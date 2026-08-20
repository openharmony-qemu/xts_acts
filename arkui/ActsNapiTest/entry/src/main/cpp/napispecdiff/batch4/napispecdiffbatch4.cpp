/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "napi/native_api.h"
#include "native_common.h"
#include "node_api.h"

#include <atomic>
#include <chrono>
#include <cstdint>
#include <limits>
#include <thread>

static napi_value BoolResult(napi_env env, bool value) {
  return Ret(env, value ? 1 : 0);
}

static napi_value MakeString(napi_env env, const char *value) {
  napi_value result = nullptr;
  napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &result);
  return result;
}

static void ExternalStringFinalize(void *data, void *hint) {
  (void)hint;
  auto *counter = reinterpret_cast<int32_t *>(data);
  if (counter != nullptr) {
    (*counter)++;
  }
}

static napi_value EmptyCallback(napi_env env, napi_callback_info info) {
  (void)info;
  napi_value undefinedValue = nullptr;
  napi_get_undefined(env, &undefinedValue);
  return undefinedValue;
}

static napi_value
SetElementHugeIndexDoesNotMutateObject(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-022
  napi_value object = nullptr;
  napi_create_array(env, &object);
  napi_value value = nullptr;
  napi_create_int32(env, 22, &value);

  const uint32_t hugeIndex = std::numeric_limits<uint32_t>::max() - 1;
  napi_status setStatus = napi_set_element(env, object, hugeIndex, value);
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  bool hasElement = true;
  napi_status hasStatus = napi_has_element(env, object, hugeIndex, &hasElement);
  if (setStatus == napi_ok) {
    return BoolResult(env, !pending && hasStatus == napi_ok && hasElement);
  }
  return BoolResult(env, setStatus == napi_pending_exception && pending &&
                             hasStatus == napi_ok && !hasElement);
}

static napi_value FatalExceptionRejectsNonError(napi_env env,
                                                napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-060
  napi_value object = nullptr;
  napi_create_object(env, &object);
  napi_status objectStatus = napi_fatal_exception(env, object);

  napi_value text = MakeString(env, "not error");
  napi_status stringStatus = napi_fatal_exception(env, text);

  bool pending = true;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, objectStatus == napi_invalid_arg &&
                             stringStatus == napi_invalid_arg && !pending);
}

static napi_value ExternalStringUtf16AndAsciiCreate(napi_env env,
                                                    napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-036 OH-NAPI-EXT-037 OH-NAPI-EXT-038
  int32_t utf16FinalizeCount = 0;
  int32_t asciiFinalizeCount = 0;
  const char16_t utf16Text[] = u"ohos";
  napi_value utf16Value = nullptr;
  napi_status utf16Status = napi_create_external_string_utf16(
      env, utf16Text, NAPI_AUTO_LENGTH, ExternalStringFinalize,
      &utf16FinalizeCount, &utf16Value);

  const char asciiText[] = "napi";
  napi_value asciiValue = nullptr;
  napi_status asciiStatus = napi_create_external_string_ascii(
      env, asciiText, NAPI_AUTO_LENGTH, ExternalStringFinalize,
      &asciiFinalizeCount, &asciiValue);

  size_t utf16Length = 0;
  size_t asciiLength = 0;
  napi_get_value_string_utf16(env, utf16Value, nullptr, 0, &utf16Length);
  napi_get_value_string_utf8(env, asciiValue, nullptr, 0, &asciiLength);
  return BoolResult(env, utf16Status == napi_ok && asciiStatus == napi_ok &&
                             utf16Length == 4 && asciiLength == 4 &&
                             utf16FinalizeCount == 0 &&
                             asciiFinalizeCount == 0);
}

static napi_value CreateDateExtremeReturnsStatus(napi_env env,
                                                 napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-047
  napi_value result = nullptr;
  napi_status status =
      napi_create_date(env, std::numeric_limits<double>::infinity(), &result);
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, status == napi_ok || status == napi_pending_exception);
}

static napi_value CallFunctionNullRecvIsolatedProbe(napi_env env,
                                                    napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-026
  std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> callStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> destroyStatus(
      static_cast<int32_t>(napi_generic_failure));
  std::thread worker([&]() {
    napi_env isolatedEnv = nullptr;
    napi_status create = napi_create_ark_runtime(&isolatedEnv);
    createStatus.store(static_cast<int32_t>(create));
    if (create != napi_ok || isolatedEnv == nullptr) {
      return;
    }

    napi_value function = nullptr;
    napi_create_function(isolatedEnv, "noop", NAPI_AUTO_LENGTH, EmptyCallback,
                         nullptr, &function);
    napi_value result = nullptr;
    napi_status status =
        napi_call_function(isolatedEnv, nullptr, function, 0, nullptr, &result);
    callStatus.store(static_cast<int32_t>(status));
    bool pending = false;
    napi_is_exception_pending(isolatedEnv, &pending);
    if (pending) {
      napi_value exception = nullptr;
      napi_get_and_clear_last_exception(isolatedEnv, &exception);
    }
    destroyStatus.store(
        static_cast<int32_t>(napi_destroy_ark_runtime(&isolatedEnv)));
  });
  worker.join();
  napi_status observed = static_cast<napi_status>(callStatus.load());
  return BoolResult(
      env, createStatus.load() == napi_ok && destroyStatus.load() == napi_ok &&
               (observed == napi_ok || observed == napi_pending_exception ||
                observed == napi_generic_failure));
}

