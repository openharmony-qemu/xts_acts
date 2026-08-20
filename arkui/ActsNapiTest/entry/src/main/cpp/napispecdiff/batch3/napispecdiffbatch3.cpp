/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "napi/native_api.h"
#include "native_common.h"

#include <atomic>
#include <thread>

static napi_value BoolResult(napi_env env, bool value) {
  return Ret(env, value ? 1 : 0);
}

static napi_value MakeString(napi_env env, const char *value) {
  napi_value result = nullptr;
  napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
  return result;
}

static napi_value EmptyCallback(napi_env env, napi_callback_info info) {
  (void)info;
  napi_value undefinedValue = nullptr;
  napi_get_undefined(env, &undefinedValue);
  return undefinedValue;
}

static napi_threadsafe_function g_crossThreadTsfn = nullptr;

static napi_value RetStatus(napi_env env, napi_status status) {
  return Ret(env, static_cast<int32_t>(status));
}

static void EmptyThreadsafeCall(napi_env env, napi_value jsCallback,
                                void *context, void *data) {
  (void)env;
  (void)jsCallback;
  (void)context;
  (void)data;
}

static void EmptyExecute(napi_env env, void *data) {
  (void)env;
  auto *counter = reinterpret_cast<std::atomic<int32_t> *>(data);
  if (counter != nullptr) {
    counter->fetch_add(1);
  }
}

static void EmptyComplete(napi_env env, napi_status status, void *data) {
  (void)env;
  (void)status;
  delete reinterpret_cast<std::atomic<int32_t> *>(data);
}

static napi_value
CreateThreadsafeFunctionInitialCountLimit(napi_env env,
                                          napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-040
  napi_value function = nullptr;
  napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr,
                       &function);
  napi_value name = MakeString(env, "batch3Tsfn");

  napi_threadsafe_function tsfn128 = nullptr;
  napi_status status128 = napi_create_threadsafe_function(
      env, function, nullptr, name, 0, 128, nullptr, nullptr, nullptr, nullptr,
      &tsfn128);
  if (status128 == napi_ok && tsfn128 != nullptr) {
    napi_release_threadsafe_function(tsfn128, napi_tsfn_abort);
  }

  napi_threadsafe_function tsfn129 = nullptr;
  napi_status status129 = napi_create_threadsafe_function(
      env, function, nullptr, name, 0, 129, nullptr, nullptr, nullptr, nullptr,
      &tsfn129);
  if (status129 == napi_ok && tsfn129 != nullptr) {
    napi_release_threadsafe_function(tsfn129, napi_tsfn_abort);
  }
  return BoolResult(env, status128 == napi_ok && status129 != napi_ok);
}

static napi_value QueueAsyncWorkWithQosReturnsOk(napi_env env,
                                                 napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-001
  auto *counter = new std::atomic<int32_t>(0);
  napi_async_work work = nullptr;
  napi_status createStatus =
      napi_create_async_work(env, nullptr, MakeString(env, "batch3QosWork"),
                             EmptyExecute, EmptyComplete, counter, &work);
  if (createStatus != napi_ok || work == nullptr) {
    delete counter;
    return BoolResult(env, false);
  }
  napi_status queueStatus =
      napi_queue_async_work_with_qos(env, work, napi_qos_default);
  if (queueStatus != napi_ok) {
    napi_delete_async_work(env, work);
  }
  return BoolResult(env, queueStatus == napi_ok);
}

static napi_value
ThreadsafeFunctionLooseResourceAndNameTypes(napi_env env,
                                            napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-041
  napi_value function = nullptr;
  napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr,
                       &function);
  napi_value numberResource = nullptr;
  napi_create_int32(env, 4101, &numberResource);
  napi_value numberName = nullptr;
  napi_create_int32(env, 4102, &numberName);

  napi_threadsafe_function tsfn = nullptr;
  napi_status createStatus = napi_create_threadsafe_function(
      env, function, numberResource, numberName, 0, 1, nullptr, nullptr,
      nullptr, nullptr, &tsfn);
  napi_status releaseStatus =
      tsfn != nullptr ? napi_release_threadsafe_function(tsfn, napi_tsfn_abort)
                      : napi_invalid_arg;
  return BoolResult(env, createStatus == napi_ok && releaseStatus == napi_ok);
}

