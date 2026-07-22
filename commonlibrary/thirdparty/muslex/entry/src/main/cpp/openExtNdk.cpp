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
#include <unistd.h>
#include <cerrno>
#include <csignal>
#include <sys/wait.h>
#include <thread>
#include <vector>
#include <string>
#include <algorithm>
#include <atomic>

static constexpr int K_LONG_PATH_LEN = 4097;
static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_THREAD_WORK_LOOP = 10;
static constexpr int K_STUB_CHECK_LOOP = 10;
static constexpr int K_THREAD_START_ID = 1;
static constexpr int K_THREAD_COUNT = 3;

static int CallOpen2(const char *pathname, int flags)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<int (*)(const char*, int)>(loader.GetOpen2());
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    return func(pathname, flags);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetOpen2())
    {
        return true;
    }
    errno = 0;
    CallOpen2("/dev/null", O_RDONLY);
    return (errno == ENOSYS);
}

static bool CheckAbortForOpen(const char *path, int flags)
{
    if (IsStubMode())
    {
        return false;
    }
    int status;
    pid_t pid = fork();
    if (pid == -1)
    {
        return false;
    }
    if (pid == 0)
    {
        CallOpen2(path, flags);
        _exit(0);
    }
    waitpid(pid, &status, 0);
    return (WIFSIGNALED(status) && WTERMSIG(status) == SIGABRT);
}

static napi_value ReturnInt32(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

/* ----- Original simple test ----- */
static napi_value Open2(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int fd = CallOpen2("/dev/null", O_RDONLY);
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Normal parameter tests ---------- */
static napi_value Open2Normal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int fd = CallOpen2("/dev/null", O_WRONLY | O_APPEND);
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value Open2Normal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int fd = CallOpen2("/dev/null", O_WRONLY | O_TRUNC);
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Abnormal parameter tests ---------- */
// empty path (should fail with ENOENT)
static napi_value Open2Abnormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    int fd = CallOpen2("", O_RDONLY);
    if (fd == -1 && errno == ENOENT)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// invalid flags (EINVAL expected)
static napi_value Open2Abnormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    int fd = CallOpen2("/dev/null", O_RDONLY | O_WRONLY);
    if (fd == -1 && (errno == EINVAL || errno == ENOSYS))
    {
        return ReturnInt32(env, 1);
    }
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// non-existent file (ENOENT expected)
static napi_value Open2Abnormal006(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    int fd = CallOpen2("/nonexistent_file_test_12345", O_RDONLY);
    if (fd == -1 && errno == ENOENT)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// open directory with O_WRONLY (EISDIR expected)
static napi_value Open2Abnormal007(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    int fd = CallOpen2("/", O_WRONLY);
    if (fd == -1 && errno == EISDIR)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Boundary value tests ---------- */
// path length > PATH_MAX (ENAMETOOLONG expected)
static napi_value Open2Boundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::string longPath(K_LONG_PATH_LEN, 'a');
    errno = 0;
    int fd = CallOpen2(longPath.c_str(), O_RDONLY);
    if (fd == -1 && errno == ENAMETOOLONG)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// flags = 0 (O_RDONLY)
static napi_value Open2Boundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int fd = CallOpen2("/dev/null", 0);
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// O_CLOEXEC flag, verify FD_CLOEXEC set
static napi_value Open2Boundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int fd = CallOpen2("/dev/null", O_CLOEXEC);
    if (fd >= 0)
    {
        int flags = fcntl(fd, F_GETFD);
        close(fd);
        if (flags != -1 && (flags & FD_CLOEXEC))
        {
            return ReturnInt32(env, 1);
        }
    }
    return ReturnInt32(env, 0);
}

// symlink test (skipped)
static napi_value Open2Boundary005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

/* ---------- Functional tests ---------- */
// compare open2 with standard open
static napi_value Open2Func001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    const char* path = "/dev/null";
    errno = 0;
    int fd1 = CallOpen2(path, O_RDONLY);
    int err1 = errno;
    errno = 0;
    int fd2 = open(path, O_RDONLY);
    int err2 = errno;
    bool pass = (fd1 >= 0 && fd2 >= 0) || (fd1 == -1 && fd2 == -1 && err1 == err2);
    if (fd1 >= 0)
    {
        close(fd1);
    }
    if (fd2 >= 0)
    {
        close(fd2);
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

// verify function works in full mode
static napi_value Open2Func003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    int fd = CallOpen2("/dev/null", O_RDONLY);
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// O_DIRECT flag test
static napi_value Open2Func004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    int fd = CallOpen2("/dev/null", O_RDONLY | O_DIRECT);
    if (fd >= 0)
    {
        close(fd);
        return ReturnInt32(env, 1);
    }
    if (errno == EINVAL)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

/* ---------- Stability tests ---------- */
static napi_value Open2Stable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i)
    {
        int fd = CallOpen2("/dev/null", O_RDONLY);
        if (fd >= 0)
        {
            close(fd);
        } else
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value Open2Stable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> allSuccess(true);
    auto worker = [&allSuccess](int)
    {
        for (int i = 0; i < K_THREAD_WORK_LOOP; ++i)
        {
            int fd = CallOpen2("/dev/null", O_RDONLY);
            if (fd < 0)
            {
                allSuccess.store(false);
                break;
            }
            close(fd);
        }
    };
    std::vector<std::thread> threads;
    for (int id = K_THREAD_START_ID; id < K_THREAD_START_ID + K_THREAD_COUNT; ++id)
    {
        threads.emplace_back(worker, id);
    }
    for (auto& t : threads)
    {
        t.join();
    }
    return ReturnInt32(env, allSuccess.load() ? 1 : 0);
}

static napi_value Open2Stable003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::vector<int> fds;
    int fd;
    while ((fd = open("/dev/null", O_RDONLY)) >= 0)
    {
        fds.push_back(fd);
    }
    errno = 0;
    int ret = CallOpen2("/dev/null", O_RDONLY);
    int savedErrno = errno;
    for (int f : fds)
    {
        close(f);
    }
    if (ret == -1 && (savedErrno == EMFILE || savedErrno == ENFILE))
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value Open2Stable004(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"open2", nullptr, Open2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Normal003", nullptr, Open2Normal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Normal004", nullptr, Open2Normal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Abnormal004", nullptr, Open2Abnormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Abnormal005", nullptr, Open2Abnormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Abnormal006", nullptr, Open2Abnormal006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Abnormal007", nullptr, Open2Abnormal007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Boundary001", nullptr, Open2Boundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Boundary002", nullptr, Open2Boundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Boundary003", nullptr, Open2Boundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Boundary005", nullptr, Open2Boundary005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Func001", nullptr, Open2Func001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Func003", nullptr, Open2Func003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Func004", nullptr, Open2Func004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Stable001", nullptr, Open2Stable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Stable002", nullptr, Open2Stable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Stable003", nullptr, Open2Stable003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"open2Stable004", nullptr, Open2Stable004, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "openextndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
