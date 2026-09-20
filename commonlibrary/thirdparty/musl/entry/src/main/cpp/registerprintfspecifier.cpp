/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <atomic>
#include <cerrno>
#include <climits>
#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cwchar>
#include <dlfcn.h>
#include <pthread.h>
#include <sys/wait.h>
#include <unistd.h>
#include <securec.h>

#undef snprintf_s
#undef swprintf_s
#define snprintf_s(strDest, destMax, count, ...) snprintf(strDest, destMax, __VA_ARGS__)
#define swprintf_s(strDest, destMax, ...) swprintf(strDest, destMax, __VA_ARGS__)

using std::atomic_int;
using std::atomic_fetch_add;
using std::atomic_load;
using std::atomic_store;
#define THREAD_COUNT_4 4
#define THREAD_COUNT_8 8
#define LOOP_COUNT_10 10
#define LOOP_COUNT_100 100
#define LOOP_COUNT_1000 1000
#define LOOP_COUNT_10000 10000
#define MAX_TYPE_COUNT_248 248
#define MAX_IDS_COUNT_40 40
#define TEST_VALUE_42 42
#define TEST_VALUE_123 123
#define TEST_VALUE_3 3
#define TEST_VALUE_5 5
#define TEST_VALUE_7 7
#define TEST_VALUE_2 2
#define EXPECTED_16 16
#define MODIFIER_MAX_256 256
#define MODIFIER_MAX_255 255
#define MODIFIER_MAX_16 16
#define MODIFIER_BIT_0X8000 0x8000
#define SLEEP_DURATION_10 10
#define TEST_DOUBLE_2_0 2.0
#define TEST_DOUBLE_3_0 3.0
#define TEST_DOUBLE_3_14 3.14
#define EXPECTED_RET_2 2
#define EXPECTED_RET_NEG_1 (-1)
#define EXPECTED_RET_NEG_2 (-2)
#define ARGINFO_MAX_32 32
#define TEST_VALUE_NEG_5 (-5)
#define SPEC_CHAR_RANGE_20 20
#define TEST_DOUBLE_4_0 4.0
#define THREAD_ARRAY_SIZE_4 4
#define WSTRING_SIZE_32 32
#define WSTRING_SIZE_64 64
#define ARGINFO_MAX_2 2
#define ARGINFO_MAX_3 3
#define WS_ARRAY_SIZE_257 257

struct PrintfInfo {
    int prec;
    int width;
    wchar_t spec;
    unsigned int isLongDouble : 1;
    unsigned int isShort : 1;
    unsigned int isLong : 1;
    unsigned int alt : 1;
    unsigned int space : 1;
    unsigned int left : 1;
    unsigned int showsign : 1;
    unsigned int group : 1;
    unsigned int extra : 1;
    unsigned int isChar : 1;
    unsigned int wide : 1;
    unsigned int i18n : 1;
    unsigned int isBinary128 : 1;
    unsigned int reservedPad : 4;
    unsigned short user;
    wchar_t pad;
};
typedef int PrintfFunction(FILE *, const struct PrintfInfo *, const void *const *);
typedef int PrintfArginfoSizeFunction(const struct PrintfInfo *, size_t, int *, int *);
typedef void PrintfVaArgFunction(void *, va_list *);
#define PA_INT 0
#define PA_CHAR 1
#define PA_STRING 2
#define PA_POINTER 3
#define PA_FLOAT 4
#define PA_DOUBLE 5
#define PA_LAST 6
#define PA_FLAG_LONG_LONG (1 << 8)
#define PA_FLAG_LONG (1 << 9)
#define PA_FLAG_SHORT (1 << 10)
#define PA_FLAG_PTR (1 << 11)

typedef int (*RegSpecifierFnT)(int, PrintfFunction, PrintfArginfoSizeFunction);
typedef int (*RegModifierFnT)(const wchar_t *);
typedef int (*RegTypeFnT)(PrintfVaArgFunction);
static RegSpecifierFnT g_regSpecifier = nullptr;
static RegModifierFnT g_regModifier = nullptr;
static RegTypeFnT g_regType = nullptr;
static void LoadFunctions(void)
{
    if (!g_regSpecifier) {
        g_regSpecifier = (RegSpecifierFnT)dlsym(RTLD_DEFAULT,
            "register_printf_specifier");
    }
    if (!g_regModifier) {
        g_regModifier = (RegModifierFnT)dlsym(RTLD_DEFAULT, "register_printf_modifier");
    }
    if (!g_regType) {
        g_regType = (RegTypeFnT)dlsym(RTLD_DEFAULT, "register_printf_type");
    }
}
static int MyFunc(FILE *s, const struct PrintfInfo *info, const void *const *args)
{
    return 0;
}

