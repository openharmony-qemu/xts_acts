'use static'
/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

import Utils from '../../../Util.test'

namespace testNS {
  // enum_explicit_type_fromvalue_4.ets
  enum Enum1

  :byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_6.ets
  enum Enum2

  : short {
    Red, Green = 10, Blue,
    First = -32768, Second = 12345, Third = 32767,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_0.ets
  enum Enum3

  : int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_2.ets
  enum Enum4

  : long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345,
    Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }
  ;

  // enum_explicit_type_fromvalue_10.ets
  enum Enum5

  : float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }
  ;

  // enum_explicit_type_fromvalue_8.ets
  enum Enum6

  : double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1.0, one = 1.0, oNe = 1.0
  }
  ;

  // enum_explicit_type_fromvalue_12.ets
  enum Enum7

  : string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex =
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }
  ;

  // enum_explicit_type_fromvalue_0.ets
  export function runTest(): boolean {
    let c = Enum3.fromValue(0);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.Red);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.Red.valueOf());
    expect(Enum3[c]).assertEqual("Red");

    c = Enum3.fromValue(10);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.Green);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.Green.valueOf());
    expect(Enum3[c]).assertEqual("Green");

    c = Enum3.fromValue(11);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.Blue);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.Blue.valueOf());
    expect(Enum3[c]).assertEqual("Blue");

    c = Enum3.fromValue(-2147483648);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.First);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.First.valueOf());
    expect(Enum3[c]).assertEqual("First");

    c = Enum3.fromValue(12345);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.Second);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.Second.valueOf());
    expect(Enum3[c]).assertEqual("Second");

    c = Enum3.fromValue(2147483647);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.Third);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.Third.valueOf());
    expect(Enum3[c]).assertEqual("Third");

    c = Enum3.fromValue(1);
    expect(c instanceof Enum3).assertTrue();
    expect(c).assertEqual(Enum3.oNe);
    expect(c.valueOf() instanceof int).assertTrue();
    expect(c.valueOf()).assertEqual(Enum3.oNe.valueOf());
    expect(Enum3[c]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_fromvalue_2.ets
  export function runTest2(): boolean {
    let c = Enum4.fromValue(0);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Red);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Red.valueOf());
    expect(Enum4[c]).assertEqual("Red");

    c = Enum4.fromValue(10);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Green);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Green.valueOf());
    expect(Enum4[c]).assertEqual("Green");

    c = Enum4.fromValue(11);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Blue);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Blue.valueOf());
    expect(Enum4[c]).assertEqual("Blue");

    c = Enum4.fromValue(-9223372036854775808);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.First);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.First.valueOf());
    expect(Enum4[c]).assertEqual("First");

    c = Enum4.fromValue(12345);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Second);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Second.valueOf());
    expect(Enum4[c]).assertEqual("Second");

    c = Enum4.fromValue(9223372036854775807);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Third);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Third.valueOf());
    expect(Enum4[c]).assertEqual("Third");

    c = Enum4.fromValue(1);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.oNe);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.oNe.valueOf());
    expect(Enum4[c]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_fromvalue_8.ets
  export function runTest8(): boolean {
    let c = Enum6.fromValue(1.5);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.Red);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.Red.valueOf());
    expect(Enum6[c]).assertEqual("Red");

    c = Enum6.fromValue(10.3);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.Green);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.Green.valueOf());
    expect(Enum6[c]).assertEqual("Green");

    c = Enum6.fromValue(7.6);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.Blue);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.Blue.valueOf());
    expect(Enum6[c]).assertEqual("Blue");

    c = Enum6.fromValue(-214748.3648);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.First);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.First.valueOf());
    expect(Enum6[c]).assertEqual("First");

    c = Enum6.fromValue(123.45);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.Second);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.Second.valueOf());
    expect(Enum6[c]).assertEqual("Second");

    c = Enum6.fromValue(2147483.647);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.Third);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.Third.valueOf());
    expect(Enum6[c]).assertEqual("Third");

    c = Enum6.fromValue(1.0);
    expect(c instanceof Enum6).assertTrue();
    expect(c).assertEqual(Enum6.oNe);
    expect(c.valueOf() instanceof double).assertTrue();
    expect(c.valueOf()).assertEqual(Enum6.oNe.valueOf());
    expect(Enum6[c]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_fromvalue_10.ets
  export function runTest10(): boolean {
    let c = Enum5.fromValue(1.5f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.Red);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.Red.valueOf());
    expect(Enum5[c]).assertEqual("Red");

    c = Enum5.fromValue(10.3f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.Green);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.Green.valueOf());
    expect(Enum5[c]).assertEqual("Green");

    c = Enum5.fromValue(7.6f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.Blue);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.Blue.valueOf());
    expect(Enum5[c]).assertEqual("Blue");

    c = Enum5.fromValue(-214748.3648f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.First);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.First.valueOf());
    expect(Enum5[c]).assertEqual("First");

    c = Enum5.fromValue(123.45f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.Second);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.Second.valueOf());
    expect(Enum5[c]).assertEqual("Second");

    c = Enum5.fromValue(2147483.647f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.Third);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.Third.valueOf());
    expect(Enum5[c]).assertEqual("Third");

    c = Enum5.fromValue(1.0f);
    expect(c instanceof Enum5).assertTrue();
    expect(c).assertEqual(Enum5.oNe);
    expect(c.valueOf() instanceof float).assertTrue();
    expect(c.valueOf()).assertEqual(Enum5.oNe.valueOf());
    expect(Enum5[c]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_fromvalue_12.ets
  export function runTest12(): boolean {
    let c = Enum7.fromValue("reD");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Red);
    expect(c.valueOf() instanceof string).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Red.valueOf());
    expect(Enum7[c]).assertEqual("Red");

    c = Enum7.fromValue("grEen");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Green);
    expect(c.valueOf() instanceof string).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Green.valueOf());
    expect(Enum7[c]).assertEqual("Green");

    c = Enum7.fromValue("Blue");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Blue);
    expect(c.valueOf() instanceof string).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Blue.valueOf());
    expect(Enum7[c]).assertEqual("Blue");

    c = Enum7.fromValue(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Complex);
    expect(c.valueOf() instanceof string).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Complex.valueOf());
    expect(Enum7[c]).assertEqual("Complex");

    c = Enum7.fromValue("one");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.oNe);
    expect(c.valueOf() instanceof string).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.oNe.valueOf());
    expect(Enum7[c]).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_fromvalue_2.ets
  export function runTest156(): boolean {
    let c = Enum4.fromValue(0);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Red);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Red.valueOf());
    expect(Enum4[c]).assertEqual("Red");

    c = Enum4.fromValue(10);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Green);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Green.valueOf());
    expect(Enum4[c]).assertEqual("Green");

    c = Enum4.fromValue(11);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Blue);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Blue.valueOf());
    expect(Enum4[c]).assertEqual("Blue");

    c = Enum4.fromValue(-9223372036854775808);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.First);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.First.valueOf());
    expect(Enum4[c]).assertEqual("First");

    c = Enum4.fromValue(12345);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Second);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Second.valueOf());
    expect(Enum4[c]).assertEqual("Second");

    c = Enum4.fromValue(9223372036854775807);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.Third);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.Third.valueOf());
    expect(Enum4[c]).assertEqual("Third");

    c = Enum4.fromValue(1);
    expect(c instanceof Enum4).assertTrue();
    expect(c).assertEqual(Enum4.oNe);
    expect(c.valueOf() instanceof long).assertTrue();
    expect(c.valueOf()).assertEqual(Enum4.oNe.valueOf());
    expect(Enum4[c]).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_fromvalue_4.ets
  export function runTest158(): boolean {
    let c = Enum7.fromValue("reD");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Red);
    expect(c.valueOf() instanceof String).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Red.valueOf());
    expect(Enum7[c]).assertEqual("Red");

    c = Enum7.fromValue("grEen");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Green);
    expect(c.valueOf() instanceof String).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Green.valueOf());
    expect(Enum7[c]).assertEqual("Green");

    c = Enum7.fromValue("Blue");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Blue);
    expect(c.valueOf() instanceof String).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Blue.valueOf());
    expect(Enum7[c]).assertEqual("Blue");

    c = Enum7.fromValue(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.Complex);
    expect(c.valueOf() instanceof String).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.Complex.valueOf());
    expect(Enum7[c]).assertEqual("Complex");

    c = Enum7.fromValue("one");
    expect(c instanceof Enum7).assertTrue();
    expect(c).assertEqual(Enum7.oNe);
    expect(c.valueOf() instanceof String).assertTrue();
    expect(c.valueOf()).assertEqual(Enum7.oNe.valueOf());
    expect(Enum7[c]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_valueof_0.ets
  export function runTest112(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.valueOf()).assertEqual(0);

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.valueOf()).assertEqual(10);

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.valueOf()).assertEqual(11);

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.valueOf()).assertEqual(-2147483648);

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.valueOf()).assertEqual(12345);

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.valueOf()).assertEqual(2147483647);

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.valueOf()).assertEqual(1);

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.valueOf()).assertEqual(1);

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_4.ets
  export function runTest116(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.valueOf()).assertEqual(0);

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.valueOf()).assertEqual(10);

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.valueOf()).assertEqual(11);

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.valueOf()).assertEqual(12345);

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.valueOf()).assertEqual(1);

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.valueOf()).assertEqual(1);

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_8.ets
  export function runTest120(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.valueOf()).assertEqual(0);

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.valueOf()).assertEqual(10);

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.valueOf()).assertEqual(11);

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.valueOf()).assertEqual(-128);

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.valueOf()).assertEqual(123);

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.valueOf()).assertEqual(127);

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.valueOf()).assertEqual(1);

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.valueOf()).assertEqual(1);

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_12.ets
  export function runTest124(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.valueOf()).assertEqual(0);

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.valueOf()).assertEqual(10);

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.valueOf()).assertEqual(11);

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.valueOf()).assertEqual(-32768);

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.valueOf()).assertEqual(12345);

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.valueOf()).assertEqual(32767);

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.valueOf()).assertEqual(1);

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.valueOf()).assertEqual(1);

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_14.ets
  export function runTest126(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.valueOf()).assertEqual(0);

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.valueOf()).assertEqual(10);

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.valueOf()).assertEqual(11);

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.valueOf()).assertEqual(-32768);

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.valueOf()).assertEqual(12345);

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.valueOf()).assertEqual(32767);

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.valueOf()).assertEqual(1);

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.valueOf()).assertEqual(1);

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_valueof_16.ets
  export function runTest128(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.valueOf()).assertEqual(1.5);

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.valueOf()).assertEqual(10.3);

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.valueOf()).assertEqual(7.6);

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.valueOf()).assertEqual(123.45);

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.valueOf()).assertEqual(1.0);

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.valueOf()).assertEqual(1.0);

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_20.ets
  export function runTest132(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.valueOf()).assertEqual(1.5);

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.valueOf()).assertEqual(10.3);

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.valueOf()).assertEqual(7.6);

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.valueOf()).assertEqual(-214748.3648);

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.valueOf()).assertEqual(123.45);

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.valueOf()).assertEqual(2147483.647);

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.valueOf()).assertEqual(1.0);

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.valueOf()).assertEqual(1.0);

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_valueof_24.ets
  export function runTest136(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.valueOf()).assertEqual("reD");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.valueOf()).assertEqual("grEen");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.valueOf()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.valueOf()).assertEqual("one");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.valueOf()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.valueOf()).assertEqual("one");

    return true;
  }

  // enum_implicit_type_valueof_0.ets
  export function runTest202(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.valueOf()).assertEqual(0);

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.valueOf()).assertEqual(10);

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.valueOf()).assertEqual(11);

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.valueOf()).assertEqual(-2147483648);

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.valueOf()).assertEqual(12345);

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.valueOf()).assertEqual(2147483647);

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.valueOf()).assertEqual(1);

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.valueOf()).assertEqual(1);

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_implicit_type_valueof_4.ets
  export function runTest206(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.valueOf()).assertEqual(0);

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.valueOf()).assertEqual(10);

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.valueOf()).assertEqual(11);

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.valueOf()).assertEqual(12345);

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.valueOf()).assertEqual(1);

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.valueOf()).assertEqual(1);

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.valueOf()).assertEqual(1);

    return true;
  }

  // enum_implicit_type_valueof_8.ets
  export function runTest210(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.valueOf()).assertEqual("reD");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.valueOf()).assertEqual("grEen");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.valueOf()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.valueOf()).assertEqual("one");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.valueOf()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.valueOf()).assertEqual("one");

    return true;
  }
}

