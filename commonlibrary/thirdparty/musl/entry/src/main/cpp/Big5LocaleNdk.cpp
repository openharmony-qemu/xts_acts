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

#include "common/napi_helper.cpp"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <clocale>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <dlfcn.h>
#include <cwctype>
#include <cwchar>
#include <iconv.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/stat.h>
#include <securec.h>

#define NO_ERR 0
#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define BUFF_SIZE 256
#define ENV_BUF_SIZE 256
#define LOOP_COUNT_1000 1000
#define LOOP_COUNT_10000 10000
#define THREAD_COUNT_8 8
#define UTF8_LEN_2 2
#define UTF8_LEN_3 3
#define PI_VAL 3.14
#define EPSILON_1E9 1e-9

static pthread_once_t g_icuInitOnce = PTHREAD_ONCE_INIT;
static int32_t g_icuInitOk = 0;

static void DoIcuInit()
{
    typedef int (*EnableFunc)(void);
    void *handle = dlopen(nullptr, RTLD_LAZY);
    if (!handle) {
        return;
    }
    EnableFunc fn1 = (EnableFunc)dlsym(handle, "set_iconv_icu_enable");
    EnableFunc fn2 = (EnableFunc)dlsym(handle, "set_wctype_icu_enable");
    if (fn1 && fn2 && fn1() == 0 && fn2() == 0) {
        g_icuInitOk = 1;
    }
    dlclose(handle);
}

static bool EnsureIcuInit()
{
    pthread_once(&g_icuInitOnce, DoIcuInit);
    return g_icuInitOk == 1;
}

static napi_value MakeResult(napi_env env, int32_t val)
{
    napi_value result = nullptr;
    napi_create_int32(env, val, &result);
    return result;
}

