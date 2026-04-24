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

#include <unistd.h>
#include "functionalext.h"

#define MAX_BUF 256
static const char* g_libPath_1 = "/data/storage/el1/bundle/libs/arm/libldso_debug_test_lib_6.so";
static const char* g_libPath_2 = "/data/storage/el1/bundle/libs/arm/libldso_debug_test_lib_8.so";
static const char* g_libPath_3 = "/data/storage/el1/bundle/libs/arm/libldso_debug_test_lib_9.so";

static bool FileExists(const char* path)
{
    return (path != nullptr && access(path, F_OK) == 0);
}

static int check_loaded(char* so)
{
    int pid = getpid();
    char path[MAX_BUF] = { 0 };
    sprintf(path, "/proc/%d/maps", pid);
    FILE* fp = fopen(path, "r");
    if (fp == nullptr) {
        return 0;
    }

    char buffer[MAX_BUF] = { 0 };
    while (fgets(buffer, MAX_BUF, fp) != nullptr) {
        if (strstr(buffer, so) != nullptr) {
            fclose(fp);
            return 1;
        }
    }
    fclose(fp);
    return 0;
}

/**
 * @tc.name      : ldso_memleak_check_0100
 * @tc.desc      : dlopen so file libldso_debug_test_lib_6.so which has another DTNEEDED so file
 *                 libldso_debug_test_lib_7.so. but the libldso_debug_test_lib_7.so is not in device,
 *                 so the dlopen will fail, and we will check there is no memleak for so libldso_debug_test_lib_6.so
 * @tc.level     : Level 0
 */
void ldso_memleak_check_0100(void)
{
    if (!FileExists(g_libPath_1)) {
        g_libPath_1 = "/data/storage/el1/bundle/libs/arm64/libldso_debug_test_lib_6.so";
    }
    if (!FileExists(g_libPath_1)) {
        return;
    }
    void* handle = dlopen(g_libPath_1, RTLD_NOW);
    if (handle != nullptr) {
        t_error("dlopen(name=%s, mode=%d) should fail\n", g_libPath_1, RTLD_NOW);
    }
    char* error = dlerror();
    if (error != nullptr && strstr(error, "libldso_debug_test_lib_7.so") == nullptr) {
        t_error("libldso_debug_test_lib_7.so should be not found, %s\n", error);
    }
    if (check_loaded(const_cast<char*>(g_libPath_1))) {
        t_error("This so file should not exist in maps, %s\n", const_cast<char*>(g_libPath_1));
    }
}

/**
 * @tc.name      : ldso_memleak_check_0200
 * @tc.desc      : dlopen so file libldso_debug_test_lib_8.so has DTNEEDED so file libldso_debug_test_lib_9.so.
 *                 libldso_debug_test_lib_9.so is dependent on libldso_debug_test_lib_10.so,
 *                 but the libldso_debug_test_lib_10.so is not in device, so the dlopen will fail,
 *                 and we will check there is no memleak for so libldso_debug_test_lib_8.so
 *                 and libldso_debug_test_lib_9.so
 * @tc.level     : Level 0
 */
void ldso_memleak_check_0200(void)
{
    if (!FileExists(g_libPath_2)) {
        g_libPath_2 = "/data/storage/el1/bundle/libs/arm64/libldso_debug_test_lib_8.so";
        g_libPath_3 = "/data/storage/el1/bundle/libs/arm64/libldso_debug_test_lib_9.so";
    }
    if (!FileExists(g_libPath_2)) {
        return;
    }
    void* handle = dlopen(g_libPath_2, RTLD_NOW);
    if (handle != nullptr) {
        t_error("dlopen(name=%s, mode=%d) should fail\n", g_libPath_2, RTLD_NOW);
    }
    if (check_loaded(const_cast<char*>(g_libPath_2))) {
        t_error("This so file should not exist in maps, %s\n", const_cast<char*>(g_libPath_2));
    }
    if (check_loaded(const_cast<char*>(g_libPath_3))) {
        t_error("This so file should not exist in maps, %s\n", const_cast<char*>(g_libPath_3));
    }
}

static int LdsoMemleakCheckTest_impl(int argc, char* argv[])
{
    ldso_memleak_check_0100();
    ldso_memleak_check_0200();
    return t_status;
}

int LdsoMemleakCheckTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return LdsoMemleakCheckTest_impl(1, libcArgv);
}