static napi_value
ReleaseThreadsafeFunctionAfterCountZero(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-044
  napi_value function = nullptr;
  napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr,
                       &function);
  napi_value name = MakeString(env, "batch3ReleaseZero");
  napi_threadsafe_function tsfn = nullptr;
  napi_status createStatus = napi_create_threadsafe_function(
      env, function, nullptr, name, 0, 2, nullptr, nullptr, nullptr, nullptr,
      &tsfn);
  napi_status firstRelease =
      tsfn != nullptr
          ? napi_release_threadsafe_function(tsfn, napi_tsfn_release)
          : napi_invalid_arg;
  napi_status secondRelease =
      tsfn != nullptr
          ? napi_release_threadsafe_function(tsfn, napi_tsfn_release)
          : napi_invalid_arg;
  napi_status thirdRelease =
      tsfn != nullptr
          ? napi_release_threadsafe_function(tsfn, napi_tsfn_release)
          : napi_invalid_arg;
  return BoolResult(env, createStatus == napi_ok && firstRelease == napi_ok &&
                             secondRelease == napi_ok &&
                             thirdRelease == napi_generic_failure);
}

static napi_value
SetupThreadsafeFunctionCrossThreadProbe(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-045 OH-NAPI-DIFF-046 setup
  if (g_crossThreadTsfn != nullptr) {
    napi_release_threadsafe_function(g_crossThreadTsfn, napi_tsfn_abort);
    g_crossThreadTsfn = nullptr;
  }

  napi_value function = nullptr;
  napi_create_function(env, "noop", NAPI_AUTO_LENGTH, EmptyCallback, nullptr,
                       &function);
  napi_value name = MakeString(env, "batch3CrossThreadTsfn");
  napi_status createStatus = napi_create_threadsafe_function(
      env, function, nullptr, name, 0, 1, nullptr, nullptr, nullptr,
      EmptyThreadsafeCall, &g_crossThreadTsfn);
  if (createStatus != napi_ok) {
    g_crossThreadTsfn = nullptr;
  }
  return BoolResult(env,
                    createStatus == napi_ok && g_crossThreadTsfn != nullptr);
}

static napi_value RefThreadsafeFunctionWithCurrentEnv(napi_env env,
                                                      napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-045
  if (g_crossThreadTsfn == nullptr) {
    return RetStatus(env, napi_invalid_arg);
  }
  return RetStatus(env, napi_ref_threadsafe_function(env, g_crossThreadTsfn));
}

static napi_value
UnrefThreadsafeFunctionWithCurrentEnv(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-046
  if (g_crossThreadTsfn == nullptr) {
    return RetStatus(env, napi_invalid_arg);
  }
  return RetStatus(env, napi_unref_threadsafe_function(env, g_crossThreadTsfn));
}

static napi_value
CleanupThreadsafeFunctionCrossThreadProbe(napi_env env,
                                          napi_callback_info info) {
  (void)info;
  if (g_crossThreadTsfn == nullptr) {
    return BoolResult(env, true);
  }
  napi_status releaseStatus =
      napi_release_threadsafe_function(g_crossThreadTsfn, napi_tsfn_abort);
  g_crossThreadTsfn = nullptr;
  return BoolResult(env, releaseStatus == napi_ok ||
                             releaseStatus == napi_generic_failure);
}

static napi_value CreateArkRuntimeOnNativeThread(napi_env env,
                                                 napi_callback_info info) {
  (void)env;
  (void)info;
  // OH-NAPI-EXT-007
  std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> destroyStatus(
      static_cast<int32_t>(napi_generic_failure));
  std::thread worker([&createStatus, &destroyStatus]() {
    napi_env newEnv = nullptr;
    napi_status status = napi_create_ark_runtime(&newEnv);
    createStatus.store(static_cast<int32_t>(status));
    if (status == napi_ok && newEnv != nullptr) {
      destroyStatus.store(
          static_cast<int32_t>(napi_destroy_ark_runtime(&newEnv)));
    }
  });
  worker.join();
  return BoolResult(env, createStatus.load() == napi_ok &&
                             destroyStatus.load() == napi_ok);
}

