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

/** IEEE 754 {@link double} of {@link LONG_MAX} (not exactly representable; rounds up). */
export const LONG_MAX_AS_DOUBLE: double = Long.toDouble(LONG_MAX);

/** IEEE 754 {@link double} of {@link LONG_MIN} (exactly representable). */
export const LONG_MIN_AS_DOUBLE: double = Long.toDouble(LONG_MIN);

/** Decimal string for {@code BigInt(Number.MAX_VALUE)} via the double constructor overload. */
export const NUMBER_MAX_VALUE_STR: string =
  '179769313486231570814527423731704356798070567525844996598917476803157260780' +
  '028538760589558632766878171540458953514382464234321326889464182768467546703' +
  '537516986049910576551282076245490090389328944075868508455133942304583236903' +
  '222948165808559332123348274797826204144723168738177180919299881250404026184' +
  '124858368';

/** LONG_MAX * BIGINT(LONG_MAX_PLUS_ONE_STR) as decimal string. */
export const LONG_MAX_TIMES_PLUS_ONE_STR: string = '85070591730234615856620279821087277056';

/** BIGINT(LONG_MAX_PLUS_ONE_STR) squared as decimal string. */
export const LONG_MAX_PLUS_ONE_SQUARED_STR: string = '85070591730234615865843651857942052864';

/** Thrown when {@code BigInt(string)} receives a non-parseable decimal string. */
export const BIGINT_PARSE_INVALID_MSG: string = 'BigInt.parseFromString(): provided string is invalid';

/** Thrown when {@code BigInt(string)} receives a non-integer numeric string such as {@code '1.5'}. */
export const BIGINT_NON_INTEGER_CONVERT_MSG: string =
  "Can't convert number 1.5 to BigInt because it's not an integer";

/** 8-bit signed maximum (2^7 - 1). */
export const INT8_MAX: int = 127;

/** 8-bit signed minimum (-2^7). */
export const INT8_MIN: int = -128;

/** One past 8-bit signed maximum; truncates to INT8_MIN under asIntN(8, …). */
export const INT8_OVERFLOW: int = 128;

/** 8-bit unsigned maximum (2^8 - 1). */
export const UINT8_MAX: int = 255;

/** One past 8-bit unsigned maximum; wraps to 0 under asUintN(8, …). */
export const UINT8_OVERFLOW: int = 256;

/** 16-bit signed maximum (2^15 - 1). */
export const INT16_MAX: int = 32767;

/** 16-bit signed minimum (-2^15). */
export const INT16_MIN: int = -32768;

/** One past 16-bit signed maximum; truncates to INT16_MIN under asIntN(16, …). */
export const INT16_OVERFLOW: int = 32768;

/** 16-bit unsigned maximum (2^16 - 1). */
export const UINT16_MAX: int = 65535;

/** One past 16-bit unsigned maximum; wraps to 0 under asUintN(16, …). */
export const UINT16_OVERFLOW: int = 65536;

/** 32-bit signed minimum (-2^31) as decimal string. */
export const INT32_MIN_STR: string = '-2147483648';

/** 2^31 as decimal string (one past INT32_MAX). */
export const POW2_31_STR: string = '2147483648';

/** 2^32 as decimal string (one past UINT32_MAX). */
export const UINT32_MAX_PLUS_ONE_STR: string = '4294967296';

/** Exponent used in asIntN/asUintN large-magnitude truncation tests (2^100). */
export const POW2_EXPONENT_100: int = 100;

/** Representative byte-wide magnitude for radix conversion demos. */
export const SAMPLE_BYTE_MAGNITUDE: int = 255;

/** Decimal string for {@link SAMPLE_BYTE_MAGNITUDE}. */
export const SAMPLE_BYTE_MAGNITUDE_STR: string = '255';

/** Radix-16 string for {@link SAMPLE_BYTE_MAGNITUDE}. */
export const SAMPLE_BYTE_RADIX16_STR: string = 'ff';

/** Radix-16 string for negated {@link SAMPLE_BYTE_MAGNITUDE}. */
export const SAMPLE_BYTE_RADIX16_NEGATED_STR: string = '-ff';

/** Radix-2 string for {@link SAMPLE_BYTE_MAGNITUDE}. */
export const SAMPLE_BYTE_RADIX2_STR: string = '11111111';

/** Small positive magnitude for decimal radix demos. */
export const SAMPLE_DECIMAL_MAGNITUDE: int = 10;

/** Radix-2 string for {@link SAMPLE_DECIMAL_MAGNITUDE}. */
export const SAMPLE_DECIMAL_RADIX2_STR: string = '1010';

/** Radix-8 string for {@link SAMPLE_DECIMAL_MAGNITUDE}. */
export const SAMPLE_DECIMAL_RADIX8_STR: string = '12';

/** {@link LONG_MAX} in radix 16 (lowercase). */
export const LONG_MAX_RADIX16_STR: string = '7fffffffffffffff';

/** BCP 47 locale tag for US English formatting. */
export const LOCALE_EN_US: string = 'en-US';

/** BCP 47 locale tag for Simplified Chinese formatting. */
export const LOCALE_ZH_CN: string = 'zh-CN';

/** BCP 47 locale tag for British English formatting. */
export const LOCALE_EN_GB: string = 'en-GB';

/** {@code toLocaleString} options: exact decimal digits without grouping. */
export const LOCALE_STRING_OPTS_NO_GROUPING: BigIntToLocaleStringOptions = { useGrouping: false };

/** {@code toLocaleString} options: compact notation with short display. */
export const LOCALE_STRING_OPTS_COMPACT_SHORT: BigIntToLocaleStringOptions = {
  notation: 'compact',
  compactDisplay: 'short'
};

/** {@code toLocaleString} options: standard notation. */
export const LOCALE_STRING_OPTS_STANDARD: BigIntToLocaleStringOptions = { notation: 'standard' };

/** Sample magnitude for locale string grouping tests. */
export const LOCALE_STRING_VALUE_MILLION: long = 1000000;

/** Sample magnitude for multi-locale locale string tests. */
export const LOCALE_STRING_VALUE_GROUPED: long = 123456789;

/** Small positive magnitude for {@code toString()} demos. */
export const TO_STRING_SMALL_POSITIVE: int = 42;

/** Medium positive magnitude for {@code toString()} demos. */
export const TO_STRING_MEDIUM_POSITIVE: int = 10000;

/** Small negative magnitude for {@code toString()} demos. */
export const TO_STRING_SMALL_NEGATIVE: int = -42;
