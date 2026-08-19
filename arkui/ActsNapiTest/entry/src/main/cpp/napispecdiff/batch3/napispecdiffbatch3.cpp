/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "napi/native_api.h"
#include "native_common.h"

#include <atomic>
#include <thread>

// Test value constants (G.CNS.02: no magic numbers)
static constexpr int32_t K_TEST_INT_2 = 2;
static constexpr int32_t K_TEST_INT_4 = 4;
static constexpr int32_t K_TEST_INT_8 = 8;

static napi_value BoolResult(napi_env env, bool value) { return Ret(env, value ? 1 : 0); }

static napi_value MakeString(napi_env env, const char *value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static bool IsPendingAndClear(napi_env env)
{
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return pending;
}

static napi_value EmptyCallback(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value undefinedValue = nullptr;
    napi_get_undefined(env, &undefinedValue);
    return undefinedValue;
}

static napi_threadsafe_function g_crossThreadTsfn = nullptr;

static napi_value RetStatus(napi_env env, napi_status status) { return Ret(env, static_cast<int32_t>(status)); }

static void EmptyThreadsafeCall(napi_env env, napi_value jsCallback, void *context, void *data)
{
    (void)env;
    (void)jsCallback;
    (void)context;
    (void)data;
}

static void EmptyExecute(napi_env env, void *data)
{
    (void)env;
    auto *counter = reinterpret_cast<std::atomic<int32_t> *>(data);
    if (counter != nullptr) {
        counter->fetch_add(1);
    }
}

static void EmptyComplete(napi_env env, napi_status status, void *data)
{
    (void)env;
    (void)status;
    delete reinterpret_cast<std::atomic<int32_t> *>(data);
}

// ========== ==========

static napi_value CreateThreadsafeFunctionInitialCountLimit(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value function = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &function);
    napi_value name = MakeString(env, "batch3Tsfn");

    napi_threadsafe_function tsfn128 = nullptr;
    napi_status status128 = napi_create_threadsafe_function(env, function, nullptr, name, 0, 128, nullptr, nullptr,
                                                            nullptr, nullptr, &tsfn128);
    if (status128 == napi_ok && tsfn128 != nullptr) {
        napi_release_threadsafe_function(tsfn128, napi_tsfn_abort);
    }

    napi_threadsafe_function tsfn129 = nullptr;
    napi_status status129 = napi_create_threadsafe_function(env, function, nullptr, name, 0, 129, nullptr, nullptr,
                                                            nullptr, nullptr, &tsfn129);
    if (status129 == napi_ok && tsfn129 != nullptr) {
        napi_release_threadsafe_function(tsfn129, napi_tsfn_abort);
    }
    return BoolResult(env, status128 == napi_ok && status129 != napi_ok);
}

static napi_value QueueAsyncWorkWithQosReturnsOk(napi_env env, napi_callback_info info)
{
    (void)info;
    auto *counter = new std::atomic<int32_t>(0);
    napi_async_work work = nullptr;
    napi_status createStatus = napi_create_async_work(env, nullptr, MakeString(env, "batch3QosWork"), EmptyExecute,
                                                      EmptyComplete, counter, &work);
    if (createStatus != napi_ok || work == nullptr) {
        delete counter;
        return BoolResult(env, false);
    }
    napi_status queueStatus = napi_queue_async_work_with_qos(env, work, napi_qos_default);
    if (queueStatus != napi_ok) {
        napi_delete_async_work(env, work);
    }
    return BoolResult(env, queueStatus == napi_ok);
}

static napi_value ThreadsafeFunctionLooseResourceAndNameTypes(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue4102 = 4102;
    const int32_t kTestValue4101 = 4101;
    napi_value function = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &function);
    napi_value numberResource = nullptr;
    napi_create_int32(env, kTestValue4101, &numberResource);
    napi_value numberName = nullptr;
    napi_create_int32(env, kTestValue4102, &numberName);

    napi_threadsafe_function tsfn = nullptr;
    napi_status createStatus = napi_create_threadsafe_function(env, function, numberResource, numberName, 0, 1, nullptr,
                                                               nullptr, nullptr, nullptr, &tsfn);
    napi_status releaseStatus =
        tsfn != nullptr ? napi_release_threadsafe_function(tsfn, napi_tsfn_abort) : napi_invalid_arg;
    return BoolResult(env, createStatus == napi_ok && releaseStatus == napi_ok);
}

static napi_value ReleaseThreadsafeFunctionAfterCountZero(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value function = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &function);
    napi_value name = MakeString(env, "batch3ReleaseZero");
    napi_threadsafe_function tsfn = nullptr;
    napi_status createStatus =
        napi_create_threadsafe_function(env, function, nullptr, name, 0, 2, nullptr, nullptr, nullptr, nullptr, &tsfn);
    napi_status firstRelease =
        tsfn != nullptr ? napi_release_threadsafe_function(tsfn, napi_tsfn_release) : napi_invalid_arg;
    napi_status secondRelease =
        tsfn != nullptr ? napi_release_threadsafe_function(tsfn, napi_tsfn_release) : napi_invalid_arg;
    napi_status thirdRelease =
        tsfn != nullptr ? napi_release_threadsafe_function(tsfn, napi_tsfn_release) : napi_invalid_arg;
    return BoolResult(env, createStatus == napi_ok && firstRelease == napi_ok && secondRelease == napi_ok &&
                               thirdRelease == napi_generic_failure);
}

static napi_value SetupThreadsafeFunctionCrossThreadProbe(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_crossThreadTsfn != nullptr) {
        napi_release_threadsafe_function(g_crossThreadTsfn, napi_tsfn_abort);
        g_crossThreadTsfn = nullptr;
    }

    napi_value function = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &function);
    napi_value name = MakeString(env, "batch3CrossThreadTsfn");
    napi_status createStatus = napi_create_threadsafe_function(env, function, nullptr, name, 0, 1, nullptr, nullptr,
                                                               nullptr, EmptyThreadsafeCall, &g_crossThreadTsfn);
    if (createStatus != napi_ok) {
        g_crossThreadTsfn = nullptr;
    }
    return BoolResult(env, createStatus == napi_ok && g_crossThreadTsfn != nullptr);
}

