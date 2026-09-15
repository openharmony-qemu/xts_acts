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
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <cwchar>
#include <dlfcn.h>
#include <pthread.h>
#include <sys/wait.h>
#include <unistd.h>

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
#define TEST_VALUE_20 20
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
#define TEST_DOUBLE_4_0 4.0
#define EXPECTED_RET_2 2
#define ARGINFO_MAX_32 32
#define EXPECTED_RET_NEG_1 (-1)
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
        g_regSpecifier = (RegSpecifierFnT)dlsym(RTLD_DEFAULT, "register_printf_specifier");
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
    (void)s;
    (void)info;
    (void)args;
    return 0;
}

static int Arginfo0(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    (void)info;
    (void)n;
    (void)at;
    (void)sz;
    return 0;
}

static int LongPrintf(FILE *s, const struct PrintfInfo *info, const void *const *args)
{
    (void)info;
    const long *lp = *reinterpret_cast<const long *const *>(args[0]);
    return fprintf(s, "%ld", *lp);
}

static int LongArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    (void)info;
    if (n > 0) {
        at[0] = PA_POINTER;
        sz[0] = sizeof(long *);
    }
    return 1;
}

static void MyVa(void *mem, va_list *ap)
{
    long *p = reinterpret_cast<long *>(mem);
    *p = va_arg(*ap, long);
}

struct Pair {
    long i;
    double d;
};

static int g_pairType;

static void PairVa(void *mem, va_list *ap)
{
    struct Pair *p = reinterpret_cast<struct Pair *>(mem);
    p->i = va_arg(*ap, long);
    p->d = va_arg(*ap, double);
}

static int PairPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    (void)info;
    const struct Pair *p = *reinterpret_cast<const struct Pair *const *>(a[0]);
    return fprintf(s, "(%ld, %f)", p->i, p->d);
}

static int PairArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    (void)info;
    if (n > 0) {
        at[0] = g_pairType;
        sz[0] = sizeof(struct Pair);
    }
    return 1;
}

static int FuncA(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    (void)i;
    (void)a;
    return fputc('A', s);
}

static int FuncB(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    (void)i;
    (void)a;
    return fputc('B', s);
}

static int g_seenUser;

static int ModPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    g_seenUser = info->user;
    const int *ip = *static_cast<const int *const *>(a[0]);
    return fprintf(s, "%d", *ip);
}

static int ModArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    if (n > 0) {
        at[0] = PA_POINTER;
        sz[0] = sizeof(int *);
    }
    return 1;
}

static int g_bits[16];

static atomic_int g_bitIdx;

static void *ModThr(void *arg)
{
    int base = *reinterpret_cast<int *>(arg);
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        wchar_t ws[3] = {L'A' + base, static_cast<wchar_t>(L'0' + i), 0};
        int b = g_regModifier(ws);
        int k = atomic_fetch_add(&g_bitIdx, 1);
        g_bits[k] = b;
    }
    return nullptr;
}

static pthread_barrier_t g_mbarrier;

static atomic_int g_mok;

static void *FirstMod(void *arg)
{
    pthread_barrier_wait(&g_mbarrier);
    if (g_regModifier(L"M") > 0) {
        atomic_fetch_add(&g_mok, 1);
    }
    return nullptr;
}

static atomic_int g_mSucc;

static void *ModLimit(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        wchar_t ws[3] = {L'Z', static_cast<wchar_t>(L'0' + (i % 10)), 0};
        errno = 0;
        int b = g_regModifier(ws);
        if (b > 0) {
            atomic_fetch_add(&g_mSucc, 1);
        }
    }
    return nullptr;
}

static int Arginfo3(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    size_t k = n < TEST_VALUE_3 ? n : TEST_VALUE_3;
    for (size_t i = 0; i < k; i++) {
        at[i] = PA_INT;
        sz[i] = sizeof(int);
    }
    return TEST_VALUE_3;
}