static napi_value IsSendableDistinguishesValues(napi_env env,
                                                napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-016
  napi_value object = nullptr;
  napi_create_object(env, &object);
  napi_value sendableObject = nullptr;
  napi_create_sendable_object_with_properties(env, 0, nullptr, &sendableObject);
  bool objectResult = true;
  bool sendableResult = false;
  napi_status objectStatus = napi_is_sendable(env, object, &objectResult);
  napi_status sendableStatus =
      napi_is_sendable(env, sendableObject, &sendableResult);
  return BoolResult(env, objectStatus == napi_ok && sendableStatus == napi_ok &&
                             !objectResult && sendableResult);
}

static napi_value CreateSendableObjectArrayAndBuffer(napi_env env,
                                                     napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-018 OH-NAPI-EXT-019 OH-NAPI-EXT-021
  napi_value object = nullptr;
  napi_value array = nullptr;
  napi_value arrayBuffer = nullptr;
  void *data = nullptr;
  napi_status objectStatus =
      napi_create_sendable_object_with_properties(env, 0, nullptr, &object);
  napi_status arrayStatus = napi_create_sendable_array(env, &array);
  napi_status bufferStatus =
      napi_create_sendable_arraybuffer(env, 8, &data, &arrayBuffer);
  bool objectSendable = false;
  bool arraySendable = false;
  bool bufferSendable = false;
  napi_is_sendable(env, object, &objectSendable);
  napi_is_sendable(env, array, &arraySendable);
  napi_is_sendable(env, arrayBuffer, &bufferSendable);
  return BoolResult(env, objectStatus == napi_ok && arrayStatus == napi_ok &&
                             bufferStatus == napi_ok && objectSendable &&
                             arraySendable && bufferSendable &&
                             data != nullptr);
}

static napi_value
CreateSendableArrayWithLengthAndTypedArray(napi_env env,
                                           napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-020 OH-NAPI-EXT-022
  napi_value array = nullptr;
  napi_status arrayStatus =
      napi_create_sendable_array_with_length(env, 4, &array);
  uint32_t length = 0;
  napi_get_array_length(env, array, &length);

  void *data = nullptr;
  napi_value arrayBuffer = nullptr;
  napi_create_sendable_arraybuffer(env, 16, &data, &arrayBuffer);
  napi_value typedArray = nullptr;
  napi_status typedArrayStatus = napi_create_sendable_typedarray(
      env, napi_int32_array, 4, arrayBuffer, 0, &typedArray);
  bool typedArraySendable = false;
  napi_is_sendable(env, typedArray, &typedArraySendable);
  return BoolResult(env, arrayStatus == napi_ok && length == 4 &&
                             typedArrayStatus == napi_ok && typedArraySendable);
}

static napi_value SendableTypedArrayInfoAndTypeCheck(napi_env env,
                                                     napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-016 OH-NAPI-DIFF-017
  void *data = nullptr;
  napi_value arrayBuffer = nullptr;
  napi_status bufferStatus =
      napi_create_sendable_arraybuffer(env, 16, &data, &arrayBuffer);
  napi_value typedArray = nullptr;
  napi_status createStatus = napi_create_sendable_typedarray(
      env, napi_int32_array, 4, arrayBuffer, 0, &typedArray);

  bool isTypedArray = false;
  napi_status isStatus = napi_is_typedarray(env, typedArray, &isTypedArray);

  napi_typedarray_type type = napi_int8_array;
  size_t length = 0;
  void *outData = nullptr;
  napi_value outArrayBuffer = nullptr;
  size_t byteOffset = 1;
  napi_status infoStatus = napi_get_typedarray_info(
      env, typedArray, &type, &length, &outData, &outArrayBuffer, &byteOffset);
  bool sameArrayBuffer = false;
  napi_strict_equals(env, arrayBuffer, outArrayBuffer, &sameArrayBuffer);

  return BoolResult(
      env, bufferStatus == napi_ok && createStatus == napi_ok &&
               isStatus == napi_ok && isTypedArray && infoStatus == napi_ok &&
               type == napi_int32_array && length == 16 && outData == data &&
               sameArrayBuffer && byteOffset == 0);
}

