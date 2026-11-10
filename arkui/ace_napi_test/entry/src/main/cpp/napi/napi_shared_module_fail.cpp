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

#include "napi/native_api.h"

static int g_failInitCount = 0;

EXTERN_C_START
static napi_value SharedModuleInitFail(napi_env env, napi_value /*unused*/)
{
    g_failInitCount++;
    return nullptr;
}
EXTERN_C_END

static napi_module sharedFailModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = __FILE__,
    .nm_register_func = SharedModuleInitFail,
    .nm_modname = "sharedtestfail",
};

extern "C" __attribute__((constructor)) void RegisterSharedFailModule(void)
{
    napi_shared_module_register(&sharedFailModule);
}
