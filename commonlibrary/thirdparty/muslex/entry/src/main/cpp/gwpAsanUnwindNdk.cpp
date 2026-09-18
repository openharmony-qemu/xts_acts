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

/*
 * GWP-ASan Unwind Backtrace Test Cases
 *
 * Tests libc_gwp_asan_unwind_fast for recursive backtrace correctness,
 * capacity boundaries, non-recursive regression, and deep recursion pressure.
 *
 * Return convention:
 *   -1  = GWP-ASan symbol not available (dlsym returned NULL), test skipped
 *    0  = test failed (frame count does not meet expectation)
 *    1  = test passed (frame count meets expectation)
 *
 * Compile requirement: -fno-omit-frame-pointer (set in CMakeLists.txt)
 */

#include "napi/native_api.h"
#include "libcFunctionLoader.h"
#include <cstring>
#include <pthread.h>
#include <unistd.h>

/* ---------- Constants ---------- */

static constexpr size_t FRAME_BUF_30 = 30;
static constexpr size_t FRAME_BUF_80 = 80;
static constexpr size_t FRAME_BUF_20 = 20;
static constexpr size_t FRAME_BUF_5 = 5;
static constexpr size_t FRAME_BUF_1 = 1;
static constexpr size_t FRAME_BUF_10 = 10;
static constexpr size_t FRAME_BUF_300 = 300;
static constexpr size_t FRAME_BUF_600 = 600;
static constexpr size_t DEPTH_3 = 3;
static constexpr size_t DEPTH_10 = 10;
static constexpr size_t DEPTH_20 = 20;
static constexpr size_t DEPTH_50 = 50;
static constexpr size_t DEPTH_200 = 200;
static constexpr size_t DEPTH_500 = 500;
static constexpr size_t DEEP_STACK_SIZE = 4 * 1024 * 1024; /* 4MB for deep recursion */

/* ---------- Helpers ---------- */

using UnwindFn = LibcFunctionLoader::GwpAsanUnwindFastFunc;

static UnwindFn GetUnwindFast()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return loader.GetGwpAsanUnwindFast();
}

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value result;
    napi_create_int32(env, val, &result);
    return result;
}

static napi_value RetSkip(napi_env env)
{
    return Ret(env, -1);
}

static napi_value RetPass(napi_env env)
{
    return Ret(env, 1);
}

static napi_value RetFail(napi_env env)
{
    return Ret(env, 0);
}

/* ---------- Recursive call pattern ----------
 *
 * __attribute__((noinline)) ensures each recursive call creates a real
 * stack frame. volatile marker prevents tail-call optimization so frames
 * are not eliminated by the compiler.
 */

__attribute__((noinline))
static size_t RecursiveCall(size_t depth, size_t *buf, size_t max, UnwindFn fn)
{
    volatile size_t marker = depth;  /* prevent tail-call optimization */
    if (depth == 0) {
        return fn(buf, max);
    }
    size_t r = RecursiveCall(depth - 1, buf, max, fn);
    return r + (marker * 0);  /* use marker to prevent elimination */
}

/* ---------- Non-recursive call chain (A->B->C->D) ---------- */

__attribute__((noinline)) static size_t ChainD(size_t *buf, size_t max, UnwindFn fn) { return fn(buf, max); }
__attribute__((noinline)) static size_t ChainC(size_t *buf, size_t max, UnwindFn fn) { return ChainD(buf, max, fn); }
__attribute__((noinline)) static size_t ChainB(size_t *buf, size_t max, UnwindFn fn) { return ChainC(buf, max, fn); }
__attribute__((noinline)) static size_t ChainA(size_t *buf, size_t max, UnwindFn fn) { return ChainB(buf, max, fn); }

/* ---------- Deep recursion thread wrapper ---------- */

struct DeepRecurArgs {
    size_t depth;
    size_t *buf;
    size_t max;
    UnwindFn fn;
    size_t result;
};

static void *DeepRecurThread(void *arg)
{
    auto *a = static_cast<DeepRecurArgs *>(arg);
    a->result = RecursiveCall(a->depth, a->buf, a->max, a->fn);
    return nullptr;
}

static size_t RunDeepRecurion(size_t depth, size_t *buf, size_t max, UnwindFn fn)
{
    DeepRecurArgs args{depth, buf, max, fn, 0};
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setstacksize(&attr, DEEP_STACK_SIZE);
    pthread_t tid;
    int ret = pthread_create(&tid, &attr, DeepRecurThread, &args);
    pthread_attr_destroy(&attr);
    if (ret != 0) {
        /* fallback: run on current thread */
        return RecursiveCall(depth, buf, max, fn);
    }
    pthread_join(tid, nullptr);
    return args.result;
}

/* ====================================================================
 * Dimension D1: Recursive backtrace correctness (BUG-001 regression)
 * ==================================================================== */