static int Arginfo2(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    size_t k = n < TEST_VALUE_2 ? n : TEST_VALUE_2;
    for (size_t i = 0; i < k; i++) {
        at[i] = PA_INT;
        sz[i] = sizeof(int);
    }
    return TEST_VALUE_2;
}

static int MyFunc2(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    return fputc('X', s);
}

static int g_seenB, g_seenC;

static int Hb(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    g_seenB = i->user;
    return fputc('b', s);
}

static int Hc(FILE *s, const struct PrintfInfo *i, const void *const *a)
{
    g_seenC = i->user;
    return fputc('c', s);
}

static atomic_int g_stop3;

static atomic_int g_oerr;

static void *OThr(void *arg)
{
    while (!atomic_load(&g_stop3)) {
        char b[16];
        long v = 1;
        if (snprintf_s(b, sizeof(b), sizeof(b) - 1, "%B", &v) < 0) {
            atomic_fetch_add(&g_oerr, 1);
        }
    }
    return nullptr;
}

static void *RThr(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_1000; i++) {
        g_regSpecifier('B', LongPrintf, LongArginfo);
        g_regSpecifier('C', LongPrintf, LongArginfo);
    }
    atomic_store(&g_stop3, 1);
    return nullptr;
}

static void *SThr(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        g_regSpecifier('A' + (i % TEST_VALUE_20), MyFunc, Arginfo0);
    }
    return nullptr;
}

static void *TThr(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        g_regType(MyVa);
    }
    return nullptr;
}

static void *MThr(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        wchar_t ws[3] = {L'X', static_cast<wchar_t>(L'0' + (i % 10)), 0};
        g_regModifier(ws);
    }
    return nullptr;
}

static atomic_int g_eerr;

static void *EThr(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    errno = 0;
    if (idx % TEST_VALUE_2 == 0) {
        g_regSpecifier(-1, MyFunc, Arginfo0);
    } else {
        g_regType(nullptr);
    }
    if (errno != EINVAL) {
        atomic_fetch_add(&g_eerr, 1);
    }
    return nullptr;
}

static atomic_int g_stop4;

static void *Stress2(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    while (!atomic_load(&g_stop4)) {
        g_regSpecifier('A' + (idx % TEST_VALUE_20), MyFunc, Arginfo0);
        char b[16];
        long v = idx;
        (void)snprintf_s(b, sizeof(b), sizeof(b) - 1, "%B", &v);
        wchar_t ws[3] = {L'M', static_cast<wchar_t>(L'0' + (idx % 10)), 0};
        g_regModifier(ws);
    }
    return nullptr;
}