static napi_value CreateObjectWithPropertiesHelpers(napi_env env,
                                                    napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-004 OH-NAPI-EXT-005
  napi_property_descriptor desc[] = {
      {"alpha", nullptr, nullptr, nullptr, nullptr, MakeString(env, "A"),
       napi_default, nullptr},
  };
  napi_value objectWithDesc = nullptr;
  napi_status descStatus =
      napi_create_object_with_properties(env, &objectWithDesc, 1, desc);

  const char *keys[] = {"beta"};
  napi_value values[1] = {nullptr};
  napi_create_int32(env, 2, &values[0]);
  napi_value objectWithNames = nullptr;
  napi_status namedStatus = napi_create_object_with_named_properties(
      env, &objectWithNames, 1, keys, values);

  napi_value alpha = nullptr;
  napi_value beta = nullptr;
  napi_get_named_property(env, objectWithDesc, "alpha", &alpha);
  napi_get_named_property(env, objectWithNames, "beta", &beta);
  int32_t betaValue = 0;
  napi_get_value_int32(env, beta, &betaValue);
  return BoolResult(env, descStatus == napi_ok && namedStatus == napi_ok &&
                             alpha != nullptr && betaValue == 2);
}

static napi_value ThrowBusinessErrorStatus(napi_env env,
                                           napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-043
  napi_status nullMsgStatus = napi_throw_business_error(env, 100, nullptr);
  napi_status throwStatus =
      napi_throw_business_error(env, 100, "business error");
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, nullMsgStatus == napi_invalid_arg &&
                             throwStatus == napi_ok && pending);
}

static napi_value CallsiteInfoGetAndSetProperty(napi_env env,
                                                napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-044 OH-NAPI-EXT-045 OH-NAPI-EXT-046
  napi_callsite_info callsite = nullptr;
  napi_status createStatus = napi_create_callsite_info(env, &callsite);
  napi_value object = nullptr;
  napi_create_object(env, &object);
  napi_value key = MakeString(env, "value");
  napi_value value = nullptr;
  napi_create_int32(env, 46, &value);
  bool setHit = false;
  bool getHit = false;
  napi_status setStatus = napi_set_property_with_callsite_info(
      env, object, key, value, callsite, &setHit);
  napi_value out = nullptr;
  napi_status getStatus = napi_get_property_with_callsite_info(
      env, object, key, callsite, &out, &getHit);
  int32_t outValue = 0;
  napi_get_value_int32(env, out, &outValue);
  napi_status deleteStatus = napi_delete_callsite_info(env, callsite);
  return BoolResult(env, createStatus == napi_ok && setStatus == napi_ok &&
                             getStatus == napi_ok && deleteStatus == napi_ok &&
                             outValue == 46);
}

static napi_value
CallsiteInfoNullParametersAreAccepted(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-045 OH-NAPI-EXT-046
  napi_value object = nullptr;
  napi_create_object(env, &object);
  napi_value key = MakeString(env, "nullInfoValue");
  napi_value value = nullptr;
  napi_create_int32(env, 45046, &value);

  napi_status setStatus = napi_set_property_with_callsite_info(
      env, object, key, value, nullptr, nullptr);
  napi_value out = nullptr;
  napi_status getStatus = napi_get_property_with_callsite_info(
      env, object, key, nullptr, &out, nullptr);

  int32_t outValue = 0;
  napi_get_value_int32(env, out, &outValue);
  return BoolResult(env, setStatus == napi_ok && getStatus == napi_ok &&
                             outValue == 45046);
}

