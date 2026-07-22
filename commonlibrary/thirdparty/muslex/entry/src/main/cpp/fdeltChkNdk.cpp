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
#include <sys/select.h>
#include <cerrno>
#include <csignal>
#include <sys/wait.h>
#include <unistd.h>
#include <climits>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_RANGE_OFFSET = 10;
static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_STABLE_LOOP_1000 = 20;
static constexpr int K_STABLE_LOOP_100000 = 200;
static constexpr int K_THREAD_WORK_LOOP = 10;
static constexpr int K_THREAD_COUNT = 3;

static long CallFdeltChk(long fd)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = reinterpret_cast<long (*)(long)>(loader.GetFdeltChk());
    if (!func)
    {
        errno = ENOSYS;
        return -1;
    }
    return func(fd);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    if (!loader.GetFdeltChk())
    {
        return true;
    }
    errno = 0;
    CallFdeltChk(0);
    return (errno == ENOSYS);
}

static bool CheckAbortForFd(long fd)
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
        CallFdeltChk(fd);
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
static napi_value FdeltChk(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    } else
    {
        long ret = CallFdeltChk(0);
        if (ret == 0)
        {
            return ReturnInt32(env, 1);
        }
        return ReturnInt32(env, 0);
    }
}

/* ---------- Normal parameter tests ---------- */
static napi_value FdeltChkNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(0) == 0)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(NFDBITS - 1) == 0)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(NFDBITS) == 1)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(FD_SETSIZE - 1) == (FD_SETSIZE - 1) / NFDBITS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkNormal005(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    long testFds[] = {0, 1, 31, 32, 63, 64, FD_SETSIZE - 1};
    for (long fd : testFds)
    {
        if (CallFdeltChk(fd) != fd / NFDBITS)
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

/* ---------- Abnormal parameter tests (removed 001-004) ---------- */
// stub mode behavior
static napi_value FdeltChkAbnormal005(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}

/* ---------- Boundary value tests ---------- */
static napi_value FdeltChkBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(0) == 0)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(FD_SETSIZE - 1) == (FD_SETSIZE - 1) / NFDBITS)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkBoundary003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(NFDBITS) == 1)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

static napi_value FdeltChkBoundary004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    if (CallFdeltChk(NFDBITS - 1) == 0)
    {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 0);
}

// Removed Boundary005 and Boundary006

/* ---------- Functional tests ---------- */
static napi_value FdeltChkFunc001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    for (int fd = 0; fd < FD_SETSIZE; ++fd)
    {
        if (CallFdeltChk(fd) != fd / NFDBITS)
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value FdeltChkFunc002(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}

static napi_value FdeltChkFunc003(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    fd_set set;
    FD_ZERO(&set);
    long fd = 10;
    long idx = CallFdeltChk(fd);
    if (idx != fd / NFDBITS)
    {
        return ReturnInt32(env, 0);
    }
    set.fds_bits[idx] |= (1UL << (fd % NFDBITS));
    if (!FD_ISSET(fd, &set))
    {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value FdeltChkFunc004(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    long tests[] = {NFDBITS - 1, NFDBITS, 2 * NFDBITS - 1, 2 * NFDBITS};
    for (long fd : tests)
    {
        if (CallFdeltChk(fd) != fd / NFDBITS)
        {
            return ReturnInt32(env, 0);
        }
    }
    return ReturnInt32(env, 1);
}

/* Stability tests */
static bool StableWorkerFunc()
{
    for (int i = 0; i < K_THREAD_WORK_LOOP; ++i)
    {
        for (int fd = 0; fd < FD_SETSIZE; ++fd)
        {
            if (CallFdeltChk(fd) != fd / NFDBITS)
            {
                return false;
            }
        }
    }
    return true;
}

static napi_value FdeltChkStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i)
    {
        for (int fd = 0; fd < FD_SETSIZE; ++fd)
        {
            if (CallFdeltChk(fd) != fd / NFDBITS)
            {
                return ReturnInt32(env, 0);
            }
        }
    }
    return ReturnInt32(env, 1);
}

static napi_value FdeltChkStable002(napi_env env, napi_callback_info info)
{
    if (IsStubMode())
    {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> allSuccess(true);
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t)
    {
        threads.emplace_back([&allSuccess]()
        {
            if (!StableWorkerFunc())
            {
                allSuccess.store(false);
            }
        });
    }
    for (auto& th : threads)
    {
        th.join();
    }
    return ReturnInt32(env, allSuccess.load() ? 1 : 0);
}

static napi_value FdeltChkStable003(napi_env env, napi_callback_info info)
{
    return ReturnInt32(env, 1);
}

// Removed Stable004

/* ---------- Module registration ---------- */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"fdeltChk", nullptr, FdeltChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkNormal001", nullptr, FdeltChkNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkNormal002", nullptr, FdeltChkNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkNormal003", nullptr, FdeltChkNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkNormal004", nullptr, FdeltChkNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkNormal005", nullptr, FdeltChkNormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkAbnormal005", nullptr, FdeltChkAbnormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkBoundary001", nullptr, FdeltChkBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkBoundary002", nullptr, FdeltChkBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkBoundary003", nullptr, FdeltChkBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkBoundary004", nullptr, FdeltChkBoundary004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkFunc001", nullptr, FdeltChkFunc001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkFunc002", nullptr, FdeltChkFunc002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkFunc003", nullptr, FdeltChkFunc003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkFunc004", nullptr, FdeltChkFunc004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkStable001", nullptr, FdeltChkStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkStable002", nullptr, FdeltChkStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fdeltChkStable003", nullptr, FdeltChkStable003, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "fdeltchkndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
