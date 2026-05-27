'use static'
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

/** Signed 64-bit integer maximum (2^63 - 1), i.e. long.MAX_VALUE. */
export const LONG_MAX: long = 9223372036854775807;

/** Signed 64-bit integer minimum (-2^63), i.e. long.MIN_VALUE. */
export const LONG_MIN: long = -9223372036854775808;

/** Decimal string for {@link LONG_MAX}. */
export const LONG_MAX_STR: string = '9223372036854775807';

/** Decimal string for {@link LONG_MIN}. */
export const LONG_MIN_STR: string = '-9223372036854775808';

/** LONG_MAX + 1 (one step past signed long maximum). */
export const LONG_MAX_PLUS_ONE_STR: string = '9223372036854775808';

/** LONG_MIN - 1 (one step below signed long minimum). */
export const LONG_MIN_MINUS_ONE_STR: string = '-9223372036854775809';

/** -LONG_MAX (still within signed long range). */
export const LONG_MAX_NEGATED: long = -9223372036854775807;

/** Negation of LONG_MAX as decimal string. */
export const LONG_MAX_NEGATED_STR: string = '-9223372036854775807';

/** LONG_MIN in unsigned radix-16 two's-complement (no leading minus). */
export const LONG_MIN_RADIX16_STR: string = '8000000000000000';

/** Unsigned 32-bit maximum (2^32 - 1). */
export const UINT32_MAX: long = 4294967295;

/** Decimal string for {@link UINT32_MAX}. */
export const UINT32_MAX_STR: string = '4294967295';

/** Unsigned 64-bit maximum (2^64 - 1) as decimal string (exceeds signed long). */
export const ULONG_MAX_STR: string = '18446744073709551615';

/** 2^64 as decimal string (one past unsigned 64-bit maximum). */
export const ULONG_MAX_PLUS_ONE_STR: string = '18446744073709551616';

/** BIGINT(LONG_MAX) - BIGINT(LONG_MIN); equals ULONG_MAX. */
export const LONG_EXTREMA_SPAN_STR: string = '18446744073709551615';

/** LONG_MAX - 1 (one step below signed long maximum). */
export const LONG_MAX_MINUS_ONE_STR: string = '9223372036854775806';

/** Negation of LONG_MAX - 1. */
export const LONG_MAX_MINUS_ONE_NEGATED_STR: string = '-9223372036854775806';

/** 2 * LONG_MAX; equals ULONG_MAX - 1. */
export const LONG_MAX_DOUBLED_STR: string = '18446744073709551614';

/** 2 * LONG_MIN; equals -2^64. */
export const LONG_MIN_DOUBLED_STR: string = '-18446744073709551616';

/** 2^64 + 1 as decimal string. */
export const ULONG_MAX_PLUS_TWO_STR: string = '18446744073709551617';

/** Unsigned interpretation of signed INT_MIN (-2^31): 2^64 - 2^31. */
export const INT_MIN_AS_ULONG_STR: string = '18446744071562067968';

/** 2^62. */
export const POW2_62_STR: string = '4611686018427387904';

/** -2^62. */
export const POW2_62_NEGATED_STR: string = '-4611686018427387904';

/** 2^65 - 1 (bitwise OR of ULONG_MAX and 2^64). */
export const POW2_65_MINUS_ONE_STR: string = '36893488147419103231';

/** IEEE 754 double largest exactly representable integer (2^53 - 1). */
export const DOUBLE_MAX_SAFE_INTEGER: long = 9007199254740991;

/** Decimal string for {@link DOUBLE_MAX_SAFE_INTEGER}. */
export const DOUBLE_MAX_SAFE_INTEGER_STR: string = '9007199254740991';

/** Negated {@link DOUBLE_MAX_SAFE_INTEGER} as decimal string. */
export const DOUBLE_MAX_SAFE_INTEGER_NEGATED_STR: string = '-9007199254740991';

/** DOUBLE_MAX_SAFE_INTEGER - 1. */
export const DOUBLE_MAX_SAFE_INTEGER_MINUS_ONE_STR: string = '9007199254740990';

/** DOUBLE_MAX_SAFE_INTEGER + 1 (2^53). */
export const DOUBLE_MAX_SAFE_INTEGER_PLUS_ONE_STR: string = '9007199254740992';

/** Negated DOUBLE_MAX_SAFE_INTEGER + 1. */
export const DOUBLE_MAX_SAFE_INTEGER_PLUS_ONE_NEGATED_STR: string = '-9007199254740992';

/** DOUBLE_MAX_SAFE_INTEGER + 2 (2^53 + 1); still exact via long/string BigInt. */
export const DOUBLE_MAX_SAFE_INTEGER_PLUS_TWO_STR: string = '9007199254740993';

/** 2 * DOUBLE_MAX_SAFE_INTEGER. */
export const DOUBLE_MAX_SAFE_INTEGER_DOUBLED_STR: string = '18014398509481982';

/** {@link DOUBLE_MAX_SAFE_INTEGER} as double for BigInt(double) construction. */
export const DOUBLE_MAX_SAFE_INTEGER_VAL: double = 9007199254740991.0;

/** Negated {@link DOUBLE_MAX_SAFE_INTEGER} as double. */
export const DOUBLE_MAX_SAFE_INTEGER_NEGATED_VAL: double = -9007199254740991.0;

/** DOUBLE_MAX_SAFE_INTEGER + 1 as double. */
export const DOUBLE_MAX_SAFE_INTEGER_PLUS_ONE_VAL: double = 9007199254740992.0;

/** Negated DOUBLE_MAX_SAFE_INTEGER + 1 as double. */
export const DOUBLE_MAX_SAFE_INTEGER_PLUS_ONE_NEGATED_VAL: double = -9007199254740992.0;

/** DOUBLE_MAX_SAFE_INTEGER + 2 as double. */
export const DOUBLE_MAX_SAFE_INTEGER_PLUS_TWO_VAL: double = 9007199254740993.0;