static napi_value CriticalScopeUtf16BufferBehavior(napi_env env,
                                                   napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-032
  const char16_t text[] = {0x4F60, 0x597D, 0};
  napi_value utf16Value = nullptr;
  napi_create_string_utf16(env, text, 2, &utf16Value);
  napi_value asciiValue = MakeString(env, "ASCII");

  napi_critical_scope scope = nullptr;
  napi_status openStatus = napi_open_critical_scope(env, &scope);
  const char16_t *buffer = nullptr;
  size_t length = 0;
  napi_status utf16Status = napi_get_buffer_string_utf16_in_critical_scope(
      env, utf16Value, &buffer, &length);
  const char16_t *asciiBuffer = nullptr;
  size_t asciiLength = 0;
  napi_status asciiStatus = napi_get_buffer_string_utf16_in_critical_scope(
      env, asciiValue, &asciiBuffer, &asciiLength);
  napi_status closeStatus = napi_close_critical_scope(env, scope);

  return BoolResult(env, openStatus == napi_ok && utf16Status == napi_ok &&
                             closeStatus == napi_ok && buffer != nullptr &&
                             length == 2 && buffer[0] == text[0] &&
                             buffer[1] == text[1] &&
                             asciiStatus == napi_invalid_arg);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("createThreadsafeFunctionInitialCountLimit",
                            CreateThreadsafeFunctionInitialCountLimit),
      DECLARE_NAPI_FUNCTION("queueAsyncWorkWithQosReturnsOk",
                            QueueAsyncWorkWithQosReturnsOk),
      DECLARE_NAPI_FUNCTION("threadsafeFunctionLooseResourceAndNameTypes",
                            ThreadsafeFunctionLooseResourceAndNameTypes),
      DECLARE_NAPI_FUNCTION("releaseThreadsafeFunctionAfterCountZero",
                            ReleaseThreadsafeFunctionAfterCountZero),
      DECLARE_NAPI_FUNCTION("setupThreadsafeFunctionCrossThreadProbe",
                            SetupThreadsafeFunctionCrossThreadProbe),
      DECLARE_NAPI_FUNCTION("refThreadsafeFunctionWithCurrentEnv",
                            RefThreadsafeFunctionWithCurrentEnv),
      DECLARE_NAPI_FUNCTION("unrefThreadsafeFunctionWithCurrentEnv",
                            UnrefThreadsafeFunctionWithCurrentEnv),
      DECLARE_NAPI_FUNCTION("cleanupThreadsafeFunctionCrossThreadProbe",
                            CleanupThreadsafeFunctionCrossThreadProbe),
      DECLARE_NAPI_FUNCTION("createArkRuntimeOnNativeThread",
                            CreateArkRuntimeOnNativeThread),
      DECLARE_NAPI_FUNCTION("isSendableDistinguishesValues",
                            IsSendableDistinguishesValues),
      DECLARE_NAPI_FUNCTION("createSendableObjectArrayAndBuffer",
                            CreateSendableObjectArrayAndBuffer),
      DECLARE_NAPI_FUNCTION("createSendableArrayWithLengthAndTypedArray",
                            CreateSendableArrayWithLengthAndTypedArray),
      DECLARE_NAPI_FUNCTION("sendableTypedArrayInfoAndTypeCheck",
                            SendableTypedArrayInfoAndTypeCheck),
      DECLARE_NAPI_FUNCTION("createObjectWithPropertiesHelpers",
                            CreateObjectWithPropertiesHelpers),
      DECLARE_NAPI_FUNCTION("throwBusinessErrorStatus",
                            ThrowBusinessErrorStatus),
      DECLARE_NAPI_FUNCTION("callsiteInfoGetAndSetProperty",
                            CallsiteInfoGetAndSetProperty),
      DECLARE_NAPI_FUNCTION("callsiteInfoNullParametersAreAccepted",
                            CallsiteInfoNullParametersAreAccepted),
      DECLARE_NAPI_FUNCTION("criticalScopeUtf16BufferBehavior",
                            CriticalScopeUtf16BufferBehavior),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
EXTERN_C_END

static napi_module napiSpecDiffBatch3Module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libnapispecdiffbatch3ndktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void
RegisterNapiSpecDiffBatch3Module(void) {
  napi_module_register(&napiSpecDiffBatch3Module);
}