static napi_value
TsfnDestroyRuntimeWithoutExplicitCleanupProbe(napi_env env,
                                              napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-042
  std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> tsfnStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> destroyStatus(
      static_cast<int32_t>(napi_generic_failure));
  std::thread worker([&]() {
    napi_env isolatedEnv = nullptr;
    napi_status create = napi_create_ark_runtime(&isolatedEnv);
    createStatus.store(static_cast<int32_t>(create));
    if (create != napi_ok || isolatedEnv == nullptr) {
      return;
    }

    napi_value function = nullptr;
    napi_create_function(isolatedEnv, "noop", NAPI_AUTO_LENGTH, EmptyCallback,
                         nullptr, &function);
    napi_value name = MakeString(isolatedEnv, "batch4TsfnNoCleanup");
    napi_threadsafe_function tsfn = nullptr;
    napi_status tsfnCreate = napi_create_threadsafe_function(
        isolatedEnv, function, nullptr, name, 0, 1, nullptr, nullptr, nullptr,
        nullptr, &tsfn);
    tsfnStatus.store(static_cast<int32_t>(tsfnCreate));
    destroyStatus.store(
        static_cast<int32_t>(napi_destroy_ark_runtime(&isolatedEnv)));
  });
  worker.join();
  return BoolResult(env, createStatus.load() == napi_ok &&
                             tsfnStatus.load() == napi_ok &&
                             destroyStatus.load() == napi_ok);
}

static napi_value
CallThreadsafeFunctionAfterRuntimeDestroyProbe(napi_env env,
                                               napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-043
  std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> tsfnStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> destroyStatus(
      static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> callStatus(static_cast<int32_t>(napi_generic_failure));
  std::thread worker([&]() {
    napi_env isolatedEnv = nullptr;
    napi_status create = napi_create_ark_runtime(&isolatedEnv);
    createStatus.store(static_cast<int32_t>(create));
    if (create != napi_ok || isolatedEnv == nullptr) {
      return;
    }

    napi_value function = nullptr;
    napi_create_function(isolatedEnv, "noop", NAPI_AUTO_LENGTH, EmptyCallback,
                         nullptr, &function);
    napi_value name = MakeString(isolatedEnv, "batch4TsfnStaleEnv");
    napi_threadsafe_function tsfn = nullptr;
    napi_status tsfnCreate = napi_create_threadsafe_function(
        isolatedEnv, function, nullptr, name, 0, 1, nullptr, nullptr, nullptr,
        nullptr, &tsfn);
    tsfnStatus.store(static_cast<int32_t>(tsfnCreate));
    destroyStatus.store(
        static_cast<int32_t>(napi_destroy_ark_runtime(&isolatedEnv)));
    if (tsfnCreate == napi_ok && tsfn != nullptr) {
      callStatus.store(static_cast<int32_t>(
          napi_call_threadsafe_function(tsfn, nullptr, napi_tsfn_nonblocking)));
    }
  });
  worker.join();
  napi_status observed = static_cast<napi_status>(callStatus.load());
  return BoolResult(env, createStatus.load() == napi_ok &&
                             tsfnStatus.load() == napi_ok &&
                             destroyStatus.load() == napi_ok &&
                             observed == napi_generic_failure);
}

static napi_value CreateBigintHugeWordsProbe(napi_env env,
                                             napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-048
  uint64_t word = 1;
  napi_value result = nullptr;
  napi_status status = napi_create_bigint_words(
      env, 0, std::numeric_limits<uint32_t>::max(), &word, &result);
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, status == napi_invalid_arg && result == nullptr &&
                             !pending);
}

static void ThrowingFinalizer(napi_env env, void *data, void *hint) {
  (void)hint;
  auto *counter = reinterpret_cast<int32_t *>(data);
  if (counter != nullptr) {
    (*counter)++;
  }
  napi_throw_error(env, nullptr, "batch4 finalizer throw probe");
}

static napi_value AddFinalizerThrowExceptionProbe(napi_env env,
                                                  napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-058
  int32_t finalizeCount = 0;
  napi_value object = nullptr;
  napi_create_object(env, &object);
  napi_ref ref = nullptr;
  napi_status addStatus = napi_add_finalizer(env, object, &finalizeCount,
                                             ThrowingFinalizer, nullptr, &ref);
  napi_status deleteStatus =
      ref != nullptr ? napi_delete_reference(env, ref) : napi_invalid_arg;
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, addStatus == napi_ok && deleteStatus == napi_ok &&
                             finalizeCount == 1 && pending);
}