static napi_value RefThreadsafeFunctionWithCurrentEnv(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_crossThreadTsfn == nullptr) {
        return RetStatus(env, napi_invalid_arg);
    }
    return RetStatus(env, napi_ref_threadsafe_function(env, g_crossThreadTsfn));
}

static napi_value UnrefThreadsafeFunctionWithCurrentEnv(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_crossThreadTsfn == nullptr) {
        return RetStatus(env, napi_invalid_arg);
    }
    return RetStatus(env, napi_unref_threadsafe_function(env, g_crossThreadTsfn));
}

static napi_value CleanupThreadsafeFunctionCrossThreadProbe(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_crossThreadTsfn == nullptr) {
        return BoolResult(env, true);
    }
    napi_status releaseStatus = napi_release_threadsafe_function(g_crossThreadTsfn, napi_tsfn_abort);
    g_crossThreadTsfn = nullptr;
    return BoolResult(env, releaseStatus == napi_ok || releaseStatus == napi_generic_failure);
}

static napi_value CreateArkRuntimeOnNativeThread(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
    std::atomic<int32_t> destroyStatus(static_cast<int32_t>(napi_generic_failure));
    std::thread worker([&createStatus, &destroyStatus]() {
        napi_env newEnv = nullptr;
        napi_status status = napi_create_ark_runtime(&newEnv);
        createStatus.store(static_cast<int32_t>(status));
        if (status == napi_ok && newEnv != nullptr) {
            destroyStatus.store(static_cast<int32_t>(napi_destroy_ark_runtime(&newEnv)));
        }
    });
    worker.join();
    return BoolResult(env, createStatus.load() == napi_ok && destroyStatus.load() == napi_ok);
}

static napi_value IsSendableDistinguishesValues(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value sendableObject = nullptr;
    napi_create_sendable_object_with_properties(env, 0, nullptr, &sendableObject);
    bool objectResult = true;
    bool sendableResult = false;
    napi_status objectStatus = napi_is_sendable(env, object, &objectResult);
    napi_status sendableStatus = napi_is_sendable(env, sendableObject, &sendableResult);
    return BoolResult(env, objectStatus == napi_ok && sendableStatus == napi_ok && !objectResult && sendableResult);
}

static napi_value CreateSendableObjectArrayAndBuffer(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_value array = nullptr;
    napi_value arrayBuffer = nullptr;
    void *data = nullptr;
    napi_status objectStatus = napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
    napi_status arrayStatus = napi_create_sendable_array(env, &array);
    napi_status bufferStatus = napi_create_sendable_arraybuffer(env, K_TEST_INT_8, &data, &arrayBuffer);
    bool objectSendable = false;
    bool arraySendable = false;
    bool bufferSendable = false;
    napi_is_sendable(env, object, &objectSendable);
    napi_is_sendable(env, array, &arraySendable);
    napi_is_sendable(env, arrayBuffer, &bufferSendable);
    return BoolResult(env, objectStatus == napi_ok && arrayStatus == napi_ok && bufferStatus == napi_ok &&
                               objectSendable && arraySendable && bufferSendable && data != nullptr);
}

static napi_value CreateSendableArrayWithLengthAndTypedArray(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value array = nullptr;
    napi_status arrayStatus = napi_create_sendable_array_with_length(env, 4, &array);
    uint32_t length = 0;
    napi_get_array_length(env, array, &length);

    void *data = nullptr;
    napi_value arrayBuffer = nullptr;
    napi_create_sendable_arraybuffer(env, 16, &data, &arrayBuffer);
    napi_value typedArray = nullptr;
    napi_status typedArrayStatus =
        napi_create_sendable_typedarray(env, napi_int32_array, 4, arrayBuffer, 0, &typedArray);
    bool typedArraySendable = false;
    napi_is_sendable(env, typedArray, &typedArraySendable);
    return BoolResult(env, arrayStatus == napi_ok && length == K_TEST_INT_4 &&
                          typedArrayStatus == napi_ok && typedArraySendable);
}

static napi_value SendableTypedArrayInfoAndTypeCheck(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue16 = 16;
    void *data = nullptr;
    napi_value arrayBuffer = nullptr;
    napi_status bufferStatus = napi_create_sendable_arraybuffer(env, 16, &data, &arrayBuffer);
    napi_value typedArray = nullptr;
    napi_status createStatus = napi_create_sendable_typedarray(env, napi_int32_array, 4, arrayBuffer, 0, &typedArray);

    bool isTypedArray = false;
    napi_status isStatus = napi_is_typedarray(env, typedArray, &isTypedArray);

    napi_typedarray_type type = napi_int8_array;
    size_t length = 0;
    void *outData = nullptr;
    napi_value outArrayBuffer = nullptr;
    size_t byteOffset = 1;
    napi_status infoStatus =
        napi_get_typedarray_info(env, typedArray, &type, &length, &outData, &outArrayBuffer, &byteOffset);
    bool sameArrayBuffer = false;
    napi_strict_equals(env, arrayBuffer, outArrayBuffer, &sameArrayBuffer);

    return BoolResult(env, bufferStatus == napi_ok && createStatus == napi_ok && isStatus == napi_ok && isTypedArray &&
                               infoStatus == napi_ok && type == napi_int32_array && length == kTestValue16 &&
                               outData == data && sameArrayBuffer && byteOffset == 0);
}

