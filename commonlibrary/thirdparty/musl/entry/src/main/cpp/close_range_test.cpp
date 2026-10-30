/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <dlfcn.h>
#include <cerrno>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <cstdint>
#include <climits>
#include <sys/prctl.h>

#ifndef PR_GET_SECCOMP
#define PR_GET_SECCOMP 21
#endif

#ifndef CLOSE_RANGE_CLOEXEC
#define CLOSE_RANGE_CLOEXEC (1U << 2)
#endif
#ifndef CLOSE_RANGE_UNSHARE
#define CLOSE_RANGE_UNSHARE (1U << 1)
#endif

#define FD_CLOSEFROM_START 6
#define FD_HIGH 8
#define FD_LOW 3
#define FD_MID 5
#define FD_RANGE_HIGH 200
#define FD_RANGE_LOW 100
#define FD_TOP 10
#define FORK_NOT_SUPPORTED (-2)

typedef int (*CloseRangeT)(unsigned int first, unsigned int last, unsigned int flags);

static CloseRangeT g_closeRange = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_closeRange = (CloseRangeT)dlsym(RTLD_DEFAULT, "close_range");
}

static bool IsSymbolReady()
{
    if (g_closeRange == nullptr) {
        return false;
    }
    if (prctl(PR_GET_SECCOMP) != 0) {
        return false;
    }
    return true;
}

static pid_t ForkChild()
{
    pid_t parentPid = getpid();
    pid_t pid = fork();
    if (pid == 0 && getpid() == parentPid) {
        return FORK_NOT_SUPPORTED;
    }
    return pid;
}

static int WaitChildExit(pid_t pid)
{
    int status = 0;
    waitpid(pid, &status, 0);
    if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
        return 0;
    }
    if (WIFSIGNALED(status)) {
        return 0;
    }
    return 1;
}

static napi_value CloseRange_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int rv = g_closeRange(0, UINT_MAX, 0);
        _exit(rv == 0 ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        errno = 0;
        int rv = g_closeRange(5, 3, 0);
        _exit((rv == -1 && errno == EINVAL) ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int rv = g_closeRange(0, 3, 1);
        _exit((rv == 0 || rv == -1) ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        if (fd < 0) {
            _exit(1);
        }
        int before = fcntl(fd, F_GETFD);
        g_closeRange(fd, fd, CLOSE_RANGE_CLOEXEC);
        int after = fcntl(fd, F_GETFD);
        close(fd);
        _exit((after != -1 && (after & FD_CLOEXEC)) ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        dup2(fd, FD_MID);
        close(fd);
        g_closeRange(FD_MID, FD_MID, 0);
        if (fcntl(FD_MID, F_GETFD) == -1 && errno == EBADF) {
            _exit(0);
        }
        _exit(1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int rv = g_closeRange(FD_RANGE_LOW, FD_RANGE_HIGH, 0);
        _exit(rv == 0 ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        dup2(fd, FD_MID);
        close(fd);
        g_closeRange(FD_RANGE_LOW, FD_RANGE_HIGH, 0);
        if (fcntl(FD_MID, F_GETFD) != -1) {
            _exit(0);
        }
        _exit(1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        g_closeRange(fd, fd, 0);
        int ret = close(fd);
        if (ret == -1 && errno == EBADF) {
            _exit(0);
        }
        _exit(1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value CloseRange_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int rv = g_closeRange(3, 7, 0);
        _exit(rv == 0 ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"CloseRange_0100", nullptr, CloseRange_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0200", nullptr, CloseRange_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0300", nullptr, CloseRange_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0400", nullptr, CloseRange_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0500", nullptr, CloseRange_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0600", nullptr, CloseRange_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0700", nullptr, CloseRange_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0800", nullptr, CloseRange_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CloseRange_0900", nullptr, CloseRange_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "close_range_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
