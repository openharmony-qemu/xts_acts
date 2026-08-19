/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "napi/native_api.h"
#include "native_common.h"
#include "node_api.h"

#include <atomic>
#include <chrono>
#include <climits>
#include <cstdint>
#include <cstring>
#include <thread>

static napi_ref g_wrapStrongRef = nullptr;
static int32_t g_wrapStrongFinalizeCount = 0;
static constexpr int32_t K_TEST_INT_4 = 4;

static napi_value BoolResult(napi_env env, bool value) { return Ret(env, value ? 1 : 0); }

static bool IsUndefined(napi_env env, napi_value value)
{
    napi_valuetype type = napi_null;
    return napi_typeof(env, value, &type) == napi_ok && type == napi_undefined;
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

static napi_value MakeString(napi_env env, const char *value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
    return result;
}

static bool GetNamedInt32(napi_env env, napi_value object, const char *name, int32_t *out)
{
    napi_value value = nullptr;
    if (napi_get_named_property(env, object, name, &value) != napi_ok) {
        return false;
    }
    return napi_get_value_int32(env, value, out) == napi_ok;
}

static napi_value EmptyConstructor(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value undefinedValue = nullptr;
    napi_get_undefined(env, &undefinedValue);
    return undefinedValue;
}

static void WrapStrongFinalizer(napi_env env, void *data, void *hint)
{
    (void)env;
    (void)hint;
    g_wrapStrongFinalizeCount++;
    delete reinterpret_cast<int32_t *>(data);
}

static void CleanupHook(void *arg) { (void)arg; }

// ========== 原有OH差异测试 ==========

static napi_value ThrowErrorNullCodeKeepsOpenHarmonyBehavior(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_throw_error(env, nullptr, "throw error with null code");
    bool pending = IsPendingAndClear(env);
    return BoolResult(env, status != napi_invalid_arg && pending);
}

static napi_value ThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_throw_type_error(env, nullptr, "throw type error with null code");
    bool pending = IsPendingAndClear(env);
    return BoolResult(env, status != napi_invalid_arg && pending);
}

static napi_value ThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_status status = napi_throw_range_error(env, nullptr, "throw range error with null code");
    bool pending = IsPendingAndClear(env);
    return BoolResult(env, status != napi_invalid_arg && pending);
}

static napi_value CreateErrorSupportsStringAndNumberCode(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue1001 = 1001;
    napi_value message = MakeString(env, "message");
    napi_value stringCode = MakeString(env, "E_STRING");
    napi_value numberCode = nullptr;
    napi_create_int32(env, kTestValue1001, &numberCode);
    napi_value objectCode = nullptr;
    napi_create_object(env, &objectCode);

    napi_value error = nullptr;
    napi_status statusString = napi_create_error(env, stringCode, message, &error);
    napi_status statusNumber = napi_create_error(env, numberCode, message, &error);
    napi_status statusObject = napi_create_error(env, objectCode, message, &error);
    return BoolResult(env, statusString == napi_ok && statusNumber == napi_ok && statusObject == napi_invalid_arg);
}

static napi_value CreateTypeErrorNumberCodeAndObjectCodeInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue1002 = 1002;
    napi_value message = MakeString(env, "message");
    napi_value numberCode = nullptr;
    napi_create_int32(env, kTestValue1002, &numberCode);
    napi_value objectCode = nullptr;
    napi_create_object(env, &objectCode);

    napi_value error = nullptr;
    napi_status statusNumber = napi_create_type_error(env, numberCode, message, &error);
    int32_t codeValue = 0;
    bool codeMatched =
        statusNumber == napi_ok && GetNamedInt32(env, error, "code", &codeValue) && codeValue == kTestValue1002;
    napi_status statusObject = napi_create_type_error(env, objectCode, message, &error);
    return BoolResult(env, codeMatched && statusObject == napi_invalid_arg);
}