static napi_value CreateObjectWithPropertiesHelpers(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue2 = 2;
    napi_property_descriptor desc[] = {
        {"alpha", nullptr, nullptr, nullptr, nullptr, MakeString(env, "A"), napi_default, nullptr},
    };
    napi_value objectWithDesc = nullptr;
    napi_status descStatus = napi_create_object_with_properties(env, &objectWithDesc, 1, desc);

    const char *keys[] = {"beta"};
    napi_value values[1] = {nullptr};
    napi_create_int32(env, kTestValue2, &values[0]);
    napi_value objectWithNames = nullptr;
    napi_status namedStatus = napi_create_object_with_named_properties(env, &objectWithNames, 1, keys, values);

    napi_value alpha = nullptr;
    napi_value beta = nullptr;
    napi_get_named_property(env, objectWithDesc, "alpha", &alpha);
    napi_get_named_property(env, objectWithNames, "beta", &beta);
    int32_t betaValue = 0;
    napi_get_value_int32(env, beta, &betaValue);
    return BoolResult(env,
                      descStatus == napi_ok && namedStatus == napi_ok && alpha != nullptr && betaValue == kTestValue2);
}

static napi_value ThrowBusinessErrorStatus(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestErrorCode = 100;
    napi_status nullMsgStatus = napi_throw_business_error(env, kTestErrorCode, nullptr);
    napi_status throwStatus = napi_throw_business_error(env, kTestErrorCode, "business error");
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return BoolResult(env, nullMsgStatus == napi_invalid_arg && throwStatus == napi_ok && pending);
}

static napi_value CallsiteInfoGetAndSetProperty(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue46 = 46;
    napi_callsite_info callsite = nullptr;
    napi_status createStatus = napi_create_callsite_info(env, &callsite);
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value key = MakeString(env, "value");
    napi_value value = nullptr;
    napi_create_int32(env, kTestValue46, &value);
    bool setHit = false;
    bool getHit = false;
    napi_status setStatus = napi_set_property_with_callsite_info(env, object, key, value, callsite, &setHit);
    napi_value out = nullptr;
    napi_status getStatus = napi_get_property_with_callsite_info(env, object, key, callsite, &out, &getHit);
    int32_t outValue = 0;
    napi_get_value_int32(env, out, &outValue);
    napi_status deleteStatus = napi_delete_callsite_info(env, callsite);
    return BoolResult(env, createStatus == napi_ok && setStatus == napi_ok && getStatus == napi_ok &&
                               deleteStatus == napi_ok && outValue == kTestValue46);
}

static napi_value CallsiteInfoNullParametersAreAccepted(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue45046 = 45046;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value key = MakeString(env, "nullInfoValue");
    napi_value value = nullptr;
    napi_create_int32(env, kTestValue45046, &value);

    napi_status setStatus = napi_set_property_with_callsite_info(env, object, key, value, nullptr, nullptr);
    napi_value out = nullptr;
    napi_status getStatus = napi_get_property_with_callsite_info(env, object, key, nullptr, &out, nullptr);

    int32_t outValue = 0;
    napi_get_value_int32(env, out, &outValue);
    return BoolResult(env, setStatus == napi_ok && getStatus == napi_ok && outValue == kTestValue45046);
}

static napi_value CriticalScopeUtf16BufferBehavior(napi_env env, napi_callback_info info)
{
    (void)info;
    const char16_t text[] = {0x4F60, 0x597D, 0};
    napi_value utf16Value = nullptr;
    napi_create_string_utf16(env, text, K_TEST_INT_2, &utf16Value);
    napi_value asciiValue = MakeString(env, "ASCII");

    napi_critical_scope scope = nullptr;
    napi_status openStatus = napi_open_critical_scope(env, &scope);
    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status utf16Status = napi_get_buffer_string_utf16_in_critical_scope(env, utf16Value, &buffer, &length);
    const char16_t *asciiBuffer = nullptr;
    size_t asciiLength = 0;
    napi_status asciiStatus =
        napi_get_buffer_string_utf16_in_critical_scope(env, asciiValue, &asciiBuffer, &asciiLength);
    napi_status closeStatus = napi_close_critical_scope(env, scope);

    return BoolResult(env, openStatus == napi_ok && utf16Status == napi_ok &&
                           closeStatus == napi_ok && buffer != nullptr &&
                           length == K_TEST_INT_2 && buffer[0] == text[0] &&
                           buffer[1] == text[1] && asciiStatus == napi_invalid_arg);
}

// ========== ==========

static napi_value QueueAsyncWorkWithQosNullWorkReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_queue_async_work_with_qos(env, nullptr, napi_qos_default);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value ReleaseThreadsafeFunctionNullTsfnReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_release_threadsafe_function(nullptr, napi_tsfn_release);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value ReleaseThreadsafeFunctionWhenPendingReturnsPendingException(napi_env env, napi_callback_info info)
{
    (void)info;
// napi_release_threadsafe_function(tsfn, mode) napi_env
// env pending exception
// napi_ok pending exception tsfn
    napi_value func = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &func);
    napi_value name = MakeString(env, "pendingTest");
    napi_threadsafe_function tsfn = nullptr;
    napi_status createStatus = napi_create_threadsafe_function(
        env, func, nullptr, name, 0, 1, nullptr, nullptr, nullptr, [](napi_env, napi_value, void *, void *) {}, &tsfn);
    if (createStatus != napi_ok || tsfn == nullptr) {
        return BoolResult(env, false);
    }
    napi_throw_error(env, "TEST_ERROR", "Simulated pending exception");
    napi_status status = napi_release_threadsafe_function(tsfn, napi_tsfn_release);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
// spec: release napi_ok env pending pending
// exception
    return BoolResult(env, status == napi_ok && pending);
}

