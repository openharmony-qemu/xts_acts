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
#define MODIFIER_BIT_0X8000 0x8000 // codecheck: noqa G.NAM.03-CPP
#define SLEEP_DURATION_10 10
#define TEST_DOUBLE_2_0 2.0
#define TEST_DOUBLE_3_0 3.0
#define TEST_DOUBLE_3_14 3.14
#define EXPECTED_RET_2 2
#define ARGINFO_MAX_32 32


struct PrintfInfo { // codecheck: noqa G.NAM.03-CPP
    int prec;
    int width;
    wchar_t spec;
    unsigned int isLongDouble : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int isShort : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int isLong : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int alt : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int space : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int left : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int showsign : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int group : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int extra : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int isChar : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int wide : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int i18n : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int isBinary128 : 1; // codecheck: noqa G.NAM.03-CPP
    unsigned int reservedPad : 4; // codecheck: noqa G.NAM.03-CPP
    unsigned short user;
    wchar_t pad;
};
typedef int PrintfFunction(FILE *, const struct PrintfInfo *, const void *const *); // codecheck: noqa G.NAM.03-CPP
// codecheck: noqa G.NAM.03-CPP
typedef int PrintfArginfoSizeFunction(const struct PrintfInfo *, size_t, int *, int *);
typedef void PrintfVaArgFunction(void *, va_list *); // codecheck: noqa G.NAM.03-CPP
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

typedef int (*RegSpecifierFnT)(int, PrintfFunction, PrintfArginfoSizeFunction); // codecheck: noqa G.NAM.03-CPP
typedef int (*RegModifierFnT)(const wchar_t *); // codecheck: noqa G.NAM.03-CPP
typedef int (*RegTypeFnT)(PrintfVaArgFunction); // codecheck: noqa G.NAM.03-CPP
static RegSpecifierFnT g_regSpecifier = nullptr; // codecheck: noqa G.NAM.03-CPP
static RegModifierFnT g_regModifier = nullptr; // codecheck: noqa G.NAM.03-CPP
static RegTypeFnT g_regType = nullptr; // codecheck: noqa G.NAM.03-CPP
typedef int (*SnFmtFnT)(char *, size_t, const char *, ...); // codecheck: noqa G.NAM.03-CPP
static SnFmtFnT g_snFmt = nullptr; // codecheck: noqa G.NAM.03-CPP
static void LoadFunctions(void) // codecheck: noqa G.NAM.03-CPP G.FMT.03
{
    if (!g_regSpecifier) {
        // codecheck: noqa G.NAM.03-CPP
        g_regSpecifier = (RegSpecifierFnT)dlsym(RTLD_DEFAULT, "register_printf_specifier");
    }
    if (!g_regModifier) {
        // codecheck: noqa G.NAM.03-CPP
        g_regModifier = (RegModifierFnT)dlsym(RTLD_DEFAULT, "register_printf_modifier");
    }
    if (!g_regType) {
        g_regType = (RegTypeFnT)dlsym(RTLD_DEFAULT, "register_printf_type"); // codecheck: noqa G.NAM.03-CPP
    }
    if (!g_snFmt) {
        g_snFmt = (SnFmtFnT)dlsym(RTLD_DEFAULT, "snprintf"); // codecheck: noqa G.NAM.03-CPP
    }
}
static void MyVa(void *mem, va_list *ap)
{
    long *p = reinterpret_cast<long *>(mem);
    *p = va_arg(*ap, long);
}

struct Pair { // codecheck: noqa G.NAM.03-CPP
    long i;
    double d;
};

static int g_pairType;

static void PairVa(void *mem, va_list *ap)
{
    struct Pair *p = reinterpret_cast<struct Pair *>(mem); // codecheck: noqa G.NAM.03-CPP
    p->i = va_arg(*ap, long);
    p->d = va_arg(*ap, double);
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int PairPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    const struct Pair *p = *static_cast<const struct Pair *const *>(a[0]); // codecheck: noqa G.EXP.14
    return fprintf(s, "(%ld, %f)", p->i, p->d); // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int PairArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    if (n > 0) {
        at[0] = g_pairType;
        sz[0] = sizeof(struct Pair); // codecheck: noqa G.NAM.03-CPP
    }
    return 1;
}

struct Tp { // codecheck: noqa G.NAM.03-CPP
    long i;
    double d;
};

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int TpPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    const struct Tp *p = *static_cast<const struct Tp *const *>(a[0]); // codecheck: noqa G.EXP.14
    return fprintf(s, "(%ld, %f)", p->i, p->d); // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int TpArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    if (n > 0) {
        at[0] = PA_POINTER;
        sz[0] = sizeof(struct Tp*); // codecheck: noqa G.NAM.03-CPP
    }
    return 1;
}

static int g_vtype;