// enum_explicit_type_fromvalue_4.ets
enum Enum1: byte {
  Red, Green = 10, Blue,
  First = -128, Second = 123, Third = 127,
  One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_6.ets
enum Enum2: short { Red, Green = 10, Blue,
First = -32768, Second = 12345, Third = 32767,
One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_0.ets
enum Enum3: int {
  Red, Green = 10, Blue,
  First = -2147483648, Second = 12345, Third = 2147483647,
  One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_2.ets
enum Enum4: long {
  Red, Green = 10, Blue,
  First = -9223372036854775808, Second = 12345,
  Third = 9223372036854775807,
  One = 1, one = 1, oNe = 1
};

// enum_explicit_type_fromvalue_10.ets
enum Enum5: float { Red = 1.5f, Green = 10.3f, Blue = 7.6f,
First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
One = 1.0f, one = 1.0f, oNe = 1.0f
};

// enum_explicit_type_fromvalue_8.ets
enum Enum6: double { Red = 1.5, Green = 10.3, Blue = 7.6,
First = -214748.3648, Second = 123.45, Third = 2147483.647,
One = 1.0, one = 1.0, oNe = 1.0
};

// enum_explicit_type_fromvalue_12.ets
enum Enum7: string { Red = "reD", Green = "grEen", Blue = "Blue",
Complex =
  "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
One = "one", one = "one", oNe = "one"
};

export default function EnumerationMethodsTest01(): void {
  describe('EnumerationMethodsTest01', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    // fromValue tests
    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0001
     * @tc.desc      Checking for enum with explicit int type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum3.fromValue(0);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.Red);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.Red.valueOf());
      expect(Enum3[c]).assertEqual("Red");

