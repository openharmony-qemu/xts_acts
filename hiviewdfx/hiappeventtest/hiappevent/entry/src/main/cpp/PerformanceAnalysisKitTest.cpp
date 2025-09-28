/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "hiappeventTest.h"
#include "hicollieTest.h"
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"SetReportRouteValue", nullptr, SetReportRouteValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportPolicy", nullptr, SetReportPolicy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetCustomConfig", nullptr, SetCustomConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetConfigId", nullptr, SetConfigId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetConfigName", nullptr, SetConfigName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportUserId", nullptr, SetReportUserId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportUserProperty0", nullptr, SetReportUserProperty0, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportUserProperty1", nullptr, SetReportUserProperty1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportUserProperty2", nullptr, SetReportUserProperty2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportUserProperty3", nullptr, SetReportUserProperty3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetReportUserPropertyCode", nullptr, SetReportUserPropertyCode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"SetReportUserPropertyCodeValue", nullptr, SetReportUserPropertyCodeValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SetWatcherOnReceive", nullptr, SetWatcherOnReceive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveProcessor", nullptr, RemoveProcessor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetConfigItem", nullptr, SetConfigItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetConfigItem1", nullptr, SetConfigItem1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetEventConfig", nullptr, SetEventConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestHiCollieStuckWithTimeoutNdk2", nullptr, TestHiCollieStuckWithTimeoutNdk2, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TestHiCollieStuckWithTimeoutNdk", nullptr, TestHiCollieStuckWithTimeoutNdk, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TestHiCollieJankC", nullptr, TestHiCollieJankC, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetTimer1", nullptr, SetTimer1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetTimer2", nullptr, SetTimer2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetTimer3", nullptr, SetTimer3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetTimer4", nullptr, SetTimer4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestHiCollieStuckWithTimeoutNdk1", nullptr, TestHiCollieStuckWithTimeoutNdk1, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
