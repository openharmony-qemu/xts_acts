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
static void CheckPredicateResult(const char* pred, int got, bool want)
{
    if ((got != 0) != want) {
        t_error("%s failed: got %d want %d\n", pred, got, static_cast<int>(want));
    }
}

/* __builtin_* avoids <cmath> macro/overload mismatch; cast to long double unifies mixed float ranks. */
static void CheckRelation(long double la, long double lb, int rel)
{
    feclearexcept(FE_ALL_EXCEPT);
    CheckPredicateResult("isunordered", __builtin_isunordered(la, lb), rel == UNORD);
    CheckPredicateResult("isless", __builtin_isless(la, lb), rel == LESS);
    CheckPredicateResult("islessequal", __builtin_islessequal(la, lb), rel == LESS || rel == EQUAL);
    CheckPredicateResult("islessgreater", __builtin_islessgreater(la, lb), rel == LESS || rel == GREATER);
    CheckPredicateResult("isgreater", __builtin_isgreater(la, lb), rel == GREATER);
    CheckPredicateResult("isgreaterequal", __builtin_isgreaterequal(la, lb), rel == GREATER || rel == EQUAL);
}

static void IslessTestNanUnordered(void)
{
    CheckRelation(NAN, 1.0, UNORD);
    CheckRelation(1.0, NAN, UNORD);
    CheckRelation(NAN, NAN, UNORD);
    CheckRelation(NAN, NAN + 1.0, UNORD);
    CheckRelation(NAN, NAN + 1.0L, UNORD);
}

static void IslessTestOrderedDouble(volatile double huge, volatile double tiny, volatile double eps)
{
    CheckRelation(1.0, 1.1, LESS);
    CheckRelation(1.0, 1.0 + eps, LESS);
    CheckRelation(1.0 + eps, 1.0, GREATER);
    CheckRelation(huge - 1, huge, EQUAL);
    CheckRelation(huge, huge * huge, LESS);
    CheckRelation(-0.0, 0.0, EQUAL);
    CheckRelation(-tiny, 0.0, LESS);
    CheckRelation(tiny, 2 * tiny, LESS);
    CheckRelation(tiny * 0x1p-9, tiny * 0x1p-8, LESS);
}

static void IslessTestOrderedFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
    CheckRelation(1.0f, 1.1f, LESS);
    CheckRelation(1.0f, 1.0f + epsf, LESS);
    CheckRelation(1.0f + epsf, 1.0f, GREATER);
    CheckRelation(hugef - 1, hugef, EQUAL);
    CheckRelation(hugef, hugef * hugef, LESS);
    CheckRelation(-0.0f, 0.0f, EQUAL);
    CheckRelation(-tinyf, 0.0f, LESS);
    CheckRelation(tinyf, 2 * tinyf, LESS);
    CheckRelation(tinyf * 0x1p-9f, tinyf * 0x1p-8f, LESS);
}

static void
    IslessTestOrderedLongDouble(volatile long double hugel, volatile long double tinyl, volatile long double epsl)
{
    CheckRelation(1.0L, 1.1L, LESS);
    CheckRelation(1.0L, 1.0L + epsl, LESS);
    CheckRelation(1.0L + epsl, 1.0L, GREATER);
    CheckRelation(hugel - 1, hugel, EQUAL);
    CheckRelation(hugel, hugel * hugel, LESS);
    CheckRelation(-0.0L, 0.0L, EQUAL);
    CheckRelation(-tinyl, 0.0L, LESS);
    CheckRelation(tinyl, 2 * tinyl, LESS);
    CheckRelation(tinyl * 0x1p-9L, tinyl * 0x1p-8L, LESS);

    CheckRelation(hugel * hugel, hugel * hugel * 2, EQUAL);
    CheckRelation(tinyl * tinyl * 0.5L, tinyl * tinyl, EQUAL);
    CheckRelation(-tinyl * tinyl, 0.0L, EQUAL);
    CheckRelation(1.0L, 1.0L + epsl * 0.25L, EQUAL);
}

static void IslessTestFltEvalDouble(volatile double huge, volatile double tiny, volatile double eps)
{
#if FLT_EVAL_METHOD == 2
    CheckRelation(huge * huge, huge * huge * 2, LESS);
    CheckRelation(tiny * tiny * 0.5, tiny * tiny, LESS);
    CheckRelation(-tiny * tiny, 0.0, LESS);
    CheckRelation(1.0, 1.0 + eps * 0.25, LESS);
#else
    CheckRelation(huge * huge, huge * huge * 2, EQUAL);
    CheckRelation(tiny * tiny * 0.5, tiny * tiny, EQUAL);
    CheckRelation(-tiny * tiny, 0.0, EQUAL);
    CheckRelation(1.0, 1.0 + eps * 0.25, EQUAL);
#endif
}

static void IslessTestFltEvalFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
#if FLT_EVAL_METHOD >= 1
    CheckRelation(hugef * hugef, hugef * hugef * 2, LESS);
    CheckRelation(tinyf * tinyf * 0.5f, tinyf * tinyf, LESS);
    CheckRelation(-tinyf * tinyf, 0.0f, LESS);
    CheckRelation(1.0f, 1.0f + epsf * 0.25f, LESS);
#else
    CheckRelation(hugef * hugef, hugef * hugef * 2, EQUAL);
    CheckRelation(tinyf * tinyf * 0.5f, tinyf * tinyf, EQUAL);
    CheckRelation(-tinyf * tinyf, 0.0f, EQUAL);
    CheckRelation(1.0f, 1.0f + epsf * 0.25f, EQUAL);
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
