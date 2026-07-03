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

export enum IntEnum: int {
  TEST_004 = 255,
  VALUE_100 = 100,
  myEnumName = 1,
  ENUM_VALUE_1 = 1,
  VALUE_123 = 1
}

export enum StringEnum {
  TEST_005 = "world",
  STATUS_ACTIVE = "ACTIVE",
  SPACE_STRING = " ",
  UNICODE_VALUE = "中文值",
  EMOJI_VALUE = "value😀",
  SPECIAL_CHARS = "value\t\n\r",
  ZERO_WIDTH_SPACE = "​"
}

export enum ByteEnum: byte {
  VALUE_100 = 100
}

export enum ShortEnum: short {
  VALUE_10000 = 10000
}

export enum LongEnum: long {
  VALUE_1000 = 1000,
  VALUE_NEG_1 = -1
}

export enum FloatEnum: float {
  PI = 3.14f,
  NEG_HALF = -0.5f,
  MIN_FLOAT = -3.4e38f
}

export enum DoubleEnum: double {
  PI = 3.141592653589793,
  NEG_SMALL = -0.001,
  MAX_DOUBLE = 1.7e308,
  MIN_DOUBLE = -1.7e308
}

export enum GetNameIntEnum: int {
  OK = 1,
  INFO = 100,
  A = 1,
  LEVEL_100 = 2,
  ALPHA = 1,
  BETA = 2,
  GAMMA = 3,
  SAME_NAME = 1,
  FIRST = 1,
  SECOND = 1,
  IMMUTABLE = 5
}

export enum GetNameByteEnum: byte {
  DEBUG = 1
}

export enum GetNameShortEnum: short {
  TRACE = 10
}

export enum GetNameLongEnum: long {
  ERROR = 1000,
  SAME_NAME = 1
}

export enum GetNameFloatEnum: float {
  LEVEL_A = 1.5f
}

export enum GetNameDoubleEnum: double {
  LEVEL_B = 3.14
}

export enum GetNameStringEnum {
  LEVEL_C = "code",
  SAME_NAME = "same_name"
}

export enum ToStringByteEnum: byte {
  POS_100 = 100,
  ZERO = 0,
  MAX = 127,
  MIN = -128,
  NEG_ONE = -1,
  TEN = 10
}

export enum ToStringShortEnum: short {
  POS_1000 = 1000,
  ZERO = 0,
  MAX = 32767,
  MIN = -32768,
  NEG_ONE = -1
}

export enum ToStringIntEnum: int {
  NOT_FOUND = 404,
  OK = 200,
  ZERO = 0,
  NEG = -1,
  MAX = 2147483647,
  MIN = -2147483648,
  VALUE_100 = 100,
  A = 404,
  B = 404,
  NEG_999 = -999,
  SERVER_ERROR = 500,
  VALUE_100000 = 100000
}

export enum ToStringLongEnum: long {
  POS_100000 = 100000,
  ZERO = 0,
  NEG_999 = -999,
  MAX = 9223372036854775807,
  MIN = -9223372036854775808,
  BIG = 999,
  BEYOND_SAFE = 9007199254740993
}

export enum ToStringFloatEnum: float {
  POS_2_5 = 2.5f,
  ZERO = 0.0f,
  NEG_2_5 = -2.5f,
  WHOLE = 100.0f,
  SMALL = 0.001953125f,
  NEG_ZERO = -0.0f,
  MAX_FLOAT = 3.4e38f,
  MIN_FLOAT = 1.4e-45f,
  HALF = 1.5f
}

export enum ToStringDoubleEnum: double {
  E = 2.718281828,
  ZERO = 0.0,
  NEG_99_99 = -99.99,
  NEG_ZERO = -0.0,
  HIGH_PREC = 3.141592653589793,
  MAX_DOUBLE = 1.7e308,
  MIN_DOUBLE = 5e-324
}

export enum ToStringStringEnum {
  HELLO = "hello",
  EMPTY = "",
  NUMERIC = "123",
  SPACE_TEXT = "hello world",
  SPECIAL = "!@#$%^&*()",
  CHINESE = "你好世界",
  VALUE = "value",
  SINGLE = "A"
}

export enum ValueOfByteEnum: byte {
  BYTE_12 = 12,
  BYTE_0 = 0,
  BYTE_NEG_1 = -1,
  BYTE_HEX_0A = 0x0A,
  BYTE_MAX = 127,
  BYTE_MIN = -128
}

