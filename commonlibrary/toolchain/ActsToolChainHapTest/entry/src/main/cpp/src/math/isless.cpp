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

namespace {
constexpr double kPosZero = 0.0;
constexpr double kNegZero = -0.0;
constexpr float kPosZerof = 0.0f;
constexpr float kNegZerof = -0.0f;
constexpr long double kPosZeroL = 0.0L;
constexpr long double kNegZeroL = -0.0L;
constexpr double kOne = 1.0;
constexpr double kOnePointOne = 1.1;
constexpr float kOnef = 1.0f;
constexpr float kOnePointOnef = 1.1f;
constexpr long double kOneL = 1.0L;
constexpr long double kOnePointOneL = 1.1L;
constexpr int kFloatRelationScale = 2;
constexpr double kQuarter = 0.25;
constexpr float kQuarterf = 0.25f;
constexpr long double kQuarterL = 0.25L;
constexpr double kHalf = 0.5;
constexpr float kHalff = 0.5f;
constexpr long double kHalfL = 0.5L;
constexpr double kTinyFrac9 = 0x1p-9;
constexpr double kTinyFrac8 = 0x1p-8;
constexpr float kTinyFrac9f = 0x1p-9f;
constexpr float kTinyFrac8f = 0x1p-8f;
constexpr long double kTinyFrac9L = 0x1p-9L;
constexpr long double kTinyFrac8L = 0x1p-8L;
} // namespace

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
    CheckRelation(NAN, kOne, UNORD);
    CheckRelation(kOne, NAN, UNORD);
    CheckRelation(NAN, NAN, UNORD);
    CheckRelation(NAN, NAN + kOne, UNORD);
    CheckRelation(NAN, NAN + kOneL, UNORD);
}

static void IslessTestOrderedDouble(volatile double huge, volatile double tiny, volatile double eps)
{
    CheckRelation(kOne, kOnePointOne, LESS);
    CheckRelation(kOne, kOne + eps, LESS);
    CheckRelation(kOne + eps, kOne, GREATER);
    CheckRelation(huge - kOne, huge, EQUAL);
    CheckRelation(huge, huge * huge, LESS);
    CheckRelation(kNegZero, kPosZero, EQUAL);
    CheckRelation(-tiny, kPosZero, LESS);
    CheckRelation(tiny, kFloatRelationScale * tiny, LESS);
    CheckRelation(tiny * kTinyFrac9, tiny * kTinyFrac8, LESS);
}

static void IslessTestOrderedFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
    CheckRelation(kOnef, kOnePointOnef, LESS);
    CheckRelation(kOnef, kOnef + epsf, LESS);
    CheckRelation(kOnef + epsf, kOnef, GREATER);
    CheckRelation(hugef - kOnef, hugef, EQUAL);
    CheckRelation(hugef, hugef * hugef, LESS);
    CheckRelation(kNegZerof, kPosZerof, EQUAL);
    CheckRelation(-tinyf, kPosZerof, LESS);
    CheckRelation(tinyf, kFloatRelationScale * tinyf, LESS);
    CheckRelation(tinyf * kTinyFrac9f, tinyf * kTinyFrac8f, LESS);
}

static void
    IslessTestOrderedLongDouble(volatile long double hugel, volatile long double tinyl, volatile long double epsl)
{
    CheckRelation(kOneL, kOnePointOneL, LESS);
    CheckRelation(kOneL, kOneL + epsl, LESS);
    CheckRelation(kOneL + epsl, kOneL, GREATER);
    CheckRelation(hugel - kOneL, hugel, EQUAL);
    CheckRelation(hugel, hugel * hugel, LESS);
    CheckRelation(kNegZeroL, kPosZeroL, EQUAL);
    CheckRelation(-tinyl, kPosZeroL, LESS);
    CheckRelation(tinyl, kFloatRelationScale * tinyl, LESS);
    CheckRelation(tinyl * kTinyFrac9L, tinyl * kTinyFrac8L, LESS);

    CheckRelation(hugel * hugel, hugel * hugel * kFloatRelationScale, EQUAL);
    CheckRelation(tinyl * tinyl * kHalfL, tinyl * tinyl, EQUAL);
    CheckRelation(-tinyl * tinyl, kPosZeroL, EQUAL);
    CheckRelation(kOneL, kOneL + epsl * kQuarterL, EQUAL);
}

static void IslessTestFltEvalDouble(volatile double huge, volatile double tiny, volatile double eps)
{
#if FLT_EVAL_METHOD == 2
    CheckRelation(huge * huge, huge * huge * kFloatRelationScale, LESS);
    CheckRelation(tiny * tiny * kHalf, tiny * tiny, LESS);
    CheckRelation(-tiny * tiny, kPosZero, LESS);
    CheckRelation(kOne, kOne + eps * kQuarter, LESS);
#else
    CheckRelation(huge * huge, huge * huge * kFloatRelationScale, EQUAL);
    CheckRelation(tiny * tiny * kHalf, tiny * tiny, EQUAL);
    CheckRelation(-tiny * tiny, kPosZero, EQUAL);
    CheckRelation(kOne, kOne + eps * kQuarter, EQUAL);
#endif
}

static void IslessTestFltEvalFloat(volatile float hugef, volatile float tinyf, volatile float epsf)
{
#if FLT_EVAL_METHOD >= 1
    CheckRelation(hugef * hugef, hugef * hugef * kFloatRelationScale, LESS);
    CheckRelation(tinyf * tinyf * kHalff, tinyf * tinyf, LESS);
    CheckRelation(-tinyf * tinyf, kPosZerof, LESS);
    CheckRelation(kOnef, kOnef + epsf * kQuarterf, LESS);
#else
    CheckRelation(hugef * hugef, hugef * hugef * kFloatRelationScale, EQUAL);
    CheckRelation(tinyf * tinyf * kHalff, tinyf * tinyf, EQUAL);
    CheckRelation(-tinyf * tinyf, kPosZerof, EQUAL);
    CheckRelation(kOnef, kOnef + epsf * kQuarterf, EQUAL);
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