static napi_value CreateRangeErrorNumberCodeAndObjectCodeInvalid(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue1003 = 1003;
    napi_value message = MakeString(env, "message");
    napi_value numberCode = nullptr;
    napi_create_int32(env, kTestValue1003, &numberCode);
    napi_value objectCode = nullptr;
    napi_create_object(env, &objectCode);

    napi_value error = nullptr;
    napi_status statusNumber = napi_create_range_error(env, numberCode, message, &error);
    int32_t codeValue = 0;
    bool codeMatched =
        statusNumber == napi_ok && GetNamedInt32(env, error, "code", &codeValue) && codeValue == kTestValue1003;
    napi_status statusObject = napi_create_range_error(env, objectCode, message, &error);
    return BoolResult(env, codeMatched && statusObject == napi_invalid_arg);
}

static napi_value CreateReferenceSupportsNonObjectValues(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue42 = 42;
    napi_value values[5] = {nullptr};
    napi_create_int32(env, kTestValue42, &values[0]);
    napi_create_string_utf8(env, "text", NAPI_AUTO_LENGTH, &values[1]);
    napi_get_boolean(env, true, &values[2]);
    napi_get_undefined(env, &values[3]);
    napi_get_null(env, &values[4]);

    for (napi_value value : values) {
        napi_ref ref = nullptr;
        napi_status status = napi_create_reference(env, value, 1, &ref);
        if (status != napi_ok || ref == nullptr) {
            return BoolResult(env, false);
        }
        napi_value refValue = nullptr;
        bool same = false;
        napi_get_reference_value(env, ref, &refValue);
        napi_strict_equals(env, value, refValue, &same);
        napi_delete_reference(env, ref);
        if (!same) {
            return BoolResult(env, false);
        }
    }
    return BoolResult(env, true);
}

static napi_value CreateSymbolInvalidDescriptionReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value numberDesc = nullptr;
    napi_create_int32(env, 1, &numberDesc);
    napi_value symbol = nullptr;
    napi_status status = napi_create_symbol(env, numberDesc, &symbol);
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value CreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value typedArray = nullptr;
    napi_status status = napi_create_typedarray(env, napi_int8_array, 1, object, 0, &typedArray);
    return BoolResult(env, status == napi_arraybuffer_expected);
}

static napi_value CreateDataViewInvalidAndOverflowArrayBuffer(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value dataView = nullptr;
    napi_status invalidStatus = napi_create_dataview(env, 1, object, 0, &dataView);

    void *data = nullptr;
    napi_value arrayBuffer = nullptr;
    napi_create_arraybuffer(env, K_TEST_INT_4, &data, &arrayBuffer);
    napi_status overflowStatus = napi_create_dataview(env, 4, arrayBuffer, 2, &dataView);
    bool pending = IsPendingAndClear(env);
    return BoolResult(env, invalidStatus == napi_arraybuffer_expected && overflowStatus == napi_pending_exception &&
                               pending);
}

static napi_value GetTypedArrayInfoLengthReturnsByteLength(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue16 = 16;
    void *data = nullptr;
    napi_value arrayBuffer = nullptr;
    napi_create_arraybuffer(env, 16, &data, &arrayBuffer);
    napi_value typedArray = nullptr;
    napi_create_typedarray(env, napi_int32_array, 4, arrayBuffer, 0, &typedArray);

    napi_typedarray_type type = napi_int8_array;
    size_t length = 0;
    napi_value outArrayBuffer = nullptr;
    size_t byteOffset = 0;
    napi_status status = napi_get_typedarray_info(env, typedArray, &type, &length, &data, &outArrayBuffer, &byteOffset);
    return BoolResult(env, status == napi_ok && type == napi_int32_array && length == kTestValue16 && byteOffset == 0);
}

static napi_value CoerceUndefinedAndNullToObjectReturnsUndefined(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value undefinedValue = nullptr;
    napi_value nullValue = nullptr;
    napi_get_undefined(env, &undefinedValue);
    napi_get_null(env, &nullValue);

    napi_value undefinedResult = nullptr;
    napi_value nullResult = nullptr;
    napi_status undefinedStatus = napi_coerce_to_object(env, undefinedValue, &undefinedResult);
    napi_status nullStatus = napi_coerce_to_object(env, nullValue, &nullResult);
    return BoolResult(env, undefinedStatus == napi_ok && nullStatus == napi_ok && IsUndefined(env, undefinedResult) &&
                               IsUndefined(env, nullResult));
}