static napi_value RefThreadsafeFunctionNullTsfnReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_ref_threadsafe_function(env, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value UnrefThreadsafeFunctionNullTsfnReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_unref_threadsafe_function(env, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}
// --- napi_create_ark_runtime ---

static napi_value CreateArkRuntimeComboWithContext(napi_env env, napi_callback_info info)
{
    (void)info;
    std::atomic<int32_t> createRuntimeStatus(static_cast<int32_t>(napi_generic_failure));
    std::atomic<napi_env> runtimeEnvAtomic(nullptr);

    // Worker thread: create ark runtime (cannot call on main thread)
    std::thread worker([&createRuntimeStatus, &runtimeEnvAtomic]() {
        napi_env runtimeEnv = nullptr;
        napi_status runtimeCreate = napi_create_ark_runtime(&runtimeEnv);
        createRuntimeStatus.store(static_cast<int32_t>(runtimeCreate));
        if (runtimeCreate == napi_ok && runtimeEnv != nullptr) {
            runtimeEnvAtomic.store(runtimeEnv);
        }
    });
    worker.join();

    napi_env runtimeEnv = runtimeEnvAtomic.load();
    if (createRuntimeStatus.load() != napi_ok || runtimeEnv == nullptr) {
        return BoolResult(env, false);
    }

    // Main thread: create context (SDK 26.0.0: multi-context only on main thread)
    bool ctxOperateOk = false;
    napi_env ctxEnv = nullptr;
    napi_status ctxCreate = napi_create_ark_context(runtimeEnv, &ctxEnv);
    if (ctxCreate == napi_ok && ctxEnv != nullptr) {
        napi_value obj = nullptr;
        napi_status opStatus = napi_create_object(ctxEnv, &obj);
        ctxOperateOk = (opStatus == napi_ok && obj != nullptr);
        napi_destroy_ark_context(ctxEnv);
    }

    napi_status destroyStatus = napi_destroy_ark_runtime(&runtimeEnv);
    return BoolResult(env, ctxOperateOk && destroyStatus == napi_ok);
}

// --- napi_create_ark_context ---

static napi_value CreateArkContextWithDestroyedRuntimeReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
    // NOTE: napi_create_ark_context must be called on main thread (SDK 26.0.0).
    // Worker thread creates then destroys runtime; main thread tries stale env.

    std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
    std::atomic<int32_t> destroyStatus(static_cast<int32_t>(napi_generic_failure));
    std::atomic<napi_env> staleEnvAtomic(nullptr);

    std::thread worker([&createStatus, &destroyStatus, &staleEnvAtomic]() {
        napi_env runtimeEnv = nullptr;
        napi_status runtimeCreate = napi_create_ark_runtime(&runtimeEnv);
        createStatus.store(static_cast<int32_t>(runtimeCreate));

        if (runtimeCreate == napi_ok && runtimeEnv != nullptr) {
            staleEnvAtomic.store(runtimeEnv);
            destroyStatus.store(static_cast<int32_t>(napi_destroy_ark_runtime(&runtimeEnv)));
        }
    });
    worker.join();

    napi_env staleEnv = staleEnvAtomic.load();
    if (createStatus.load() != napi_ok || destroyStatus.load() != napi_ok || staleEnv == nullptr) {
        return BoolResult(env, false);
    }

    // Main thread: try to create context from stale (destroyed) runtime env
    napi_env ctxEnv = nullptr;
    napi_status ctxStatus = napi_create_ark_context(staleEnv, &ctxEnv);
    return BoolResult(env, ctxStatus == napi_invalid_arg || ctxStatus == napi_generic_failure);
}

static napi_value DestroyArkRuntimeNullReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    napi_status status = napi_destroy_ark_runtime(nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value IsSendableNullEnvReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    bool result = false;
    napi_status status = napi_is_sendable(nullptr, obj, &result);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value IsSendableNullResultReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_status status = napi_is_sendable(env, obj, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

// 0071: napi_is_sendable undefined napi_ok
// specfalseok
static napi_value IsSendableUndefinedReturnsFalse(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    bool result = true;
    napi_status status = napi_is_sendable(env, undefined, &result);
    (void)result;
    return BoolResult(env, status == napi_ok);
}

// 0072: napi_is_sendable null napi_ok
// OH-NAPI-DIFF: SDKnulltrueSDKsendable
// specfalse
static napi_value IsSendableNullReturnsFalse(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value null = nullptr;
    napi_get_null(env, &null);
    bool result = true;
    napi_status status = napi_is_sendable(env, null, &result);
    (void)result;
    return BoolResult(env, status == napi_ok);
}

// 0073: napi_is_sendable napi_ok
// OH-NAPI-DIFF: SDKnumbertrueSDKsendable
// specfalse
static napi_value IsSendableNumberReturnsFalse(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue42 = 42;
    napi_value number = nullptr;
    napi_create_int32(env, kTestValue42, &number);
    bool result = true;
    napi_status status = napi_is_sendable(env, number, &result);
    (void)result;
    return BoolResult(env, status == napi_ok);
}

static napi_value CreateSendableArrayWithLengthZero(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value array = nullptr;
    napi_status status = napi_create_sendable_array_with_length(env, 0, &array);
    if (status != napi_ok) {
        return BoolResult(env, false);
    }
    uint32_t length = 1;
    napi_get_array_length(env, array, &length);
    return BoolResult(env, length == 0);
}

static napi_value CreateSendableTypedArrayNullResultReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    void *data = nullptr;
    napi_value ab = nullptr;
    napi_create_sendable_arraybuffer(env, K_TEST_INT_8, &data, &ab);
    napi_status status = napi_create_sendable_typedarray(env, napi_int32_array, K_TEST_INT_2, ab, 0, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value ThrowBusinessErrorWhenPendingReturnsPendingException(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_throw_error(env, "FIRST", "first error");
    napi_status status = napi_throw_business_error(env, 200, "business error");
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
// napi_pending_exception; ;
    return BoolResult(env, status == napi_pending_exception && pending);
}

static napi_value CreateCallsiteInfoReturnsOkAndNonNull(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_callsite_info callsite = nullptr;
    napi_status status = napi_create_callsite_info(env, &callsite);
    bool valid = (status == napi_ok && callsite != nullptr);
    if (callsite != nullptr) {
        napi_delete_callsite_info(env, callsite);
    }
    return BoolResult(env, valid);
}

static napi_value DeleteCallsiteInfoNullReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_delete_callsite_info(env, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value DeleteCallsiteInfoTwiceReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_callsite_info callsite = nullptr;
    napi_create_callsite_info(env, &callsite);
    napi_status first = napi_delete_callsite_info(env, callsite);
    napi_status second = napi_delete_callsite_info(env, callsite);
    // OH-NAPI-DIFF: SDK may return napi_invalid_arg, napi_generic_failure, or
    // napi_ok for double delete.
    return BoolResult(env, first == napi_ok &&
                               (second == napi_invalid_arg || second == napi_generic_failure || second == napi_ok));
}

static napi_value CriticalScopeUtf16BufferNullParamsReturnInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
// NULL valuenapi_invalid_arg
    napi_status nullValueStatus = napi_get_buffer_string_utf16_in_critical_scope(env, nullptr, nullptr, nullptr);
    return BoolResult(env, nullValueStatus == napi_invalid_arg);
}

static napi_value OpenCriticalScopeNullEnvReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    napi_critical_scope scope = nullptr;
    napi_status status = napi_open_critical_scope(nullptr, &scope);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value OpenCriticalScopeNullScopeReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_open_critical_scope(env, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value CloseCriticalScopeNullScopeReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_close_critical_scope(env, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

// ========== ==========

static napi_value CriticalScopeUtf16BufferReturnValueVerification(napi_env env, napi_callback_info info)
{
    (void)info;
    const char16_t text[] = {0x4F60, 0x597D, 0};
    napi_value utf16Value = nullptr;
    napi_create_string_utf16(env, text, K_TEST_INT_2, &utf16Value);

    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);

    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, utf16Value, &buffer, &length);

// napi_ok; ;
    bool result =
        (status == napi_ok && buffer != nullptr && length == K_TEST_INT_2 &&
         buffer[0] == text[0] && buffer[1] == text[1]);

    napi_close_critical_scope(env, scope);
    return BoolResult(env, result);
}

static napi_value OpenCriticalScopeReturnsOkAndValidScope(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_critical_scope scope = nullptr;
    napi_status status = napi_open_critical_scope(env, &scope);

// napi_ok; scopeNULL
    bool valid = (status == napi_ok && scope != nullptr);

    if (scope != nullptr) {
        napi_close_critical_scope(env, scope);
    }
    return BoolResult(env, valid);
}

// --- napi_create_callsite_info ---
// NOTE: OH SDKnapi_callsite_infoICinline
// cache
// handleNULL

static napi_value CreateCallsiteInfoContainsCallstackInfo(napi_env env, napi_callback_info info)
{
    (void)info;
// callsite_info(, , )
// 1.callsite_info; 2.; 3.
    // NOTE: OH
// handleNULL

    napi_callsite_info callsite = nullptr;
    napi_status status = napi_create_callsite_info(env, &callsite);
    bool valid = (status == napi_ok && callsite != nullptr);
    if (callsite != nullptr) {
        napi_delete_callsite_info(env, callsite);
    }
    return BoolResult(env, valid);
}

// --- napi_create_callsite_info ---
// NOTE: callsite_infonapi_get_property_with_callsite_info/

static napi_value CreateCallsiteInfoComboWithGetProperty(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue42 = 42;
// 1.create_callsite_info; 2.get_property; 3.
// NOTE: OH SDKcallsite_info

    napi_callsite_info callsite = nullptr;
    napi_status createStatus = napi_create_callsite_info(env, &callsite);
    if (createStatus != napi_ok || callsite == nullptr) {
        return BoolResult(env, false);
    }

// callsite_info
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = MakeString(env, "comboKey");
    napi_value val = nullptr;
    napi_create_int32(env, kTestValue42, &val);
    napi_set_property(env, obj, key, val);

    napi_value out = nullptr;
    bool hit = false;
    napi_status getStatus = napi_get_property_with_callsite_info(env, obj, key, callsite, &out, &hit);

    int32_t outVal = 0;
    napi_get_value_int32(env, out, &outVal);

    napi_delete_callsite_info(env, callsite);

// get
    return BoolResult(env, createStatus == napi_ok && getStatus == napi_ok && outVal == kTestValue42);
}

static napi_value DeleteCallsiteInfoWhenPendingReturnsPendingException(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_callsite_info callsite = nullptr;
    napi_create_callsite_info(env, &callsite);

    napi_throw_error(env, "ERR", "pending");
    napi_status status = napi_delete_callsite_info(env, callsite);

    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return BoolResult(env, status == napi_pending_exception && pending);
}

// --- napi_delete_callsite_info ---
// NOTE: callsite_infoICfileName/lineNumber

static napi_value DeleteCallsiteInfoComboWithErrorHandling(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue999 = 999;
// callsite_info;
// 1.create_type_error; 2.callsite_info;
// 3.callsite_info; 4.delete_callsite_info;
// 5.throw; 6.ArkTS catch
// NOTE: OH SDKcallsite_info/

    napi_value msg = nullptr;
    napi_create_string_utf8(env, "test error", NAPI_AUTO_LENGTH, &msg);
    napi_value error = nullptr;
    napi_create_error(env, nullptr, msg, &error);

    napi_callsite_info callsite = nullptr;
    napi_status createStatus = napi_create_callsite_info(env, &callsite);
    if (createStatus != napi_ok || callsite == nullptr) {
        return BoolResult(env, false);
    }

// callsite_info
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_value key = MakeString(env, "errorKey");
    napi_value val = nullptr;
    napi_create_int32(env, kTestValue999, &val);
    napi_set_property(env, obj, key, val);

    napi_value out = nullptr;
    bool hit = false;
    napi_get_property_with_callsite_info(env, obj, key, callsite, &out, &hit);

    napi_status deleteStatus = napi_delete_callsite_info(env, callsite);

    napi_throw(env, error);

    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }

    return BoolResult(env, createStatus == napi_ok && deleteStatus == napi_ok && pending);
}

// ========== ==========

// --- napi_release_threadsafe_function ---

static void TsfnComboCallJs(napi_env env, napi_value jsCallback, void *context, void *data)
{
    (void)env;
    (void)jsCallback;
    (void)context;
    (void)data;
}

static napi_value ReleaseThreadsafeFunctionComboWithRefAndCall(napi_env env, napi_callback_info info)
{
    (void)info;
// ---; ;
// ;
    napi_value func = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &func);
    napi_value name = MakeString(env, "batch3TsfnCombo");

    napi_threadsafe_function tsfn = nullptr;
    napi_status createStatus = napi_create_threadsafe_function(env, func, nullptr, name, 0, 1, nullptr, nullptr,
                                                               nullptr, TsfnComboCallJs, &tsfn);
    if (createStatus != napi_ok || tsfn == nullptr) {
        return BoolResult(env, false);
    }

    napi_status refStatus = napi_ref_threadsafe_function(env, tsfn);
    napi_status callStatus = napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking);
    napi_status releaseStatus = napi_release_threadsafe_function(tsfn, napi_tsfn_release);

