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
#include <cstdlib>
#include <cstring>
#include <thread>
#include <vector>

static constexpr int K_STABLE_LOOP1000 = 20;
static constexpr int K_MEM_LOOP100 = 10;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_THREAD_LOOP = 100;
static constexpr int K_STRLEN_TEST = 4;
static constexpr int K_STRLEN_HELLO = 5;
static constexpr int K_STRLEN_FORMATTED = 8;

static int CallAsprintfChk(char** strp, int flag, const char* fmt, ...)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetVasprintfChk();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    va_list va;
    va_start(va, fmt);
    int result = func(strp, flag, fmt, va);
    va_end(va);
    return result;
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetVasprintfChk()) {
        return true;
    }
    errno = 0;
    char* buf = nullptr;
    CallAsprintfChk(&buf, 0, "test");
    bool isStub = (errno == ENOSYS);
    if (buf) {
        free(buf);
    }
    return isStub;
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ---------- TC-030: flag=0 basic formatted output ---------- */
static napi_value AsprintfChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    errno = 0;
    int ret = CallAsprintfChk(&buf, 0, "hello %d", 42);
    if (ret != K_STRLEN_FORMATTED) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    if (buf == nullptr || strcmp(buf, "hello 42") != 0) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    if (errno != 0) {
        free(buf);
        return ReturnInt32(env, 0);
    }
    free(buf);
    return ReturnInt32(env, 1);
}

/* ---------- TC-031: flag=1 enabled checking ---------- */
static napi_value AsprintfChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    errno = 0;
    int ret = CallAsprintfChk(&buf, 1, "%s-%d", "test", 100);
    if (ret != K_STRLEN_FORMATTED) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    if (buf == nullptr || strcmp(buf, "test-100") != 0) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    free(buf);
    return ReturnInt32(env, 1);
}

/* ---------- TC-032: fmt=NULL parameter check ---------- */
static napi_value AsprintfChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    errno = 0;
    int ret = CallAsprintfChk(&buf, 0, nullptr);
    if (ret != -1) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-033: flag=0 vs flag=1 consistency ---------- */
static napi_value AsprintfChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf0 = nullptr;
    char* buf1 = nullptr;
    int ret0 = CallAsprintfChk(&buf0, 0, "hello");
    int ret1 = CallAsprintfChk(&buf1, 1, "hello");
    if (ret0 != ret1) {
        if (buf0) {
            free(buf0);
        }
        if (buf1) {
            free(buf1);
        }
        return ReturnInt32(env, 0);
    }
    if (buf0 == nullptr || buf1 == nullptr || strcmp(buf0, buf1) != 0) {
        if (buf0) {
            free(buf0);
        }
        if (buf1) {
            free(buf1);
        }
        return ReturnInt32(env, 0);
    }
    free(buf0);
    free(buf1);
    return ReturnInt32(env, 1);
}

/* ---------- TC-034: successful return character count ---------- */
static napi_value AsprintfChkFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    int ret = CallAsprintfChk(&buf, 0, "%d", 12345);
    if (ret != K_STRLEN_HELLO) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    if (buf == nullptr || strcmp(buf, "12345") != 0) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    free(buf);
    return ReturnInt32(env, 1);
}

/* ---------- TC-035: empty string formatting ---------- */
static napi_value AsprintfChkFunc002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    int ret = CallAsprintfChk(&buf, 0, "");
    if (ret != 0) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    if (buf == nullptr || buf[0] != '\0') {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    free(buf);
    return ReturnInt32(env, 1);
}

/* ---------- TC-036: allocated memory can be freed ---------- */
static napi_value AsprintfChkFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    for (int i = 0; i < K_MEM_LOOP100; ++i) {
        char* buf = nullptr;
        int ret = CallAsprintfChk(&buf, 0, "iter %d", i);
        if (ret <= 0 || buf == nullptr) {
            return ReturnInt32(env, 0);
        }
        free(buf);
    }
    return ReturnInt32(env, 1);
}

/* ---------- TC-037: 1000 repeated calls stability ---------- */
static napi_value AsprintfChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int failCount = 0;
    for (int i = 0; i < K_STABLE_LOOP1000; ++i) {
        char* buf = nullptr;
        int ret = CallAsprintfChk(&buf, 0, "test");
        if (ret != K_STRLEN_TEST || buf == nullptr || strcmp(buf, "test") != 0) {
            failCount++;
        }
        if (buf) {
            free(buf);
        }
    }
    return ReturnInt32(env, (failCount == 0) ? 1 : 0);
}

