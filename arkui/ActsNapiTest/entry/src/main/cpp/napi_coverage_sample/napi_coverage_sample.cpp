/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/native_common.h"
#include "napi/common.h"
#include "napi/native_api.h"

static napi_status SetIntProperty(napi_env env, napi_value object,
                                  const char *name, int32_t number) {
  napi_value value = nullptr;
  napi_status createStatus = napi_create_int32(env, number, &value);
  if (createStatus != napi_ok) {
    return createStatus;
  }
  return napi_set_named_property(env, object, name, value);
}

static napi_status SetStatusProperty(napi_env env, napi_value object,
                                     const char *name, napi_status status) {
  return SetIntProperty(env, object, name, static_cast<int32_t>(status));
}

static napi_status SetBoolProperty(napi_env env, napi_value object,
                                   const char *name, bool boolValue) {
  napi_value value = nullptr;
  napi_status createStatus = napi_get_boolean(env, boolValue, &value);
  if (createStatus != napi_ok) {
    return createStatus;
  }
  return napi_set_named_property(env, object, name, value);
}

static napi_value CreateResultObject(napi_env env) {
  napi_value result = nullptr;
  napi_status status = napi_create_object(env, &result);
  if (status != napi_ok) {
    return nullptr;
  }
  return result;
}

static napi_value CreateCriticalScopeStatusResult(
    napi_env env, napi_status openStatus, napi_status getBufferStatus,
    napi_status closeStatus, size_t length, bool contentMatched) {
  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }

  SetStatusProperty(env, result, "openStatus", openStatus);
  SetStatusProperty(env, result, "getBufferStatus", getBufferStatus);
  SetStatusProperty(env, result, "closeStatus", closeStatus);
  SetIntProperty(env, result, "length", static_cast<int32_t>(length));
  SetBoolProperty(env, result, "contentMatched", contentMatched);
  return result;
}

static napi_value TestEnumValues(napi_env env, napi_callback_info info) {
  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }

  SetIntProperty(env, result, "qosBackground",
                 static_cast<int32_t>(napi_qos_background));
  SetIntProperty(env, result, "qosUtility",
                 static_cast<int32_t>(napi_qos_utility));
  SetIntProperty(env, result, "eventModeDefault",
                 static_cast<int32_t>(napi_event_mode_default));
  SetIntProperty(env, result, "priorityImmediate",
                 static_cast<int32_t>(napi_priority_immediate));
  return result;
}

static napi_value DummyModuleInit(napi_env env, napi_value exports) {
  return exports;
}

static napi_value TestModuleRegister(napi_env env, napi_callback_info info) {
  static napi_module dummyModule = {
      .nm_version = 1,
      .nm_flags = 0,
      .nm_filename = nullptr,
      .nm_register_func = DummyModuleInit,
      .nm_modname = "libnapicoveragevoidprobe",
      .nm_priv = ((void *)0),
      .reserved = {0},
  };
  napi_module_register(&dummyModule);

  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }
  SetBoolProperty(env, result, "registerCalled", true);
  return result;
}

static napi_value TestFatalExceptionInvalidArg(napi_env env,
                                               napi_callback_info info) {
  napi_value notError = nullptr;
  napi_status createStringStatus =
      napi_create_string_utf8(env, "not error", NAPI_AUTO_LENGTH, &notError);
  napi_status fatalStatus = napi_generic_failure;
  if (createStringStatus == napi_ok) {
    fatalStatus = napi_fatal_exception(env, notError);
  }

  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }
  SetStatusProperty(env, result, "createStringStatus", createStringStatus);
  SetStatusProperty(env, result, "fatalStatus", fatalStatus);
  return result;
}

static napi_value TestCriticalScopeOpenClose(napi_env env,
                                             napi_callback_info info) {
  const char16_t expected[] = {0x4F60, 0x597D, 0};
  napi_value stringValue = nullptr;
  napi_status createStringStatus =
      napi_create_string_utf16(env, expected, 2, &stringValue);
  if (createStringStatus != napi_ok) {
    return CreateCriticalScopeStatusResult(env, napi_generic_failure,
                                           createStringStatus,
                                           napi_generic_failure, 0, false);
  }

  napi_critical_scope scope = nullptr;
  napi_status openStatus = napi_open_critical_scope(env, &scope);
  if (openStatus != napi_ok) {
    return CreateCriticalScopeStatusResult(
        env, openStatus, napi_generic_failure, napi_generic_failure, 0, false);
  }

  const char16_t *buffer = nullptr;
  size_t length = 0;
  napi_status getBufferStatus = napi_get_buffer_string_utf16_in_critical_scope(
      env, stringValue, &buffer, &length);
  bool contentMatched = getBufferStatus == napi_ok && length == 2 &&
                        buffer != nullptr && buffer[0] == expected[0] &&
                        buffer[1] == expected[1];
  napi_status closeStatus = napi_close_critical_scope(env, scope);
  return CreateCriticalScopeStatusResult(env, openStatus, getBufferStatus,
                                         closeStatus, length, contentMatched);
}

static void NoopExternalStringFinalizer(void *data, void *hint) {}