static napi_value
GetUvEventLoopAfterRuntimeDestroyProbe(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-061
  std::atomic<int32_t> createStatus(static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> destroyStatus(
      static_cast<int32_t>(napi_generic_failure));
  std::atomic<int32_t> getLoopStatus(
      static_cast<int32_t>(napi_generic_failure));
  std::thread worker([&]() {
    napi_env isolatedEnv = nullptr;
    napi_status create = napi_create_ark_runtime(&isolatedEnv);
    createStatus.store(static_cast<int32_t>(create));
    if (create != napi_ok || isolatedEnv == nullptr) {
      return;
    }
    napi_env staleEnv = isolatedEnv;
    destroyStatus.store(
        static_cast<int32_t>(napi_destroy_ark_runtime(&isolatedEnv)));
    uv_loop_s *loop = nullptr;
    getLoopStatus.store(
        static_cast<int32_t>(napi_get_uv_event_loop(staleEnv, &loop)));
  });
  worker.join();
  napi_status observed = static_cast<napi_status>(getLoopStatus.load());
  return BoolResult(env, createStatus.load() == napi_ok &&
                             destroyStatus.load() == napi_ok &&
                             observed == napi_generic_failure);
}

static napi_value CreateArrayWithHugeLengthProbe(napi_env env,
                                                 napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-062
  napi_value result = nullptr;
  napi_status status = napi_create_array_with_length(
      env, std::numeric_limits<uint32_t>::max(), &result);
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, status == napi_ok && result != nullptr);
}

static napi_value
CreateArrayBufferWithHugeLengthProbe(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-DIFF-063
  void *data = nullptr;
  napi_value result = nullptr;
  napi_status status = napi_create_arraybuffer(
      env, std::numeric_limits<uint32_t>::max(), &data, &result);
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return BoolResult(env, (status == napi_ok && result != nullptr) ||
                             (status == napi_pending_exception && pending));
}

static napi_value
CriticalScopeForbiddenNapiCrashProbe(napi_env env, napi_callback_info info) {
  (void)info;
  // OH-NAPI-EXT-031
  napi_critical_scope scope = nullptr;
  napi_status openStatus = napi_open_critical_scope(env, &scope);
  napi_value object = nullptr;
  napi_status forbiddenStatus = napi_create_object(env, &object);
  napi_status closeStatus = napi_close_critical_scope(env, scope);
  return BoolResult(env, openStatus == napi_ok && closeStatus == napi_ok &&
                             forbiddenStatus != napi_ok);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("setElementHugeIndexDoesNotMutateObject",
                            SetElementHugeIndexDoesNotMutateObject),
      DECLARE_NAPI_FUNCTION("fatalExceptionRejectsNonError",
                            FatalExceptionRejectsNonError),
      DECLARE_NAPI_FUNCTION("externalStringUtf16AndAsciiCreate",
                            ExternalStringUtf16AndAsciiCreate),
      DECLARE_NAPI_FUNCTION("createDateExtremeReturnsStatus",
                            CreateDateExtremeReturnsStatus),
      DECLARE_NAPI_FUNCTION("callFunctionNullRecvIsolatedProbe",
                            CallFunctionNullRecvIsolatedProbe),
      DECLARE_NAPI_FUNCTION("tsfnDestroyRuntimeWithoutExplicitCleanupProbe",
                            TsfnDestroyRuntimeWithoutExplicitCleanupProbe),
      DECLARE_NAPI_FUNCTION("callThreadsafeFunctionAfterRuntimeDestroyProbe",
                            CallThreadsafeFunctionAfterRuntimeDestroyProbe),
      DECLARE_NAPI_FUNCTION("createBigintHugeWordsProbe",
                            CreateBigintHugeWordsProbe),
      DECLARE_NAPI_FUNCTION("addFinalizerThrowExceptionProbe",
                            AddFinalizerThrowExceptionProbe),
      DECLARE_NAPI_FUNCTION("getUvEventLoopAfterRuntimeDestroyProbe",
                            GetUvEventLoopAfterRuntimeDestroyProbe),
      DECLARE_NAPI_FUNCTION("createArrayWithHugeLengthProbe",
                            CreateArrayWithHugeLengthProbe),
      DECLARE_NAPI_FUNCTION("createArrayBufferWithHugeLengthProbe",
                            CreateArrayBufferWithHugeLengthProbe),
      DECLARE_NAPI_FUNCTION("criticalScopeForbiddenNapiCrashProbe",
                            CriticalScopeForbiddenNapiCrashProbe),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
EXTERN_C_END

static napi_module napiSpecDiffBatch4Module = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libnapispecdiffbatch4ndktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void
RegisterNapiSpecDiffBatch4Module(void) {
  napi_module_register(&napiSpecDiffBatch4Module);
}