/* D1-T01: Recursive 10, max=30, expect frames >= 10 */
static napi_value GwpAsanUnwindRecursive10(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_30] = {0};
    size_t frames = RecursiveCall(DEPTH_10, buf, FRAME_BUF_30, fn);
    int pass = (frames >= DEPTH_10) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D1-T02: Recursive 50, max=80, expect frames >= 50 */
static napi_value GwpAsanUnwindRecursive50(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_80] = {0};
    size_t frames = RecursiveCall(DEPTH_50, buf, FRAME_BUF_80, fn);
    int pass = (frames >= DEPTH_50) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D1-T03: Recursive 3, max=20, expect frames >= 3 */
static napi_value GwpAsanUnwindRecursive3(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_20] = {0};
    size_t frames = RecursiveCall(DEPTH_3, buf, FRAME_BUF_20, fn);
    int pass = (frames >= DEPTH_3) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* ====================================================================
 * Dimension D2: max_record_stack capacity boundary (BUG-002, BUG-003)
 * ==================================================================== */

/* D2-T01: Recursive 20, max=5, expect frames <= 5 (capacity truncation) */
static napi_value GwpAsanUnwindCapLimit(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_5] = {0};
    size_t frames = RecursiveCall(DEPTH_20, buf, FRAME_BUF_5, fn);
    int pass = (frames <= FRAME_BUF_5) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D2-T02: Recursive 10, max=0, expect frames == 0 (zero capacity) */
static napi_value GwpAsanUnwindZeroCap(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t dummy = 0;
    size_t frames = RecursiveCall(DEPTH_10, &dummy, 0, fn);
    int pass = (frames == 0) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D2-T03: Recursive 10, max=1, expect frames <= 1 (single frame fast path) */
static napi_value GwpAsanUnwindSingleFrameFast(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_1] = {0};
    size_t frames = RecursiveCall(DEPTH_10, buf, FRAME_BUF_1, fn);
    int pass = (frames <= FRAME_BUF_1) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D2-T05: Recursive 10, max=10, NULL buf, expect frames == 0 (null buffer) */
static napi_value GwpAsanUnwindNullBuf(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t frames = RecursiveCall(DEPTH_10, nullptr, FRAME_BUF_10, fn);
    int pass = (frames == 0) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* ====================================================================
 * Dimension D3: Non-recursive normal backtrace (regression protection)
 * ==================================================================== */

/* D3-T01: Non-recursive A->B->C->D chain, max=20, expect frames >= 4 */
static napi_value GwpAsanUnwindNonRecursive4(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_20] = {0};
    size_t frames = ChainA(buf, FRAME_BUF_20, fn);
    int pass = (frames >= 4) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D3-T02: Single frame minimum, max=10, expect frames >= 1 */
static napi_value GwpAsanUnwindSingleMin(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_10] = {0};
    size_t frames = fn(buf, FRAME_BUF_10);
    int pass = (frames >= 1) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* ====================================================================
 * Dimension D6: Deep recursion pressure (BUG-001 stress)
 * ==================================================================== */

/* D6-T01: Recursive 200, max=300, expect frames >= 200 */
static napi_value GwpAsanUnwindDeep200(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_300] = {0};
    size_t frames = RunDeepRecurion(DEPTH_200, buf, FRAME_BUF_300, fn);
    int pass = (frames >= DEPTH_200) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* D6-T02: Recursive 500, max=600, expect frames >= 500 */
static napi_value GwpAsanUnwindDeep500(napi_env env, napi_callback_info info)
{
    UnwindFn fn = GetUnwindFast();
    if (!fn) { return RetSkip(env); }
    size_t buf[FRAME_BUF_600] = {0};
    size_t frames = RunDeepRecurion(DEPTH_500, buf, FRAME_BUF_600, fn);
    int pass = (frames >= DEPTH_500) ? 1 : 0;
    return pass ? RetPass(env) : RetFail(env);
}

/* ====================================================================
 * Module registration
 * ==================================================================== */

static const napi_property_descriptor DESC[] = {
    {"gwpAsanUnwindRecursive10",     nullptr, GwpAsanUnwindRecursive10,     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindRecursive50",     nullptr, GwpAsanUnwindRecursive50,     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindRecursive3",      nullptr, GwpAsanUnwindRecursive3,      nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindCapLimit",        nullptr, GwpAsanUnwindCapLimit,        nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindZeroCap",         nullptr, GwpAsanUnwindZeroCap,         nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindSingleFrameFast", nullptr, GwpAsanUnwindSingleFrameFast, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindNullBuf",         nullptr, GwpAsanUnwindNullBuf,         nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindNonRecursive4",   nullptr, GwpAsanUnwindNonRecursive4,   nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindSingleMin",       nullptr, GwpAsanUnwindSingleMin,       nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindDeep200",         nullptr, GwpAsanUnwindDeep200,         nullptr, nullptr, nullptr, napi_default, nullptr},
    {"gwpAsanUnwindDeep500",         nullptr, GwpAsanUnwindDeep500,         nullptr, nullptr, nullptr, napi_default, nullptr},
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(DESC) / sizeof(DESC[0]), DESC);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libgwpasanunwindndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
