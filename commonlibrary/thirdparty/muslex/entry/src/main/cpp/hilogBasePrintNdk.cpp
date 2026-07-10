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
#include <thread>
#include <vector>
#include <atomic>

static constexpr int kLogApp = 0;
static constexpr int kLogCore = 3;
static constexpr int kLogDebug = 3;
static constexpr int kLogInfo = 4;
static constexpr int kLogError = 6;
static constexpr int kLogFatal = 7;
static constexpr int kStableLoop = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static int CallHilogBasePrint(int type, int level, unsigned int domain, const char* tag, const char* fmt, ...)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetHilogBasePrint();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    va_list va;
    va_start(va, fmt);
    int ret = func(type, level, domain, tag, fmt, va);
    va_end(va);
    return ret;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetHilogBasePrint() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value HilogBasePrintNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", "test message");
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value HilogBasePrintNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallHilogBasePrint(kLogCore, kLogError, 0xD000900, "TEST_TAG", "error message %d", 42);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value HilogBasePrintNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", "msg %s %d", "hello", 123);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value HilogBasePrintNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value HilogBasePrintAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, nullptr, "test");
    return ReturnInt32(env, 1);
}

static napi_value HilogBasePrintAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", nullptr);
    return ReturnInt32(env, 1);
}

static napi_value HilogBasePrintBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", "");
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value HilogBasePrintBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int msgsize = 2000;
    std::string longMsg(msgsize, 'a');
    int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", "%s", longMsg.c_str());
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value HilogBasePrintStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int successCount = 0;
    for (int i = 0; i < kStableLoop; ++i) {
        int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", "stable test %d", i);
        if (ret >= 0) {
            successCount++;
        }
    }
    return ReturnInt32(env, (successCount > 0) ? 1 : 0);
}

static napi_value HilogBasePrintThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                int ret = CallHilogBasePrint(kLogApp, kLogInfo, 0xD000900, "TEST_TAG", "thread test %d", i);
                if (ret < 0) {
                    hasError = true;
                    return;
                }
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"hilogBasePrintNormal001", nullptr, HilogBasePrintNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintNormal002", nullptr, HilogBasePrintNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintNormal003", nullptr, HilogBasePrintNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintNormal004", nullptr, HilogBasePrintNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintAbnormal001", nullptr, HilogBasePrintAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintAbnormal002", nullptr, HilogBasePrintAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintBoundary001", nullptr, HilogBasePrintBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintBoundary002", nullptr, HilogBasePrintBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintStable001", nullptr, HilogBasePrintStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hilogBasePrintThread001", nullptr, HilogBasePrintThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "hilogbaseprintndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
