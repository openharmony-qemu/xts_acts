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

napi_value RegisterLifecycleRisk(napi_env env, napi_value exports);
napi_value RegisterFinalizerRisk(napi_env env, napi_value exports);
napi_value RegisterAsyncRisk(napi_env env, napi_value exports);
napi_value RegisterJsModuleRisk(napi_env env, napi_value exports);
napi_value RegisterNativeBindingRisk(napi_env env, napi_value exports);

static bool GetRiskIdArg(napi_env env, napi_callback_info info, int32_t *id) {
  size_t argc = 1;
  napi_value argv[1] = {nullptr};
  napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
  if (argc < 1 || argv[0] == nullptr) {
    return false;
  }
  return napi_get_value_int32(env, argv[0], id) == napi_ok;
}

static napi_value ResetRiskStatus(napi_env env, napi_callback_info info) {
  int32_t id = 0;
  if (!GetRiskIdArg(env, info, &id)) {
    return RiskResult(env, false);
  }
  ResetRiskState(id);
  return RiskResult(env, true);
}

static napi_value IsRiskCalled(napi_env env, napi_callback_info info) {
  int32_t id = 0;
  if (!GetRiskIdArg(env, info, &id)) {
    return RiskResult(env, false);
  }
  return RiskResult(env, id >= 0 && id <= RISK_STATE_MAX_ID &&
                             GetRiskStates()[id].called.load() > 0);
}

static napi_value GetRiskStatus(napi_env env, napi_callback_info info) {
  int32_t id = 0;
  if (!GetRiskIdArg(env, info, &id) || id < 0 || id > RISK_STATE_MAX_ID) {
    return Ret(env, RISK_PENDING);
  }
  return Ret(env, GetRiskStates()[id].napiStatus.load());
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
  RegisterLifecycleRisk(env, exports);
  RegisterFinalizerRisk(env, exports);
  RegisterAsyncRisk(env, exports);
  RegisterJsModuleRisk(env, exports);
  RegisterNativeBindingRisk(env, exports);
  napi_property_descriptor riskStateDesc[] = {
      DECLARE_NAPI_FUNCTION("resetRiskStatus", ResetRiskStatus),
      DECLARE_NAPI_FUNCTION("isRiskCalled", IsRiskCalled),
      DECLARE_NAPI_FUNCTION("getRiskStatus", GetRiskStatus),
  };
  napi_define_properties(env, exports,
                         sizeof(riskStateDesc) / sizeof(riskStateDesc[0]),
                         riskStateDesc);
  return exports;
}
EXTERN_C_END

static napi_module callbackRiskModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napicallbackriskndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterCallbackRiskModule(void) {
  napi_module_register(&callbackRiskModule);
}
