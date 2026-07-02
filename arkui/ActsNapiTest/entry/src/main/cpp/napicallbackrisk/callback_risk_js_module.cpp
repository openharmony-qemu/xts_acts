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
#include "callback_risk_common.h"

static napi_value DestroyRuntimeCallback(napi_env env,
                                         napi_callback_info info) {
  MarkRiskCalled(33);
  RunWithArkRuntimeInNativeThread(33, [](napi_env arkEnv) { return true; });
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  return undefined;
}

static napi_value CriticalScopeLeakCallback(napi_env env,
                                            napi_callback_info info) {
  MarkRiskCalled(34);
  napi_critical_scope scope = nullptr;
  RecordRiskStatus(34, napi_open_critical_scope(env, &scope));
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  return undefined;
}

static napi_value GetterDeleteRef(napi_env env, napi_callback_info info) {
  MarkRiskCalled(35);
  void *data = nullptr;
  napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(data);
  if (probe != nullptr) {
    DeleteRefRisk(env, probe);
  }
  napi_value value = nullptr;
  napi_create_int32(env, 35, &value);
  return value;
}

static napi_value SetterThrowThenPromise(napi_env env,
                                         napi_callback_info info) {
  MarkRiskCalled(36);
  RecordRiskStatus(
      36, napi_throw_error(env, nullptr, "risk036 setter pending exception"));
  napi_deferred deferred = nullptr;
  napi_value promise = nullptr;
  RecordRiskStatus(36, napi_create_promise(env, &deferred, &promise));
  return promise;
}

static napi_value ConstructorWrapRemove(napi_env env, napi_callback_info info) {
  MarkRiskCalled(37);
  napi_value thisArg = nullptr;
  napi_get_cb_info(env, info, nullptr, nullptr, &thisArg, nullptr);
  auto *data = new int32_t(37);
  RecordRiskStatus(37,
                   napi_wrap(env, thisArg, data, nullptr, nullptr, nullptr));
  void *removed = nullptr;
  RecordRiskStatus(37, napi_remove_wrap(env, thisArg, &removed));
  delete reinterpret_cast<int32_t *>(removed);
  return thisArg;
}

static napi_value SendableConstructorMixedNapi(napi_env env,
                                               napi_callback_info info) {
  MarkRiskCalled(38);
  napi_value thisArg = nullptr;
  napi_get_cb_info(env, info, nullptr, nullptr, &thisArg, nullptr);
  napi_value normalObject = nullptr;
  RecordRiskStatus(38, napi_create_object(env, &normalObject));
  napi_ref ref = nullptr;
  RecordRiskStatus(38, napi_create_reference(env, normalObject, 1, &ref));
  if (ref != nullptr) {
    RecordRiskStatus(38, napi_delete_reference(env, ref));
  }
  return thisArg;
}

static napi_value Risk033(napi_env env, napi_callback_info info) {
  ResetRiskState(33);
  napi_value func = nullptr;
  NAPI_CALL(env, napi_create_function(env, "destroyRuntime", NAPI_AUTO_LENGTH,
                                      DestroyRuntimeCallback, nullptr, &func));
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  napi_value result = nullptr;
  napi_status status =
      napi_call_function(env, undefined, func, 0, nullptr, &result);
  return RiskResult(env,
                    status == napi_ok && GetRiskStates()[33].called.load() > 0);
}

static napi_value Risk034(napi_env env, napi_callback_info info) {
  ResetRiskState(34);
  napi_value func = nullptr;
  NAPI_CALL(env,
            napi_create_function(env, "criticalScopeLeak", NAPI_AUTO_LENGTH,
                                 CriticalScopeLeakCallback, nullptr, &func));
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  napi_value result = nullptr;
  napi_status status =
      napi_call_function(env, undefined, func, 0, nullptr, &result);
  return RiskResult(env,
                    status == napi_ok && GetRiskStates()[34].called.load() > 0);
}

static napi_value Risk035(napi_env env, napi_callback_info info) {
  ResetRiskState(35);
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  auto *probe = new CallbackRiskProbe();
  probe->id = 35;
  probe->ref = CreateStrongRef(env, object);
  napi_property_descriptor desc[] = {{"riskGetter", nullptr, nullptr,
                                      GetterDeleteRef, nullptr, nullptr,
                                      napi_default, probe}};
  NAPI_CALL(env, napi_define_properties(env, object, 1, desc));
  napi_value value = nullptr;
  napi_status status =
      napi_get_named_property(env, object, "riskGetter", &value);
  delete probe;
  return RiskResult(env,
                    status == napi_ok && GetRiskStates()[35].called.load() > 0);
}

static napi_value Risk036(napi_env env, napi_callback_info info) {
  ResetRiskState(36);
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  napi_property_descriptor desc[] = {{"riskSetter", nullptr, nullptr, nullptr,
                                      SetterThrowThenPromise, nullptr,
                                      napi_default, nullptr}};
  NAPI_CALL(env, napi_define_properties(env, object, 1, desc));
  napi_value value = nullptr;
  napi_create_int32(env, 36, &value);
  napi_set_named_property(env, object, "riskSetter", value);
  bool pending = false;
  napi_is_exception_pending(env, &pending);
  if (pending) {
    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);
  }
  return RiskResult(env, GetRiskStates()[36].called.load() > 0);
}

static napi_value Risk037(napi_env env, napi_callback_info info) {
  ResetRiskState(37);
  napi_value cons = nullptr;
  napi_status status =
      napi_define_class(env, "RiskWrapRemove", NAPI_AUTO_LENGTH,
                        ConstructorWrapRemove, nullptr, 0, nullptr, &cons);
  if (status != napi_ok || cons == nullptr) {
    return RiskResult(env, false);
  }
  napi_value instance = nullptr;
  status = napi_new_instance(env, cons, 0, nullptr, &instance);
  return RiskResult(env,
                    status == napi_ok && GetRiskStates()[37].called.load() > 0);
}

static napi_value Risk038(napi_env env, napi_callback_info info) {
  ResetRiskState(38);
  napi_value cons = nullptr;
  napi_status status = napi_define_sendable_class(
      env, "RiskSendableMixed", NAPI_AUTO_LENGTH, SendableConstructorMixedNapi,
      nullptr, 0, nullptr, nullptr, &cons);
  if (status != napi_ok || cons == nullptr) {
    return RiskResult(env, false);
  }
  napi_value instance = nullptr;
  status = napi_new_instance(env, cons, 0, nullptr, &instance);
  return RiskResult(env,
                    status == napi_ok && GetRiskStates()[38].called.load() > 0);
}

static napi_value Risk039(napi_env env, napi_callback_info info) {
  ResetRiskState(39);
  MarkRiskCalled(39);
  napi_value result = nullptr;
  napi_status status =
      napi_load_module(env, "libnapicallbackriskndktest.so", &result);
  RecordRiskStatus(39, status);
  return RiskResult(env,
                    status == napi_ok && GetRiskStates()[39].called.load() > 0);
}

napi_value RegisterJsModuleRisk(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("risk033", Risk033),
      DECLARE_NAPI_FUNCTION("risk034", Risk034),
      DECLARE_NAPI_FUNCTION("risk035", Risk035),
      DECLARE_NAPI_FUNCTION("risk036", Risk036),
      DECLARE_NAPI_FUNCTION("risk037", Risk037),
      DECLARE_NAPI_FUNCTION("risk038", Risk038),
      DECLARE_NAPI_FUNCTION("risk039", Risk039),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