static napi_value InstanceOfInvalidArgumentsReturnExpectedStatus(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value number = nullptr;
    napi_create_int32(env, 1, &number);
    napi_value function = nullptr;
    napi_create_function(
        env, "Ctor", NAPI_AUTO_LENGTH,
        [](napi_env cbEnv, napi_callback_info cbInfo) -> napi_value {
            (void)cbInfo;
            napi_value undefinedValue = nullptr;
            napi_get_undefined(cbEnv, &undefinedValue);
            return undefinedValue;
        },
        nullptr, &function);
    bool result = true;
    napi_status objectStatus = napi_instanceof(env, number, function, &result);

    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_status constructorStatus = napi_instanceof(env, object, object, &result);
    bool pending = false;
    napi_is_exception_pending(env, &pending);
    if (pending) {
        napi_value exception = nullptr;
        napi_get_and_clear_last_exception(env, &exception);
    }
    return BoolResult(env,
                      objectStatus == napi_object_expected && constructorStatus == napi_function_expected && !pending);
}

static napi_value PropertyApitNonObjectReturnObjectExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue2 = 2;
    napi_value number = nullptr;
    napi_create_int32(env, 1, &number);
    napi_value key = MakeString(env, "k");
    napi_value value = nullptr;
    napi_create_int32(env, kTestValue2, &value);
    bool boolResult = false;
    napi_value out = nullptr;
    napi_property_descriptor desc[] = {DECLARE_NAPI_FUNCTION("x", nullptr)};

    napi_status statuses[] = {
        napi_get_property_names(env, number, &out),
        napi_set_property(env, number, key, value),
        napi_get_property(env, number, key, &out),
        napi_has_property(env, number, key, &boolResult),
        napi_delete_property(env, number, key, &boolResult),
        napi_has_own_property(env, number, key, &boolResult),
        napi_set_named_property(env, number, "k", value),
        napi_get_named_property(env, number, "k", &out),
        napi_has_named_property(env, number, "k", &boolResult),
        napi_set_element(env, number, 0, value),
        napi_get_element(env, number, 0, &out),
        napi_has_element(env, number, 0, &boolResult),
        napi_delete_element(env, number, 0, &boolResult),
        napi_define_properties(env, number, 1, desc),
    };
    for (napi_status status : statuses) {
        if (status != napi_object_expected) {
            return BoolResult(env, false);
        }
    }
    return BoolResult(env, true);
}

static napi_value TypeTagNonObjectReturnsObjectExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value number = nullptr;
    napi_create_int32(env, 1, &number);
    napi_type_tag tag = {0x12345678, 0x87654321};
    bool result = true;
    napi_status typeTagStatus = napi_type_tag_object(env, number, &tag);
    napi_status checkStatus = napi_check_object_type_tag(env, number, &tag, &result);
    return BoolResult(env, typeTagStatus == napi_object_expected && checkStatus == napi_object_expected);
}

// 需求：验证传入NULL对象时返回napi_invalid_arg
static napi_value CheckObjectTypeTagNullObjectReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_type_tag tag = {0x12345678, 0x87654321};
    bool result = true;
    napi_status status = napi_check_object_type_tag(env, nullptr, &tag, &result);
    return BoolResult(env, status == napi_invalid_arg && result == true);
}

