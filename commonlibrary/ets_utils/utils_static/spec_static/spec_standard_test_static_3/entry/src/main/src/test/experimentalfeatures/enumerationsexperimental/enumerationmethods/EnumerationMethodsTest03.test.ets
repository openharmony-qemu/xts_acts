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

  // enum_explicit_type_getname_0.ets
  export function runTest28(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.getName() instanceof string).assertTrue();
    expect(Enum3.Red.getName()).assertEqual("Red");

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.getName() instanceof string).assertTrue();
    expect(Enum3.Green.getName()).assertEqual("Green");

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.getName() instanceof string).assertTrue();
    expect(Enum3.Blue.getName()).assertEqual("Blue");

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.getName() instanceof string).assertTrue();
    expect(Enum3.First.getName()).assertEqual("First");

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.getName() instanceof string).assertTrue();
    expect(Enum3.Second.getName()).assertEqual("Second");

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.getName() instanceof string).assertTrue();
    expect(Enum3.Third.getName()).assertEqual("Third");

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.getName() instanceof string).assertTrue();
    expect(Enum3.One.getName()).assertEqual("One");

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.getName() instanceof string).assertTrue();
    expect(Enum3.one.getName()).assertEqual("one");

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.getName() instanceof string).assertTrue();
    expect(Enum3.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_1.ets
  export function runTest29(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.getName() instanceof string).assertTrue();
    expect(Enum3.Red.getName()).assertEqual("Red");

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.getName() instanceof string).assertTrue();
    expect(Enum3.Green.getName()).assertEqual("Green");

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.getName() instanceof string).assertTrue();
    expect(Enum3.Blue.getName()).assertEqual("Blue");

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.getName() instanceof string).assertTrue();
    expect(Enum3.First.getName()).assertEqual("First");

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.getName() instanceof string).assertTrue();
    expect(Enum3.Second.getName()).assertEqual("Second");

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.getName() instanceof string).assertTrue();
    expect(Enum3.Third.getName()).assertEqual("Third");

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.getName() instanceof string).assertTrue();
    expect(Enum3.One.getName()).assertEqual("One");

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.getName() instanceof string).assertTrue();
    expect(Enum3.one.getName()).assertEqual("one");

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.getName() instanceof string).assertTrue();
    expect(Enum3.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_2.ets
  export function runTest30(): boolean {

    expect(Enum3.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Red.getName() instanceof String).assertTrue();
    expect(Enum3.Red.getName()).assertEqual("Red");

    expect(Enum3.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Green.getName() instanceof String).assertTrue();
    expect(Enum3.Green.getName()).assertEqual("Green");

    expect(Enum3.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Blue.getName() instanceof String).assertTrue();
    expect(Enum3.Blue.getName()).assertEqual("Blue");

    expect(Enum3.First.valueOf() instanceof Number).assertTrue();
    expect(Enum3.First.getName() instanceof String).assertTrue();
    expect(Enum3.First.getName()).assertEqual("First");

    expect(Enum3.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Second.getName() instanceof String).assertTrue();
    expect(Enum3.Second.getName()).assertEqual("Second");

    expect(Enum3.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Third.getName() instanceof String).assertTrue();
    expect(Enum3.Third.getName()).assertEqual("Third");

    expect(Enum3.One.valueOf() instanceof Number).assertTrue();
    expect(Enum3.One.getName() instanceof String).assertTrue();
    expect(Enum3.One.getName()).assertEqual("One");

    expect(Enum3.one.valueOf() instanceof Number).assertTrue();
    expect(Enum3.one.getName() instanceof String).assertTrue();
    expect(Enum3.one.getName()).assertEqual("one");

    expect(Enum3.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum3.oNe.getName() instanceof String).assertTrue();
    expect(Enum3.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_3.ets
  export function runTest31(): boolean {

    expect(Enum3.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Red.getName() instanceof String).assertTrue();
    expect(Enum3.Red.getName()).assertEqual("Red");

    expect(Enum3.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Green.getName() instanceof String).assertTrue();
    expect(Enum3.Green.getName()).assertEqual("Green");

    expect(Enum3.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Blue.getName() instanceof String).assertTrue();
    expect(Enum3.Blue.getName()).assertEqual("Blue");

    expect(Enum3.First.valueOf() instanceof Number).assertTrue();
    expect(Enum3.First.getName() instanceof String).assertTrue();
    expect(Enum3.First.getName()).assertEqual("First");

    expect(Enum3.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Second.getName() instanceof String).assertTrue();
    expect(Enum3.Second.getName()).assertEqual("Second");

    expect(Enum3.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum3.Third.getName() instanceof String).assertTrue();
    expect(Enum3.Third.getName()).assertEqual("Third");

    expect(Enum3.One.valueOf() instanceof Number).assertTrue();
    expect(Enum3.One.getName() instanceof String).assertTrue();
    expect(Enum3.One.getName()).assertEqual("One");

    expect(Enum3.one.valueOf() instanceof Number).assertTrue();
    expect(Enum3.one.getName() instanceof String).assertTrue();
    expect(Enum3.one.getName()).assertEqual("one");

    expect(Enum3.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum3.oNe.getName() instanceof String).assertTrue();
    expect(Enum3.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_4.ets
  export function runTest32(): boolean {
    expect(Enum4.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Red.getName() instanceof String).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Green.getName() instanceof String).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Blue.getName() instanceof String).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof Number).assertTrue();
    expect(Enum4.First.getName() instanceof String).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Second.getName() instanceof String).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Third.getName() instanceof String).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof Number).assertTrue();
    expect(Enum4.One.getName() instanceof String).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof Number).assertTrue();
    expect(Enum4.one.getName() instanceof String).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum4.oNe.getName() instanceof String).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_5.ets
  export function runTest33(): boolean {
    expect(Enum4.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Red.getName() instanceof String).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Green.getName() instanceof String).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Blue.getName() instanceof String).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof Number).assertTrue();
    expect(Enum4.First.getName() instanceof String).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Second.getName() instanceof String).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Third.getName() instanceof String).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof Number).assertTrue();
    expect(Enum4.One.getName() instanceof String).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof Number).assertTrue();
    expect(Enum4.one.getName() instanceof String).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum4.oNe.getName() instanceof String).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_6.ets
  export function runTest34(): boolean {
    expect(Enum4.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Red.getName() instanceof String).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Green.getName() instanceof String).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Blue.getName() instanceof String).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof Number).assertTrue();
    expect(Enum4.First.getName() instanceof String).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Second.getName() instanceof String).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Third.getName() instanceof String).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof Number).assertTrue();
    expect(Enum4.One.getName() instanceof String).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof Number).assertTrue();
    expect(Enum4.one.getName() instanceof String).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum4.oNe.getName() instanceof String).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_7.ets
  export function runTest35(): boolean {
    expect(Enum4.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Red.getName() instanceof String).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Green.getName() instanceof String).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Blue.getName() instanceof String).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof Number).assertTrue();
    expect(Enum4.First.getName() instanceof String).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Second.getName() instanceof String).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum4.Third.getName() instanceof String).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof Number).assertTrue();
    expect(Enum4.One.getName() instanceof String).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof Number).assertTrue();
    expect(Enum4.one.getName() instanceof String).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum4.oNe.getName() instanceof String).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_8.ets
  export function runTest36(): boolean {
    expect(Enum1.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Red.getName() instanceof String).assertTrue();
    expect(Enum1.Red.getName()).assertEqual("Red");

    expect(Enum1.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Green.getName() instanceof String).assertTrue();
    expect(Enum1.Green.getName()).assertEqual("Green");

    expect(Enum1.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Blue.getName() instanceof String).assertTrue();
    expect(Enum1.Blue.getName()).assertEqual("Blue");

    expect(Enum1.First.valueOf() instanceof Number).assertTrue();
    expect(Enum1.First.getName() instanceof String).assertTrue();
    expect(Enum1.First.getName()).assertEqual("First");

    expect(Enum1.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Second.getName() instanceof String).assertTrue();
    expect(Enum1.Second.getName()).assertEqual("Second");

    expect(Enum1.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Third.getName() instanceof String).assertTrue();
    expect(Enum1.Third.getName()).assertEqual("Third");

    expect(Enum1.One.valueOf() instanceof Number).assertTrue();
    expect(Enum1.One.getName() instanceof String).assertTrue();
    expect(Enum1.One.getName()).assertEqual("One");

    expect(Enum1.one.valueOf() instanceof Number).assertTrue();
    expect(Enum1.one.getName() instanceof String).assertTrue();
    expect(Enum1.one.getName()).assertEqual("one");

    expect(Enum1.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum1.oNe.getName() instanceof String).assertTrue();
    expect(Enum1.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_9.ets
  export function runTest37(): boolean {
    expect(Enum1.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Red.getName() instanceof String).assertTrue();
    expect(Enum1.Red.getName()).assertEqual("Red");

    expect(Enum1.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Green.getName() instanceof String).assertTrue();
    expect(Enum1.Green.getName()).assertEqual("Green");

    expect(Enum1.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Blue.getName() instanceof String).assertTrue();
    expect(Enum1.Blue.getName()).assertEqual("Blue");

    expect(Enum1.First.valueOf() instanceof Number).assertTrue();
    expect(Enum1.First.getName() instanceof String).assertTrue();
    expect(Enum1.First.getName()).assertEqual("First");

    expect(Enum1.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Second.getName() instanceof String).assertTrue();
    expect(Enum1.Second.getName()).assertEqual("Second");

    expect(Enum1.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Third.getName() instanceof String).assertTrue();
    expect(Enum1.Third.getName()).assertEqual("Third");

    expect(Enum1.One.valueOf() instanceof Number).assertTrue();
    expect(Enum1.One.getName() instanceof String).assertTrue();
    expect(Enum1.One.getName()).assertEqual("One");

    expect(Enum1.one.valueOf() instanceof Number).assertTrue();
    expect(Enum1.one.getName() instanceof String).assertTrue();
    expect(Enum1.one.getName()).assertEqual("one");

    expect(Enum1.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum1.oNe.getName() instanceof String).assertTrue();
    expect(Enum1.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_10.ets
  export function runTest38(): boolean {
    expect(Enum1.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Red.getName() instanceof String).assertTrue();
    expect(Enum1.Red.getName()).assertEqual("Red");

    expect(Enum1.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Green.getName() instanceof String).assertTrue();
    expect(Enum1.Green.getName()).assertEqual("Green");

    expect(Enum1.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Blue.getName() instanceof String).assertTrue();
    expect(Enum1.Blue.getName()).assertEqual("Blue");

    expect(Enum1.First.valueOf() instanceof Number).assertTrue();
    expect(Enum1.First.getName() instanceof String).assertTrue();
    expect(Enum1.First.getName()).assertEqual("First");

    expect(Enum1.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Second.getName() instanceof String).assertTrue();
    expect(Enum1.Second.getName()).assertEqual("Second");

    expect(Enum1.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Third.getName() instanceof String).assertTrue();
    expect(Enum1.Third.getName()).assertEqual("Third");

    expect(Enum1.One.valueOf() instanceof Number).assertTrue();
    expect(Enum1.One.getName() instanceof String).assertTrue();
    expect(Enum1.One.getName()).assertEqual("One");

    expect(Enum1.one.valueOf() instanceof Number).assertTrue();
    expect(Enum1.one.getName() instanceof String).assertTrue();
    expect(Enum1.one.getName()).assertEqual("one");

    expect(Enum1.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum1.oNe.getName() instanceof String).assertTrue();
    expect(Enum1.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_11.ets
  export function runTest39(): boolean {
    expect(Enum1.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Red.getName() instanceof String).assertTrue();
    expect(Enum1.Red.getName()).assertEqual("Red");

    expect(Enum1.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Green.getName() instanceof String).assertTrue();
    expect(Enum1.Green.getName()).assertEqual("Green");

    expect(Enum1.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Blue.getName() instanceof String).assertTrue();
    expect(Enum1.Blue.getName()).assertEqual("Blue");

    expect(Enum1.First.valueOf() instanceof Number).assertTrue();
    expect(Enum1.First.getName() instanceof String).assertTrue();
    expect(Enum1.First.getName()).assertEqual("First");

    expect(Enum1.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Second.getName() instanceof String).assertTrue();
    expect(Enum1.Second.getName()).assertEqual("Second");

    expect(Enum1.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum1.Third.getName() instanceof String).assertTrue();
    expect(Enum1.Third.getName()).assertEqual("Third");

    expect(Enum1.One.valueOf() instanceof Number).assertTrue();
    expect(Enum1.One.getName() instanceof String).assertTrue();
    expect(Enum1.One.getName()).assertEqual("One");

    expect(Enum1.one.valueOf() instanceof Number).assertTrue();
    expect(Enum1.one.getName() instanceof String).assertTrue();
    expect(Enum1.one.getName()).assertEqual("one");

    expect(Enum1.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum1.oNe.getName() instanceof String).assertTrue();
    expect(Enum1.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_12.ets
  export function runTest40(): boolean {
    expect(Enum2.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Red.getName() instanceof String).assertTrue();
    expect(Enum2.Red.getName()).assertEqual("Red");

    expect(Enum2.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Green.getName() instanceof String).assertTrue();
    expect(Enum2.Green.getName()).assertEqual("Green");

    expect(Enum2.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Blue.getName() instanceof String).assertTrue();
    expect(Enum2.Blue.getName()).assertEqual("Blue");

    expect(Enum2.First.valueOf() instanceof Number).assertTrue();
    expect(Enum2.First.getName() instanceof String).assertTrue();
    expect(Enum2.First.getName()).assertEqual("First");

    expect(Enum2.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Second.getName() instanceof String).assertTrue();
    expect(Enum2.Second.getName()).assertEqual("Second");

    expect(Enum2.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Third.getName() instanceof String).assertTrue();
    expect(Enum2.Third.getName()).assertEqual("Third");

    expect(Enum2.One.valueOf() instanceof Number).assertTrue();
    expect(Enum2.One.getName() instanceof String).assertTrue();
    expect(Enum2.One.getName()).assertEqual("One");

    expect(Enum2.one.valueOf() instanceof Number).assertTrue();
    expect(Enum2.one.getName() instanceof String).assertTrue();
    expect(Enum2.one.getName()).assertEqual("one");

    expect(Enum2.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum2.oNe.getName() instanceof String).assertTrue();
    expect(Enum2.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_getname_13.ets
  export function runTest41(): boolean {
    expect(Enum2.Red.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Red.getName() instanceof String).assertTrue();
    expect(Enum2.Red.getName()).assertEqual("Red");

    expect(Enum2.Green.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Green.getName() instanceof String).assertTrue();
    expect(Enum2.Green.getName()).assertEqual("Green");

    expect(Enum2.Blue.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Blue.getName() instanceof String).assertTrue();
    expect(Enum2.Blue.getName()).assertEqual("Blue");

    expect(Enum2.First.valueOf() instanceof Number).assertTrue();
    expect(Enum2.First.getName() instanceof String).assertTrue();
    expect(Enum2.First.getName()).assertEqual("First");

    expect(Enum2.Second.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Second.getName() instanceof String).assertTrue();
    expect(Enum2.Second.getName()).assertEqual("Second");

    expect(Enum2.Third.valueOf() instanceof Number).assertTrue();
    expect(Enum2.Third.getName() instanceof String).assertTrue();
    expect(Enum2.Third.getName()).assertEqual("Third");

    expect(Enum2.One.valueOf() instanceof Number).assertTrue();
    expect(Enum2.One.getName() instanceof String).assertTrue();
    expect(Enum2.One.getName()).assertEqual("One");

    expect(Enum2.one.valueOf() instanceof Number).assertTrue();
    expect(Enum2.one.getName() instanceof String).assertTrue();
    expect(Enum2.one.getName()).assertEqual("one");

    expect(Enum2.oNe.valueOf() instanceof Number).assertTrue();
    expect(Enum2.oNe.getName() instanceof String).assertTrue();
    expect(Enum2.oNe.getName()).assertEqual("oNe");

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
     * 源文件：        enum_explicit_type_fromvalue_rte_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0015
     * @tc.desc      Checking for enum with explicit int type constant for fromValue method support which should throws
     *               an error if no constant has such a value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * 源文件：        enum_explicit_type_getname_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0029
     * @tc.desc      Checking for enum with explicit int type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.getName() instanceof string).assertTrue();
      expect(Enum3.Red.getName()).assertEqual("Red");

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.getName() instanceof string).assertTrue();
      expect(Enum3.Green.getName()).assertEqual("Green");

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.getName() instanceof string).assertTrue();
      expect(Enum3.Blue.getName()).assertEqual("Blue");

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.getName() instanceof string).assertTrue();
      expect(Enum3.First.getName()).assertEqual("First");

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.getName() instanceof string).assertTrue();
      expect(Enum3.Second.getName()).assertEqual("Second");

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.getName() instanceof string).assertTrue();
      expect(Enum3.Third.getName()).assertEqual("Third");

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.getName() instanceof string).assertTrue();
      expect(Enum3.One.getName()).assertEqual("One");

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.getName() instanceof string).assertTrue();
      expect(Enum3.one.getName()).assertEqual("one");

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.getName() instanceof string).assertTrue();
      expect(Enum3.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest28()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getname_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0030
     * @tc.desc      Checking for enum with explicit int type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.getName() instanceof string).assertTrue();
      expect(Enum3.Red.getName()).assertEqual("Red");

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.getName() instanceof string).assertTrue();
      expect(Enum3.Green.getName()).assertEqual("Green");

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.getName() instanceof string).assertTrue();
      expect(Enum3.Blue.getName()).assertEqual("Blue");

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.getName() instanceof string).assertTrue();
      expect(Enum3.First.getName()).assertEqual("First");

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.getName() instanceof string).assertTrue();
      expect(Enum3.Second.getName()).assertEqual("Second");

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.getName() instanceof string).assertTrue();
      expect(Enum3.Third.getName()).assertEqual("Third");

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.getName() instanceof string).assertTrue();
      expect(Enum3.One.getName()).assertEqual("One");

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.getName() instanceof string).assertTrue();
      expect(Enum3.one.getName()).assertEqual("one");

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.getName() instanceof string).assertTrue();
      expect(Enum3.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest29()).assertTrue();
    });
  })
}