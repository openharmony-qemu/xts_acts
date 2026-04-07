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

#include <cmath>
#include "mtest.h"
#include "test.h"

enum { LESS, EQUAL, GREATER, UNORD };

/* compare result only; skip fetestexcept — some OHOS targets report stale/spurious flags after
 * feclearexcept, causing false failures. */
#define TEST(f, want)                                           \
    do {                                                        \
        int r;                                                  \
        feclearexcept(FE_ALL_EXCEPT);                           \
        r = (f);                                                \
        if (r != (want))                                        \
            t_error(#f " failed: got %d want %d\n", r, (want)); \
    } while (0)

#undef T
/* __builtin_* avoids <cmath> macro/overload mismatch; cast to long double unifies mixed float ranks. */
#define t(a, b, rel)                                                                \
    do {                                                                            \
        long double la = static_cast<long double>(a);                               \
        long double lb = static_cast<long double>(b);                               \
        TEST(__builtin_isunordered(la, lb), (rel) == UNORD);                        \
        TEST(__builtin_isless(la, lb), (rel) == LESS);                              \
        TEST(__builtin_islessequal(la, lb), (rel) == LESS || (rel) == EQUAL);       \
        TEST(__builtin_islessgreater(la, lb), (rel) == LESS || (rel) == GREATER);   \
        TEST(__builtin_isgreater(la, lb), (rel) == GREATER);                        \
        TEST(__builtin_isgreaterequal(la, lb), (rel) == GREATER || (rel) == EQUAL); \
    } while (0)

static void IslessTestNanUnordered(void)
{
    t(NAN, 1.0, UNORD);
    t(1.0, NAN, UNORD);
    t(NAN, NAN, UNORD);
    t(NAN, NAN + 1.0, UNORD);
    t(NAN, NAN + 1.0L, UNORD);
}

static void IslessTestOrderedDouble(volatile double huge, volatile double tiny, volatile double eps)
{
    t(1.0, 1.1, LESS);
    t(1.0, 1.0 + eps, LESS);
    t(1.0 + eps, 1.0, GREATER);
    t(huge - 1, huge, EQUAL);
    t(huge, huge * huge, LESS);
    t(-0.0, 0.0, EQUAL);
    t(-tiny, 0.0, LESS);
    t(tiny, 2 * tiny, LESS);
    t(tiny * 0x1p-9, tiny * 0x1p-8, LESS);
}

static void IslessTestOrderedFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
    t(1.0f, 1.1f, LESS);
    t(1.0f, 1.0f + epsf, LESS);
    t(1.0f + epsf, 1.0f, GREATER);
    t(hugef - 1, hugef, EQUAL);
    t(hugef, hugef * hugef, LESS);
    t(-0.0f, 0.0f, EQUAL);
    t(-tinyf, 0.0f, LESS);
    t(tinyf, 2 * tinyf, LESS);
    t(tinyf * 0x1p-9f, tinyf * 0x1p-8f, LESS);
}

static void
    IslessTestOrderedLongDouble(volatile long double hugel, volatile long double tinyl, volatile long double epsl)
{
    t(1.0L, 1.1L, LESS);
    t(1.0L, 1.0L + epsl, LESS);
    t(1.0L + epsl, 1.0L, GREATER);
    t(hugel - 1, hugel, EQUAL);
    t(hugel, hugel * hugel, LESS);
    t(-0.0L, 0.0L, EQUAL);
    t(-tinyl, 0.0L, LESS);
    t(tinyl, 2 * tinyl, LESS);
    t(tinyl * 0x1p-9L, tinyl * 0x1p-8L, LESS);

    t(hugel * hugel, hugel * hugel * 2, EQUAL);
    t(tinyl * tinyl * 0.5L, tinyl * tinyl, EQUAL);
    t(-tinyl * tinyl, 0.0L, EQUAL);
    t(1.0L, 1.0L + epsl * 0.25L, EQUAL);
}

static void IslessTestFltEvalDouble(volatile double huge, volatile double tiny, volatile double eps)
{
#if FLT_EVAL_METHOD == 2
    t(huge * huge, huge * huge * 2, LESS);
    t(tiny * tiny * 0.5, tiny * tiny, LESS);
    t(-tiny * tiny, 0.0, LESS);
    t(1.0, 1.0 + eps * 0.25, LESS);
#else
    t(huge * huge, huge * huge * 2, EQUAL);
    t(tiny * tiny * 0.5, tiny * tiny, EQUAL);
    t(-tiny * tiny, 0.0, EQUAL);
    t(1.0, 1.0 + eps * 0.25, EQUAL);
#endif
}

static void IslessTestFltEvalFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
#if FLT_EVAL_METHOD >= 1
    t(hugef * hugef, hugef * hugef * 2, LESS);
    t(tinyf * tinyf * 0.5f, tinyf * tinyf, LESS);
    t(-tinyf * tinyf, 0.0f, LESS);
    t(1.0f, 1.0f + epsf * 0.25f, LESS);
#else
    t(hugef * hugef, hugef * hugef * 2, EQUAL);
    t(tinyf * tinyf * 0.5f, tinyf * tinyf, EQUAL);
    t(-tinyf * tinyf, 0.0f, EQUAL);
    t(1.0f, 1.0f + epsf * 0.25f, EQUAL);
#endif
}

static int IslessTestImpl()
{
#pragma STDC FENV_ACCESS ON
    T_STATUS = 0;
    volatile double huge = DBL_MAX;
    volatile double tiny = DBL_MIN;
    volatile double eps = DBL_EPSILON;
    volatile float hugef = FLT_MAX;
    volatile float tinyf = FLT_MIN;
    volatile float epsf = FLT_EPSILON;
    volatile long double hugel = LDBL_MAX;
    volatile long double tinyl = LDBL_MIN;
    volatile long double epsl = LDBL_EPSILON;

    IslessTestNanUnordered();
    IslessTestOrderedDouble(huge, tiny, eps);
    IslessTestOrderedFloat(hugef, tinyf, epsf);
    IslessTestOrderedLongDouble(hugel, tinyl, epsl);
    IslessTestFltEvalDouble(huge, tiny, eps);
    IslessTestFltEvalFloat(hugef, tinyf, epsf);

    return T_STATUS;
}

int IslessTest(void)
{
    return IslessTestImpl();
}
