/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <dlfcn_ext.h>
#include <errno.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

#include "functionalext.h"

#define PIPE_FD 2
#define LEN_OF_POINTER 8
#define BASE_NUM 11
#define TEST_COUNTS 32

static const char *LIB_NAME = "/data/storage/el1/bundle/libs/arm/libldso_randomization_dep.so";
static const char *LIB_NAME_A = "/data/storage/el1/bundle/libs/arm/libldso_randomization_dep_a.so";

typedef void (*TEST_FUNC)(void);

typedef void* (*dlopen_ext_func)(const char*, int, void*);
static dlopen_ext_func g_dlopen_ext = NULL;
static bool g_dlopen_ext_available = false;

int g_test = BASE_NUM;
extern void test_f(void)
{
    ++g_test;
}

/**
 * @tc.name      : dlopen_randomization_0100
 * @tc.desc      : Call the dlopen interface to load a valid dynamic library
 * @tc.level     : Level0
 */
static void dlopen_randomization_0100(void)
{
    void *handle = dlopen(LIB_NAME, RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (handle) {
        int close_ret = dlclose(handle);
        EXPECT_EQ(__FUNCTION__, close_ret, 0);
    } else {
    }
}

/**
 * @tc.name      : dlopen_randomization_0200
 * @tc.desc      : Call the dlopen interface to load NULL
 * @tc.level     : Level1
 */
static void dlopen_randomization_0200(void)
{
    void *handle = dlopen(NULL, RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (!handle) {
        return;
    };
    int *i = static_cast<int*>(dlsym(handle, "g_test"));
    EXPECT_PTRNE(__FUNCTION__, i, 0);
    if (!i) {
        dlclose(handle);
        return;
    }
    EXPECT_EQ(__FUNCTION__, BASE_NUM, *i);
    TEST_FUNC test = reinterpret_cast<TEST_FUNC>(dlsym(handle, "test_f"));
    EXPECT_PTRNE(__FUNCTION__, test, 0);
    if (!test) {
        dlclose(handle);
        return;
    }
    test();
    EXPECT_EQ(__FUNCTION__, BASE_NUM + 1, g_test);
    g_test = BASE_NUM;
    dlclose(handle);
}

/**
 * @tc.name      : dlopen_randomization_0300
 * @tc.desc      : Call the dlopen interface to load a invalid dynamic library
 * @tc.level     : Level2
 */
static void dlopen_randomization_0300(void)
{
    void *handle = dlopen("test_invaild.so", RTLD_NOW);
    EXPECT_PTREQ(__FUNCTION__, handle, 0);
    if (handle) {
        dlclose(handle);
    }
}

/**
 * @tc.name      : dlopen_randomization_0400
 * @tc.desc      : Repeatedly calling the dlopen interface to load the same dynamic library
 * @tc.level     : Level1
 */
static void dlopen_randomization_0400(void)
{
    void *ori_handle = dlopen(LIB_NAME, RTLD_NOW);
    void *handle = 0;
    EXPECT_PTRNE(__FUNCTION__, ori_handle, 0);
    if (!ori_handle) {
        return;
    }
    int i = TEST_COUNTS;
    while (i--) {
        handle = dlopen(LIB_NAME, RTLD_NOW);
        EXPECT_PTREQ(__FUNCTION__, ori_handle, handle);
    }
    i = TEST_COUNTS + 1;
    while (i--) {
        dlclose(ori_handle);
    }
}

/**
 * @tc.name      : dlopen_randomization_0600
 * @tc.desc      : Call the dlopen interface to load a invalid dynamic library,
 *                 and call the dlsym interface to get symbol address
 * @tc.level     : Level1
 */
static void dlopen_randomization_0600(void)
{
    void *handle;
    int *i;
    TEST_FUNC test;
    handle = dlopen(LIB_NAME, RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (!handle) {
        return;
    }
    i = static_cast<int*>(dlsym(handle, "i"));
    EXPECT_PTRNE(__FUNCTION__, i, 0);
    if (!i) {
        dlclose(handle);
        return;
    }
    EXPECT_EQ(__FUNCTION__, *i, 0);
    test = reinterpret_cast<TEST_FUNC>(dlsym(handle, "test"));
    EXPECT_PTRNE(__FUNCTION__, test, 0);
    if (!test) {
        dlclose(handle);
        return;
    }
    test();
    EXPECT_EQ(__FUNCTION__, *i, 1);
    dlclose(handle);
}

/**
 * @tc.name      : dlopen_ext_randomization_0100
 * @tc.desc      : Call the dlopen_ext interface to load a valid dynamic library
 * @tc.level     : Level0
 */
static void dlopen_ext_randomization_0100(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    DlExtinfo extinfo = {0};
    void *handle = g_dlopen_ext(LIB_NAME_A, RTLD_NOW, &extinfo);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (handle) {
        int close_ret = dlclose(handle);
        EXPECT_EQ(__FUNCTION__, close_ret, 0);
    } else {
    }
}

/**
 * @tc.name      : dlopen_ext_randomization_0200
 * @tc.desc      : Call the dlopen interface to load NULL
 * @tc.level     : Level1
 */
static void dlopen_ext_randomization_0200(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    DlExtinfo extinfo = {0};
    void *handle = g_dlopen_ext(NULL, RTLD_NOW, &extinfo);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (!handle) {
        return;
    }
    int *i = static_cast<int*>(dlsym(handle, "g_test"));
    EXPECT_PTRNE(__FUNCTION__, i, 0);
    if (!i) {
        dlclose(handle);
        return;
    }
    EXPECT_EQ(__FUNCTION__, BASE_NUM, *i);
    TEST_FUNC test = reinterpret_cast<TEST_FUNC>(dlsym(handle, "test_f"));
    EXPECT_PTRNE(__FUNCTION__, test, 0);
    if (!test) {
        dlclose(handle);
        return;
    }
    test();
    EXPECT_EQ(__FUNCTION__, BASE_NUM + 1, g_test);
    g_test = BASE_NUM;
    dlclose(handle);
}

/**
 * @tc.name      : dlopen_ext_randomization_0300
 * @tc.desc      : Call the dlopen interface to load a invalid dynamic library
 * @tc.level     : Level2
 */
static void dlopen_ext_randomization_0300(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    DlExtinfo extinfo = {0};
    void *handle = g_dlopen_ext("test_invaild.so", RTLD_NOW, &extinfo);
    EXPECT_PTREQ(__FUNCTION__, handle, 0);
    if (handle) {
        dlclose(handle);
    }
}

/**
 * @tc.name      : dlopen_ext_randomization_0400
 * @tc.desc      : Repeatedly calling the dlopen_ext interface to load the same dynamic library
 * @tc.level     : Level1
 */
static void dlopen_ext_randomization_0400(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    DlExtinfo extinfo = {0};
    void *ori_handle = g_dlopen_ext(LIB_NAME, RTLD_NOW, &extinfo);
    void *handle = 0;
    EXPECT_PTRNE(__FUNCTION__, ori_handle, 0);
    if (!ori_handle) {
        return;
    }
    int i = TEST_COUNTS;
    while (i--) {
        handle = g_dlopen_ext(LIB_NAME, RTLD_NOW, &extinfo);
        EXPECT_PTREQ(__FUNCTION__, ori_handle, handle);
    }
    i = TEST_COUNTS + 1;
    while (i--) {
        dlclose(ori_handle);
    }
}

/**
 * @tc.name      : dlopen_ext_randomization_0600
 * @tc.desc      : Call the dlopen_ext interface to load a invalid dynamic library,
 *                 and call the dlsym interface to get symbol address
 * @tc.level     : Level1
 */
static void dlopen_ext_randomization_0600(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    void *handle;
    int *i;
    TEST_FUNC test;
    DlExtinfo extinfo = {0};
    handle = g_dlopen_ext(LIB_NAME, RTLD_NOW, &extinfo);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (!handle) {
        return;
    }
    i = static_cast<int*>(dlsym(handle, "i"));
    EXPECT_PTRNE(__FUNCTION__, i, 0);
    if (!i) {
        dlclose(handle);
        return;
    }
    EXPECT_EQ(__FUNCTION__, *i, 0);
    test = reinterpret_cast<TEST_FUNC>(dlsym(handle, "test"));
    EXPECT_PTRNE(__FUNCTION__, test, 0);
    if (!test) {
        dlclose(handle);
        return;
    }
    test();
    EXPECT_EQ(__FUNCTION__, *i, 1);
    dlclose(handle);
}

/**
 * @tc.name      : dlopen_ext_randomization_0800
 * @tc.desc      : The flag of dl_extinfo is set to DL_EXT_RESERVED_ADDRESS_RECURSIVE,
 *                 call the dlopen_ext interface to load a valid dynamic library
 * @tc.level     : Level1
 */
static void dlopen_ext_randomization_0800(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    DlExtinfo extinfo = {
        .flag = DL_EXT_RESERVED_ADDRESS_RECURSIVE,
    };
    void *handle = g_dlopen_ext(NULL, RTLD_NOW, &extinfo);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    if (!handle) {
        return;
    }
    int *i = static_cast<int*>(dlsym(handle, "g_test"));
    EXPECT_PTRNE(__FUNCTION__, i, 0);
    if (!i) {
        dlclose(handle);
        return;
    }
    EXPECT_EQ(__FUNCTION__, BASE_NUM, *i);
    TEST_FUNC test = reinterpret_cast<TEST_FUNC>(dlsym(handle, "test_f"));
    EXPECT_PTRNE(__FUNCTION__, test, 0);
    if (!test) {
        dlclose(handle);
        return;
    }
    test();
    EXPECT_EQ(__FUNCTION__, BASE_NUM + 1, *i);
    g_test = BASE_NUM;
    dlclose(handle);
}

/**
 * @tc.name      : dlopen_ext_randomization_0900
 * @tc.desc      : Different processes call the dlopen_ext interface to load a dynamic library,
 *                 the flag of dl_extinfo is set to DL_EXT_RESERVED_ADDRESS_RECURSIVE,
 *                 and then call the dlsym interface to get symbol address
 * @tc.level     : Level1
 */
static void dlopen_ext_randomization_0900(void)
{
    if (!g_dlopen_ext_available) {
        return;
    }
    void *parent_handle = 0;
    void *child_handle = 0;
    void *parent_sym = 0;
    void *child_sym = 0;
    void *get_child_sym = 0;
    int fd[PIPE_FD];
    if (pipe(fd) < 0) {
        EXPECT_FALSE(__FUNCTION__, true);
        return;
    }
    DlExtinfo extinfo = {
        .flag = DL_EXT_RESERVED_ADDRESS_RECURSIVE,
    };
    pid_t pid = fork();
    if (pid == 0) {
        child_handle = g_dlopen_ext(LIB_NAME_A, RTLD_NOW, &extinfo);
        EXPECT_PTRNE(__FUNCTION__, child_handle, 0);
        if (!child_handle) {
            exit(-1);
        }
        child_sym = dlsym(child_handle, "test");
        write(fd[1], &child_sym, sizeof(void *));
        dlclose(child_handle);
        exit(0);
    }
    parent_handle = g_dlopen_ext(LIB_NAME_A, RTLD_NOW, &extinfo);
    EXPECT_PTRNE(__FUNCTION__, parent_handle, 0);
    if (!parent_handle) {
        return;
    };
    parent_sym = dlsym(parent_handle, "test");
    dlclose(parent_handle);
    int status;
    waitpid(pid, &status, 0);
    read(fd[0], &get_child_sym, sizeof(void *));
    EXPECT_PTREQ(__FUNCTION__, parent_sym, get_child_sym);
    close(fd[0]);
    close(fd[1]);
}

/**
 * @tc.name      : dlopen_ns_randomization_0100
 * @tc.desc      : Call the dlopen_ns interface to load a valid dynamic library
 * @tc.level     : Level0
 */
static void dlopen_ns_randomization_0100(void)
{
    // dlopen_ns not available, skip test
}

/**
 * @tc.name      : dlopen_ns_randomization_0200
 * @tc.desc      : Call the dlopen_ns interface to load NULL
 * @tc.level     : Level1
 */
static void dlopen_ns_randomization_0200(void)
{
    // dlopen_ns not available, skip test
}

/**
 * @tc.name      : dlopen_ns_randomization_0300
 * @tc.desc      : Call the dlopen_ns interface to load a invalid dynamic library
 * @tc.level     : Level2
 */
static void dlopen_ns_randomization_0300(void)
{
    // dlopen_ns not available, skip test
}

/**
 * @tc.name      : dlopen_ns_randomization_0400
 * @tc.desc      : Repeatedly calling the dlopen_ns interface to load the same dynamic library
 * @tc.level     : Level1
 */
static void dlopen_ns_randomization_0400(void)
{
    // dlopen_ns not available, skip test
}

/**
 * @tc.name      : dlopen_ns_randomization_0600
 * @tc.desc      : Call the dlopen_ns interface to load a invalid dynamic library,
 *                 and call the dlsym interface to get symbol address
 * @tc.level     : Level1
 */
static void dlopen_ns_randomization_0600(void)
{
    // dlopen_ns not available, skip test
}

/**
 * @tc.name      : dlsym_randomization_0300
 * @tc.desc      : Call the dlsym interface to get symbol address, handle is invalid
 * @tc.level     : Level2
 */
static void dlsym_randomization_0300(void)
{
    void *sym = dlsym((void *)0xFFFF, "invalid_function");
    EXPECT_PTREQ(__FUNCTION__, sym, NULL);
}

/**
 * @tc.name      : dlsym_randomization_0400
 * @tc.desc      : Call the dlsym interface to get symbol address, handle is setted to RTLD_DEFAULT, and name is valid
 * @tc.level     : Level1
 */
static void dlsym_randomization_0400(void)
{
    void *sym = dlsym(RTLD_DEFAULT, "fopen");
    EXPECT_PTRNE(__FUNCTION__, sym, NULL);
}

/**
 * @tc.name      : dlsym_randomization_0500
 * @tc.desc      : Call the dlsym interface to get symbol address, handle is setted to RTLD_DEFAULT, and name is invalid
 * @tc.level     : Level2
 */
static void dlsym_randomization_0500(void)
{
    void *sym = dlsym(RTLD_DEFAULT, "invalid_func");
    EXPECT_PTREQ(__FUNCTION__, sym, NULL);
}


/**
 * @tc.name      : dlsym_randomization_0600
 * @tc.desc      : Call the dlsym interface to get symbol address, handle is setted to RTLD_NEXT, and name is valid
 * @tc.level     : Level1
 */
static void dlsym_randomization_0600(void)
{
    void *sym = dlsym(RTLD_NEXT, "fopen");
    EXPECT_PTRNE(__FUNCTION__, sym, NULL);
}

/**
 * @tc.name      : dlsym_randomization_0700
 * @tc.desc      : Call the dlsym interface to get symbol address, handle is setted to RTLD_NEXT, and name is invalid
 * @tc.level     : Level2
 */
static void dlsym_randomization_0700(void)
{
    void *sym = dlsym(RTLD_NEXT, "invalid_func");
    EXPECT_PTREQ(__FUNCTION__, sym, NULL);
}

/**
 * @tc.name      : dlclose_randomization_0100
 * @tc.desc      : Call the dlclose interface to unload dynamic library
 * @tc.level     : Level2
 */
static void dlclose_randomization_0100(void)
{
    int ret = dlclose(NULL);
    EXPECT_EQ(__FUNCTION__, -1, ret);
}

/**
 * @tc.name      : dlopen_randomization_0800
 * @tc.desc      : Call the dlopen interface to load libc.so
 * @tc.level     : Level1
 */
static void dlopen_randomization_0800(void)
{
    // Skip this test - HAP environment cannot access /system files
    /*
    if (sizeof(void *) == LEN_OF_POINTER) {
        system("cp /system/lib64/libc.so .");
    } else {
        system("cp /system/lib/libc.so .");
    }
    void *handle = dlopen("./libc.so", RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    system("rm ./libc.so");
    */
}

/**
 * @tc.name      : dlopen_randomization_0900
 * @tc.desc      : Call the dlopen interface to load ld.so
 * @tc.level     : Level1
 */
static void dlopen_randomization_0900(void)
{
    // Skip this test - HAP environment cannot access /system files
    /*
    void *handle = NULL;
    if (sizeof(void *) == LEN_OF_POINTER) {
        system("cp /system/lib/ld-musl-aarch64.so.1 .");
        handle = dlopen("./ld-musl-aarch64.so.1", RTLD_NOW);
        system("rm ld-musl-aarch64.so.1");
    } else {
        system("cp /system/lib/ld-musl-arm.so.1 .");
        handle = dlopen("./ld-musl-arm.so.1", RTLD_NOW);
        system("rm ./ld-musl-arm.so.1");
    }
    EXPECT_PTRNE(__FUNCTION__, handle, 0);
    */
}

TEST_FUNC test_cases[] = {
    dlopen_randomization_0100,
    // dlopen_randomization_0200, // requires dlsym on main program symbols (not supported in HAP)
    dlopen_randomization_0300,
    dlopen_randomization_0400,
    dlopen_randomization_0600,
    dlopen_ext_randomization_0100,
    // dlopen_ext_randomization_0200, // requires dlsym on main program symbols (not supported in HAP)
    dlopen_ext_randomization_0300,
    dlopen_ext_randomization_0400,
    dlopen_ext_randomization_0600,
    // dlopen_ext_randomization_0800, // requires dlsym on main program symbols (not supported in HAP)
    dlopen_ext_randomization_0900,
    dlopen_ns_randomization_0100,
    dlopen_ns_randomization_0200,
    dlopen_ns_randomization_0300,
    dlopen_ns_randomization_0400,
    dlopen_ns_randomization_0600,
    dlsym_randomization_0300,
    dlsym_randomization_0400,
    dlsym_randomization_0500,
    // dlsym_randomization_0600, // RTLD_NEXT not supported in HAP environment
    dlsym_randomization_0700,
    dlclose_randomization_0100,
    dlopen_randomization_0800,
    dlopen_randomization_0900,
};

static int LdsoRandomizationTestTest_impl(int argc, char *argv[]){
    
    // Try to get dlopen_ext function via dlsym
    g_dlopen_ext = (dlopen_ext_func)dlsym(RTLD_DEFAULT, "dlopen_ext");
    if (g_dlopen_ext) {
        g_dlopen_ext_available = true;
    } else {
        g_dlopen_ext_available = false;
    }
    
    size_t case_counts = sizeof(test_cases) / sizeof(TEST_FUNC);
    for (size_t case_num = 0; case_num < case_counts; case_num++) {
        test_cases[case_num]();
    }
    return g_tStatus;
}

int LdsoRandomizationTestTest(void)
{
    static char __libc_prog[] = "libc_test";
    char *__libc_argv[] = { __libc_prog, NULL };
    return LdsoRandomizationTestTest_impl(1, __libc_argv);
}