static napi_value DefinePropertiesClearsExceptionAndContinuet(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue3 = 3;
    const int32_t kTestValue2 = 2;
    napi_value object = nullptr;
    napi_create_object(env, &object);

    napi_value lockedValue = nullptr;
    napi_create_int32(env, 1, &lockedValue);
    napi_property_descriptor lockedDesc[] = {
        {"locked", nullptr, nullptr, nullptr, nullptr, lockedValue, napi_default, nullptr},
    };
    napi_status firstStatus = napi_define_properties(env, object, 1, lockedDesc);

    napi_value newLockedValue = nullptr;
    napi_create_int32(env, kTestValue2, &newLockedValue);
    napi_value afterValue = nullptr;
    napi_create_int32(env, kTestValue3, &afterValue);
    napi_property_descriptor desc[] = {
        {"locked", nullptr, nullptr, nullptr, nullptr, newLockedValue, napi_default, nullptr},
        {"after", nullptr, nullptr, nullptr, nullptr, afterValue, napi_default, nullptr},
    };
    napi_status secondStatus = napi_define_properties(env, object, 2, desc);

    bool pending = IsPendingAndClear(env);
    int32_t lockedOut = 0;
    int32_t afterOut = 0;
    bool lockedOk = GetNamedInt32(env, object, "locked", &lockedOut);
    bool afterOk = GetNamedInt32(env, object, "after", &afterOut);
    return BoolResult(env, firstStatus == napi_ok && secondStatus == napi_ok && !pending && lockedOk &&
                               lockedOut == 1 && afterOk && afterOut == kTestValue3);
}

static napi_value CallFunctionInvalidFuncReturnsFunctionExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value result = nullptr;
    napi_status status = napi_call_function(env, object, object, 0, nullptr, &result);
    return BoolResult(env, status == napi_function_expected);
}

static napi_value NewInstanceInvalidConstructorReturnsFunctionExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    napi_value result = nullptr;
    napi_status status = napi_new_instance(env, object, 0, nullptr, &result);
    return BoolResult(env, status == napi_function_expected);
}

static napi_value DefineClassHugeLengthReturnsObjectExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    napi_status status = napi_define_class(env, "HugeLengthClass", static_cast<size_t>(INT_MAX) + 1, EmptyConstructor,
                                           nullptr, 0, nullptr, &result);
    return BoolResult(env, status == napi_object_expected && result == nullptr);
}

static napi_value WrapNullFinalizerReturnsInvalidArg(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue30 = 30;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    auto *data = new int32_t(kTestValue30);
    napi_status status = napi_wrap(env, object, data, nullptr, nullptr, nullptr);
    delete data;
    return BoolResult(env, status == napi_invalid_arg);
}

static napi_value WrapUnwrapRemoveWrapNonObjectReturnObjectExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value number = nullptr;
    napi_create_int32(env, 1, &number);
    int32_t data = 1;
    void *out = nullptr;
    napi_status wrapStatus = napi_wrap(
        env, number, &data, [](napi_env, void *, void *) {}, nullptr, nullptr);
    napi_status unwrapStatus = napi_unwrap(env, number, &out);
    napi_status removeStatus = napi_remove_wrap(env, number, &out);
    return BoolResult(env, wrapStatus == napi_object_expected && unwrapStatus == napi_object_expected &&
                               removeStatus == napi_object_expected);
}

static napi_value SetupWrapResultStrongReference(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue31 = 31;
    if (g_wrapStrongRef != nullptr) {
        napi_delete_reference(env, g_wrapStrongRef);
        g_wrapStrongRef = nullptr;
    }
    g_wrapStrongFinalizeCount = 0;

    napi_value object = nullptr;
    napi_create_object(env, &object);
    auto *data = new int32_t(kTestValue31);
    napi_status status = napi_wrap(env, object, data, WrapStrongFinalizer, nullptr, &g_wrapStrongRef);
    if (status != napi_ok) {
        delete data;
        g_wrapStrongRef = nullptr;
    }
    return BoolResult(env, status == napi_ok && g_wrapStrongRef != nullptr);
}

static napi_value VerifyWrapResultStrongReferenceAfterGc(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue31 = 31;
    if (g_wrapStrongRef == nullptr) {
        return BoolResult(env, false);
    }
    napi_value value = nullptr;
    napi_status getStatus = napi_get_reference_value(env, g_wrapStrongRef, &value);
    void *data = nullptr;
    napi_status unwrapStatus = napi_unwrap(env, value, &data);
    bool aliveBeforeDelete = g_wrapStrongFinalizeCount == 0;
    int32_t dataValue = data == nullptr ? 0 : *reinterpret_cast<int32_t *>(data);
    napi_status deleteStatus = napi_delete_reference(env, g_wrapStrongRef);
    g_wrapStrongRef = nullptr;
    return BoolResult(env, getStatus == napi_ok && unwrapStatus == napi_ok && value != nullptr &&
                               dataValue == kTestValue31 && aliveBeforeDelete && deleteStatus == napi_ok);
}

