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

#include <climits>
#include <cstdio>
#include <memory.h>
#include <stdatomic.h>
#include "test.h"
#define HOOK_ENABLE
#include "musl_preinit_common.h"

#define TEST(c, ...) ((c) || (t_error(#c " failed: " __VA_ARGS__), 0))

static bool g_clientHookFlag;

bool ClientGetHookFlag()
{
    return g_clientHookFlag;
}

bool ClientSetHookFlag(bool flag)
{
    bool beforeFlag = g_clientHookFlag;
    g_clientHookFlag = flag;
    return beforeFlag;
}

void InstallHookFunction()
{
    memset(function_of_shared_lib,
           0,
           sizeof(function_of_shared_lib[0]) * LAST_FUNCTION); /* NOLINT(G.FUU.21 禁止使用内存操作类不安全函数【C】) */
    function_of_shared_lib[GET_HOOK_FLAG_FUNCTION] = reinterpret_cast<void*>(ClientGetHookFlag);
    function_of_shared_lib[SET_HOOK_FLAG_FUNCTION] = reinterpret_cast<void*>(ClientSetHookFlag);
}

static int NativehookTestTestImpl(int argc, char** argv)
{
    printf("Installing client's functions...");
    InstallHookFunction();
    printf("\nInstallation Completes\n");

    printf("start 7 scenes testing...\n");

    printf("Case 1: client shared library has not been loaded.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)0, memory_order_seq_cst);
    bool hookFlag = GetHookFlag();
    TEST(hookFlag == false, "hookFlag shoud be false\n");
    volatile const struct MallocDispatchType* mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable == nullptr, "mallocDispatchTable shoud be nullptr\n");

    printf(
        "Case 2: client shared library is loading, no uninstall signal raising, but the functions hasn't been loaded, "
        "using the temporary malloc table.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)-1, memory_order_seq_cst);
    atomic_store_explicit(
        &g_muslLibcGlobals.currentDispatchTable, (volatile const long long)0x95919591, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, (volatile bool)true, memory_order_seq_cst);
    hookFlag = GetHookFlag();
    TEST(hookFlag == true, "hookFlag shoud be true\n");
    mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable != nullptr, "mallocDispatchTable shoud be not nullptr\n");

    printf(
        "Case 3: client shared library is loading, uninstall signal raising, but the functions hasn't been loaded, "
        "using the temporary malloc table.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)-1, memory_order_seq_cst);
    atomic_store_explicit(
        &g_muslLibcGlobals.currentDispatchTable, (volatile const long long)0x95919591, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, (volatile bool)false, memory_order_seq_cst);
    hookFlag = GetHookFlag();
    TEST(hookFlag == true, "hookFlag shoud be true\n");
    mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable == nullptr, "mallocDispatchTable shoud be nullptr\n");

    printf("Case 4: client shared library is loaded, no uninstall signal raising, outside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)0x10319090, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, (volatile bool)true, memory_order_seq_cst);
    SetHookFlag(true);
    hookFlag = GetHookFlag();
    TEST(hookFlag == true, "hookFlag shoud be true\n");
    mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable != nullptr, "mallocDispatchTable shoud be not nullptr\n");

    printf("Case 5: client shared library is loaded, no uninstall signal raising, inside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)0x10319090, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, (volatile bool)true, memory_order_seq_cst);
    SetHookFlag(false);
    hookFlag = GetHookFlag();
    TEST(hookFlag == false, "hookFlag shoud be false\n");
    mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable == nullptr, "mallocDispatchTable shoud be nullptr\n");

    printf("Case 6: client shared library is loaded, uninstall signal raising, outside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)0x10319090, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, (volatile bool)false, memory_order_seq_cst);
    SetHookFlag(true);
    hookFlag = GetHookFlag();
    TEST(hookFlag == true, "hookFlag shoud be true\n");
    mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable == nullptr, "mallocDispatchTable shoud be nullptr\n");

    printf("Case 7: client shared library is loaded, uninstall signal raising, inside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, (volatile long long)0x10319090, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, (volatile bool)false, memory_order_seq_cst);
    SetHookFlag(false);
    hookFlag = GetHookFlag();
    TEST(hookFlag == false, "hookFlag shoud be false\n");
    mallocDispatchTable = GetCurrentDispatchTable();
    TEST(mallocDispatchTable == nullptr, "mallocDispatchTable shoud be nullptr\n");
    TEST(mallocDispatchTable == nullptr, "mallocDispatchTable shoud be nullptr\n");

    if (T_STATUS == 0) {
        printf("All test cases passed!\n");
    } else {
        printf("***There are some test cases not passed.\n");
    }
    return T_STATUS;
}

int NativehookTestTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return NativehookTestTestImpl(1, libcArgvStub);
}
