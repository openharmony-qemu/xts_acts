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
#include "napi/native_api.h"

static int g_sharedInitCount = 0;
static constexpr size_t ARGC_TWO = 2;

static napi_value SharedModuleAdd(napi_env env, napi_callback_info info)
{
    size_t argc = ARGC_TWO;
    napi_value argv[ARGC_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (argc < ARGC_TWO) {
        return nullptr;
    }
    double a = 0;
    double b = 0;
    napi_get_value_double(env, argv[0], &a);
    napi_get_value_double(env, argv[1], &b);
    napi_value result = nullptr;
    napi_create_double(env, a + b, &result);
    return result;
}

static napi_value SharedModuleGetInitCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, g_sharedInitCount, &result);
    return result;
}

EXTERN_C_START
static napi_value SharedModuleInit(napi_env env, napi_value /*unused*/)
{
    g_sharedInitCount++;
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("add", SharedModuleAdd),
        DECLARE_NAPI_FUNCTION("getInitCount", SharedModuleGetInitCount),
    };
    napi_value exports = nullptr;
    napi_create_sendable_object_with_properties(env, sizeof(desc) / sizeof(desc[0]), desc, &exports);
    return exports;
}
EXTERN_C_END

static napi_module sharedValidModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = __FILE__,
    .nm_register_func = SharedModuleInit,
    .nm_modname = "sharedtestvalid",
};

extern "C" __attribute__((constructor)) void RegisterSharedValidModule(void)
{
    napi_shared_module_register(&sharedValidModule);
}