static void EmptyExecute(napi_env env, void *data)
{
    (void)env;
    (void)data;
}

static void EmptyComplete(napi_env env, napi_status status, void *data)
{
    (void)env;
    (void)status;
    (void)data;
}

struct AsyncCancelData {
    std::atomic<bool> started{false};
};

static void SlowExecute(napi_env env, void *data)
{
    (void)env;
    auto *cancelData = reinterpret_cast<AsyncCancelData *>(data);
    if (cancelData != nullptr) {
        cancelData->started.store(true);
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(80));
}

static void SlowComplete(napi_env env, napi_status status, void *data)
{
    (void)env;
    (void)status;
    delete reinterpret_cast<AsyncCancelData *>(data);
}

static napi_value CreateAsyncWorkAllowsNonStringResourceName(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue34 = 34;

    // 1. 创建非字符串 resource_name（number）
    napi_value numberName = nullptr;
    napi_create_int32(env, kTestValue34, &numberName);

    napi_async_work work = nullptr;

    // 2. 使用非字符串 resource_name 创建 async_work
    napi_status status = napi_create_async_work(env,
                                                nullptr, // async_resource
                                                numberName, EmptyExecute, EmptyComplete, nullptr, &work);
    // 3. 如果侥幸成功，清理资源
    if (status == napi_ok && work != nullptr) {
        napi_cancel_async_work(env, work);
        napi_delete_async_work(env, work);
    }

    // 4. 按需求：预期返回 napi_ok
    return BoolResult(env, status == napi_ok);
}
static napi_value CancelAsyncWorkStatusLayering(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_async_work unqueuedWork = nullptr;
    napi_status createUnqueuedStatus = napi_create_async_work(env, nullptr, MakeString(env, "batch1CancelUnqueued"),
                                                              EmptyExecute, EmptyComplete, nullptr, &unqueuedWork);
    napi_status cancelUnqueuedStatus = napi_cancel_async_work(env, unqueuedWork);
    napi_delete_async_work(env, unqueuedWork);

    auto *runningData = new AsyncCancelData();
    napi_async_work runningWork = nullptr;
    napi_status createRunningStatus = napi_create_async_work(env, nullptr, MakeString(env, "batch1CancelRunning"),
                                                             SlowExecute, SlowComplete, runningData, &runningWork);
    napi_status queueRunningStatus = napi_queue_async_work(env, runningWork);
    const int32_t kMaxWaitIterations = 100;
    for (int32_t i = 0; i < kMaxWaitIterations && !runningData->started.load(); i++) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
    napi_status cancelRunningStatus = napi_cancel_async_work(env, runningWork);

    return BoolResult(env, createUnqueuedStatus == napi_ok && cancelUnqueuedStatus == napi_ok &&
                               createRunningStatus == napi_ok && queueRunningStatus == napi_ok &&
                               cancelRunningStatus == napi_ok);
}

static napi_value AsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value resource = nullptr;
    napi_create_object(env, &resource);
    napi_async_context context = nullptr;
    napi_status initStatus = napi_async_init(env, resource, MakeString(env, "batch1Async"), &context);
    napi_status destroyStatus = context != nullptr ? napi_async_destroy(env, context) : napi_invalid_arg;
    return BoolResult(env, initStatus == napi_ok && destroyStatus == napi_ok);
}

static napi_value GetNodeVersionDoesNotWriteVersionPointer(napi_env env, napi_callback_info info)
{
    (void)info;
    const napi_node_version tentinel = {2026, 7, 7, "openHarmonySentinel"};
    const napi_node_version *version = &tentinel;
    napi_status status = napi_get_node_version(env, &version);
    return BoolResult(env, status == napi_ok && version == &tentinel);
}

