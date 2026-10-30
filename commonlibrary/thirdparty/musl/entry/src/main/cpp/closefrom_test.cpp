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
#include <sys/prctl.h>
#include <climits>

#ifndef PR_GET_SECCOMP
#define PR_GET_SECCOMP 21
#endif

#define FD_CLOSEFROM_START 6
#define FD_HIGH 8
#define FD_LOW 3
#define FD_MID 5
#define FD_RANGE_HIGH 200
#define FD_RANGE_LOW 100
#define FD_TOP 10
#define FORK_NOT_SUPPORTED (-2)

typedef void (*ClosefromT)(int lowfd);

static ClosefromT g_closefrom = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_closefrom = (ClosefromT)dlsym(RTLD_DEFAULT, "closefrom");
}

static bool IsSymbolReady()
{
    if (g_closefrom == nullptr) {
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

static napi_value Closefrom_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd1 = open("/dev/null", O_RDONLY);
        int fd2 = open("/dev/null", O_RDONLY);
        int fd3 = open("/dev/null", O_RDONLY);
        g_closefrom(fd1);
        int ok = 1;
        if (fcntl(fd1, F_GETFD) != -1) { ok = 0; }
        if (fcntl(fd2, F_GETFD) != -1) { ok = 0; }
        if (fcntl(fd3, F_GETFD) != -1) { ok = 0; }
        _exit(ok ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        g_closefrom(-1);
        _exit(0);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd1 = open("/dev/null", O_RDONLY);
        int fd2 = open("/dev/null", O_RDONLY);
        g_closefrom(INT_MAX);
        int ok = 1;
        if (fcntl(fd1, F_GETFD) == -1) { ok = 0; }
        if (fcntl(fd2, F_GETFD) == -1) { ok = 0; }
        if (fd1 >= 0) { close(fd1); }
        if (fd2 >= 0) { close(fd2); }
        _exit(ok ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        dup2(fd, FD_LOW);
        dup2(fd, FD_MID);
        dup2(fd, FD_HIGH);
        dup2(fd, FD_TOP);
        close(fd);
        g_closefrom(FD_CLOSEFROM_START);
        int ok = 1;
        if (fcntl(FD_LOW, F_GETFD) == -1) { ok = 0; }
        if (fcntl(FD_MID, F_GETFD) == -1) { ok = 0; }
        if (fcntl(FD_HIGH, F_GETFD) != -1) { ok = 0; }
        if (fcntl(FD_TOP, F_GETFD) != -1) { ok = 0; }
        close(FD_LOW);
        close(FD_MID);
        _exit(ok ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        g_closefrom(fd);
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

static napi_value Closefrom_0700(napi_env env, napi_callback_info info)
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
        g_closefrom(FD_TOP);
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

static napi_value Closefrom_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int fd = open("/dev/null", O_RDONLY);
        dup2(fd, FD_TOP);
        close(fd);
        g_closefrom(FD_TOP);
        if (fcntl(FD_TOP, F_GETFD) == -1 && errno == EBADF) {
            _exit(0);
        }
        _exit(1);
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
        {"Closefrom_0100", nullptr, Closefrom_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0200", nullptr, Closefrom_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0300", nullptr, Closefrom_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0500", nullptr, Closefrom_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0600", nullptr, Closefrom_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0700", nullptr, Closefrom_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_1000", nullptr, Closefrom_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "closefrom_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