// napi_ok;
    return BoolResult(env, refStatus == napi_ok && callStatus == napi_ok && releaseStatus == napi_ok);
}

static napi_value RefThreadsafeFunctionComboWithCreateAndRelease(napi_env env, napi_callback_info info)
{
    (void)info;
// --;
    napi_value func = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &func);
    napi_value name = MakeString(env, "batch3RefCombo");

    napi_threadsafe_function tsfn = nullptr;
    napi_status createStatus = napi_create_threadsafe_function(env, func, nullptr, name, 0, 1, nullptr, nullptr,
                                                               nullptr, TsfnComboCallJs, &tsfn);
    if (createStatus != napi_ok || tsfn == nullptr) {
        return BoolResult(env, false);
    }

    napi_status refStatus = napi_ref_threadsafe_function(env, tsfn);
    napi_status releaseStatus = napi_release_threadsafe_function(tsfn, napi_tsfn_release);

// napi_ok
    return BoolResult(env, refStatus == napi_ok && releaseStatus == napi_ok);
}

static napi_value UnrefThreadsafeFunctionReturnsOk(napi_env env, napi_callback_info info)
{
    (void)info;
// napi_ok; tsfn
    napi_value func = nullptr;
    napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr, &func);
    napi_value name = MakeString(env, "batch3Unref");

    napi_threadsafe_function tsfn = nullptr;
    napi_status createStatus = napi_create_threadsafe_function(env, func, nullptr, name, 0, 1, nullptr, nullptr,
                                                               nullptr, TsfnComboCallJs, &tsfn);
    if (createStatus != napi_ok || tsfn == nullptr) {
        return BoolResult(env, false);
    }

    napi_status unrefStatus = napi_unref_threadsafe_function(env, tsfn);
    napi_status releaseStatus = napi_release_threadsafe_function(tsfn, napi_tsfn_abort);

    return BoolResult(env, unrefStatus == napi_ok && releaseStatus == napi_ok);
}

// --- Ark Context ---

static napi_value CreateArkContextReturnsOkAndNonNull(napi_env env, napi_callback_info info)
{
    (void)info;
// napi_ok; context
    napi_env newEnv = nullptr;
    napi_status ctxStatus = napi_create_ark_context(env, &newEnv);
    if (ctxStatus != napi_ok || newEnv == nullptr) {
        return BoolResult(env, false);
    }
    napi_status destroyStatus = napi_destroy_ark_context(newEnv);
    return BoolResult(env, ctxStatus == napi_ok && destroyStatus == napi_ok);
}

static napi_value CreateArkContextWithInvalidEnvReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
// nullptr envcontextnapi_invalid_arg
    napi_env newEnv = nullptr;
    napi_status status = napi_create_ark_context(nullptr, &newEnv);
    return BoolResult(env, status == napi_invalid_arg && newEnv == nullptr);
}

static napi_value DestroyArkContextReturnsOk(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_env newEnv = nullptr;
    if (napi_create_ark_context(env, &newEnv) != napi_ok || newEnv == nullptr) {
        return BoolResult(env, false);
    }
    napi_status destroyStatus = napi_destroy_ark_context(newEnv);
    return BoolResult(env, destroyStatus == napi_ok);
}