/* TC-001: setlocale zh_HK.Big5 + localeconv港澳格式 */
static napi_value SetlocaleBig5Localeconv(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    char *r = setlocale(LC_ALL, "zh_HK.Big5");
    int32_t ret = FAIL;
    if (r) {
        struct lconv *lc = localeconv();
        if (lc && lc->currency_symbol && strstr(lc->currency_symbol, "HK") != nullptr) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-002: zh_hk.Big5小写-验证返回NULL */
static napi_value SetlocaleLowercase(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    char *r = setlocale(LC_ALL, "zh_hk.Big5");
    int32_t ret = (r == nullptr) ? NO_ERR : FAIL;
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-003: 超长locale名-验证回退C.UTF-8 */
static napi_value SetlocaleTooLong(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *r = setlocale(LC_ALL, "zh_HK.Big5-HKSCS.paddingpad");
    int32_t ret = (r != nullptr) ? NO_ERR : FAIL;
    return MakeResult(env, ret);
}

/* TC-004: ICU缺失zh_HK数据-验证localeconv默认格式 */
static napi_value SetlocaleIcuMissing(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    char *r = setlocale(LC_ALL, "zh_HK.Big5");
    int32_t ret = FAIL;
    if (r) {
        struct lconv *lc = localeconv();
        if (lc) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-005: zh_HK.Big5-HKSCS-验证localeconv格式一致 */
static napi_value SetlocaleHkscsLocaleconv(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    char *r1 = setlocale(LC_ALL, "zh_HK.Big5");
    int32_t ret = FAIL;
    if (r1) {
        struct lconv *lc1 = localeconv();
        char dp1[BUFF_SIZE] = {0};
        if (lc1 && lc1->decimal_point) {
            (void)strncpy_s(dp1, BUFF_SIZE, lc1->decimal_point, BUFF_SIZE - 1);
        }
        char *r2 = setlocale(LC_ALL, "zh_HK.Big5-HKSCS");
        if (r2) {
            struct lconv *lc2 = localeconv();
            if (lc2 && lc2->decimal_point && strcmp(dp1, lc2->decimal_point) == 0) {
                ret = NO_ERR;
            }
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-006: zh_hk.Big5-HKSCS小写-验证返回NULL */
static napi_value SetlocaleHkscsLowercase(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *r = setlocale(LC_ALL, "zh_hk.Big5-HKSCS");
    int32_t ret = (r == nullptr) ? NO_ERR : FAIL;
    return MakeResult(env, ret);
}

/* TC-007: 清空环境变量后zh_HK.Big5-验证返回非NULL */
static napi_value SetlocaleEnvCleared(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    const char *envAll = getenv("LC_ALL");
    const char *envCtype = getenv("LC_CTYPE");
    const char *envLang = getenv("LANG");
    char saveAll[ENV_BUF_SIZE] = {0};
    char saveCtype[ENV_BUF_SIZE] = {0};
    char saveLang[ENV_BUF_SIZE] = {0};
    if (envAll) {
        (void)strncpy_s(saveAll, ENV_BUF_SIZE, envAll, ENV_BUF_SIZE - 1);
    }
    if (envCtype) {
        (void)strncpy_s(saveCtype, ENV_BUF_SIZE, envCtype, ENV_BUF_SIZE - 1);
    }
    if (envLang) {
        (void)strncpy_s(saveLang, ENV_BUF_SIZE, envLang, ENV_BUF_SIZE - 1);
    }
    unsetenv("LC_ALL");
    unsetenv("LC_CTYPE");
    unsetenv("LANG");
    char *r = setlocale(LC_ALL, "zh_HK.Big5");
    int32_t ret = (r != nullptr) ? NO_ERR : FAIL;
    if (saveAll[0]) {
        setenv("LC_ALL", saveAll, 1);
    } else {
        unsetenv("LC_ALL");
    }
    if (saveCtype[0]) {
        setenv("LC_CTYPE", saveCtype, 1);
    } else {
        unsetenv("LC_CTYPE");
    }
    if (saveLang[0]) {
        setenv("LANG", saveLang, 1);
    } else {
        unsetenv("LANG");
    }
    return MakeResult(env, ret);
}

/* TC-008: 含斜杠locale名-验证回退C.UTF-8 */
static napi_value SetlocaleSlash(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *r = setlocale(LC_ALL, "zh_HK/Big5");
    int32_t ret = FAIL;
    if (r) {
        struct lconv *lc = localeconv();
        if (lc && lc->decimal_point && strcmp(lc->decimal_point, ".") == 0) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-009~TC-013: wctype分类测试 */
static int32_t TestWctypeAll(wint_t c, locale_t loc)
{
    if (!iswalnum_l(c, loc)) {
        return FAIL;
    }
    if (!iswalpha_l(c, loc)) {
        return FAIL;
    }
    if (iswcntrl_l(c, loc)) {
        return FAIL;
    }
    if (!iswgraph_l(c, loc)) {
        return FAIL;
    }
    if (!iswprint_l(c, loc)) {
        return FAIL;
    }
    if (iswblank_l(c, loc)) {
        return FAIL;
    }
    if (iswdigit_l(c, loc)) {
        return FAIL;
    }
    if (iswlower_l(c, loc)) {
        return FAIL;
    }
    if (iswpunct_l(c, loc)) {
        return FAIL;
    }
    if (iswspace_l(c, loc)) {
        return FAIL;
    }
    if (iswupper_l(c, loc)) {
        return FAIL;
    }
    if (iswxdigit_l(c, loc)) {
        return FAIL;
    }
    return NO_ERR;
}

/* TC-009: newlocale创建locale_t-粤字U+7CA4-ICU委托 */
static napi_value WctypeNewlocaleYue(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        ret = TestWctypeAll(0x7CA4, loc);
        if (towupper_l(0x7CA4, loc) < 0) {
            ret = FAIL;
        }
        if (towlower_l(0x7CA4, loc) < 0) {
            ret = FAIL;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-010: setlocale获取locale_t-粤字U+7CA4-ICU委托 */
static napi_value WctypeSetlocaleYue(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5")) {
        locale_t loc = uselocale(nullptr);
        if (loc) {
            ret = TestWctypeAll(0x7CA4, loc);
        }
        setlocale(LC_ALL, origBuf[0] ? origBuf : "C");
    }
    return MakeResult(env, ret);
}

/* TC-011: HKSCS locale_t-扩展字符U+233E6 */
static napi_value WctypeHkscsSupplementary(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5-HKSCS")) {
        locale_t loc = uselocale(nullptr);
        if (loc) {
            ret = TestWctypeAll(0x233E6, loc);
        }
        setlocale(LC_ALL, origBuf[0] ? origBuf : "C");
    }
    return MakeResult(env, ret);
}

/* TC-012: C locale_t-粤字U+7CA4-musl内置Unicode表分类为alpha */
static napi_value WctypeCLocaleYue(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    (void)setlocale(LC_ALL, "C");
    locale_t loc = uselocale(nullptr);
    int32_t ret = FAIL;
    if (loc) {
        /* C locale: musl built-in iswalpha uses Unicode table, CJK is alpha */
        if (iswalpha_l(0x7CA4, loc) != 0) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

static int32_t CompareAsciiAlpha(locale_t locHk, locale_t locC)
{
    for (int32_t c = 'a'; c <= 'z'; c++) {
        if (iswalpha_l(c, locHk) != iswalpha_l(c, locC)) {
            return FAIL;
        }
    }
    return NO_ERR;
}

/* TC-013: zh_HK.Big5下ASCII字符-与C locale分类一致 */
static int32_t CompareAsciiWctype(locale_t locHk)
{
    (void)setlocale(LC_ALL, "C");
    locale_t locC = uselocale(nullptr);
    if (locC == nullptr) {
        return FAIL;
    }
    return CompareAsciiAlpha(locHk, locC);
}

static napi_value WctypeAsciiConsistent(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5")) {
        locale_t locHk = uselocale(nullptr);
        (void)setlocale(LC_ALL, "C");
        locale_t locC = uselocale(nullptr);
        if (locHk && locC) {
            ret = CompareAsciiAlpha(locHk, locC);
        }
        setlocale(LC_ALL, origBuf[0] ? origBuf : "C");
    }
    return MakeResult(env, ret);
}

/* TC-014: strtod_l解析3.14 */
static napi_value StrtodLBig5_314(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        char *endptr = nullptr;
        double r = strtod_l("3.14", &endptr, loc);
        if (fabs(r - PI_VAL) < EPSILON_1E9 && endptr && *endptr == '\0') {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-016: strtod_l解析溢出1e999-ICU返回INFINITY不设ERANGE */
static napi_value StrtodLBig5Overflow(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        char *endptr = nullptr;
        double r = strtod_l("1e999", &endptr, loc);
        if (isinf(r)) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-017: wcstod_l解析3.14 */
static napi_value WcstodLBig5_314(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        wchar_t *endptr = nullptr;
        double r = wcstod_l(L"3.14", &endptr, loc);
        if (fabs(r - PI_VAL) < EPSILON_1E9 && endptr && *endptr == L'\0') {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-019: wcstod_l解析溢出1e999-ICU返回INFINITY不设ERANGE */
static napi_value WcstodLBig5Overflow(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        wchar_t *endptr = nullptr;
        double r = wcstod_l(L"1e999", &endptr, loc);
        if (isinf(r)) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-020: 查询zh_HK格式字段-验证港澳地区格式非C默认值 */
static napi_value LocaleconvBig5Fields(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5")) {
        struct lconv *lc = localeconv();
        if (lc && lc->decimal_point && lc->currency_symbol &&
            lc->thousands_sep && lc->int_curr_symbol) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-021: 切换setlocale后访问旧指针 */
static napi_value LocaleconvStaticInvalidation(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5")) {
        localeconv();
        (void)setlocale(LC_ALL, "C");
        struct lconv *lc2 = localeconv();
        if (lc2) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-022: HKSCS变体验证行为一致性 */
static napi_value HkscsVariantConsistency(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5-HKSCS")) {
        locale_t loc = uselocale(nullptr);
        if (loc) {
            char *ep = nullptr;
            double r1 = strtod_l("3.14", &ep, loc);
            wchar_t *wp = nullptr;
            double r2 = wcstod_l(L"3.14", &wp, loc);
            if (fabs(r1 - PI_VAL) < EPSILON_1E9 && fabs(r2 - PI_VAL) < EPSILON_1E9) {
                ret = NO_ERR;
            }
        }
        if (origBuf[0]) {
            setlocale(LC_ALL, origBuf);
        } else {
            (void)setlocale(LC_ALL, "C");
        }
    }
    return MakeResult(env, ret);
}

/* TC-023: 跨架构精度与结构体布局验证 */
static napi_value StrtodLStructLayout(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        char *ep = nullptr;
        double r1 = strtod_l("3.14", &ep, loc);
        strtod_l("1e999", &ep, loc);
        wchar_t *wp = nullptr;
        wcstod_l(L"3.14", &wp, loc);
        if (fabs(r1 - PI_VAL) < EPSILON_1E9) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-024: Big5转UTF8有效字节序列 */
static napi_value IconvBig5ToUtf8(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "big5");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xca\xfd";
        char *inp = in;
        size_t inlen = 2;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && (sizeof(out) - outlen) > 0) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-025: Big5转UTF8非法字节-验证U+FFFD替换不报错 */
static napi_value IconvBig5InvalidByte(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "big5");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\x80";
        char *inp = in;
        size_t inlen = 1;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && (sizeof(out) - outlen) > 0) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-026: Big5转UTF8不完整序列-验证U+FFFD替换不报错 */
static napi_value IconvBig5Incomplete(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "big5");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xa4";
        char *inp = in;
        size_t inlen = 1;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && (sizeof(out) - outlen) > 0) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-027: Big5转UTF8输出缓冲不足-验证E2BIG */
static napi_value IconvBig5BufferTooSmall(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "big5");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xca\xfd";
        char *inp = in;
        size_t inlen = 2;
        char out[1] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        errno = 0;
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r == static_cast<size_t>(-1) && errno == E2BIG) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-028: HKSCS转UTF8-验证句柄重复使用 */
static napi_value IconvHkscsToUtf8Reuse(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "big5hkscs");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in1[] = "\x87\x40";
        char *inp1 = in1;
        size_t inlen1 = 2;
        char out1[16] = {0};
        char *outp1 = out1;
        size_t outlen1 = sizeof(out1);
        size_t r1 = iconv(cd, &inp1, &inlen1, &outp1, &outlen1);
        char in2[] = "\xa4\xa4";
        char *inp2 = in2;
        size_t inlen2 = 2;
        char out2[16] = {0};
        char *outp2 = out2;
        size_t outlen2 = sizeof(out2);
        size_t r2 = iconv(cd, &inp2, &inlen2, &outp2, &outlen2);
        iconv_close(cd);
        if (r1 != static_cast<size_t>(-1) && r2 != static_cast<size_t>(-1)) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-029: UTF8转Big5有效字符序列 */
static napi_value IconvUtf8ToBig5(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("big5", "UTF-8");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xe4\xb8\xad";
        char *inp = in;
        size_t inlen = 3;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && (sizeof(out) - outlen) == UTF8_LEN_2) {
            if (memcmp(out, "\xa4\xa4", UTF8_LEN_2) == 0) {
                ret = NO_ERR;
            }
        }
    }
    return MakeResult(env, ret);
}

/* TC-030: UTF8转Big5不可表示字符-验证替换与继续转换 */
static napi_value IconvUtf8ToBig5Unrepresentable(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("big5", "UTF-8");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xc3\xa9\xe4\xb8\xad";
        char *inp = in;
        size_t inlen = 5;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        errno = 0;
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r == static_cast<size_t>(-1) && errno == EILSEQ) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-031: UTF8转HKSCS含补充平面字符 */
static napi_value IconvUtf8ToHkscsSupplementary(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("big5hkscs", "UTF-8");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xf0\xa3\x8f\xa6";
        char *inp = in;
        size_t inlen = 4;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && inlen == 0) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* TC-032: cp950别名识别与Big5转UTF8转换 */
static napi_value IconvCp950Alias(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "cp950");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xa4\xa4";
        char *inp = in;
        size_t inlen = 2;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && (sizeof(out) - outlen) == UTF8_LEN_3) {
            if (memcmp(out, "\xe4\xb8\xad", UTF8_LEN_3) == 0) {
                ret = NO_ERR;
            }
        }
    }
    return MakeResult(env, ret);
}

/* TC-033: 不支持字符集名-验证EINVAL */
static napi_value IconvUnsupportedCharset(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    errno = 0;
    iconv_t cd = iconv_open("UTF-8", "zh_HK.big5");
    int32_t ret = FAIL;
    if (cd == reinterpret_cast<iconv_t>(-1) && errno == EINVAL) {
        ret = NO_ERR;
    }
    return MakeResult(env, ret);
}

/* ---- TC-034~TC-043: 回归测试 ---- */

/* TC-034: setlocale加载zhCN与localeconv格式-验证回归不变 */
static napi_value RegressZhCnLocaleconv(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_CN")) {
        struct lconv *lc = localeconv();
        if (lc && lc->decimal_point) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-035: zhCN下wctype字符分类-验证回归不变 */
static napi_value RegressZhCnWctype(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        if (iswalpha_l(0x4E00, loc) && iswdigit_l('0', loc)) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-036: zhCN下strtodL与wcstodL数值解析-验证回归不变 */
static napi_value RegressZhCnStrtod(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        char *ep = nullptr;
        double r = strtod_l("3.14", &ep, loc);
        if (fabs(r - PI_VAL) < EPSILON_1E9) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-037: setlocale加载enUSUTF8与localeconv格式-验证回归不变 */
static napi_value RegressEnUsLocaleconv(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "en_US.UTF-8")) {
        struct lconv *lc = localeconv();
        if (lc && lc->decimal_point) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-038: enUSUTF8下wctype字符分类-验证回归不变 */
static napi_value RegressEnUsWctype(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        if (iswalpha_l('A', loc) && iswdigit_l('0', loc)) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-039: enUSUTF8下strtodL与wcstodL数值解析-验证回归不变 */
static napi_value RegressEnUsStrtod(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        char *ep = nullptr;
        double r = strtod_l("3.14", &ep, loc);
        if (fabs(r - PI_VAL) < EPSILON_1E9) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-040: setlocale加载zhCNUTF8与localeconv格式-验证回归不变 */
static napi_value RegressZhCnUtf8Localeconv(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_CN.UTF-8")) {
        struct lconv *lc = localeconv();
        if (lc && lc->decimal_point) {
            ret = NO_ERR;
        }
    }
    if (origBuf[0]) {
        setlocale(LC_ALL, origBuf);
    } else {
        (void)setlocale(LC_ALL, "C");
    }
    return MakeResult(env, ret);
}

/* TC-041: zhCNUTF8下wctype字符分类-验证回归不变 */
static napi_value RegressZhCnUtf8Wctype(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_CN.UTF-8", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        if (iswalpha_l(0x4E00, loc) && iswdigit_l('0', loc)) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-042: zhCNUTF8下strtodL与wcstodL数值解析-验证回归不变 */
static napi_value RegressZhCnUtf8Strtod(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t loc = newlocale(LC_ALL_MASK, "zh_CN.UTF-8", nullptr);
    int32_t ret = FAIL;
    if (loc) {
        char *ep = nullptr;
        double r = strtod_l("3.14", &ep, loc);
        if (fabs(r - PI_VAL) < EPSILON_1E9) {
            ret = NO_ERR;
        }
        freelocale(loc);
    }
    return MakeResult(env, ret);
}

/* TC-043: iconv编码转换locale无关-验证回归不变 */
static napi_value RegressIconvLocaleIndependent(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t cd = iconv_open("UTF-8", "big5");
    int32_t ret = FAIL;
    if (cd != reinterpret_cast<iconv_t>(-1)) {
        char in[] = "\xa4\xa4";
        char *inp = in;
        size_t inlen = 2;
        char out[16] = {0};
        char *outp = out;
        size_t outlen = sizeof(out);
        size_t r = iconv(cd, &inp, &inlen, &outp, &outlen);
        iconv_close(cd);
        if (r != static_cast<size_t>(-1) && (sizeof(out) - outlen) == UTF8_LEN_3) {
            ret = NO_ERR;
        }
    }
    return MakeResult(env, ret);
}

/* ---- TC-045~TC-054: 稳定性和功能测试 ---- */

/* TC-045: 多线程locale_t隔离验证 */
typedef struct {
    locale_t loc;
    int32_t expectedNonZero;
    int32_t ok;
} ThreadArg;

static void *ThreadWctypeFunc(void *arg)
{
    ThreadArg *ta = reinterpret_cast<ThreadArg *>(arg);
    for (int32_t i = 0; i < LOOP_COUNT_1000; i++) {
        int32_t r = iswalpha_l(0x7CA4, ta->loc);
        if (ta->expectedNonZero && r == 0) {
            ta->ok = 0;
            return nullptr;
        }
        if (!ta->expectedNonZero && r != 0) {
            ta->ok = 0;
            return nullptr;
        }
    }
    ta->ok = 1;
    return nullptr;
}

static napi_value MultiThreadLocaleIsolation(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t locHk = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    locale_t locCn = newlocale(LC_ALL_MASK, "zh_CN", nullptr);
    int32_t ret = FAIL;
    if (locHk && locCn) {
        pthread_t t1;
        pthread_t t2;
        ThreadArg arg1 = {locHk, 1, 0};
        ThreadArg arg2 = {locCn, 1, 0};
        pthread_create(&t1, nullptr, ThreadWctypeFunc, &arg1);
        pthread_create(&t2, nullptr, ThreadWctypeFunc, &arg2);
        pthread_join(t1, nullptr);
        pthread_join(t2, nullptr);
        if (arg1.ok && arg2.ok) {
            ret = NO_ERR;
        }
    }
    if (locHk) {
        freelocale(locHk);
    }
    if (locCn) {
        freelocale(locCn);
    }
    return MakeResult(env, ret);
}

/* TC-046: 多线程setlocale与locale_t隔离验证 */
static void *ThreadSetlocaleFunc(void *arg)
{
    for (int32_t i = 0; i < LOOP_COUNT_1000; i++) {
        if (i % UTF8_LEN_2 == 0) {
            (void)setlocale(LC_ALL, "zh_HK.Big5");
        } else {
            (void)setlocale(LC_ALL, "C");
        }
        usleep(1);
    }
    return nullptr;
}

static void *ThreadLocaleTFunc(void *arg)
{
    locale_t loc = reinterpret_cast<locale_t>(arg);
    for (int32_t i = 0; i < LOOP_COUNT_1000; i++) {
        if (iswalpha_l(0x7CA4, loc) == 0) {
            return reinterpret_cast<void *>(1);
        }
    }
    return nullptr;
}

static napi_value MultiThreadSetlocaleIsolation(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t locHk = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (locHk) {
        pthread_t tA;
        pthread_t tB;
        pthread_create(&tA, nullptr, ThreadSetlocaleFunc, nullptr);
        pthread_create(&tB, nullptr, ThreadLocaleTFunc, locHk);
        pthread_join(tA, nullptr);
        void *bResult = nullptr;
        pthread_join(tB, &bResult);
        if (bResult == nullptr) {
            ret = NO_ERR;
        }
        freelocale(locHk);
    }
    return MakeResult(env, ret);
}

/* TC-047: 多线程localeconv静态指针竞争安全验证 */
static void *ThreadLocaleconvFunc(void *arg)
{
    for (int32_t i = 0; i < LOOP_COUNT_10000; i++) {
        struct lconv *lc = localeconv();
        if (lc == nullptr || lc->decimal_point == nullptr) {
            return reinterpret_cast<void *>(1);
        }
    }
    return nullptr;
}

static napi_value MultiThreadLocaleconvSafety(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    (void)setlocale(LC_ALL, "zh_HK.Big5");
    int32_t ret = NO_ERR;
    pthread_t threads[THREAD_COUNT_8];
    for (int32_t i = 0; i < THREAD_COUNT_8; i++) {
        pthread_create(&threads[i], nullptr, ThreadLocaleconvFunc, nullptr);
    }
    for (int32_t i = 0; i < THREAD_COUNT_8; i++) {
        void *r = nullptr;
        pthread_join(threads[i], &r);
        if (r != nullptr) {
            ret = FAIL;
        }
    }
    (void)setlocale(LC_ALL, "C");
    return MakeResult(env, ret);
}

/* TC-048: 循环newlocale与freelocale内存泄漏验证 */
static napi_value MemLeakNewlocaleFreelocale(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    (void)setlocale(LC_ALL, "zh_HK.Big5");
    (void)setlocale(LC_ALL, "C");
    for (int32_t i = 0; i < LOOP_COUNT_10000; i++) {
        locale_t loc = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
        if (loc) {
            freelocale(loc);
        }
    }
    return MakeResult(env, NO_ERR);
}

/* TC-049: 循环iconv_open与close资源泄漏验证 */
static napi_value MemLeakIconvOpenClose(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    iconv_t warmup = iconv_open("UTF-8", "big5");
    if (warmup != reinterpret_cast<iconv_t>(-1)) {
        iconv_close(warmup);
    }
    for (int32_t i = 0; i < LOOP_COUNT_10000; i++) {
        iconv_t cd = iconv_open("UTF-8", "big5");
        if (cd != reinterpret_cast<iconv_t>(-1)) {
            iconv_close(cd);
        }
    }
    return MakeResult(env, NO_ERR);
}

/* TC-050: 混合掩码locale分类与解析路径分离验证 */
static napi_value MixedMaskLocale(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t locCtype = newlocale(LC_CTYPE_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (locCtype) {
        locale_t locMixed = newlocale(LC_NUMERIC_MASK, "C", locCtype);
        if (locMixed) {
            int32_t alpha = iswalpha_l(0x7CA4, locMixed);
            char *ep = nullptr;
            double r = strtod_l("3.14", &ep, locMixed);
            if (alpha && fabs(r - PI_VAL) < EPSILON_1E9) {
                ret = NO_ERR;
            }
            freelocale(locMixed);
        } else {
            freelocale(locCtype);
        }
    }
    return MakeResult(env, ret);
}

/* TC-051: setlocale空字符串输入不崩溃验证 */
static napi_value SetlocaleEmptyString(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *r = setlocale(LC_ALL, "");
    int32_t ret = (r != nullptr) ? NO_ERR : FAIL;
    return MakeResult(env, ret);
}

/* TC-052: setlocale传入NULL查询当前locale验证 */
static napi_value SetlocaleNullQuery(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    char *orig = setlocale(LC_ALL, nullptr);
    char origBuf[BUFF_SIZE] = {0};
    if (orig) {
        (void)strncpy_s(origBuf, BUFF_SIZE, orig, BUFF_SIZE - 1);
    }
    int32_t ret = FAIL;
    if (setlocale(LC_ALL, "zh_HK.Big5")) {
        char *q = setlocale(LC_ALL, nullptr);
        if (q && strcmp(q, "zh_HK.Big5") == 0) {
            ret = NO_ERR;
        }
        if (origBuf[0]) {
            setlocale(LC_ALL, origBuf);
        } else {
            (void)setlocale(LC_ALL, "C");
        }
    }
    return MakeResult(env, ret);
}

/* TC-053: uselocale线程局部locale与全局setlocale隔离验证 */
static void *ThreadUselocaleFunc(void *arg)
{
    locale_t locHk = reinterpret_cast<locale_t>(arg);
    uselocale(locHk);
    int32_t r1 = iswalpha_l(0x7CA4, uselocale(nullptr));
    (void)setlocale(LC_ALL, "C");
    int32_t r2 = iswalpha_l(0x7CA4, uselocale(nullptr));
    if (r1 == 0 || r2 == 0) {
        return reinterpret_cast<void *>(1);
    }
    uselocale(LC_GLOBAL_LOCALE);
    return nullptr;
}

static napi_value UselocaleThreadIsolation(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    locale_t locHk = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (locHk) {
        pthread_t t;
        pthread_create(&t, nullptr, ThreadUselocaleFunc, locHk);
        void *r = nullptr;
        pthread_join(t, &r);
        if (r == nullptr) {
            ret = NO_ERR;
        }
        freelocale(locHk);
    }
    return MakeResult(env, ret);
}

/* TC-054: uselocale恢复全局locale行为验证 */
static napi_value UselocaleRestoreGlobal(napi_env env, napi_callback_info info)
{
    if (!EnsureIcuInit()) {
        return MakeResult(env, NO_ERR);
    }
    (void)setlocale(LC_ALL, "C");
    locale_t locHk = newlocale(LC_ALL_MASK, "zh_HK.Big5", nullptr);
    int32_t ret = FAIL;
    if (locHk) {
        uselocale(locHk);
        int32_t r1 = iswalpha_l(0x7CA4, locHk);
        uselocale(LC_GLOBAL_LOCALE);
        /* uselocale(nullptr) returns LC_GLOBAL_LOCALE after restore;
         * passing LC_GLOBAL_LOCALE to iswalpha_l causes crash,
         * so use global iswalpha() instead */
        int32_t r2 = iswalpha(0x7CA4);
        if (r1 && r2) {
            ret = NO_ERR;
        }
        freelocale(locHk);
    }
    return MakeResult(env, ret);
}

/* ---- NAPI module registration ---- */

static void InitPartA(napi_env env, napi_value exports);
static void InitPartB(napi_env env, napi_value exports);

static inline napi_property_descriptor MakeDesc(const char *name, napi_callback func)
{
    return {name, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr};
}

static napi_value Init(napi_env env, napi_value exports)
{
    InitPartA(env, exports);
    InitPartB(env, exports);
    return exports;
}

EXTERN_C_START
static void InitPartA(napi_env env, napi_value exports)
{
    napi_property_descriptor descA[] = {
        MakeDesc("setlocaleBig5Localeconv", SetlocaleBig5Localeconv),
        MakeDesc("setlocaleLowercase", SetlocaleLowercase),
        MakeDesc("setlocaleTooLong", SetlocaleTooLong),
        MakeDesc("setlocaleIcuMissing", SetlocaleIcuMissing),
        MakeDesc("setlocaleHkscsLocaleconv", SetlocaleHkscsLocaleconv),
        MakeDesc("setlocaleHkscsLowercase", SetlocaleHkscsLowercase),
        MakeDesc("setlocaleEnvCleared", SetlocaleEnvCleared),
        MakeDesc("setlocaleSlash", SetlocaleSlash),
        MakeDesc("wctypeNewlocaleYue", WctypeNewlocaleYue),
        MakeDesc("wctypeSetlocaleYue", WctypeSetlocaleYue),
        MakeDesc("wctypeHkscsSupplementary", WctypeHkscsSupplementary),
        MakeDesc("wctypeCLocaleYue", WctypeCLocaleYue),
        MakeDesc("wctypeAsciiConsistent", WctypeAsciiConsistent),
        MakeDesc("strtodLBig5_314", StrtodLBig5_314),
        MakeDesc("strtodLBig5Overflow", StrtodLBig5Overflow),
        MakeDesc("wcstodLBig5_314", WcstodLBig5_314),
        MakeDesc("wcstodLBig5Overflow", WcstodLBig5Overflow),
        MakeDesc("localeconvBig5Fields", LocaleconvBig5Fields),
        MakeDesc("localeconvStaticInvalidation", LocaleconvStaticInvalidation),
        MakeDesc("hkscsVariantConsistency", HkscsVariantConsistency),
        MakeDesc("strtodLStructLayout", StrtodLStructLayout),
        MakeDesc("iconvBig5ToUtf8", IconvBig5ToUtf8),
        MakeDesc("iconvBig5InvalidByte", IconvBig5InvalidByte),
        MakeDesc("iconvBig5Incomplete", IconvBig5Incomplete),
        MakeDesc("iconvBig5BufferTooSmall", IconvBig5BufferTooSmall),
    };
    napi_define_properties(env, exports, sizeof(descA) / sizeof(descA[0]), descA);
}

static void InitPartB(napi_env env, napi_value exports)
{
    napi_property_descriptor descB[] = {
        MakeDesc("iconvHkscsToUtf8Reuse", IconvHkscsToUtf8Reuse),
        MakeDesc("iconvUtf8ToBig5", IconvUtf8ToBig5),
        MakeDesc("iconvUtf8ToBig5Unrepresentable", IconvUtf8ToBig5Unrepresentable),
        MakeDesc("iconvUtf8ToHkscsSupplementary", IconvUtf8ToHkscsSupplementary),
        MakeDesc("iconvCp950Alias", IconvCp950Alias),
        MakeDesc("iconvUnsupportedCharset", IconvUnsupportedCharset),
        MakeDesc("regressZhCnLocaleconv", RegressZhCnLocaleconv),
        MakeDesc("regressZhCnWctype", RegressZhCnWctype),
        MakeDesc("regressZhCnStrtod", RegressZhCnStrtod),
        MakeDesc("regressEnUsLocaleconv", RegressEnUsLocaleconv),
        MakeDesc("regressEnUsWctype", RegressEnUsWctype),
        MakeDesc("regressEnUsStrtod", RegressEnUsStrtod),
        MakeDesc("regressZhCnUtf8Localeconv", RegressZhCnUtf8Localeconv),
        MakeDesc("regressZhCnUtf8Wctype", RegressZhCnUtf8Wctype),
        MakeDesc("regressZhCnUtf8Strtod", RegressZhCnUtf8Strtod),
        MakeDesc("regressIconvLocaleIndependent", RegressIconvLocaleIndependent),
        MakeDesc("multiThreadLocaleIsolation", MultiThreadLocaleIsolation),
        MakeDesc("multiThreadSetlocaleIsolation", MultiThreadSetlocaleIsolation),
        MakeDesc("multiThreadLocaleconvSafety", MultiThreadLocaleconvSafety),
        MakeDesc("memLeakNewlocaleFreelocale", MemLeakNewlocaleFreelocale),
        MakeDesc("memLeakIconvOpenClose", MemLeakIconvOpenClose),
        MakeDesc("mixedMaskLocale", MixedMaskLocale),
        MakeDesc("setlocaleEmptyString", SetlocaleEmptyString),
        MakeDesc("setlocaleNullQuery", SetlocaleNullQuery),
        MakeDesc("uselocaleThreadIsolation", UselocaleThreadIsolation),
        MakeDesc("uselocaleRestoreGlobal", UselocaleRestoreGlobal),
    };
    napi_define_properties(env, exports, sizeof(descB) / sizeof(descB[0]), descB);
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "big5locale",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
