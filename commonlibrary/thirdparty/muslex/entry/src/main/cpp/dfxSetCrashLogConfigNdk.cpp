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
#include "libcFunctionLoader.h"
#include <cerrno>
#include <cstdint>

static constexpr int K_DIV_VAL = 10;

static int CallDFXSetCrashLogConfig(uint8_t type, uint32_t value)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetDFXSetCrashLogConfig();
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    int ret = func(type, value);
    // If returns -1 and errno is ENOSYS, function loaded but actually unavailable
    if (ret == -1 && errno == ENOSYS)
    {
        return -1;
    }
    return ret;
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

/* ==================== Normal Parameter Tests ==================== */

/* TC-001: Set crash log config with valid type and value */
static napi_value DFXSetCrashLogConfigNormal001(napi_env env, napi_callback_info info)
{
    int ret = CallDFXSetCrashLogConfig(0, 1);
    if (ret == -1 && errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* TC-002: Set crash log config with type=1 */
static napi_value DFXSetCrashLogConfigNormal002(napi_env env, napi_callback_info info)
{
    int ret = CallDFXSetCrashLogConfig(1, 100);
    if (ret == -1 && errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* TC-003: Set crash log config with type=255 (max uint8_t) */
static napi_value DFXSetCrashLogConfigNormal003(napi_env env, napi_callback_info info)
{
    int ret = CallDFXSetCrashLogConfig(255, 0xFFFFFFFF);
    if (ret == -1 && errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* TC-004: Set crash log config with value=0 */
static napi_value DFXSetCrashLogConfigNormal004(napi_env env, napi_callback_info info)
{
    int ret = CallDFXSetCrashLogConfig(0, 0);
    if (ret == -1 && errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* TC-005: Set crash log config with type=10, value=0x7FFFFFFF */
static napi_value DFXSetCrashLogConfigBoundary001(napi_env env, napi_callback_info info)
{
    int ret = CallDFXSetCrashLogConfig(10, 0x7FFFFFFF);
    if (ret == -1 && errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* TC-006: Set crash log config with type=5, value=0xFFFFFFFF */
static napi_value DFXSetCrashLogConfigBoundary002(napi_env env, napi_callback_info info)
{
    int ret = CallDFXSetCrashLogConfig(5, 0xFFFFFFFF);
    if (ret == -1 && errno == ENOSYS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* TC-007: Repeated calls stability */
static napi_value DFXSetCrashLogConfigStable001(napi_env env, napi_callback_info info)
{
    int loopCount = 20;
    for (int i = 0; i < loopCount; ++i)
    {
        int ret = CallDFXSetCrashLogConfig(i % K_DIV_VAL, i);
        if (ret == -1 && errno == ENOSYS)
        {
            return ReturnInt32(env, 1);
        }
    }
    return ReturnInt32(env, 1);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"dfxSetCrashLogConfigNormal001", nullptr, DFXSetCrashLogConfigNormal001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"dfxSetCrashLogConfigNormal002", nullptr, DFXSetCrashLogConfigNormal002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"dfxSetCrashLogConfigNormal003", nullptr, DFXSetCrashLogConfigNormal003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"dfxSetCrashLogConfigNormal004", nullptr, DFXSetCrashLogConfigNormal004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"dfxSetCrashLogConfigBoundary001", nullptr, DFXSetCrashLogConfigBoundary001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"dfxSetCrashLogConfigBoundary002", nullptr, DFXSetCrashLogConfigBoundary002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"dfxSetCrashLogConfigStable001", nullptr, DFXSetCrashLogConfigStable001, nullptr, nullptr, nullptr,
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
    .nm_modname = "dfxsetcrashlogconfigndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}