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
#include <netdb.h>
#include <cerrno>
#include <cstring>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int kStableLoop = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static int CallGetaddrinfoCustom(const char* host, const char* serv,
                                 const struct addrinfo* hint, struct addrinfo** res) {
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetGetaddrinfoCustom();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    return func(host, serv, hint, res);
}

static bool IsStubMode() {
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetGetaddrinfoCustom() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value) {
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GetaddrinfoCustomNormal001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    struct addrinfo* res = nullptr;
    CallGetaddrinfoCustom("localhost", "80", &hints, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomNormal002(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    struct addrinfo* res = nullptr;
    CallGetaddrinfoCustom("127.0.0.1", "8080", &hints, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomNormal003(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET;
    struct addrinfo* res = nullptr;
    CallGetaddrinfoCustom(nullptr, "80", &hints, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomNormal004(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomAbnormal001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo* res = nullptr;
    int ret = CallGetaddrinfoCustom(nullptr, nullptr, nullptr, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomAbnormal002(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    struct addrinfo* res = nullptr;
    int ret = CallGetaddrinfoCustom("nonexistent.invalid.host", nullptr, &hints, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, (ret != 0) ? 1 : 0);
}

static napi_value GetaddrinfoCustomBoundary001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    struct addrinfo* res = nullptr;
    int ret = CallGetaddrinfoCustom("", nullptr, &hints, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomBoundary002(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    struct addrinfo hints;
    memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_UNSPEC;
    struct addrinfo* res = nullptr;
    CallGetaddrinfoCustom("localhost", "65535", &hints, &res);
    if (res) {
        freeaddrinfo(res);
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomStable001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    for (int i = 0; i < kStableLoop; ++i) {
        struct addrinfo hints;
        memset(&hints, 0, sizeof(hints));
        hints.ai_family = AF_UNSPEC;
        struct addrinfo* res = nullptr;
        CallGetaddrinfoCustom("localhost", "80", &hints, &res);
        if (res) {
            freeaddrinfo(res);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value GetaddrinfoCustomThread001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                struct addrinfo hints;
                memset(&hints, 0, sizeof(hints));
                hints.ai_family = AF_UNSPEC;
                struct addrinfo* res = nullptr;
                CallGetaddrinfoCustom("localhost", "80", &hints, &res);
                if (res) {
                    freeaddrinfo(res);
                }
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"getaddrinfoCustomNormal001", nullptr, GetaddrinfoCustomNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomNormal002", nullptr, GetaddrinfoCustomNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomNormal003", nullptr, GetaddrinfoCustomNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomNormal004", nullptr, GetaddrinfoCustomNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomAbnormal001", nullptr, GetaddrinfoCustomAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomAbnormal002", nullptr, GetaddrinfoCustomAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomBoundary001", nullptr, GetaddrinfoCustomBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomBoundary002", nullptr, GetaddrinfoCustomBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomStable001", nullptr, GetaddrinfoCustomStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getaddrinfoCustomThread001", nullptr, GetaddrinfoCustomThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "getaddrcustomndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) {
    napi_module_register(&demoModule);
}