static void VVa(void *mem, va_list *ap)
{
    struct Pair *p = reinterpret_cast<struct Pair *>(mem); // codecheck: noqa G.NAM.03-CPP
    p->i = va_arg(*ap, long);
    p->d = va_arg(*ap, double);
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int VPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    const struct Pair *p = *static_cast<const struct Pair *const *>(a[0]); // codecheck: noqa G.EXP.14
    return fprintf(s, "(%ld, %f)", p->i, p->d); // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
}

static int VArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz) // codecheck: noqa G.NAM.03-CPP G.FMT.03
{
    if (n > 0) {
        at[0] = g_vtype;
        sz[0] = sizeof(struct Pair); // codecheck: noqa G.NAM.03-CPP
    }
    return 1;
}

static int g_dblType;

static void DblVa(void *mem, va_list *ap)
{
    double *p = reinterpret_cast<double *>(mem);
    *p = va_arg(*ap, double);
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int DblPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    const double *p = *static_cast<const double *const *>(a[0]); // codecheck: noqa G.EXP.14
    return fprintf(s, "%.2f", *p); // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int DblArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    if (n > 0) {
        at[0] = g_dblType;
        sz[0] = sizeof(double);
    }
    return 1;
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int UnkPrintf(FILE *s, const struct PrintfInfo *info, const void *const *a)
{
    return fputc('.', s);
}

// codecheck: noqa G.NAM.03-CPP G.FMT.03
static int UnkArginfo(const struct PrintfInfo *info, size_t n, int *at, int *sz)
{
    if (n > 0) {
        at[0] = 0x7FFFFFFF;
        sz[0] = sizeof(void *);
    }
    return 1;
}

static int g_ids[40];

static atomic_int g_idIdx;

static void *TypeThr(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_10; i++) {
        int id = g_regType(MyVa);
        int k = atomic_fetch_add(&g_idIdx, 1);
        g_ids[k] = id;
    }
    return nullptr;
}

static pthread_barrier_t g_tbarrier;

static atomic_int g_tok;

static void *FirstType(void *arg)
{
    pthread_barrier_wait(&g_tbarrier);
    if (g_regType(MyVa) >= PA_LAST) {
        atomic_fetch_add(&g_tok, 1);
    }
    return nullptr;
}

static atomic_int g_tSucc;

static void *TypeLimit(void *arg)
{
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        errno = 0;
        int id = g_regType(MyVa);
        if (id >= PA_LAST) {
            atomic_fetch_add(&g_tSucc, 1);
        }
    }
    return nullptr;
}