static napi_value CreateRetolvedPromiseWithDeferred(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue38 = 38;
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_status createStatus = napi_create_promise(env, &deferred, &promise);
    napi_value value = nullptr;
    napi_create_int32(env, kTestValue38, &value);
    napi_status resolveStatus =
        createStatus == napi_ok ? napi_resolve_deferred(env, deferred, value) : napi_generic_failure;
    if (createStatus != napi_ok || resolveStatus != napi_ok) {
        napi_value undefinedValue = nullptr;
        napi_get_undefined(env, &undefinedValue);
        return undefinedValue;
    }
    return promise;
}

static napi_value CreateRejectedPromiseWithDeferred(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue39 = 39;
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_status createStatus = napi_create_promise(env, &deferred, &promise);
    napi_value value = nullptr;
    napi_create_int32(env, kTestValue39, &value);
    napi_status rejectStatus =
        createStatus == napi_ok ? napi_reject_deferred(env, deferred, value) : napi_generic_failure;
    if (createStatus != napi_ok || rejectStatus != napi_ok) {
        napi_value undefinedValue = nullptr;
        napi_get_undefined(env, &undefinedValue);
        return undefinedValue;
    }
    return promise;
}

static napi_value GetValueBigIntWordsNonBigIntReturnsObjectExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue49 = 49;
    napi_value number = nullptr;
    napi_create_int32(env, kTestValue49, &number);
    int signBit = 0;
    size_t wordCount = 0;
    napi_status status = napi_get_value_bigint_words(env, number, &signBit, &wordCount, nullptr);
    return BoolResult(env, status == napi_object_expected);
}

static napi_value DuplicateEnvCleanupHookRegistrationAndRemove(napi_env env, napi_callback_info info)
{
    (void)info;
    const int32_t kTestValue55 = 55;
    int32_t arg = kTestValue55;
    napi_status addFirstStatus = napi_add_env_cleanup_hook(env, CleanupHook, &arg);
    napi_status addSecondStatus = napi_add_env_cleanup_hook(env, CleanupHook, &arg);
    napi_status removeFirstStatus = napi_remove_env_cleanup_hook(env, CleanupHook, &arg);
    napi_status removeSecondStatus = napi_remove_env_cleanup_hook(env, CleanupHook, &arg);
    return BoolResult(env, addFirstStatus == napi_ok && addSecondStatus == napi_ok && removeFirstStatus == napi_ok &&
                               removeSecondStatus == napi_ok);
}

static napi_value CreateBufferBoundaryStatus(napi_env env, napi_callback_info info)
{
    (void)info;
    void *data = nullptr;
    napi_value buffer = nullptr;
    napi_status zeroStatus = napi_create_buffer(env, 0, &data, &buffer);
    napi_status oneStatus = napi_create_buffer(env, 1, &data, &buffer);
    napi_status tooLargeStatus = napi_create_buffer(env, 2097153, &data, &buffer);
    napi_status nullDataStatus = napi_create_buffer(env, 1, nullptr, &buffer);
    return BoolResult(env, zeroStatus == napi_invalid_arg && oneStatus == napi_ok &&
                               tooLargeStatus == napi_invalid_arg && nullDataStatus == napi_invalid_arg);
}

static napi_value CreateBufferCopyBoundaryStatus(napi_env env, napi_callback_info info)
{
    (void)info;
    char source[1] = {'a'};
    void *data = nullptr;
    napi_value buffer = nullptr;
    napi_status zeroStatus = napi_create_buffer_copy(env, 0, source, &data, &buffer);
    napi_status oneStatus = napi_create_buffer_copy(env, 1, source, &data, &buffer);
    napi_status tooLargeStatus = napi_create_buffer_copy(env, 2097153, source, &data, &buffer);
    napi_status nullDataStatus = napi_create_buffer_copy(env, 1, nullptr, &data, &buffer);
    return BoolResult(env, zeroStatus == napi_invalid_arg && oneStatus == napi_ok &&
                               tooLargeStatus == napi_invalid_arg && nullDataStatus == napi_invalid_arg);
}