static napi_value RegPrintfModifier_0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regModifier(L"I");
    if (static_cast<int>(ret) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (!((ret & (ret - 1)) == 0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regModifier(L"I32");
    if (static_cast<int>(ret) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (!((ret & (ret - 1)) == 0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        int bit = g_regModifier(L"I32");
        if (bit < 0) {
            _exit(0);
        }
        g_regSpecifier('R', ModPrintf, ModArginfo);
        int v = TEST_VALUE_42;
        char buf[32];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%I32R", &v);
        if (static_cast<int>(g_seenUser) != static_cast<int>(bit)) {
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

static napi_value RegPrintfModifier_0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regModifier(L"I32");
        char buf[32];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%I32d", TEST_VALUE_42);
        if (strcmp((buf), ("42")) != 0) {
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

static napi_value RegPrintfModifier_0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regModifier(L"I32");
        g_regSpecifier('R', ModPrintf, ModArginfo);
        int v = TEST_VALUE_42;
        wchar_t wb[ARGINFO_MAX_32];
        int ret = swprintf(wb, ARGINFO_MAX_32, L"%I32R", &v);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfModifier_0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regModifier(L"");
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

static napi_value RegPrintfModifier_0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regModifier(nullptr);
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

static napi_value RegPrintfModifier_0800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    wchar_t ws[2] = {0x100, 0};
    errno = 0;
    int ret = g_regModifier(ws);
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

static napi_value RegPrintfModifier_0900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    wchar_t ws[2] = {0xFFFF, 0};
    errno = 0;
    int ret = g_regModifier(ws);
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

static napi_value RegPrintfModifier_1000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    wchar_t ws[256];
    for (int i = 0; i < MODIFIER_MAX_255; i++) {
        ws[i] = L'A';
    }
    ws[MODIFIER_MAX_255] = 0;
    int ret = g_regModifier(ws);
    if (static_cast<int>(ret) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    wchar_t ws[WS_ARRAY_SIZE_257];
    for (int i = 0; i < MODIFIER_MAX_256; i++) {
        ws[i] = L'A';
    }
    ws[MODIFIER_MAX_256] = 0;
    errno = 0;
    int ret = g_regModifier(ws);
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

static napi_value RegPrintfModifier_1200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    wchar_t ws[2] = {0x01, 0};
    int ret = g_regModifier(ws);
    if (static_cast<int>(ret) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    wchar_t ws[2] = {0xFF, 0};
    int ret = g_regModifier(ws);
    if (static_cast<int>(ret) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int ret = g_regModifier(L"A");
    if (static_cast<int>(ret) <= static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int last = 0;
    for (int i = 0; i < MODIFIER_MAX_16; i++) {
        wchar_t ws[3] = {L'Z', static_cast<wchar_t>(L'0' + i), 0};
        last = g_regModifier(ws);
    }
    if (static_cast<int>(last) < static_cast<int>(0)) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < MODIFIER_MAX_16; i++) {
        wchar_t ws[3] = {L'Z', static_cast<wchar_t>(L'0' + i), 0};
        g_regModifier(ws);
    }
    errno = 0;
    int ret = g_regModifier(L"Z");
    if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    if (static_cast<int>(errno) != static_cast<int>(ENOSPC)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < MODIFIER_MAX_16; i++) {
        wchar_t ws[3] = {L'Z', static_cast<wchar_t>(L'0' + i), 0};
        g_regModifier(ws);
        }
    for (int i = 0; i < LOOP_COUNT_10; i++) {
        errno = 0;
        int ret = g_regModifier(L"Q");
        if (static_cast<int>(ret) != static_cast<int>(EXPECTED_RET_NEG_1)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        if (static_cast<int>(errno) != static_cast<int>(ENOSPC)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int b1 = g_regModifier(L"I32");
    int b2 = g_regModifier(L"I32");
    if (b1 <= 0 || b2 <= 0) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    if (b1 > 0 && b2 > 0 && b1 == b2) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_1900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int b1 = g_regModifier(L"I");
    int b2 = g_regModifier(L"I32");
    int b3 = g_regModifier(L"I64");
    if (b1 <= 0 || b2 <= 0 || b3 <= 0) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    if (b1 > 0 && b2 > 0 && b3 > 0 && (b1 == b2 || b2 == b3 || b1 == b3)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_2000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        int b1 = g_regModifier(L"I");
        if (b1 < 0) {
            _exit(0);
        }
        int b2 = g_regModifier(L"I32");
        g_regSpecifier('R', ModPrintf, ModArginfo);
        int v = 7;
        char buf[32];
        g_seenUser = 0;
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%I32R", &v);
        if (static_cast<int>(g_seenUser) != static_cast<int>(b2)) {
            _exit(0);
        }
        if (b1 > 0 && b2 > 0 && b1 == b2) {
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

static napi_value RegPrintfModifier_2100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        int b1 = g_regModifier(L"I");
        g_regModifier(L"I32");
        g_regSpecifier('R', ModPrintf, ModArginfo);
        int v = 7;
        char buf[32];
        g_seenUser = 0;
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%IR", &v);
        if (static_cast<int>(g_seenUser) != static_cast<int>(b1)) {
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

static napi_value RegPrintfModifier_2200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regModifier(L"AB");
        g_regModifier(L"ABC");
        int b4 = g_regModifier(L"ABCD");
        if (b4 < 0) {
            _exit(0);
        }
        g_regSpecifier('R', ModPrintf, ModArginfo);
        int v = 7;
        char buf[32];
        g_seenUser = 0;
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%ABCDR", &v);
        if (static_cast<int>(g_seenUser) != static_cast<int>(b4)) {
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

static napi_value RegPrintfModifier_2300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regModifier(L"I");
        char buf[32];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%ld", 42L);
        if (strcmp((buf), ("42")) != 0) {
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

static napi_value RegPrintfModifier_2400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    char buf[16];
    for (int i = 0; i < LOOP_COUNT_10000; i++) {
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%d", 1);
        if (static_cast<int>(ret) <= static_cast<int>(0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_2500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regModifier(L"I");
    char buf[64];
    (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%ld %hd %lld", 1L, static_cast<short>(TEST_VALUE_2), 3LL);
    if (strcmp((buf), ("1 2 3")) != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_2600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    int idx[THREAD_COUNT_4] = {0, 1, 2, 3};
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, ModThr, &idx[i]);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    int okCount = 0;
    for (int i = 0; i < MODIFIER_MAX_16; i++) {
        if (g_bits[i] > 0) {
            okCount++;
        }
    }
    if (okCount == 0) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_2700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_barrier_init(&g_mbarrier, nullptr, THREAD_COUNT_4);
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, FirstMod, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    pthread_barrier_destroy(&g_mbarrier);
    if (static_cast<int>(atomic_load(&g_mok)) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_2800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, ModLimit, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    if (static_cast<int>(atomic_load(&g_mSucc)) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfModifier_2900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < LOOP_COUNT_10000; i++) {
        wchar_t ws[3] = {L'Z', static_cast<wchar_t>(L'0' + (i % 10)), 0};
        g_regModifier(ws);
        }
    if (!(1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_3000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_pairType = g_regType(PairVa);
        if (g_pairType < 0) {
            _exit(0);
        }
        g_regModifier(L"I32");
        g_regSpecifier('R', PairPrintf, PairArginfo);
        char buf[64];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%I32R", 1L, TEST_DOUBLE_2_0);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
            _exit(1);
        }
        if (strcmp((buf), ("(1, 2.000000)")) != 0) {
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

static napi_value RegPrintfCombined_3100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', MyFunc, Arginfo0);
        g_regSpecifier('C', MyFunc, Arginfo0);
        g_regSpecifier('D', MyFunc, Arginfo0);
        char buf[32];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%B %C %D");
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfCombined_3200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long v = 1;
        char buf[64];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%d %B %s %B", TEST_VALUE_2, &v, "a", &v);
        if (!(strstr(buf, "2") != nullptr)) {
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

static napi_value RegPrintfCombined_3300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regModifier(L"I32");
        char buf[64];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%I32d %ld %hd", 1, 2L, static_cast<short>(TEST_VALUE_3));
        if (!(strstr(buf, "1") != nullptr)) {
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

static napi_value RegPrintfCombined_3400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_pairType = g_regType(PairVa);
        if (g_pairType < 0) {
            _exit(0);
        }
        g_regSpecifier('P', PairPrintf, PairArginfo);
        char buf[64];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%d %P %f", 1, 2L, TEST_DOUBLE_3_0, TEST_DOUBLE_4_0);
        if (!(strstr(buf, "1") != nullptr)) {
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

static napi_value RegPrintfCombined_3500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long v = TEST_VALUE_42;
        char buf[32];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%*B", 5, &v);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfCombined_3600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long v = TEST_VALUE_42;
        char buf[32];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%.*B", 3, &v);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfCombined_3700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('B', LongPrintf, LongArginfo);
        long v = TEST_VALUE_42;
        char buf[32];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%*.*B", 5, 3, &v);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfCombined_3800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regModifier(L"I32");
        g_regSpecifier('R', ModPrintf, ModArginfo);
        int v = TEST_VALUE_42;
        char buf[32];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%*I32R", 5, &v);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfCombined_3900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('X', MyFunc, Arginfo3);
        char buf[16];
        int ret = snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%X", 1, 2, 3);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
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

static napi_value RegPrintfCombined_4000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('X', MyFunc2, Arginfo2);
        char buf[32];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%X %d", 1, TEST_VALUE_2, TEST_VALUE_42);
        if (!(strstr(buf, "42") != nullptr)) {
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

static napi_value RegPrintfCombined_4100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < TEST_VALUE_5; i++) {
        char sp = 'A' + i;
        g_regSpecifier(sp, MyFunc, Arginfo0);
        g_regType(MyVa);
        wchar_t ws[3] = {L'M', static_cast<wchar_t>(L'0' + i), 0};
        g_regModifier(ws);
        }
    if (!(1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_4200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < MODIFIER_MAX_256; i++) {
        g_regSpecifier(i, MyFunc, Arginfo0);
    }
    int id = g_regType(MyVa);
    if (id >= 0 && !(id >= PA_LAST)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_4300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('C', FuncA, Arginfo0);
        char b1[8];
        (void)snprintf_s(b1, sizeof(b1), sizeof(b1) - 1, "%C");
        g_regSpecifier('C', FuncB, Arginfo0);
        char b2[8];
        (void)snprintf_s(b2, sizeof(b2), sizeof(b2) - 1, "%C");
        if (strcmp((b1), ("A")) != 0) {
            _exit(0);
        }
        if (strcmp((b2), ("B")) != 0) {
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

static napi_value RegPrintfCombined_4400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        g_pairType = g_regType(PairVa);
        if (g_pairType < 0) {
            _exit(0);
        }
        g_regSpecifier('P', PairPrintf, PairArginfo);
        char buf[64];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%P", 1L, TEST_DOUBLE_2_0);
        if (strcmp((buf), ("(1, 2.000000)")) != 0) {
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

static napi_value RegPrintfCombined_4500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
            _exit(0);
        }
        int bit = g_regModifier(L"I");
        if (bit < 0) {
            _exit(0);
        }
        g_regSpecifier('B', Hb, Arginfo0);
        g_regSpecifier('C', Hc, Arginfo0);
        char buf[8];
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%IB");
        (void)snprintf_s(buf, sizeof(buf), sizeof(buf) - 1, "%IC");
        if (static_cast<int>(g_seenB) != static_cast<int>(bit)) {
            _exit(0);
        }
        if (static_cast<int>(g_seenC) != static_cast<int>(bit)) {
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

static napi_value RegPrintfCombined_4600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('B', LongPrintf, LongArginfo);
    pid_t pid = fork();
    if (pid == 0) {
        long v = TEST_VALUE_42;
        char b[16];
        (void)snprintf_s(b, sizeof(b), sizeof(b) - 1, "%B", &v);
        if (strcmp(b, "42") != 0) {
            _exit(1);
        }
        _exit(0);
    }
    int st;
    waitpid(pid, &st, 0);
    if (static_cast<int>(WEXITSTATUS(st)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_4700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    g_regSpecifier('B', LongPrintf, LongArginfo);
        pthread_t a;
        pthread_t b;
    pthread_create(&a, nullptr, OThr, nullptr);
    pthread_create(&b, nullptr, RThr, nullptr);
    pthread_join(b, nullptr);
    pthread_join(a, nullptr);
    if (static_cast<int>(atomic_load(&g_oerr)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_4800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
        pthread_t a;
        pthread_t b;
        pthread_t c;
    pthread_create(&a, nullptr, SThr, nullptr);
    pthread_create(&b, nullptr, TThr, nullptr);
    pthread_create(&c, nullptr, MThr, nullptr);
    pthread_join(a, nullptr);
    pthread_join(b, nullptr);
    pthread_join(c, nullptr);
    if (!(1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_4900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    int idx[THREAD_COUNT_4] = {0, 1, 2, 3};
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, EThr, &idx[i]);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    if (static_cast<int>(atomic_load(&g_eerr)) != static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfCombined_5000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regSpecifier == nullptr || g_regType == nullptr || g_regModifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_8];
    int idx[THREAD_COUNT_8];
    for (int i = 0; i < THREAD_COUNT_8; i++) {
        idx[i] = i;
        pthread_create(&t[i], nullptr, Stress2, &idx[i]);
    }
    sleep(SLEEP_DURATION_10);
    atomic_store(&g_stop4, 1);
    for (int i = 0; i < THREAD_COUNT_8; i++) {
        pthread_join(t[i], nullptr);
    }
    napi_create_int32(env, 0, &result);
    return result;
}


static const napi_property_descriptor g_regPrintfModifierDesc[] = {
    {"RegPrintfModifier_0100", nullptr, RegPrintfModifier_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0200", nullptr, RegPrintfModifier_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0300", nullptr, RegPrintfModifier_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0400", nullptr, RegPrintfModifier_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0500", nullptr, RegPrintfModifier_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0600", nullptr, RegPrintfModifier_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0700", nullptr, RegPrintfModifier_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0800", nullptr, RegPrintfModifier_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_0900", nullptr, RegPrintfModifier_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1000", nullptr, RegPrintfModifier_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1100", nullptr, RegPrintfModifier_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1200", nullptr, RegPrintfModifier_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1300", nullptr, RegPrintfModifier_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1400", nullptr, RegPrintfModifier_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1500", nullptr, RegPrintfModifier_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1600", nullptr, RegPrintfModifier_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1700", nullptr, RegPrintfModifier_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1800", nullptr, RegPrintfModifier_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_1900", nullptr, RegPrintfModifier_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2000", nullptr, RegPrintfModifier_2000, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2100", nullptr, RegPrintfModifier_2100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2200", nullptr, RegPrintfModifier_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2300", nullptr, RegPrintfModifier_2300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2400", nullptr, RegPrintfModifier_2400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2500", nullptr, RegPrintfModifier_2500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2600", nullptr, RegPrintfModifier_2600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2700", nullptr, RegPrintfModifier_2700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2800", nullptr, RegPrintfModifier_2800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfModifier_2900", nullptr, RegPrintfModifier_2900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3000", nullptr, RegPrintfCombined_3000, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3100", nullptr, RegPrintfCombined_3100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3200", nullptr, RegPrintfCombined_3200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3300", nullptr, RegPrintfCombined_3300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3400", nullptr, RegPrintfCombined_3400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3500", nullptr, RegPrintfCombined_3500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3600", nullptr, RegPrintfCombined_3600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3700", nullptr, RegPrintfCombined_3700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3800", nullptr, RegPrintfCombined_3800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_3900", nullptr, RegPrintfCombined_3900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4000", nullptr, RegPrintfCombined_4000, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4100", nullptr, RegPrintfCombined_4100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4200", nullptr, RegPrintfCombined_4200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4300", nullptr, RegPrintfCombined_4300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4400", nullptr, RegPrintfCombined_4400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4500", nullptr, RegPrintfCombined_4500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4600", nullptr, RegPrintfCombined_4600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4700", nullptr, RegPrintfCombined_4700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4800", nullptr, RegPrintfCombined_4800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_4900", nullptr, RegPrintfCombined_4900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RegPrintfCombined_5000", nullptr, RegPrintfCombined_5000, nullptr, nullptr, nullptr, napi_default, nullptr}
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_define_properties(env, exports,
        sizeof(g_regPrintfModifierDesc) / sizeof(g_regPrintfModifierDesc[0]), g_regPrintfModifierDesc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "registerprintfmodifier",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