static napi_value RegPrintfType_0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int id = g_regType(MyVa);
    if (!(id >= PA_LAST)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int id = g_regType(MyVa);
    if (static_cast<int>(id) < static_cast<int>(PA_LAST)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int id1 = g_regType(MyVa);
    int id2 = g_regType(MyVa);
    if (static_cast<int>(id2) != static_cast<int>(id1 + 1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int prev = -1;
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        int id = g_regType(MyVa);
        if (static_cast<int>(id) < static_cast<int>(prev)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        prev = id;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    int ret = g_regType(nullptr);
    if (static_cast<int>(ret) != static_cast<int>(-1)) {
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

static napi_value RegPrintfType_0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    errno = 0;
    g_regType(nullptr);
    if (static_cast<int>(errno) != static_cast<int>(EINVAL)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_pairType = g_regType(PairVa);
        if (g_pairType < 0) {
            _exit(0);
        }
        g_regSpecifier('P', PairPrintf, PairArginfo);
        char buf[64];
        const char *pairFmt = "%P";
        // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
        int ret = g_snFmt(buf, sizeof(buf), pairFmt, 1L, TEST_DOUBLE_2_0);
        if (static_cast<int>(ret) < static_cast<int>(0)) {
            _exit(1);
        }
        if (strcmp((buf), ("(1, 2.000000)")) != 0) {
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

static napi_value RegPrintfType_0800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('P', TpPrintf, TpArginfo);
        struct Tp v = {1, 2.0}; // codecheck: noqa G.NAM.03-CPP
        char buf[64];
        const char *tpFmt = "%P";
        (void)g_snFmt(buf, sizeof(buf), tpFmt, &v); // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
        if (strcmp((buf), ("(1, 2.000000)")) != 0) {
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

static napi_value RegPrintfType_0900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_vtype = g_regType(VVa);
        g_regSpecifier('P', VPrintf, VArginfo);
        char buf[64];
        const char *vpairFmt = "%P";
        // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
        (void)g_snFmt(buf, sizeof(buf), vpairFmt, 1L, TEST_DOUBLE_2_0);
        if (strcmp((buf), ("(1, 2.000000)")) != 0) {
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

static napi_value RegPrintfType_1000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_pairType = g_regType(PairVa);
        if (g_pairType < 0) {
            _exit(0);
        }
        g_regSpecifier('P', PairPrintf, PairArginfo);
        char buf[64];
        const char *pair42Fmt = "%P";
        // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
        (void)g_snFmt(buf, sizeof(buf), pair42Fmt, 42L, TEST_DOUBLE_3_14);
        if (!(strstr(buf, "42") != nullptr)) {
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

static napi_value RegPrintfType_1100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_dblType = g_regType(DblVa);
        g_regSpecifier('P', DblPrintf, DblArginfo);
        char buf[32];
        const char *dblFmt = "%P";
        // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
        (void)g_snFmt(buf, sizeof(buf), dblFmt, TEST_DOUBLE_3_14);
        if (strcmp((buf), ("3.14")) != 0) {
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

static napi_value RegPrintfType_1200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    int last = -1;
    for (int i = 0; i < MAX_TYPE_COUNT_248; i++) {
        last = g_regType(MyVa);
    }
    if (last >= 0 && last < PA_LAST) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_1300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < MAX_TYPE_COUNT_248; i++) {
        g_regType(MyVa);
    }
    errno = 0;
    int ret = g_regType(MyVa);
    if (static_cast<int>(ret) != static_cast<int>(-1)) {
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

static napi_value RegPrintfType_1400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < MAX_TYPE_COUNT_248; i++) {
        g_regType(MyVa);
    }
    for (int i = 0; i < LOOP_COUNT_10; i++) {
        errno = 0;
        int ret = g_regType(MyVa);
        if (static_cast<int>(ret) != static_cast<int>(-1)) {
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

static napi_value RegPrintfType_1500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_pairType = g_regType(PairVa);
        if (g_pairType < 0) {
            _exit(0);
        }
        g_regSpecifier('P', PairPrintf, PairArginfo);
        for (int i = 0; i < MAX_TYPE_COUNT_248; i++) {
        g_regType(MyVa);
        }
        char buf[64];
        const char *pairLoopFmt = "%P";
        // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.CNS.02
        (void)g_snFmt(buf, sizeof(buf), pairLoopFmt, 1L, TEST_DOUBLE_2_0);
        if (strcmp((buf), ("(1, 2.000000)")) != 0) {
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

static napi_value RegPrintfType_1600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        if (g_regType == nullptr || g_regSpecifier == nullptr) {
            _exit(0);
        }
        g_regSpecifier('X', UnkPrintf, UnkArginfo);
        char buf[16];
        // codecheck: noqa G.FUU.03 G.FUU.21 G.FUU.01 G.FMT.05 G.CNS.02 G.SEC.01
        const char *unkFmt = "%X";
        (void)g_snFmt(buf, sizeof(buf), unkFmt, reinterpret_cast<void* *>(0));
        if (!(1)) {
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

static napi_value RegPrintfType_1700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, TypeThr, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    for (int i = 0; i < MAX_IDS_COUNT_40; i++) {
        if (g_ids[i] >= 0 && !(g_ids[i] >= PA_LAST)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
        for (int j = i + 1; j < MAX_IDS_COUNT_40; j++) {
            if (g_ids[i] == g_ids[j] && g_ids[i] >= 0) {
                napi_create_int32(env, 1, &result);
                return result;
            }
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_1800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_barrier_init(&g_tbarrier, nullptr, THREAD_COUNT_4);
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, FirstType, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    pthread_barrier_destroy(&g_tbarrier);
    if (static_cast<int>(atomic_load(&g_tok)) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_1900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    pthread_t t[THREAD_COUNT_4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_create(&t[i], nullptr, TypeLimit, nullptr);
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        pthread_join(t[i], nullptr);
    }
    if (static_cast<int>(atomic_load(&g_tSucc)) < static_cast<int>(0)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value RegPrintfType_2000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    if (g_regType == nullptr || g_regSpecifier == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    for (int i = 0; i < LOOP_COUNT_10000; i++) {
        int t = g_regType(MyVa);
        (void)t;
        }
    if (!(1)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}


EXTERN_C_START // codecheck: noqa G.EXP.05
// codecheck: noqa G.FUD.05
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions(); // codecheck: noqa G.NAM.03-CPP
    napi_property_descriptor desc[] = {
        {"RegPrintfType_0100", nullptr, RegPrintfType_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0200", nullptr, RegPrintfType_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0300", nullptr, RegPrintfType_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0400", nullptr, RegPrintfType_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0500", nullptr, RegPrintfType_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0600", nullptr, RegPrintfType_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0700", nullptr, RegPrintfType_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0800", nullptr, RegPrintfType_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_0900", nullptr, RegPrintfType_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1000", nullptr, RegPrintfType_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1100", nullptr, RegPrintfType_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1200", nullptr, RegPrintfType_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1300", nullptr, RegPrintfType_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1400", nullptr, RegPrintfType_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1500", nullptr, RegPrintfType_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1600", nullptr, RegPrintfType_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1700", nullptr, RegPrintfType_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1800", nullptr, RegPrintfType_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_1900", nullptr, RegPrintfType_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RegPrintfType_2000", nullptr, RegPrintfType_2000, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "registerprintftype",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
