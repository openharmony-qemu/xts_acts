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
#define LOG_TAG "DlvsymSymverTest"

#include "hilog/log.h"
#include "dso_symver.h"

/**
 * @tc.name      : dlvsym_no_symver_0100
 * @tc.desc      : invoke a symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymNoSymver0100(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0100] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0100] Attempting to dlopen: %{public}s", dso_no_symver_name);
    void *handle = dlopen(dso_no_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymNoSymver0100] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0100] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0100] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_no_symver_symbol, dso_version_invalid);
    functype func = (functype)dlvsym(handle, dso_no_symver_symbol, dso_version_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymNoSymver0100] dlvsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0100] dlvsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0100] END");
}

/**
 * @tc.name      : dlvsym_no_symver_0200
 * @tc.desc      : invoke an invalid symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymNoSymver0200(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0200] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0200] Attempting to dlopen: %{public}s", dso_no_symver_name);
    void *handle = dlopen(dso_no_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymNoSymver0200] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0200] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0200] Attempting to dlvsym invalid symbol: %{public}s@%{public}s", 
                dso_symbol_invalid, dso_version_invalid);
    functype func = (functype)dlvsym(handle, dso_symbol_invalid, dso_version_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymNoSymver0200] dlvsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0200] dlvsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymNoSymver0200] END");
}

/**
 * @tc.name      : dlvsym_easy_symver_0100
 * @tc.desc      : invoke a symbol with the default version
 * @tc.level     : Level 0
 */
void DlvsymEasySymver0100(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] Attempting to dlopen: %{public}s", dso_easy_symver_name);
    void *handle = dlopen(dso_easy_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0100] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_easy_symver_symbol, dso_easy_symver_version_stable);
    functype func = (functype)dlvsym(handle, dso_easy_symver_symbol, dso_easy_symver_version_stable);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0100] dlvsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] dlvsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] func() returned: %{public}s, expected: %{public}s", 
                result, dso_easy_symver_symbol_stable);
    symver_streq(result, dso_easy_symver_symbol_stable);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0100] END");
}

/**
 * @tc.name      : dlvsym_easy_symver_0200
 * @tc.desc      : invoke a symbol with a non-default version
 * @tc.level     : Level 1
 */
void DlvsymEasySymver0200(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] Attempting to dlopen: %{public}s", dso_easy_symver_name);
    void *handle = dlopen(dso_easy_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0200] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_easy_symver_symbol, dso_easy_symver_version_old);
    functype func = (functype)dlvsym(handle, dso_easy_symver_symbol, dso_easy_symver_version_old);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0200] dlvsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] dlvsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] func() returned: %{public}s, expected: %{public}s", 
                result, dso_easy_symver_symbol_old);
    symver_streq(result, dso_easy_symver_symbol_old);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0200] END");
}

/**
 * @tc.name      : dlvsym_easy_symver_0300
 * @tc.desc      : invoke an invalid symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymEasySymver0300(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0300] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0300] Attempting to dlopen: %{public}s", dso_easy_symver_name);
    void *handle = dlopen(dso_easy_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0300] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0300] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0300] Attempting to dlvsym invalid symbol: %{public}s@%{public}s", 
                dso_symbol_invalid, dso_version_invalid);
    functype func = (functype)dlvsym(handle, dso_symbol_invalid, dso_version_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0300] dlvsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0300] dlvsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0300] END");
}

/**
 * @tc.name      : dlvsym_easy_symver_0400
 * @tc.desc      : invoke a symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymEasySymver0400(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0400] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0400] Attempting to dlopen: %{public}s", dso_easy_symver_name);
    void *handle = dlopen(dso_easy_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0400] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0400] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0400] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_easy_symver_symbol, dso_version_invalid);
    functype func = (functype)dlvsym(handle, dso_easy_symver_symbol, dso_version_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymEasySymver0400] dlvsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0400] dlvsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymEasySymver0400] END");
}

/**
 * @tc.name      : dlvsym_hard_symver_0100
 * @tc.desc      : invoke a symbol with the default version
 * @tc.level     : Level 0
 */