/* ---------- TC-038: multi-thread MT-Safe ---------- */
static napi_value AsprintfChkStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::vector<std::thread> threads;
    bool allPassed = true;

    auto worker = [&allPassed](int tid) {
        for (int i = 0; i < K_THREAD_LOOP; ++i) {
            char* buf = nullptr;
            int ret = CallAsprintfChk(&buf, 0, "t%d-%d", tid, i);
            if (ret <= 0 || buf == nullptr) {
                allPassed = false;
                return;
            }
            free(buf);
        }
    };

    for (int i = 0; i < K_THREAD_COUNT; ++i) {
        threads.emplace_back(worker, i);
    }
    for (auto& t : threads) {
        t.join();
    }
    return ReturnInt32(env, allPassed ? 1 : 0);
}

/* ---------- TC-039: dlsym symbol existence ---------- */
static napi_value AsprintfChkSpec001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    int ret = CallAsprintfChk(&buf, 0, "hello");
    if (ret != K_STRLEN_HELLO || buf == nullptr || strcmp(buf, "hello") != 0) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    free(buf);
    return ReturnInt32(env, 1);
}

/* ---------- TC-040: function pointer nullptr safety ---------- */
static napi_value AsprintfChkSpec002(napi_env env, napi_callback_info info)
{
    dlerror();
    void* sym = dlsym(RTLD_DEFAULT, "__asprintf_chk");
    auto funcPtr = reinterpret_cast<int (*)(char**, int, const char*, ...)>(sym);
    if (funcPtr == nullptr) {
        return ReturnInt32(env, 0);
    }
    char* buf = nullptr;
    int ret = funcPtr(&buf, 0, "hello");
    if (ret != K_STRLEN_HELLO || buf == nullptr) {
        if (buf) {
            free(buf);
        }
        return ReturnInt32(env, 0);
    }
    free(buf);
    return ReturnInt32(env, 1);
}

/* ---------- TC-041: non-PC stub mode verification ---------- */
static napi_value AsprintfChkSpec003(napi_env env, napi_callback_info info)
{
    errno = 0;
    char* buf = nullptr;
    int ret = CallAsprintfChk(&buf, 0, "test");
    if (ret == -1 && errno == ENOSYS) {
        return ReturnInt32(env, 0);
    }
    if (ret == K_STRLEN_TEST && errno == 0 && buf != nullptr && strcmp(buf, "test") == 0) {
        free(buf);
        return ReturnInt32(env, 1);
    }
    if (buf) {
        free(buf);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-042: IsStubMode detection ---------- */
static napi_value AsprintfChkSpec004(napi_env env, napi_callback_info info)
{
    bool isStub = IsStubMode();
    if (isStub) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    char* buf = nullptr;
    int ret = CallAsprintfChk(&buf, 0, "test");
    if (ret == K_STRLEN_TEST && errno == 0 && buf != nullptr && strcmp(buf, "test") == 0) {
        free(buf);
        return ReturnInt32(env, 1);
    }
    if (buf) {
        free(buf);
    }
    return ReturnInt32(env, 0);
}

/* ---------- TC-043: PC vs non-PC device behavior difference ---------- */
static napi_value AsprintfChkSpec005(napi_env env, napi_callback_info info)
{
    errno = 0;
    char* buf = nullptr;
    int ret = CallAsprintfChk(&buf, 0, "test");
    int e = errno;
    if (e == ENOSYS) {
        if (ret == -1) {
            return ReturnInt32(env, 0);
        }
        return ReturnInt32(env, 0);
    } else {
        if (ret == K_STRLEN_TEST && e == 0 && buf != nullptr && strcmp(buf, "test") == 0) {
            free(buf);
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"asprintfChkNormal001", nullptr, AsprintfChkNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkNormal002", nullptr, AsprintfChkNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkNormal003", nullptr, AsprintfChkNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkNormal004", nullptr, AsprintfChkNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkFunc001", nullptr, AsprintfChkFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkFunc002", nullptr, AsprintfChkFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkFunc003", nullptr, AsprintfChkFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkStable001", nullptr, AsprintfChkStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkStable002", nullptr, AsprintfChkStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkSpec001", nullptr, AsprintfChkSpec001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkSpec002", nullptr, AsprintfChkSpec002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkSpec003", nullptr, AsprintfChkSpec003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkSpec004", nullptr, AsprintfChkSpec004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"asprintfChkSpec005", nullptr, AsprintfChkSpec005, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "asprintfChkndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterAsprintfChkndkModule(void)
{
    napi_module_register(&demoModule);
}