      c = Enum3.fromValue(10);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.Green);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.Green.valueOf());
      expect(Enum3[c]).assertEqual("Green");

      c = Enum3.fromValue(11);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.Blue);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.Blue.valueOf());
      expect(Enum3[c]).assertEqual("Blue");

      c = Enum3.fromValue(-2147483648);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.First);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.First.valueOf());
      expect(Enum3[c]).assertEqual("First");

      c = Enum3.fromValue(12345);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.Second);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.Second.valueOf());
      expect(Enum3[c]).assertEqual("Second");

      c = Enum3.fromValue(2147483647);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.Third);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.Third.valueOf());
      expect(Enum3[c]).assertEqual("Third");

      c = Enum3.fromValue(1);
      expect(c instanceof Enum3).assertTrue();
      expect(c).assertEqual(Enum3.oNe);
      expect(c.valueOf() instanceof int).assertTrue();
      expect(c.valueOf()).assertEqual(Enum3.oNe.valueOf());
      expect(Enum3[c]).assertEqual("oNe");

      expect(testNS.runTest()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0003
     * @tc.desc      Checking for enum with explicit long type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum4.fromValue(0);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Red);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Red.valueOf());
      expect(Enum4[c]).assertEqual("Red");

      c = Enum4.fromValue(10);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Green);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Green.valueOf());
      expect(Enum4[c]).assertEqual("Green");

      c = Enum4.fromValue(11);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Blue);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Blue.valueOf());
      expect(Enum4[c]).assertEqual("Blue");

      c = Enum4.fromValue(-9223372036854775808);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.First);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.First.valueOf());
      expect(Enum4[c]).assertEqual("First");

      c = Enum4.fromValue(12345);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Second);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Second.valueOf());
      expect(Enum4[c]).assertEqual("Second");

      c = Enum4.fromValue(9223372036854775807);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Third);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Third.valueOf());
      expect(Enum4[c]).assertEqual("Third");

      c = Enum4.fromValue(1);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.oNe);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.oNe.valueOf());
      expect(Enum4[c]).assertEqual("oNe");

      expect(testNS.runTest2()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0004
     * @tc.desc      Checking for enum with explicit double type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum6.fromValue(1.5);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.Red);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.Red.valueOf());
      expect(Enum6[c]).assertEqual("Red");

      c = Enum6.fromValue(10.3);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.Green);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.Green.valueOf());
      expect(Enum6[c]).assertEqual("Green");

      c = Enum6.fromValue(7.6);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.Blue);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.Blue.valueOf());
      expect(Enum6[c]).assertEqual("Blue");

      c = Enum6.fromValue(-214748.3648);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.First);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.First.valueOf());
      expect(Enum6[c]).assertEqual("First");

      c = Enum6.fromValue(123.45);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.Second);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.Second.valueOf());
      expect(Enum6[c]).assertEqual("Second");

      c = Enum6.fromValue(2147483.647);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.Third);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.Third.valueOf());
      expect(Enum6[c]).assertEqual("Third");

      c = Enum6.fromValue(1.0);
      expect(c instanceof Enum6).assertTrue();
      expect(c).assertEqual(Enum6.oNe);
      expect(c.valueOf() instanceof double).assertTrue();
      expect(c.valueOf()).assertEqual(Enum6.oNe.valueOf());
      expect(Enum6[c]).assertEqual("oNe");

      expect(testNS.runTest8()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0005
     * @tc.desc      Checking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum5.fromValue(1.5f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.Red);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.Red.valueOf());
      expect(Enum5[c]).assertEqual("Red");

      c = Enum5.fromValue(10.3f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.Green);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.Green.valueOf());
      expect(Enum5[c]).assertEqual("Green");

      c = Enum5.fromValue(7.6f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.Blue);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.Blue.valueOf());
      expect(Enum5[c]).assertEqual("Blue");

      c = Enum5.fromValue(-214748.3648f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.First);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.First.valueOf());
      expect(Enum5[c]).assertEqual("First");

      c = Enum5.fromValue(123.45f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.Second);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.Second.valueOf());
      expect(Enum5[c]).assertEqual("Second");

      c = Enum5.fromValue(2147483.647f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.Third);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.Third.valueOf());
      expect(Enum5[c]).assertEqual("Third");

      c = Enum5.fromValue(1.0f);
      expect(c instanceof Enum5).assertTrue();
      expect(c).assertEqual(Enum5.oNe);
      expect(c.valueOf() instanceof float).assertTrue();
      expect(c.valueOf()).assertEqual(Enum5.oNe.valueOf());
      expect(Enum5[c]).assertEqual("oNe");

      expect(testNS.runTest10()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0006
     * @tc.desc      Checking for enum with explicit string type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum7.fromValue("reD");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Red);
      expect(c.valueOf() instanceof string).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Red.valueOf());
      expect(Enum7[c]).assertEqual("Red");

      c = Enum7.fromValue("grEen");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Green);
      expect(c.valueOf() instanceof string).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Green.valueOf());
      expect(Enum7[c]).assertEqual("Green");

      c = Enum7.fromValue("Blue");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Blue);
      expect(c.valueOf() instanceof string).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Blue.valueOf());
      expect(Enum7[c]).assertEqual("Blue");

      c = Enum7.fromValue(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Complex);
      expect(c.valueOf() instanceof string).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Complex.valueOf());
      expect(Enum7[c]).assertEqual("Complex");

      c = Enum7.fromValue("one");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.oNe);
      expect(c.valueOf() instanceof string).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.oNe.valueOf());
      expect(Enum7[c]).assertEqual("oNe");

      expect(testNS.runTest12()).assertTrue();
    });

    // fromValue subset tests
    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0008
     * @tc.desc      Checking for enum with implicit long type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum4.fromValue(0);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Red);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Red.valueOf());
      expect(Enum4[c]).assertEqual("Red");

      c = Enum4.fromValue(10);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Green);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Green.valueOf());
      expect(Enum4[c]).assertEqual("Green");

      c = Enum4.fromValue(11);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Blue);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Blue.valueOf());
      expect(Enum4[c]).assertEqual("Blue");

      c = Enum4.fromValue(-9223372036854775808);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.First);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.First.valueOf());
      expect(Enum4[c]).assertEqual("First");

      c = Enum4.fromValue(12345);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Second);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Second.valueOf());
      expect(Enum4[c]).assertEqual("Second");

      c = Enum4.fromValue(9223372036854775807);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.Third);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.Third.valueOf());
      expect(Enum4[c]).assertEqual("Third");

      c = Enum4.fromValue(1);
      expect(c instanceof Enum4).assertTrue();
      expect(c).assertEqual(Enum4.oNe);
      expect(c.valueOf() instanceof long).assertTrue();
      expect(c.valueOf()).assertEqual(Enum4.oNe.valueOf());
      expect(Enum4[c]).assertEqual("oNe");

      expect(testNS.runTest156()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0009
     * @tc.desc      Checking for enum with implicit string type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum7.fromValue("reD");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Red);
      expect(c.valueOf() instanceof String).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Red.valueOf());
      expect(Enum7[c]).assertEqual("Red");

      c = Enum7.fromValue("grEen");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Green);
      expect(c.valueOf() instanceof String).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Green.valueOf());
      expect(Enum7[c]).assertEqual("Green");

      c = Enum7.fromValue("Blue");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Blue);
      expect(c.valueOf() instanceof String).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Blue.valueOf());
      expect(Enum7[c]).assertEqual("Blue");

      c = Enum7.fromValue(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.Complex);
      expect(c.valueOf() instanceof String).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.Complex.valueOf());
      expect(Enum7[c]).assertEqual("Complex");

      c = Enum7.fromValue("one");
      expect(c instanceof Enum7).assertTrue();
      expect(c).assertEqual(Enum7.oNe);
      expect(c.valueOf() instanceof String).assertTrue();
      expect(c.valueOf()).assertEqual(Enum7.oNe.valueOf());
      expect(Enum7[c]).assertEqual("oNe");

      expect(testNS.runTest158()).assertTrue();
    });

    // valueOf tests
    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0010
     * @tc.desc      Checking for enum with explicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.valueOf()).assertEqual(0);

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.valueOf()).assertEqual(10);

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.valueOf()).assertEqual(11);

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.valueOf()).assertEqual(-2147483648);

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.valueOf()).assertEqual(12345);

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.valueOf()).assertEqual(2147483647);

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.valueOf()).assertEqual(1);

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.valueOf()).assertEqual(1);

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest112()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0011
     * @tc.desc      Checking for enum with explicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.valueOf()).assertEqual(0);

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.valueOf()).assertEqual(10);

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.valueOf()).assertEqual(11);

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.valueOf()).assertEqual(12345);

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.valueOf()).assertEqual(1);

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.valueOf()).assertEqual(1);

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest116()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0012
     * @tc.desc      Checking for enum with explicit byte type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.valueOf()).assertEqual(0);

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.valueOf()).assertEqual(10);

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.valueOf()).assertEqual(11);

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.valueOf()).assertEqual(-128);

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.valueOf()).assertEqual(123);

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.valueOf()).assertEqual(127);

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.valueOf()).assertEqual(1);

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.valueOf()).assertEqual(1);

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest120()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0013
     * @tc.desc      Checking for enum with explicit short type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.valueOf()).assertEqual(0);

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.valueOf()).assertEqual(10);

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.valueOf()).assertEqual(11);

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.valueOf()).assertEqual(-32768);

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.valueOf()).assertEqual(12345);

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.valueOf()).assertEqual(32767);

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.valueOf()).assertEqual(1);

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.valueOf()).assertEqual(1);

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest124()).assertTrue();
    });

    // valueOf tests
    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0014
     * @tc.desc      Checking for enum with explicit short type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.valueOf()).assertEqual(0);

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.valueOf()).assertEqual(10);

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.valueOf()).assertEqual(11);

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.valueOf()).assertEqual(-32768);

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.valueOf()).assertEqual(12345);

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.valueOf()).assertEqual(32767);

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.valueOf()).assertEqual(1);

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.valueOf()).assertEqual(1);

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest126()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1500
     * @tc.name      testEnumerationMethods0015
     * @tc.desc      Checking for enum with explicit double type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.valueOf()).assertEqual(1.5);

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.valueOf()).assertEqual(10.3);

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.valueOf()).assertEqual(7.6);

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.valueOf()).assertEqual(-214748.3648);

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.valueOf()).assertEqual(123.45);

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.valueOf()).assertEqual(2147483.647);

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.valueOf()).assertEqual(1.0);

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.valueOf()).assertEqual(1.0);

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.valueOf()).assertEqual(1.0);

      expect(testNS.runTest128()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1600
     * @tc.name      testEnumerationMethods0016
     * @tc.desc      Checking for enum with explicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.valueOf()).assertEqual("reD");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.valueOf()).assertEqual("grEen");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.valueOf()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.valueOf()).assertEqual("one");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.valueOf()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.valueOf()).assertEqual("one");

      expect(testNS.runTest136()).assertTrue();
    });

    // valueOf subset tests
    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1700
     * @tc.name      testEnumerationMethods0017
     * @tc.desc      Checking for enum with implicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.valueOf()).assertEqual(0);

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.valueOf()).assertEqual(10);

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.valueOf()).assertEqual(11);

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.valueOf()).assertEqual(-2147483648);

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.valueOf()).assertEqual(12345);

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.valueOf()).assertEqual(2147483647);

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.valueOf()).assertEqual(1);

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.valueOf()).assertEqual(1);

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest202()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1800
     * @tc.name      testEnumerationMethods0018
     * @tc.desc      Checking for enum with implicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.valueOf()).assertEqual(0);

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.valueOf()).assertEqual(10);

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.valueOf()).assertEqual(11);

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.valueOf()).assertEqual(12345);

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.valueOf()).assertEqual(1);

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.valueOf()).assertEqual(1);

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.valueOf()).assertEqual(1);

      expect(testNS.runTest206()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1900
     * @tc.name      testEnumerationMethods0019
     * @tc.desc      Checking for enum with implicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.valueOf()).assertEqual("reD");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.valueOf()).assertEqual("grEen");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.valueOf()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.valueOf()).assertEqual("one");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.valueOf()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.valueOf()).assertEqual("one");

      expect(testNS.runTest210()).assertTrue();
    });
  })
}
