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
#include <csetjmp>
#include <cerrno>
#include <climits>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetLongjmpChk() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value LongjmpChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    jmp_buf jb;
    int ret = setjmp(jb);
    if (ret == 0) {
        func(jb, 1);
    }
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

static napi_value LongjmpChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    jmp_buf jb;
    int ret = setjmp(jb);
    if (ret == 0) {
        func(jb, 456);
    }
    return ReturnInt32(env, (ret == 456) ? 1 : 0);
}

static napi_value LongjmpChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    jmp_buf jb;
    int ret = setjmp(jb);
    if (ret == 0) {
        func(jb, 0);
    }
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

static napi_value LongjmpChkAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    jmp_buf jb;
    int ret = setjmp(jb);
    if (ret == 0) {
        func(jb, -1);
    }
    return ReturnInt32(env, (ret == -1) ? 1 : 0);
}

static napi_value LongjmpChkAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    jmp_buf jb;
    int ret = setjmp(jb);
    if (ret == 0) {
        func(jb, INT_MAX);
    }
    return ReturnInt32(env, (ret == INT_MAX) ? 1 : 0);
}

static napi_value LongjmpChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    jmp_buf jb;
    int ret = setjmp(jb);
    if (ret == 0) {
        func(jb, 1);
    }
    return ReturnInt32(env, (ret == 1) ? 1 : 0);
}

static napi_value LongjmpChkBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    int longjmpVal = 42;
    jmp_buf outerJb;
    int outerRet = setjmp(outerJb);
    if (outerRet == 0) {
        jmp_buf innerJb;
        volatile int innerRet = setjmp(innerJb);
        if (innerRet == 0) {
            func(innerJb, longjmpVal);
        }
        func(outerJb, (innerRet == longjmpVal) ? 1 : 2);
    }
    return ReturnInt32(env, (outerRet == 1) ? 1 : 0);
}

static napi_value LongjmpChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    volatile int passCount = 0;
    for (volatile int i = 0; i < K_STABLE_LOOP10000; ++i) {
        jmp_buf jb;
        int ret = setjmp(jb);
        if (ret == 0) {
            func(jb, 1);
        }
        if (ret == 1) {
            passCount++;
        }
    }
    return ReturnInt32(env, (passCount == K_STABLE_LOOP10000) ? 1 : 0);
}

static void LongjmpChkThreadWorker(std::atomic<int>& successCount)
{
    auto func = LibcFunctionLoader::GetInstance().GetLongjmpChk();
    volatile int localCount = 0;
    for (volatile int i = 0; i < K_ITER_PER_THREAD; ++i) {
        jmp_buf jb;
        int ret = setjmp(jb);
        if (ret == 0) {
            func(jb, 1);
        } else {
            localCount++;
        }
    }
    successCount.fetch_add(localCount);
}

static napi_value LongjmpChkThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<int> successCount{0};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(LongjmpChkThreadWorker, std::ref(successCount));
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, (successCount == K_THREAD_COUNT * K_ITER_PER_THREAD) ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"longjmpChkNormal001", nullptr, LongjmpChkNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkNormal002", nullptr, LongjmpChkNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkNormal003", nullptr, LongjmpChkNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkAbnormal001", nullptr, LongjmpChkAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkAbnormal002", nullptr, LongjmpChkAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkBoundary001", nullptr, LongjmpChkBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkBoundary002", nullptr, LongjmpChkBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkStable001", nullptr, LongjmpChkStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"longjmpChkThread001", nullptr, LongjmpChkThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "longjmpchkndktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}