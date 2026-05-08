/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <dlfcn.h>

#define LOG_DOMAIN 0x0000
#define LOG_TAG "DlsymSymverTest"

#include "hilog/log.h"
#include "dso_easy_symver.h"
#include "dso_hard_symver.h"
#include "dso_no_symver.h"
#include "dso_symver.h"

extern "C" void  *__dlsym_time64(void *__restrict, const char *__restrict);
/**
 * @tc.name      : dlsym_no_symver_0100
 * @tc.desc      : invoke a symbol programmatically
 * @tc.level     : Level 0
 */
void DlsymNoSymver0100(void)
{
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] Attempting to dlopen: %{public}s", dso_no_symver_name);
    void *handle = dlopen(dso_no_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlsymNoSymver0100] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] Attempting to dlsym: %{public}s", dso_no_symver_symbol);
    functype func = (functype)dlsym(handle, dso_no_symver_symbol);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlsymNoSymver0100] dlsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] dlsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] func() returned: %{public}s", result);
    symver_streq(result, dso_no_symver_symbol);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0100] END");
}

/**
 * @tc.name      : dlsym_no_symver_0200
 * @tc.desc      : invoke an invalid symbol programmatically
 * @tc.level     : Level 2
 */
void DlsymNoSymver0200(void)
{
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0200] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0200] Attempting to dlopen: %{public}s", dso_no_symver_name);
    void *handle = dlopen(dso_no_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlsymNoSymver0200] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0200] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0200] Attempting to dlsym invalid symbol: %{public}s", dso_symbol_invalid);
    functype func = (functype)dlsym(handle, dso_symbol_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlsymNoSymver0200] dlsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0200] dlsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlsymNoSymver0200] END");
}

/**
 * @tc.name      : dlsym_easy_symver_0100
 * @tc.desc      : invoke a symbol directly after specifying a non-default version
 * @tc.level     : Level 0
 */
void DlsymEasySymver0100(void)
{
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0100] START");
    symver_log("start");
    __asm__(".symver dso_easy_symver, dso_easy_symver@OLD");
    const char *result = dso_easy_symver();
    symver_streq(result, dso_easy_symver_symbol_old);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0100] END");
}

/**
 * @tc.name      : dlsym_easy_symver_0200
 * @tc.desc      : invoke a symbol with versions programmatically
 * @tc.level     : Level 1
 */
void DlsymEasySymver0200(void)
{
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] Attempting to dlopen: %{public}s", dso_easy_symver_name);
    void *handle = dlopen(dso_easy_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlsymEasySymver0200] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] Attempting to dlsym: %{public}s", dso_easy_symver_symbol);
    functype func = (functype)dlsym(handle, dso_easy_symver_symbol);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlsymEasySymver0200] dlsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] dlsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] func() returned: %{public}s, expected: %{public}s", result, dso_easy_symver_symbol_stable);
    symver_streq(result, dso_easy_symver_symbol_stable);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlsymEasySymver0200] END");
}

/**
 * @tc.name      : dlsym_easy_symver_0300
 * @tc.desc      : invoke an invalid symbol programmatically
 * @tc.level     : Level 2
 */
void DlsymEasySymver0300(void)
{
    symver_log("start");

    void *handle = dlopen(dso_easy_symver_name, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, dso_symbol_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlsym_hard_symver_0100
 * @tc.desc      : invoke a symbol directly after specifying a non-default version
 * @tc.level     : Level 0
 */
void DlsymHardSymver0100(void)
{
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0100] START");
    symver_log("start");

    __asm__(".symver dso_hard_symver_ld, dso_hard_symver_ld@OLD");
    const char *result = dso_hard_symver_ld();
    symver_streq(result, dso_hard_symver_ld_symbol_old);
    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0100] END");
}

/**
 * @tc.name      : dlsym_hard_symver_0200
 * @tc.desc      : invoke a symbol with versions programmatically
 * @tc.level     : Level 1
 */
void DlsymHardSymver0200(void)
{
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] Attempting to dlopen: %{public}s", dso_hard_symver_name);
    void *handle = dlopen(dso_hard_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlsymHardSymver0200] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] Attempting to dlsym: %{public}s", dso_hard_symver_if_symbol);
    functype func = (functype)dlsym(handle, dso_hard_symver_if_symbol);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlsymHardSymver0200] dlsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] dlsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] func() returned: %{public}s, expected: %{public}s", result, dso_hard_symver_if_symbol_stable);
    symver_streq(result, dso_hard_symver_if_symbol_stable);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlsymHardSymver0200] END");
}

/**
 * @tc.name      : dlsym_hard_symver_0300
 * @tc.desc      : invoke an invalid symbol programmatically
 * @tc.level     : Level 2
 */
void DlsymHardSymver0300(void)
{
    symver_log("start");

    void *handle = dlopen(dso_hard_symver_name, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)dlsym(handle, dso_symbol_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        symver_error();
        return;
    }

    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
}

/**
 * @tc.name      : dlsym_time64_no_symver_0100
 * @tc.desc      : invoke a symbol programmatically
 * @tc.level     : Level 0
 */
void DlsymTime64NoSymver0100(void)
{
    symver_log("start");

    void *handle = dlopen(dso_no_symver_name, RTLD_LAZY);
    if (!handle) {
        symver_error("%s", dlerror());
        return;
    }

    // Clear any existing error
    dlerror();

    functype func = (functype)__dlsym_time64(handle, dso_no_symver_symbol);
    const char *error = dlerror();
    if (error != NULL) {
        symver_error("%s", error);
        return;
    }

    const char *result = func();
    symver_streq(result, dso_no_symver_symbol);

    dlclose(handle);

    symver_log("end");
}

static int DlsymTestWithArgs(int argc, char *argv[])
{
    symver_log("start");

    DlsymNoSymver0100();
    DlsymNoSymver0200();
    //DlsymTime64NoSymver0100();

    DlsymEasySymver0100();
    DlsymEasySymver0200();
    DlsymEasySymver0300();

    DlsymHardSymver0100();
    DlsymHardSymver0200();
    DlsymHardSymver0300();

    symver_log("t_status = %d", g_tStatus);
    symver_log("end");

    return g_tStatus;
}

int DlsymTest(void)
{
    static char __libc_prog[] = "libc_test";
    char *__libc_argv[] = { __libc_prog, NULL };
    return DlsymTestWithArgs(1, __libc_argv);
}