void DlvsymHardSymver0100(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] Attempting to dlopen: %{public}s", dso_hard_symver_name);
    void *handle = dlopen(dso_hard_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0100] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_hard_symver_if_symbol, dso_hard_symver_version_stable);
    functype func = (functype)dlvsym(handle, dso_hard_symver_if_symbol, dso_hard_symver_version_stable);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0100] dlvsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] dlvsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] func() returned: %{public}s, expected: %{public}s", 
                result, dso_hard_symver_if_symbol_stable);
    symver_streq(result, dso_hard_symver_if_symbol_stable);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0100] END");
}

/**
 * @tc.name      : dlvsym_hard_symver_0200
 * @tc.desc      : invoke a symbol with a non-default version
 * @tc.level     : Level 1
 */
void DlvsymHardSymver0200(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] Attempting to dlopen: %{public}s", dso_hard_symver_name);
    void *handle = dlopen(dso_hard_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0200] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_hard_symver_if_symbol, dso_hard_symver_version_old);
    functype func = (functype)dlvsym(handle, dso_hard_symver_if_symbol, dso_hard_symver_version_old);
    const char *error = dlerror();
    if (error != NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0200] dlvsym failed: %{public}s", error);
        symver_error("%s", error);
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] dlvsym success, func: %{public}p", func);

    const char *result = func();
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] func() returned: %{public}s, expected: %{public}s", 
                result, dso_hard_symver_if_symbol_old);
    symver_streq(result, dso_hard_symver_if_symbol_old);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0200] END");
}

/**
 * @tc.name      : dlvsym_hard_symver_0300
 * @tc.desc      : invoke an invalid symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymHardSymver0300(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0300] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0300] Attempting to dlopen: %{public}s", dso_hard_symver_name);
    void *handle = dlopen(dso_hard_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0300] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0300] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0300] Attempting to dlvsym invalid symbol: %{public}s@%{public}s", 
                dso_symbol_invalid, dso_version_invalid);
    functype func = (functype)dlvsym(handle, dso_symbol_invalid, dso_version_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0300] dlvsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0300] dlvsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0300] END");
}

/**
 * @tc.name      : dlvsym_hard_symver_0400
 * @tc.desc      : invoke a symbol with an invalid version
 * @tc.level     : Level 2
 */
void DlvsymHardSymver0400(void)
{
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0400] START");
    symver_log("start");

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0400] Attempting to dlopen: %{public}s", dso_hard_symver_name);
    void *handle = dlopen(dso_hard_symver_name, RTLD_LAZY);
    if (!handle) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0400] dlopen failed: %{public}s", dlerror());
        symver_error("%s", dlerror());
        return;
    }
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0400] dlopen success, handle: %{public}p", handle);

    // Clear any existing error
    dlerror();

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0400] Attempting to dlvsym: %{public}s@%{public}s", 
                dso_hard_symver_if_symbol, dso_version_invalid);
    functype func = (functype)dlvsym(handle, dso_hard_symver_if_symbol, dso_version_invalid);
    const char *error = dlerror();
    if (error == NULL) {
        OH_LOG_ERROR(LOG_APP, "[DlvsymHardSymver0400] dlvsym should have failed but didn't");
        symver_error();
        return;
    }

    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0400] dlvsym failed as expected: %{public}s", error);
    symver_log("error = %s", error);

    dlclose(handle);

    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymHardSymver0400] END");
}

static int DlvsymTestWithArgs(int argc, char *argv[])
{
    OH_LOG_INFO(LOG_APP, "[DlvsymTestWithArgs] START");
    symver_log("start");

    DlvsymNoSymver0100();
    DlvsymNoSymver0200();

    DlvsymEasySymver0100();
    DlvsymEasySymver0200();
    DlvsymEasySymver0300();
    DlvsymEasySymver0400();

    DlvsymHardSymver0100();
    DlvsymHardSymver0200();
    DlvsymHardSymver0300();
    DlvsymHardSymver0400();

    symver_log("t_status = %d", g_tStatus);
    OH_LOG_INFO(LOG_APP, "[DlvsymTestWithArgs] t_status = %{public}d", g_tStatus);
    symver_log("end");
    OH_LOG_INFO(LOG_APP, "[DlvsymTestWithArgs] END");

    return g_tStatus;
}

int DlvsymTest(void)
{
    static char __libc_prog[] = "libc_test";
    char *__libc_argv[] = { __libc_prog, NULL };
    return DlvsymTestWithArgs(1, __libc_argv);
}
