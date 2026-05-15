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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

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

  // enum_explicit_type_fromvalue_1.ets
  export function runTest1(): boolean {
    let c = Enum3.fromValue(0)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.Red)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.Red.valueOf())
    expect(Enum3[c]).assertEqual("Red")

    c = Enum3.fromValue(10)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.Green)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.Green.valueOf())
    expect(Enum3[c]).assertEqual("Green")

    c = Enum3.fromValue(11)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.Blue)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.Blue.valueOf())
    expect(Enum3[c]).assertEqual("Blue")

    c = Enum3.fromValue(-2147483648)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.First)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.First.valueOf())
    expect(Enum3[c]).assertEqual("First")

    c = Enum3.fromValue(12345)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.Second)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.Second.valueOf())
    expect(Enum3[c]).assertEqual("Second")

    c = Enum3.fromValue(2147483647)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.Third)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.Third.valueOf())
    expect(Enum3[c]).assertEqual("Third")

    c = Enum3.fromValue(1)
    expect(c instanceof Enum3).assertTrue()
    expect(c).assertEqual(Enum3.oNe)
    expect(c.valueOf() instanceof int).assertTrue()
    expect(c.valueOf()).assertEqual(Enum3.oNe.valueOf())
    expect(Enum3[c]).assertEqual("oNe")

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

  // enum_explicit_type_fromvalue_3.ets
  export function runTest3(): boolean {
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

  // enum_explicit_type_fromvalue_4.ets
  export function runTest4(): boolean {
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

  // enum_explicit_type_fromvalue_5.ets
  export function runTest5(): boolean {
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

  // enum_explicit_type_fromvalue_6.ets
  export function runTest6(): boolean {
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

  // enum_explicit_type_fromvalue_7.ets
  export function runTest7(): boolean {
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

  // enum_explicit_type_fromvalue_9.ets
  export function runTest9(): boolean {
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

  // enum_explicit_type_fromvalue_11.ets
  export function runTest11(): boolean {
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

  // enum_explicit_type_fromvalue_13.ets
  export function runTest13(): boolean {
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

export default function EnumerationMethodsTest(): void {
  describe('EnumerationMethodsTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * 源文件：        enum_explicit_type_fromvalue_0.ets
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
     * 源文件：        enum_explicit_type_fromvalue_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0002
     * @tc.desc      Checking for enum with explicit int type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest1()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_2.ets
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
     * 源文件：        enum_explicit_type_fromvalue_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0004
     * @tc.desc      Checking for enum with explicit long type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest3()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0005
     * @tc.desc      Checking for enum with explicit byte type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest4()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0006
     * @tc.desc      Checking for enum with explicit byte type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest5()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0007
     * @tc.desc      Checking for enum with explicit short type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest6()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0008
     * @tc.desc      Checking for enum with explicit short type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest7()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0009
     * @tc.desc      Checking for enum with explicit double type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * 源文件：        enum_explicit_type_fromvalue_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0010
     * @tc.desc      Checking for enum with explicit double type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest9()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0011
     * @tc.desc      Checking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * 源文件：        enum_explicit_type_fromvalue_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0012
     * @tc.desc      Checking for enum with explicit float type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest11()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_fromvalue_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0013
     * @tc.desc      Checking for enum with explicit string type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * 源文件：        enum_explicit_type_fromvalue_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0014
     * @tc.desc      Checking for enum with explicit string type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest13()).assertTrue();
    });
  })
}