static napi_value TestExternalString(napi_env env, napi_callback_info info) {
  static const char16_t utf16Text[] = u"napi";
  static const char asciiText[] = "napi";

  napi_value utf16Value = nullptr;
  napi_status utf16Status = napi_create_external_string_utf16(
      env, utf16Text, 4, NoopExternalStringFinalizer, nullptr, &utf16Value);
  char16_t utf16Buffer[8] = {0};
  size_t utf16Length = 0;
  napi_status readUtf16Status =
      utf16Status == napi_ok
          ? napi_get_value_string_utf16(env, utf16Value, utf16Buffer, 8,
                                        &utf16Length)
          : napi_generic_failure;
  bool utf16Matched = readUtf16Status == napi_ok && utf16Length == 4 &&
                      utf16Buffer[0] == u'n' && utf16Buffer[1] == u'a' &&
                      utf16Buffer[2] == u'p' && utf16Buffer[3] == u'i';

  napi_value asciiValue = nullptr;
  napi_status asciiStatus = napi_create_external_string_ascii(
      env, asciiText, 4, NoopExternalStringFinalizer, nullptr, &asciiValue);
  char asciiBuffer[8] = {0};
  size_t asciiLength = 0;
  napi_status readAsciiStatus =
      asciiStatus == napi_ok
          ? napi_get_value_string_utf8(env, asciiValue, asciiBuffer, 8,
                                       &asciiLength)
          : napi_generic_failure;
  bool asciiMatched = readAsciiStatus == napi_ok && asciiLength == 4 &&
                      asciiBuffer[0] == 'n' && asciiBuffer[1] == 'a' &&
                      asciiBuffer[2] == 'p' && asciiBuffer[3] == 'i';

  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }
  SetStatusProperty(env, result, "utf16Status", utf16Status);
  SetStatusProperty(env, result, "readUtf16Status", readUtf16Status);
  SetBoolProperty(env, result, "utf16Matched", utf16Matched);
  SetStatusProperty(env, result, "asciiStatus", asciiStatus);
  SetStatusProperty(env, result, "readAsciiStatus", readAsciiStatus);
  SetBoolProperty(env, result, "asciiMatched", asciiMatched);
  return result;
}

static napi_value TestStrongSendableReference(napi_env env,
                                              napi_callback_info info) {
  napi_value sendableArray = nullptr;
  napi_status createArrayStatus =
      napi_create_sendable_array_with_length(env, 0, &sendableArray);
  napi_sendable_ref ref = nullptr;
  napi_status createRefStatus =
      createArrayStatus == napi_ok
          ? napi_create_strong_sendable_reference(env, sendableArray, &ref)
          : napi_generic_failure;
  napi_value refValue = nullptr;
  napi_status getRefStatus =
      createRefStatus == napi_ok
          ? napi_get_strong_sendable_reference_value(env, ref, &refValue)
          : napi_generic_failure;
  bool isSendable = false;
  napi_status isSendableStatus =
      getRefStatus == napi_ok ? napi_is_sendable(env, refValue, &isSendable)
                              : napi_generic_failure;
  napi_status deleteRefStatus =
      createRefStatus == napi_ok
          ? napi_delete_strong_sendable_reference(env, ref)
          : napi_generic_failure;

  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }
  SetStatusProperty(env, result, "createArrayStatus", createArrayStatus);
  SetStatusProperty(env, result, "createRefStatus", createRefStatus);
  SetStatusProperty(env, result, "getRefStatus", getRefStatus);
  SetStatusProperty(env, result, "isSendableStatus", isSendableStatus);
  SetBoolProperty(env, result, "isSendable", isSendable);
  SetStatusProperty(env, result, "deleteRefStatus", deleteRefStatus);
  return result;
}

static napi_value TestThrowBusinessError(napi_env env,
                                         napi_callback_info info) {
  napi_status throwStatus =
      napi_throw_business_error(env, 20260724, "business error");
  bool pendingAfterThrow = false;
  napi_status pendingStatus =
      napi_is_exception_pending(env, &pendingAfterThrow);

  napi_value exception = nullptr;
  napi_status clearStatus =
      pendingAfterThrow ? napi_get_and_clear_last_exception(env, &exception)
                        : napi_ok;
  bool pendingAfterClear = true;
  napi_status pendingAfterClearStatus =
      napi_is_exception_pending(env, &pendingAfterClear);

  napi_value result = CreateResultObject(env);
  if (result == nullptr) {
    return Ret(env, static_cast<int32_t>(napi_generic_failure));
  }
  SetStatusProperty(env, result, "throwStatus", throwStatus);
  SetStatusProperty(env, result, "pendingStatus", pendingStatus);
  SetBoolProperty(env, result, "pendingAfterThrow", pendingAfterThrow);
  SetStatusProperty(env, result, "clearStatus", clearStatus);
  SetStatusProperty(env, result, "pendingAfterClearStatus",
                    pendingAfterClearStatus);
  SetBoolProperty(env, result, "pendingAfterClear", pendingAfterClear);
  return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("testEnumValues", TestEnumValues),
      DECLARE_NAPI_FUNCTION("testModuleRegister", TestModuleRegister),
      DECLARE_NAPI_FUNCTION("testFatalExceptionInvalidArg",
                            TestFatalExceptionInvalidArg),
      DECLARE_NAPI_FUNCTION("testCriticalScopeOpenClose",
                            TestCriticalScopeOpenClose),
      DECLARE_NAPI_FUNCTION("testExternalString", TestExternalString),
      DECLARE_NAPI_FUNCTION("testStrongSendableReference",
                            TestStrongSendableReference),
      DECLARE_NAPI_FUNCTION("testThrowBusinessError", TestThrowBusinessError),
  };
  NAPI_CALL(env, napi_define_properties(env, exports,
                                        sizeof(desc) / sizeof(desc[0]), desc));
  return exports;
}
EXTERN_C_END

static napi_module napiCoverageSampleModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libnapicoveragesamplendktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void
RegisterNapiCoverageSampleModule(void) {
  napi_module_register(&napiCoverageSampleModule);
}