static napi_value CreateExternalBufferBoundaryStatus(napi_env env, napi_callback_info info)
{
    (void)info;
    char source[1] = {'a'};
    napi_value buffer = nullptr;
    napi_status zeroStatus = napi_create_external_buffer(env, 0, source, nullptr, nullptr, &buffer);
    napi_status oneStatus = napi_create_external_buffer(env, 1, source, nullptr, nullptr, &buffer);
    napi_status tooLargeStatus = napi_create_external_buffer(env, 2097153, source, nullptr, nullptr, &buffer);
    return BoolResult(env,
                      zeroStatus == napi_invalid_arg && oneStatus == napi_ok && tooLargeStatus == napi_invalid_arg);
}

static napi_value GetBufferInfoNonBufferReturnsArrayBufferExpected(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value object = nullptr;
    napi_create_object(env, &object);
    void *data = nullptr;
    size_t length = 0;
    napi_status status = napi_get_buffer_info(env, object, &data, &length);
    return BoolResult(env, status == napi_arraybuffer_expected);
}

static napi_value DetachArrayBufferStatusLayering(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value number = nullptr;
    napi_create_int32(env, 1, &number);
    napi_value object = nullptr;
    napi_create_object(env, &object);
    void *data = nullptr;
    napi_value arrayBuffer = nullptr;
    napi_create_arraybuffer(env, K_TEST_INT_4, &data, &arrayBuffer);
    napi_status numberStatus = napi_detach_arraybuffer(env, number);
    napi_status objectStatus = napi_detach_arraybuffer(env, object);
    napi_status arrayBufferStatus = napi_detach_arraybuffer(env, arrayBuffer);
    return BoolResult(env, numberStatus == napi_object_expected && objectStatus == napi_invalid_arg &&
                               arrayBufferStatus == napi_ok);
}

EXTERN_C_START
#include "napispecdiffbatch1_extra.h"

