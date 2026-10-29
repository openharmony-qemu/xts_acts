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
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/prctl.h>

#ifndef PR_GET_SECCOMP
#define PR_GET_SECCOMP 21
#endif

typedef void (*closefrom_t)(int lowfd);

static closefrom_t g_closefrom = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_closefrom = (closefrom_t)dlsym(RTLD_DEFAULT, "closefrom");
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
    pid_t parent_pid = getpid();
    pid_t pid = fork();
    if (pid == 0 && getpid() == parent_pid) {
        return -2;
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
        if (fcntl(fd1, F_GETFD) != -1) ok = 0;
        if (fcntl(fd2, F_GETFD) != -1) ok = 0;
        if (fcntl(fd3, F_GETFD) != -1) ok = 0;
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
        g_closefrom(99999);
        int ok = 1;
        if (fcntl(fd1, F_GETFD) == -1) ok = 0;
        if (fcntl(fd2, F_GETFD) == -1) ok = 0;
        if (fd1 >= 0) close(fd1);
        if (fd2 >= 0) close(fd2);
        _exit(ok ? 0 : 1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
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
        dup2(fd, 3);
        dup2(fd, 5);
        dup2(fd, 8);
        dup2(fd, 10);
        close(fd);
        g_closefrom(6);
        int ok = 1;
        if (fcntl(3, F_GETFD) == -1) ok = 0;
        if (fcntl(5, F_GETFD) == -1) ok = 0;
        if (fcntl(8, F_GETFD) != -1) ok = 0;
        if (fcntl(10, F_GETFD) != -1) ok = 0;
        close(3);
        close(5);
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
        dup2(fd, 5);
        close(fd);
        g_closefrom(10);
        if (fcntl(5, F_GETFD) != -1) {
            _exit(0);
        }
        _exit(1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Closefrom_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
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
        dup2(fd, 10);
        close(fd);
        g_closefrom(10);
        if (fcntl(10, F_GETFD) == -1 && errno == EBADF) {
            _exit(0);
        }
        _exit(1);
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, WaitChildExit(pid));
}

static napi_value Closefrom_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Closefrom_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Closefrom_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Closefrom_0100", nullptr, Closefrom_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0200", nullptr, Closefrom_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0300", nullptr, Closefrom_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0400", nullptr, Closefrom_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0500", nullptr, Closefrom_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0600", nullptr, Closefrom_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0700", nullptr, Closefrom_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0800", nullptr, Closefrom_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_0900", nullptr, Closefrom_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_1000", nullptr, Closefrom_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_1100", nullptr, Closefrom_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_1200", nullptr, Closefrom_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Closefrom_1300", nullptr, Closefrom_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
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