static int MyArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    return 0;
}

static int LongPrintf(FILE *s, const struct PrintfInfo *info, const void *const *args)
{
    const long *lp = *reinterpret_cast<const long *const *>(args[0]);
    return fprintf(s, "%ld", *lp);
}

static int LongArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    if (n > 0) {
        at[0] = PA_POINTER;
        sz[0] = sizeof(long *);
    }
    return 1;
}

static int WlongPrintf(FILE *s, const struct PrintfInfo *info, const void *const *args)
{
    const long *lp = *reinterpret_cast<const long *const *>(args[0]);
    if (info->wide) {
        return fwprintf(s, L"%ld", *lp);
    }
    return fprintf(s, "%ld", *lp);
}

static int FuncA(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    fputc('A', s);
    return 1;
}

static int FuncB(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    fputc('B', s);
    return 1;
}

static int FuncM2(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    return EXPECTED_RET_NEG_2;
}

static int FuncM1(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    return EXPECTED_RET_NEG_1;
}

static int Func0(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    return 0;
}

static int Arginfo0(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    return 0;
}

static int Arginfo32(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    size_t k = n < ARGINFO_MAX_32 ? n : ARGINFO_MAX_32;
    for (size_t i = 0; i < k; i++) {
        at[i] = PA_INT;
        sz[i] = sizeof(int);
    }
    return ARGINFO_MAX_32;
}

static char g_seenPad;

static int g_seenLeft;

static int PadFunc(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    g_seenPad = static_cast<char>(info->pad);
    g_seenLeft = static_cast<int>(info->left);
    fputc('.', s);
    return 1;
}

static int g_seenPrec;

static int PrecFunc(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    g_seenPrec = info->prec;
    fputc('.', s);
    return 1;
}

static int g_results[4];

static int g_specs[4] = {'a', 'b', 'c', 'd'};

static void *RegThr(void *arg)
{
    int i = *reinterpret_cast<int *>(arg);
    g_results[i] = g_regSpecifier(g_specs[i], MyFunc, Arginfo0);
    return nullptr;
}

static atomic_int g_failCnt;

static void *RegSame(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        if (g_regSpecifier('Z', MyFunc, Arginfo0) != 0) {
            atomic_fetch_add(&g_failCnt, 1);
        }
    }
    return nullptr;
}

static pthread_barrier_t g_barrier;

static atomic_int g_okCnt;

static void *FirstReg(void *arg)
{
    pthread_barrier_wait(&g_barrier);
    if (g_regSpecifier('A', MyFunc, Arginfo0) == 0) {
        atomic_fetch_add(&g_okCnt, 1);
    }
    return nullptr;
}

static atomic_int g_stopFlag;

static atomic_int g_outErr;

static void *OutThr(void *arg)
{
    while (!atomic_load(&g_stopFlag)) {
        char b[16];
        long v = 1;
        if (snprintf_s(b, sizeof(b), sizeof(b) - 1, "%B", &v) < 0) {
            atomic_fetch_add(&g_outErr, 1);
        }
    }
    return nullptr;
}

static void *RegThr2(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_1000; i++) {
        g_regSpecifier('B', MyFunc, Arginfo0);
        g_regSpecifier('C', MyFunc, Arginfo0);
    }
    atomic_store(&g_stopFlag, 1);
    return nullptr;
}

static atomic_int g_mismatch;

static void *OutReg(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_1000; i++) {
        char b[16];
        long v = TEST_VALUE_42;
        if (snprintf_s(b, sizeof(b), sizeof(b) - 1, "%B", &v) < 0 || strcmp(b, "42") != 0) {
            atomic_fetch_add(&g_mismatch, 1);
        }
    }
    return nullptr;
}

static atomic_int g_stop2;