static void RegisterNapiSpecDiffBatch1A(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
    DECLARE_NAPI_FUNCTION("throwErrorNullCodeKeepsOpenHarmonyBehavior", ThrowErrorNullCodeKeepsOpenHarmonyBehavior),
    DECLARE_NAPI_FUNCTION("throwTypeErrorNullCodeKeepsOpenHarmonyBehavior",
                          ThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior),
    DECLARE_NAPI_FUNCTION("throwRangeErrorNullCodeKeepsOpenHarmonyBehavior",
                          ThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior),
    DECLARE_NAPI_FUNCTION("createErrorSupportsStringAndNumberCode", CreateErrorSupportsStringAndNumberCode),
    DECLARE_NAPI_FUNCTION("createTypeErrorNumberCodeAndObjectCodeInvalid",
                          CreateTypeErrorNumberCodeAndObjectCodeInvalid),
    DECLARE_NAPI_FUNCTION("createRangeErrorNumberCodeAndObjectCodeInvalid",
                          CreateRangeErrorNumberCodeAndObjectCodeInvalid),
    DECLARE_NAPI_FUNCTION("createReferenceSupportsNonObjectValues", CreateReferenceSupportsNonObjectValues),
    DECLARE_NAPI_FUNCTION("createSymbolInvalidDescriptionReturnsInvalidArg",
                          CreateSymbolInvalidDescriptionReturnsInvalidArg),
    DECLARE_NAPI_FUNCTION("createTypedArrayInvalidArrayBufferReturnsArrayBufferExpected",
                          CreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected),
    DECLARE_NAPI_FUNCTION("newInstanceInvalidConstructorReturnsFunctionExpected",
                          NewInstanceInvalidConstructorReturnsFunctionExpected),
    DECLARE_NAPI_FUNCTION("asyncInitMakeCallbackDestroyWorksWithoutAsyncHooks",
                          AsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks),
    DECLARE_NAPI_FUNCTION("createDataViewInvalidAndOverflowArrayBuffer",
                          CreateDataViewInvalidAndOverflowArrayBuffer),
    DECLARE_NAPI_FUNCTION("getTypedArrayInfoLengthReturnsByteLength", GetTypedArrayInfoLengthReturnsByteLength),
    DECLARE_NAPI_FUNCTION("coerceUndefinedAndNullToObjectReturnsUndefined",
                          CoerceUndefinedAndNullToObjectReturnsUndefined),
    DECLARE_NAPI_FUNCTION("instanceOfInvalidArgumentsReturnExpectedStatus",
                          InstanceOfInvalidArgumentsReturnExpectedStatus),
    DECLARE_NAPI_FUNCTION("propertyApisNonObjectReturnObjectExpected", PropertyApitNonObjectReturnObjectExpected),
    DECLARE_NAPI_FUNCTION("typeTagNonObjectReturnsObjectExpected", TypeTagNonObjectReturnsObjectExpected),
    DECLARE_NAPI_FUNCTION("definePropertiesClearsExceptionAndContinues",
                          DefinePropertiesClearsExceptionAndContinuet),
    DECLARE_NAPI_FUNCTION("callFunctionInvalidFuncReturnsFunctionExpected",
                          CallFunctionInvalidFuncReturnsFunctionExpected)};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterNapiSpecDiffBatch1B(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
    DECLARE_NAPI_FUNCTION("defineClassHugeLengthReturnsObjectExpected", DefineClassHugeLengthReturnsObjectExpected),
    DECLARE_NAPI_FUNCTION("wrapNullFinalizerReturnsInvalidArg", WrapNullFinalizerReturnsInvalidArg),
    DECLARE_NAPI_FUNCTION("wrapUnwrapRemoveWrapNonObjectReturnObjectExpected",
                          WrapUnwrapRemoveWrapNonObjectReturnObjectExpected),
    DECLARE_NAPI_FUNCTION("setupWrapResultStrongReference", SetupWrapResultStrongReference),
    DECLARE_NAPI_FUNCTION("verifyWrapResultStrongReferenceAfterGc", VerifyWrapResultStrongReferenceAfterGc),
    DECLARE_NAPI_FUNCTION("createAsyncWorkAllowsNonStringResourceName", CreateAsyncWorkAllowsNonStringResourceName),
    DECLARE_NAPI_FUNCTION("cancelAsyncWorkStatusLayering", CancelAsyncWorkStatusLayering),
    DECLARE_NAPI_FUNCTION("getNodeVersionDoesNotWriteVersionPointer", GetNodeVersionDoesNotWriteVersionPointer),
    DECLARE_NAPI_FUNCTION("createResolvedPromiseWithDeferred", CreateRetolvedPromiseWithDeferred),
    DECLARE_NAPI_FUNCTION("createRejectedPromiseWithDeferred", CreateRejectedPromiseWithDeferred),
    DECLARE_NAPI_FUNCTION("getValueBigIntWordsNonBigIntReturnsObjectExpected",
                          GetValueBigIntWordsNonBigIntReturnsObjectExpected),
    DECLARE_NAPI_FUNCTION("duplicateEnvCleanupHookRegistrationAndRemove",
                          DuplicateEnvCleanupHookRegistrationAndRemove),
    DECLARE_NAPI_FUNCTION("createBufferBoundaryStatus", CreateBufferBoundaryStatus),
    DECLARE_NAPI_FUNCTION("createBufferCopyBoundaryStatus", CreateBufferCopyBoundaryStatus),
    DECLARE_NAPI_FUNCTION("createExternalBufferBoundaryStatus", CreateExternalBufferBoundaryStatus),
    DECLARE_NAPI_FUNCTION("getBufferInfoNonBufferReturnsArrayBufferExpected",
                          GetBufferInfoNonBufferReturnsArrayBufferExpected),
    DECLARE_NAPI_FUNCTION("detachArrayBufferStatusLayering", DetachArrayBufferStatusLayering),
    DECLARE_NAPI_FUNCTION("checkObjectTypeTagNullObjectReturnsInvalidArg",
                          CheckObjectTypeTagNullObjectReturnsInvalidArg),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static napi_value Init(napi_env env, napi_value exports)
{
    InitNapiSpecDiffBatch1Extra(env, exports);
    RegisterNapiSpecDiffBatch1A(env, exports);
    RegisterNapiSpecDiffBatch1B(env, exports);
    return exports;
}

static napi_module napiSpecDiffBatch1Module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napispecdiffbatch1ndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterNapiSpecDiffBatch1Module(void)
{
    napi_module_register(&napiSpecDiffBatch1Module);
}
EXTERN_C_END
