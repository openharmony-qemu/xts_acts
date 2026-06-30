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

static void *DetachCreateObject(napi_env env, void *nativeObject, void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
    napi_value object = nullptr;
    RecordStatus(probe, napi_create_object(env, &object));
  }
  return nativeObject;
}

static napi_value AttachReturnCrossEnvValue(napi_env env, void *nativeObject,
                                            void *hint) {
  auto *probe = reinterpret_cast<CallbackRiskProbe *>(hint);
  if (probe != nullptr) {
    MarkProbeCalled(probe);
  }
  napi_value value = nullptr;
  RunWithArkRuntimeInNativeThread(45, [](napi_env arkEnv) {
    napi_value value = nullptr;
    napi_create_object(arkEnv, &value);
    return value != nullptr;
  });
  if (value == nullptr) {
    napi_get_undefined(env, &value);
  }
  return value;
}

static napi_value AttachNormal(napi_env env, void *nativeObject, void *hint) {
  napi_value undefined = nullptr;
  napi_get_undefined(env, &undefined);
  return undefined;
}

static napi_value Risk044(napi_env env, napi_callback_info info) {
  ResetRiskState(44);
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  CallbackRiskProbe probe;
  probe.id = 44;
  int32_t nativeObject = 44;
  napi_status status = napi_coerce_to_native_binding_object(
      env, object, DetachCreateObject, AttachNormal, &nativeObject, &probe);
  RecordRiskStatus(44, status);
  return RiskResult(env, status == napi_ok);
}

static napi_value Risk045(napi_env env, napi_callback_info info) {
  ResetRiskState(45);
  napi_value object = nullptr;
  NAPI_CALL(env, napi_create_object(env, &object));
  CallbackRiskProbe probe;
  probe.id = 45;
  int32_t nativeObject = 45;
  napi_status status = napi_coerce_to_native_binding_object(
      env, object, DetachCreateObject, AttachReturnCrossEnvValue, &nativeObject,
      &probe);
  RecordRiskStatus(45, status);
  return RiskResult(env, status == napi_ok);
}

napi_value RegisterNativeBindingRisk(napi_env env, napi_value exports) {
  napi_property_descriptor desc[] = {
      DECLARE_NAPI_FUNCTION("risk044", Risk044),
      DECLARE_NAPI_FUNCTION("risk045", Risk045),
  };
  napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
  return exports;
}