static void *Stress(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    while (!atomic_load(&g_stop2)) {
        char sp = 'A' + (idx % SPEC_CHAR_RANGE_20);
        g_regSpecifier(sp, MyFunc, Arginfo0);
        char b[16];
                int snRet0 = snprintf_s(b, sizeof(b), sizeof(b) - 1, "%c", sp);
                if (snRet0 < 0) { continue; }
    }
    return nullptr;
}

static atomic_int g_errnoErr;

static void *ErrnoThr(void *arg)
{
    errno = 0;
    g_regSpecifier(-1, MyFunc, Arginfo0);
    if (errno != EINVAL) {
        atomic_fetch_add(&g_errnoErr, 1);
    }
    return nullptr;
}

static napi_value RegPrintfSpecifier_0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regSpecifier('B', MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regSpecifier('Z', MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long val = TEST_VALUE_42;
        char buf[64];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B", &val);
        if (ret < 0) {
            _exit(1);
        } else if (ret >= sizeof(buf)) {
            _exit(1);
        }
        if (strcmp((buf), ("42")) != 0) {
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long val = TEST_VALUE_42;
        char tf[128];
        int snRet2 = snprintf_s(tf, sizeof(tf), sizeof(tf) - 1, "/data/local/tmp/t_%d", getpid());
        if (snRet2 < 0) {
            _exit(1);
        } else if (snRet2 >= sizeof(tf)) {
            _exit(1);
        }
        FILE *fp = fopen(tf, "w");
        if (!(fp != nullptr)) {
            _exit(0);
        }
        int ret = fprintf(fp, "%B", &val);
        (void)fclose(fp);
        if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_2)) {
            _exit(0);
        }
        fp = fopen(tf, "r");
        char buf[64] = {0};
        (void)fread(buf, 1, sizeof(buf) - 1, fp);
        (void)fclose(fp);
        (void)remove(tf);
        if (strcmp((buf), ("42")) != 0) {
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long val = TEST_VALUE_42;
        char *str = nullptr;
        int ret = asprintf(&str, "[[%B]]", &val);
        if (ret < 0) {
            _exit(1);
        }
        if (strcmp((str), ("[[42]]")) != 0) {
            _exit(1);
        }
        free(str);
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', WlongPrintf, LongArginfo);
        long val = TEST_VALUE_42;
        wchar_t wb[64];
        int ret = swprintf_s(wb, WSTRING_SIZE_64, L"%B", &val);
        if (ret < 0) {
            _exit(1);
        } else if (ret >= WSTRING_SIZE_64) {
            _exit(1);
        }
        if (!(wcscmp(wb, L"42") == 0)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier(-1, MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_0800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier(256, MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_0900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier(INT_MIN, MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier(INT_MAX, MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier('D', nullptr, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier('E', MyFunc, nullptr);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regSpecifier('F', nullptr, nullptr);
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regSpecifier(0, MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regSpecifier(255, MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('C', MyFunc, MyArginfo);
    int ret = g_regSpecifier('C', MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('C', FuncA, MyArginfo);
        g_regSpecifier('C', FuncB, MyArginfo);
        char buf[8];
        int snRet4 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%C");
        if (snRet4 < 0) {
            _exit(1);
        } else if (snRet4 >= sizeof(buf)) {
            _exit(1);
        }
        if (strcmp((buf), ("B")) != 0) {
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_1800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < LOOP_COUNT_10; i++) {
        int ret = g_regSpecifier('G', MyFunc, MyArginfo);
        if (static_cast<int>(ret) != static_cast<int>(0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_1900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regSpecifier('d', MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    char buf[16];
    int snRet6 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%d", TEST_VALUE_123);
    if (snRet6 < 0) {
        napi_create_int32(env, 1, &result);
        return result;
    } else if (snRet6 >= sizeof(buf)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (strcmp((buf), ("123")) != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_2000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regSpecifier('s', MyFunc, MyArginfo);
    if (static_cast<int>(ret) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    char buf[16];
    int snRet8 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%s", "abc");
    if (snRet8 < 0) {
        napi_create_int32(env, 1, &result);
        return result;
    } else if (snRet8 >= sizeof(buf)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (strcmp((buf), ("abc")) != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_2100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('f', MyFunc, MyArginfo);
    char buf[32];
    int snRet10 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%f", 1.0);
    if (snRet10 < 0) {
        napi_create_int32(env, 1, &result);
        return result;
    } else if (snRet10 >= sizeof(buf)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (strcmp((buf), ("1.000000")) != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_2200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    char buf[16];
    errno = 0;
    int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%Q", 1);
    if (ret < 0 && static_cast<int>(errno) == static_cast<int>(EINVAL)) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_2300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    char buf[16];
    for (int i = 0; i < LOOP_COUNT_10000; i++) {
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%d", 1);
        if (ret < 0) {
            napi_create_int32(env, 1, &result);
            return result;
        } else if (ret >= sizeof(buf)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_2400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', FuncM2, MyArginfo);
        char buf[16];
        errno = 0;
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B");
        if (ret < 0) {
            if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
                _exit(1);
            }
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_2500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', FuncM1, MyArginfo);
        char buf[16];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B");
        if (ret < 0) {
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_2600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', Func0, MyArginfo);
        char buf[16] = {0};
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B");
        if (ret < 0) {
            _exit(1);
        } else if (ret >= sizeof(buf)) {
            _exit(1);
        }
        if (strcmp((buf), ("")) != 0) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_2700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', MyFunc, Arginfo0);
        char buf[16];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B");
        if (ret < 0) {
            _exit(1);
        } else if (ret >= sizeof(buf)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_2800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('X', MyFunc, Arginfo32);
        char buf[16];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%X",
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
            17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32);
        if (ret < 0) {
            _exit(1);
        } else if (ret >= sizeof(buf)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_2900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', PadFunc, Arginfo0);
        char buf[16];
        int snRet12 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%0-B", TEST_VALUE_123);
        if (snRet12 < 0) {
            _exit(1);
        } else if (snRet12 >= sizeof(buf)) {
            _exit(1);
        }
        if (static_cast<int>(g_seenPad) != static_cast<int>(' ')) {
            _exit(0);
        }
        if (static_cast<int>(g_seenLeft) != static_cast<int>(1)) {
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_3000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', PadFunc, Arginfo0);
        char buf[16];
        int snRet14 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%0B", TEST_VALUE_123);
        if (snRet14 < 0) {
            _exit(1);
        } else if (snRet14 >= sizeof(buf)) {
            _exit(1);
        }
        if (static_cast<int>(g_seenPad) != static_cast<int>('0')) {
            _exit(0);
        }
        if (static_cast<int>(g_seenLeft) != static_cast<int>(0)) {
            _exit(0);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_3100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', PrecFunc, Arginfo0);
        char buf[16];
        int snRet16 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%.*B", TEST_VALUE_NEG_5, TEST_VALUE_123);
        if (snRet16 < 0) {
            _exit(1);
        } else if (snRet16 >= sizeof(buf)) {
            _exit(1);
        }
        if (static_cast<int>(g_seenPrec) != static_cast<int>(EXPECTED_RET_NEG_1)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_3200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', PrecFunc, Arginfo0);
        char buf[16];
        int snRet18 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%.3B", TEST_VALUE_123);
        if (snRet18 < 0) {
            _exit(1);
        } else if (snRet18 >= sizeof(buf)) {
            _exit(1);
        }
        if (static_cast<int>(g_seenPrec) != static_cast<int>(ARGINFO_MAX_3)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_3300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', PrecFunc, Arginfo0);
        char buf[16];
        int snRet20 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B", TEST_VALUE_123);
        if (snRet20 < 0) {
            _exit(1);
        } else if (snRet20 >= sizeof(buf)) {
            _exit(1);
        }
        if (static_cast<int>(g_seenPrec) != static_cast<int>(EXPECTED_RET_NEG_1)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_3400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('B', MyFunc, MyArginfo);
    char buf[64];
    int snRet22 = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%d %s %f", 1, "a", 1.0);
    if (snRet22 < 0) {
        napi_create_int32(env, 1, &result);
        return result;
    } else if (snRet22 >= sizeof(buf)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (strcmp((buf), ("1 a 1.000000")) != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_3500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', MyFunc, Arginfo0);
        g_regSpecifier('C', MyFunc, Arginfo0);
        g_regSpecifier('D', MyFunc, Arginfo0);
        char buf[32];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B %C %D");
        if (ret < 0) {
            _exit(1);
        } else if (ret >= sizeof(buf)) {
            _exit(1);
        }
        _exit(0);
    } else if (sPid > 0) {
        int sStatus;
        (void)waitpid(sPid, &sStatus, 0);
        if (WIFSIGNALED(sStatus) || (WIFEXITED(sStatus) && WEXITSTATUS(sStatus) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value RegPrintfSpecifier_3600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    int idx[4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        idx[i] = i;
        pthread_create(&t[i], nullptr, RegThr, &idx[i]);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        if (g_results[i] != 0) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_3700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, RegSame, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    if (static_cast<int>(atomic_load(&g_failCnt)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_3800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_barrier_init(&g_barrier, nullptr, THREAD_COUNT_4);
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, FirstReg, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    pthread_barrier_destroy(&g_barrier);
    if (static_cast<int>(atomic_load(&g_okCnt)) != static_cast<int>(THREAD_COUNT_4)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_3900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('B', MyFunc, Arginfo0);
        pthread_t a;
        pthread_t b;
    pthread_create(&a, nullptr, OutThr, nullptr);
    pthread_create(&b, nullptr, RegThr2, nullptr);
    pthread_join(b, nullptr);
    pthread_join(a, nullptr);
    if (static_cast<int>(atomic_load(&g_outErr)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_4000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('B', LongPrintf, LongArginfo);
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, OutReg, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    if (static_cast<int>(atomic_load(&g_mismatch)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_4100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[8];
    int idx[8];
    for (int i = 0; i < THREAD_COUNT_8; i++) {
        idx[i] = i;
        pthread_create(&t[i], nullptr, Stress, &idx[i]);
    }
    sleep(SLEEP_DURATION_10);
    atomic_store(&g_stop2, 1);
    for (int i = 0; i < THREAD_COUNT_8; i++) {
        pthread_join(t[i], nullptr);
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfSpecifier_4200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, ErrnoThr, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    if (static_cast<int>(atomic_load(&g_errnoErr)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"RegPrintfSpecifier_0100", nullptr, RegPrintfSpecifier_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0200", nullptr, RegPrintfSpecifier_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0300", nullptr, RegPrintfSpecifier_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0400", nullptr, RegPrintfSpecifier_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0500", nullptr, RegPrintfSpecifier_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0600", nullptr, RegPrintfSpecifier_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0700", nullptr, RegPrintfSpecifier_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0800", nullptr, RegPrintfSpecifier_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_0900", nullptr, RegPrintfSpecifier_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1000", nullptr, RegPrintfSpecifier_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1100", nullptr, RegPrintfSpecifier_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1200", nullptr, RegPrintfSpecifier_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1300", nullptr, RegPrintfSpecifier_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1400", nullptr, RegPrintfSpecifier_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1500", nullptr, RegPrintfSpecifier_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1600", nullptr, RegPrintfSpecifier_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1700", nullptr, RegPrintfSpecifier_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1800", nullptr, RegPrintfSpecifier_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_1900", nullptr, RegPrintfSpecifier_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2000", nullptr, RegPrintfSpecifier_2000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2100", nullptr, RegPrintfSpecifier_2100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2200", nullptr, RegPrintfSpecifier_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2300", nullptr, RegPrintfSpecifier_2300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2400", nullptr, RegPrintfSpecifier_2400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2500", nullptr, RegPrintfSpecifier_2500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2600", nullptr, RegPrintfSpecifier_2600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2700", nullptr, RegPrintfSpecifier_2700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2800", nullptr, RegPrintfSpecifier_2800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_2900", nullptr, RegPrintfSpecifier_2900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3000", nullptr, RegPrintfSpecifier_3000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3100", nullptr, RegPrintfSpecifier_3100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3200", nullptr, RegPrintfSpecifier_3200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3300", nullptr, RegPrintfSpecifier_3300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3400", nullptr, RegPrintfSpecifier_3400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3500", nullptr, RegPrintfSpecifier_3500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3600", nullptr, RegPrintfSpecifier_3600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3700", nullptr, RegPrintfSpecifier_3700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3800", nullptr, RegPrintfSpecifier_3800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_3900", nullptr, RegPrintfSpecifier_3900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_4000", nullptr, RegPrintfSpecifier_4000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_4100", nullptr, RegPrintfSpecifier_4100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfSpecifier_4200", nullptr, RegPrintfSpecifier_4200, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "registerprintfspecifier",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