export enum ValueOfShortEnum: short {
  SHORT_100 = 100,
  SHORT_0 = 0,
  SHORT_HEX = 0x7FF,
  SHORT_NEG_100 = -100,
  SHORT_MAX = 32767,
  SHORT_MIN = -32768
}

export enum ValueOfIntEnum: int {
  HUNDRED = 100,
  INT_10000 = 10000,
  INT_0 = 0,
  INT_HEX = 0x1234,
  INT_NEG_1 = -1,
  INT_MAX = 2147483647,
  INT_MIN = -2147483648,
  VALUE_404 = 404,
  ANSWER = 42,
  VALUE_200 = 200,
  VALUE_NEG_100 = -100,
  ONE_A = 1,
  ONE_B = 1
}

export enum ValueOfLongEnum: long {
  LONG_100 = 100,
  LONG_0 = 0,
  LONG_HEX = 0x1234,
  LONG_NEG_1 = -1,
  LONG_BIG = 10000000000,
  LONG_MAX = 9223372036854775807,
  LONG_MIN = -9223372036854775808,
  VALUE_9999999999 = 9999999999,
  VALUE_123456789 = 123456789,
  VALUE_999 = 999
}

export enum ValueOfFloatEnum: float {
  FLOAT_PI = 3.14f,
  FLOAT_0 = 0.0f,
  FLOAT_NEG = -99.99f,
  FLOAT_1000 = 1000.0f,
  FLOAT_9 = 9.0f,
  FLOAT_MAX = 3.4028235e38f,
  FLOAT_MIN = 1.4e-45f,
  FLOAT_NEG_ZERO = -0.0f
}

export enum ValueOfDoubleEnum: double {
  DOUBLE_123_456 = 123.456,
  DOUBLE_0 = 0.0,
  DOUBLE_NEG = -888.88,
  DOUBLE_1E6 = 1.0e6,
  DOUBLE_9 = 9.0,
  DOUBLE_MAX = 1.7976931348623157e308,
  DOUBLE_MIN = 5e-324,
  DOUBLE_NEG_ZERO = -0.0,
  EULER = 2.718281828
}

export enum ValueOfStringEnum {
  DEBUG = "debug",
  TEST_CN = "测试",
  NUMERIC = "123456",
  SPECIAL = "!@#$%^&*()",
  EMPTY = "",
  SPACE = " ",
  UNICODE = "中文",
  EMOJI = "😀",
  JP = "テスト",
  ZERO_WIDTH = "\u200B",
  XSS = "<script>alert(1)</script>",
  FIRST = "first",
  SECOND = "second",
  TEST = "test",
  HELLO = "hello"
}

export enum BaseIntEnum: int {
  TWO_PARAMS = 42,
  TEST = 42,
  CONSISTENT_NAME = 42,
  FIRST = 1,
  SECOND = 2,
  THIRD = 3,
  INT_CONST = 42,
  SAME = 42,
  MY_ENUM = 100,
  TEST_NAME = 42,
  PUBLIC_TEST = 1,
  API_V20 = 1,
  STA_MODE = 42,
  STRICT_TYPE = 100,
  INT_ENUM = 1
}

export enum BaseStringEnum {
  STR_CONST = "HELLO",
  STR_ENUM = "VALUE",
  RED = "#FF0000",
  BLUE = "#0000FF"
}

export enum BaseFloatEnum: float {
  FLOAT_CONST = 3.14f,
  FLOAT_ENUM = 1.5f
}

export enum BaseLongEnum: long {
  LONG_ENUM = 999
}

export enum BaseByteEnum: byte {
  BYTE_ENUM = 10
}

export enum BaseShortEnum: short {
  SHORT_ENUM = 100
}

export enum BaseDoubleEnum: double {
  DOUBLE_ENUM = 2.5
}

export enum DirectionEnum {
  NORTH = "N",
  SOUTH = "S",
  EAST = "E",
  WEST = "W"
}

export enum HttpStatusEnum: int {
  OK = 200,
  NOT_FOUND = 404,
  INTERNAL_SERVER_ERROR = 500
}

export enum ErrorCodeEnum: long {
  NONE = 0,
  NETWORK_ERROR = 1001,
  TIMEOUT_ERROR = 1002
}
