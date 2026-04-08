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

#include <cstdint>
#include <cstdio>
#include "libc_test_shim.h"

namespace {
using SnprintfFn = int (*)(char*, size_t, const char*, ...);

static constexpr int EXPECTED_SNPRINTF_LEN_AFTER = 258;
static constexpr int EXPECTED_SNPRINTF_LEN = 257;
static constexpr int INT_D_1 = 1;
static constexpr int INT_D_2 = 2;
static constexpr int INT_D_3 = 3;

static void CheckPrintfFmtNCaseAfter(int* status, int* retv, const char* label)
{
    if (*retv != EXPECTED_SNPRINTF_LEN_AFTER) {
        LibcTestError(status, "%s: expected snprintf to write 258 chars, got %d\n", label, *retv);
    }
}

template <typename T> static void CheckPrintfFmtNVar(int* status, T* var, const char* label)
{
    if (*var != EXPECTED_SNPRINTF_LEN) {
        LibcTestError(status, "%s: %%n format failed: wanted 257\n", label);
    }
}

static void CheckPrintfFmtNCase(int* status, char* buf, size_t bufSize, int* retv, int* var, const char* label)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *retv = unsafeSnprintf(buf, bufSize, "%256d%d%n%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(status, retv, label);
    CheckPrintfFmtNVar(status, var, label);
}

// On LP64, intmax_t may be a typedef of long; keep one overload and select %ln vs %jn explicitly.
static void
    CheckPrintfFmtNCase(int* status, char* buf, size_t bufSize, int* retv, long* var, const char* label, bool useJn)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    if (useJn) {
        *retv =
            unsafeSnprintf(buf, bufSize, "%256d%d%jn%d", INT_D_1, INT_D_2, reinterpret_cast<intmax_t*>(var), INT_D_3);
    } else {
        *retv = unsafeSnprintf(buf, bufSize, "%256d%d%ln%d", INT_D_1, INT_D_2, var, INT_D_3);
    }
    CheckPrintfFmtNCaseAfter(status, retv, label);
    CheckPrintfFmtNVar(status, var, label);
}

static void CheckPrintfFmtNCase(int* status, char* buf, size_t bufSize, int* retv, long long* var, const char* label)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *retv = unsafeSnprintf(buf, bufSize, "%256d%d%lln%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(status, retv, label);
    CheckPrintfFmtNVar(status, var, label);
}

static void CheckPrintfFmtNCase(int* status, char* buf, size_t bufSize, int* retv, short* var, const char* label)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *retv = unsafeSnprintf(buf, bufSize, "%256d%d%hn%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(status, retv, label);
    CheckPrintfFmtNVar(status, var, label);
}

static void CheckPrintfFmtNCase(int* status, char* buf, size_t bufSize, int* retv, size_t* var, const char* label)
{
    SnprintfFn unsafeSnprintf = &std::snprintf;
    *retv = unsafeSnprintf(buf, bufSize, "%256d%d%zn%d", INT_D_1, INT_D_2, var, INT_D_3);
    CheckPrintfFmtNCaseAfter(status, retv, label);
    CheckPrintfFmtNVar(status, var, label);
}

} // namespace

int PrintfFmtNTest()
{
    int status = SUCCESS_CODE;

    char buf[1024];
    int ret;
    int i;
    long l;
    long long ll;
    short h;
    size_t z;
    intmax_t j;

    CheckPrintfFmtNCase(&status, buf, sizeof(buf), &ret, &i, "%n");
    CheckPrintfFmtNCase(&status, buf, sizeof(buf), &ret, &l, "%ln", false);
    CheckPrintfFmtNCase(&status, buf, sizeof(buf), &ret, &ll, "%lln");
    CheckPrintfFmtNCase(&status, buf, sizeof(buf), &ret, &h, "%hn");
    CheckPrintfFmtNCase(&status, buf, sizeof(buf), &ret, &z, "%zn");
    CheckPrintfFmtNCase(&status, buf, sizeof(buf), &ret, reinterpret_cast<long*>(&j), "%jn", true);

    return status;
}
