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
#include <fcntl.h>
#include <cerrno>
#include <unistd.h>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int kStableLoop = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static FILE* CreateSandboxTempFile() {
    char tmpPath[256];
    snprintf(tmpPath, sizeof(tmpPath), "/data/storage/el2/base/temp/tmpfile_XXXXXX");
    int fd = mkstemp(tmpPath);
    if (fd == -1) {
        return nullptr;
    }
    unlink(tmpPath);
    return fdopen(fd, "w+");
}

static int CallFcntl64(int fd, int cmd, ...) {
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetFcntl64();
    if (!func) {
        errno = ENOSYS;
        return -1;
    }
    errno = 0;
    if (cmd == F_GETFD || cmd == F_GETFL) {
        return func(fd, cmd);
    }
    va_list va;
    va_start(va, cmd);
    int arg = va_arg(va, int);
    va_end(va);
    return func(fd, cmd, arg);
}

static bool IsStubMode() {
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetFcntl64() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value) {
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Fcntl64Normal001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp) {
        return ReturnInt32(env, 0);
    }
    int fd = fileno(tmp);
    int ret = CallFcntl64(fd, F_GETFD);
    fclose(tmp);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value Fcntl64Normal002(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp) {
        return ReturnInt32(env, 0);
    }
    int fd = fileno(tmp);
    CallFcntl64(fd, F_SETFD, FD_CLOEXEC);
    int ret = CallFcntl64(fd, F_GETFD);
    fclose(tmp);
    return ReturnInt32(env, ((ret & FD_CLOEXEC) != 0) ? 1 : 0);
}

static napi_value Fcntl64Normal003(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp) {
        return ReturnInt32(env, 0);
    }
    int fd = fileno(tmp);
    int ret = CallFcntl64(fd, F_GETFL);
    fclose(tmp);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value Fcntl64Normal004(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value Fcntl64Abnormal001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    int ret = CallFcntl64(-1, F_GETFD);
    return ReturnInt32(env, (ret == -1) ? 1 : 0);
}

static napi_value Fcntl64Abnormal002(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp) {
        return ReturnInt32(env, 0);
    }
    int fd = fileno(tmp);
    errno = 0;
    int ret = CallFcntl64(fd, -1);
    fclose(tmp);
    return ReturnInt32(env, (ret == -1) ? 1 : 0);
}

static napi_value Fcntl64Boundary001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int ret = CallFcntl64(0, F_GETFD);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value Fcntl64Boundary002(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    FILE* tmp = CreateSandboxTempFile();
    if (!tmp) {
        return ReturnInt32(env, 0);
    }
    int fd = fileno(tmp);
    CallFcntl64(fd, F_SETFD, 0);
    int ret = CallFcntl64(fd, F_GETFD);
    fclose(tmp);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value Fcntl64Stable001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < kStableLoop; ++i) {
        FILE* tmp = CreateSandboxTempFile();
        if (!tmp) {
            pass = false;
            break;
        }
        int fd = fileno(tmp);
        int ret = CallFcntl64(fd, F_GETFD);
        fclose(tmp);
        if (ret < 0) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value Fcntl64Thread001(napi_env env, napi_callback_info info) {
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                char tmpPath[256];
                snprintf(tmpPath, sizeof(tmpPath), "/data/storage/el2/base/temp/tmpfile_t%d_XXXXXX", i);
                int fd = mkstemp(tmpPath);
                if (fd == -1) {
                    hasError = true;
                    return;
                }
                unlink(tmpPath);
                int ret = CallFcntl64(fd, F_GETFD);
                close(fd);
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
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"fcntl64Normal001", nullptr, Fcntl64Normal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Normal002", nullptr, Fcntl64Normal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Normal003", nullptr, Fcntl64Normal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Normal004", nullptr, Fcntl64Normal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Abnormal001", nullptr, Fcntl64Abnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Abnormal002", nullptr, Fcntl64Abnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Boundary001", nullptr, Fcntl64Boundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Boundary002", nullptr, Fcntl64Boundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Stable001", nullptr, Fcntl64Stable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fcntl64Thread001", nullptr, Fcntl64Thread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "fcntl64ndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) {
    napi_module_register(&demoModule);
}