static napi_value DestroyArkContextWithInvalidArgsReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_destroy_ark_context(nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

// --- napi_create_sendable_array ---

static napi_value CreateSendableArrayWhenPendingReturnsPendingException(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_throw_error(env, "ERR", "pending");
    napi_value array = nullptr;
    napi_status status = napi_create_sendable_array(env, &array);
    bool stillPending = false;
    napi_is_exception_pending(env, &stillPending);
    if (stillPending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return BoolResult(env, (status == napi_pending_exception || status == napi_closing) && stillPending);
}

static napi_value CreateSendableObjectWithPropertiesNullResultReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
// NULL resultnapi_invalid_arg
    napi_property_descriptor desc[] = {
        {"x", nullptr, nullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_status status = napi_create_sendable_object_with_properties(env, 1, desc, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value IsTypedArrayNullEnvReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
// NULL envnapi_invalid_arg
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    bool result = false;
    napi_status status = napi_is_typedarray(nullptr, obj, &result);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value IsTypedArrayNullResultReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
// NULL resultnapi_invalid_arg
    napi_value obj = nullptr;
    napi_create_object(env, &obj);
    napi_status status = napi_is_typedarray(env, obj, nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value CreateObjectWithPropertiesNullResultReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
// NULL resultnapi_invalid_arg
    napi_property_descriptor desc[] = {
        {"x", nullptr, nullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_status status = napi_create_object_with_properties(env, nullptr, 1, desc);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value CreateObjectWithPropertiesWhenPendingReturnsPendingException(napi_env env, napi_callback_info info)
{
    (void)info;
// SDK 26.0.0napi_ok
    napi_throw_error(env, "ERR", "pending");
    napi_property_descriptor desc[] = {
        {"x", nullptr, nullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_value obj = nullptr;
    napi_status status = napi_create_object_with_properties(env, &obj, 1, desc);
    bool stillPending = false;
    napi_is_exception_pending(env, &stillPending);
    if (stillPending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return BoolResult(env, status == napi_pending_exception && stillPending);
}

static napi_value CreateObjectWithNamedPropertiesNullResultReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
// NULL resultnapi_invalid_arg
    const char *keys[] = {"x"};
    napi_value values[1] = {nullptr};
    napi_status status = napi_create_object_with_named_properties(env, nullptr, 1, keys, values);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value CreateObjectWithNamedPropertiesWhenPendingReturnsPendingException(napi_env env,
                                                                                    napi_callback_info info)
{
    (void)info;
// SDK 26.0.0napi_ok
    napi_throw_error(env, "ERR", "pending");
    const char *keys[] = {"x"};
    napi_value values[1] = {nullptr};
    napi_value obj = nullptr;
    napi_status status = napi_create_object_with_named_properties(env, &obj, 1, keys, values);
    bool stillPending = false;
    napi_is_exception_pending(env, &stillPending);
    if (stillPending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return BoolResult(env, status == napi_pending_exception && stillPending);
}

static napi_value ThrowBusinessErrorComboWithCreateError(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue500 = 500;
// napi_ok; codemessage;

// 1napi_create_error + napi_throw
    napi_value code1 = nullptr;
    napi_create_int32(env, kTestValue500, &code1);
    napi_value msg1 = MakeString(env, "business combo error");
    napi_value errorObj1 = nullptr;
    napi_status createStatus = napi_create_error(env, code1, msg1, &errorObj1);
    if (createStatus != napi_ok) {
        return BoolResult(env, false);
    }
    napi_status throwStatus1 = napi_throw(env, errorObj1);

    bool pending1 = false;
    napi_is_exception_pending(env, &pending1);
    napi_value exception1 = nullptr;
    if (pending1) {
        napi_get_and_clear_last_exception(env, &exception1);
    }

    napi_status throwStatus2 = napi_throw_business_error(env, 500, "business combo error");

    bool pending2 = false;
    napi_is_exception_pending(env, &pending2);
    napi_value exception2 = nullptr;
    if (pending2) {
        napi_get_and_clear_last_exception(env, &exception2);
    }

// napi_ok; pending
    return BoolResult(env, throwStatus1 == napi_ok && pending1 && throwStatus2 == napi_ok && pending2);
}

static napi_value CloseCriticalScopeReturnsOk(napi_env env, napi_callback_info info)
{
    (void)info;
// napi_ok; scope
    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);
    napi_status status = napi_close_critical_scope(env, scope);
    return BoolResult(env, status == napi_ok);
}

static napi_value CreateCallsiteInfoInvalidEnvReturnsError(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
// nullptrenvenv
    napi_callsite_info callsite = nullptr;
    napi_status status = napi_create_callsite_info(nullptr, &callsite);
    return BoolResult(env, status == napi_invalid_arg && callsite == nullptr);
}

// - context
// 1.Ark; 2.; 3.
// napi_invalid_arg
static napi_value DestroyArkContextTwiceReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_env newEnv = nullptr;
    napi_status createStatus = napi_create_ark_context(env, &newEnv);
    if (createStatus != napi_ok || newEnv == nullptr) {
        return BoolResult(env, false);
    }
    napi_status firstDestroy = napi_destroy_ark_context(newEnv);
    napi_status secondDestroy = napi_destroy_ark_context(newEnv);
    return BoolResult(env, firstDestroy == napi_ok && secondDestroy != napi_ok);
}
static napi_value DestroyArkContextComboWithRuntime(napi_env env, napi_callback_info info)
{
    (void)info;

    napi_status status;

// 1runtime
    napi_env runtimeEnv = nullptr;
    status = napi_create_ark_runtime(&runtimeEnv);
    if (status != napi_ok || runtimeEnv == nullptr) {
        return BoolResult(env, false);
    }

// 2
    napi_env ctxEnv = nullptr;
    status = napi_create_ark_context(runtimeEnv, &ctxEnv);
    if (status != napi_ok || ctxEnv == nullptr) {
        napi_destroy_ark_runtime(&runtimeEnv);
        return BoolResult(env, false);
    }

// 3
    napi_value obj = nullptr;
napi_create_object(ctxEnv, &obj); //

// 4
    status = napi_destroy_ark_context(ctxEnv);
    if (status != napi_ok) {
        napi_destroy_ark_runtime(&runtimeEnv);
        return BoolResult(env, false);
    }

// 5
    napi_env ctxEnv2 = nullptr;
    status = napi_create_ark_context(runtimeEnv, &ctxEnv2);
    if (status == napi_ok && ctxEnv2 != nullptr) {
        napi_destroy_ark_context(ctxEnv2);
    } else {
        napi_destroy_ark_runtime(&runtimeEnv);
        return BoolResult(env, false);
    }

// 6
    status = napi_destroy_ark_runtime(&runtimeEnv);

    return BoolResult(env, status == napi_ok);
}

// --- napi_create_ark_runtime batch4 ---
// 0061: NULL envnapi_create_ark_runtime napi_invalid_arg
static napi_value CreateArkRuntimeNullReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    napi_status status = napi_create_ark_runtime(nullptr);
    return BoolResult(env, status == napi_invalid_arg);
}

// 0062: napi_destroy_ark_runtime
static napi_value DestroyArkRuntimeTwiceReturnsError(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    std::atomic<int32_t> firstDestroyStatus(static_cast<int32_t>(napi_generic_failure));
    std::atomic<int32_t> secondDestroyStatus(static_cast<int32_t>(napi_generic_failure));

    std::thread worker([&firstDestroyStatus, &secondDestroyStatus]() {
        napi_env newEnv = nullptr;
        napi_status create = napi_create_ark_runtime(&newEnv);
        if (create == napi_ok && newEnv != nullptr) {
            firstDestroyStatus.store(static_cast<int32_t>(napi_destroy_ark_runtime(&newEnv)));
            secondDestroyStatus.store(static_cast<int32_t>(napi_destroy_ark_runtime(&newEnv)));
        }
    });
    worker.join();

    return BoolResult(env, firstDestroyStatus.load() == napi_ok && secondDestroyStatus.load() != napi_ok);
}

// 0063: napi_create_sendable_arraybuffer
static napi_value CreateSendableArraybufferHugeLengthReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
    void *data = nullptr;
    napi_value result = nullptr;
    napi_status status = napi_create_sendable_arraybuffer(env, std::numeric_limits<uint32_t>::max(), &data, &result);
// OH-NAPI-DIFF: SDK 26.0.0UINT32_MAXnapi_ok
    return BoolResult(env, status != napi_ok);
}

// 0064: napi_get_buffer_string_utf16_in_critical_scope
static napi_value CriticalScopeUtf16BufferEfficientAccess(napi_env env, napi_callback_info info)
{
    (void)info;
const char16_t text[] = {0x4F60, 0x597D, 0x4E16, 0x754C, 0}; //
    napi_value utf16Value = nullptr;
    napi_create_string_utf16(env, text, K_TEST_INT_4, &utf16Value);

    napi_critical_scope scope = nullptr;
    napi_status openStatus = napi_open_critical_scope(env, &scope);
    if (openStatus != napi_ok || scope == nullptr) {
        return BoolResult(env, false);
    }

    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status bufferStatus = napi_get_buffer_string_utf16_in_critical_scope(env, utf16Value, &buffer, &length);

    bool dataMatch = (bufferStatus == napi_ok && buffer != nullptr && length == K_TEST_INT_4 && buffer[0] == text[0] &&
                      buffer[1] == text[1] && buffer[2] == text[2] && buffer[3] == text[3]);

    napi_status closeStatus = napi_close_critical_scope(env, scope);

    return BoolResult(env, openStatus == napi_ok && dataMatch && closeStatus == napi_ok);
}

// 0065: critical scope napi_generic_failure
static napi_value CriticalScopeUtf16BufferOutsideScopeReturnsError(napi_env env, napi_callback_info info)
{
    (void)info;
    const char16_t text[] = {0x4F60, 0x597D, 0};
    napi_value utf16Value = nullptr;
    napi_create_string_utf16(env, text, K_TEST_INT_2, &utf16Value);

    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, utf16Value, &buffer, &length);

    return BoolResult(env, status == napi_generic_failure);
}

// 0066: - napi_get_value_string_utf16/napi_create_string_utf16
static napi_value CriticalScopeUtf16BufferComboWithGetValue(napi_env env, napi_callback_info info)
{
    (void)info;
const char16_t text[] = {0x4F60, 0x597D, 0}; //
    napi_value utf16Value = nullptr;
    napi_create_string_utf16(env, text, K_TEST_INT_2, &utf16Value);

    size_t valueLength = 0;
    napi_get_value_string_utf16(env, utf16Value, nullptr, 0, &valueLength);

    char16_t valueBuf[8] = {0};
    napi_get_value_string_utf16(env, utf16Value, valueBuf, K_TEST_INT_8, nullptr);

    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);

    const char16_t *buffer = nullptr;
    size_t bufferLength = 0;
    napi_status bufferStatus = napi_get_buffer_string_utf16_in_critical_scope(env, utf16Value, &buffer, &bufferLength);

    bool lengthMatch = (valueLength == 2 && bufferLength == 2);
    bool contentMatch = (valueBuf[0] == buffer[0] && valueBuf[1] == buffer[1]);

    napi_close_critical_scope(env, scope);

    return BoolResult(env, bufferStatus == napi_ok && lengthMatch && contentMatch);
}

// 0074: NULL env napi_invalid_arg
static napi_value CriticalScopeUtf16BufferNullEnvReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value str = nullptr;
    const char16_t text[] = {0x78, 0};
    napi_create_string_utf16(env, text, 1, &str);
    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(nullptr, str, &buffer, &length);
    return BoolResult(env, status == napi_invalid_arg);
}

// 0075: NULL data napi_invalid_arg
static napi_value CriticalScopeUtf16BufferNullDataReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value str = nullptr;
    const char16_t text[] = {0x78, 0};
    napi_create_string_utf16(env, text, 1, &str);
    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);
    size_t length = 0;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, str, nullptr, &length);
    if (scope) {
        napi_close_critical_scope(env, scope);
    }
    return BoolResult(env, status == napi_invalid_arg);
}

// 0076: NULL length napi_invalid_arg
static napi_value CriticalScopeUtf16BufferNullLengthReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value str = nullptr;
    const char16_t text[] = {0x78, 0};
    napi_create_string_utf16(env, text, 1, &str);
    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);
    const char16_t *buffer = nullptr;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, str, &buffer, nullptr);
    if (scope) {
        napi_close_critical_scope(env, scope);
    }
    return BoolResult(env, status == napi_invalid_arg);
}

// 0077: number napi_string_expected
static napi_value CriticalScopeUtf16BufferNumberReturnsStringExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue42 = 42;
    napi_value number = nullptr;
    napi_create_int32(env, kTestValue42, &number);
    napi_critical_scope scope = nullptr;
    napi_open_critical_scope(env, &scope);
    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, number, &buffer, &length);
    if (scope) {
        napi_close_critical_scope(env, scope);
    }
    return BoolResult(env, status == napi_string_expected);
}

// 0078: pending napi_pending_exception
// critical scopeSDKscopenapi_generic_failure
static napi_value CriticalScopeUtf16BufferWhenPendingReturnsPendingException(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value str = nullptr;
    const char16_t text[] = {0x78, 0};
    napi_create_string_utf16(env, text, 1, &str);
    napi_throw_error(env, "ERR", "pending");
    const char16_t *buffer = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_string_utf16_in_critical_scope(env, str, &buffer, &length);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    IsPendingAndClear(env);
    return BoolResult(env, pending && (status == napi_pending_exception || status == napi_generic_failure));
}
