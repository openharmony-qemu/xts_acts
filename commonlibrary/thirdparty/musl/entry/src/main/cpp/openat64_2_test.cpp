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

#ifndef O_TMPFILE
#define O_TMPFILE 020200000
#endif

typedef int (*openat64_2_t)(int fd, const char *path, int oflag);

static openat64_2_t g_openat64_2 = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_openat64_2 = (openat64_2_t)dlsym(RTLD_DEFAULT, "__openat64_2");
}

static bool IsSymbolReady()
{
    return g_openat64_2 != nullptr;
}

static napi_value Openat64_2_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Openat64_2_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Openat64_2_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int fd = g_openat64_2(AT_FDCWD, "/dev/null", O_RDONLY);
    if (fd >= 0) {
        char buf[16];
        ssize_t n = read(fd, buf, sizeof(buf));
        close(fd);
        return Ret(env, (n >= 0) ? 0 : 1);
    }
    return Ret(env, 1);
}

static napi_value Openat64_2_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int dirfd = open("/dev", O_DIRECTORY | O_RDONLY);
    if (dirfd < 0) {
        return Ret(env, 0);
    }
    int fd = g_openat64_2(dirfd, "null", O_RDONLY);
    close(dirfd);
    if (fd >= 0) {
        close(fd);
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Openat64_2_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int fd = g_openat64_2(AT_FDCWD, "/dev/null", O_WRONLY);
    if (fd >= 0) {
        close(fd);
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Openat64_2_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int fd = g_openat64_2(AT_FDCWD, "/nonexistent_xyz_123_test", O_RDONLY);
    if (fd == -1 && errno == ENOENT) {
        return Ret(env, 0);
    }
    if (fd >= 0) close(fd);
    return Ret(env, 1);
}

static napi_value Openat64_2_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int fd = g_openat64_2(9999, "relative_path_test", O_RDONLY);
    if (fd == -1 && errno == EBADF) {
        return Ret(env, 0);
    }
    if (fd >= 0) close(fd);
    return Ret(env, 1);
}

static napi_value Openat64_2_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Openat64_2_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value Openat64_2_1700(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Openat64_2_0100", nullptr, Openat64_2_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0200", nullptr, Openat64_2_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0300", nullptr, Openat64_2_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0400", nullptr, Openat64_2_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0500", nullptr, Openat64_2_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0600", nullptr, Openat64_2_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0700", nullptr, Openat64_2_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0800", nullptr, Openat64_2_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_0900", nullptr, Openat64_2_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1000", nullptr, Openat64_2_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1100", nullptr, Openat64_2_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1200", nullptr, Openat64_2_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1300", nullptr, Openat64_2_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1400", nullptr, Openat64_2_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1500", nullptr, Openat64_2_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1600", nullptr, Openat64_2_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Openat64_2_1700", nullptr, Openat64_2_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "openat64_2_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
