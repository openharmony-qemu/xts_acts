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


  // enum_explicit_type_getvalueof_0.ets
  export function runTest56(): boolean {
    expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
    expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
    expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
    expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
    expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

    expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
    expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
    expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

    expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
    expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
    expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
    expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_1.ets
  export function runTest57(): boolean {
    expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
    expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
    expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
    expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
    expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

    expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
    expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
    expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

    expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
    expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
    expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
    expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
    expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
    expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_2.ets
  export function runTest58(): boolean {
    expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
    expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
    expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
    expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
    expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
    expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
    expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
    expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
    expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
    expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_3.ets
  export function runTest59(): boolean {
    expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
    expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
    expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
    expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
    expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

    expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
    expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
    expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

    expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
    expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
    expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
    expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
    expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
    expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_4.ets
  export function runTest60(): boolean {
    expect(Enum1.getValueOf("Red") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Red")).assertEqual(Enum1.Red);
    expect(Enum1.getValueOf("Red").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum1.getValueOf("Green") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Green")).assertEqual(Enum1.Green);
    expect(Enum1.getValueOf("Green").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum1.getValueOf("Blue") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Blue")).assertEqual(Enum1.Blue);
    expect(Enum1.getValueOf("Blue").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum1.getValueOf("First") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("First")).assertEqual(Enum1.First);
    expect(Enum1.getValueOf("First").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("First").valueOf()).assertEqual(-128);

    expect(Enum1.getValueOf("Second") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Second")).assertEqual(Enum1.Second);
    expect(Enum1.getValueOf("Second").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Second").valueOf()).assertEqual(123);

    expect(Enum1.getValueOf("Third") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Third")).assertEqual(Enum1.Third);
    expect(Enum1.getValueOf("Third").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Third").valueOf()).assertEqual(127);

    expect(Enum1.getValueOf("One") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("One")).assertEqual(Enum1.One);
    expect(Enum1.getValueOf("One").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum1.getValueOf("one") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("one")).assertEqual(Enum1.one);
    expect(Enum1.getValueOf("one").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum1.getValueOf("oNe") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("oNe")).assertEqual(Enum1.oNe);
    expect(Enum1.getValueOf("oNe").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_5.ets
  export function runTest61(): boolean {
    expect(Enum1.getValueOf("Red") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Red")).assertEqual(Enum1.Red);
    expect(Enum1.getValueOf("Red").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum1.getValueOf("Green") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Green")).assertEqual(Enum1.Green);
    expect(Enum1.getValueOf("Green").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum1.getValueOf("Blue") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Blue")).assertEqual(Enum1.Blue);
    expect(Enum1.getValueOf("Blue").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum1.getValueOf("First") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("First")).assertEqual(Enum1.First);
    expect(Enum1.getValueOf("First").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("First").valueOf()).assertEqual(-128);

    expect(Enum1.getValueOf("Second") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Second")).assertEqual(Enum1.Second);
    expect(Enum1.getValueOf("Second").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Second").valueOf()).assertEqual(123);

    expect(Enum1.getValueOf("Third") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("Third")).assertEqual(Enum1.Third);
    expect(Enum1.getValueOf("Third").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("Third").valueOf()).assertEqual(127);

    expect(Enum1.getValueOf("One") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("One")).assertEqual(Enum1.One);
    expect(Enum1.getValueOf("One").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum1.getValueOf("one") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("one")).assertEqual(Enum1.one);
    expect(Enum1.getValueOf("one").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum1.getValueOf("oNe") instanceof Enum1).assertTrue();
    expect(Enum1.getValueOf("oNe")).assertEqual(Enum1.oNe);
    expect(Enum1.getValueOf("oNe").valueOf() instanceof byte).assertTrue();
    expect(Enum1.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_6.ets
  export function runTest62(): boolean {
    expect(Enum2.getValueOf("Red") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Red")).assertEqual(Enum2.Red);
    expect(Enum2.getValueOf("Red").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum2.getValueOf("Green") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Green")).assertEqual(Enum2.Green);
    expect(Enum2.getValueOf("Green").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum2.getValueOf("Blue") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Blue")).assertEqual(Enum2.Blue);
    expect(Enum2.getValueOf("Blue").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum2.getValueOf("First") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("First")).assertEqual(Enum2.First);
    expect(Enum2.getValueOf("First").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("First").valueOf()).assertEqual(-32768);

    expect(Enum2.getValueOf("Second") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Second")).assertEqual(Enum2.Second);
    expect(Enum2.getValueOf("Second").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum2.getValueOf("Third") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Third")).assertEqual(Enum2.Third);
    expect(Enum2.getValueOf("Third").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Third").valueOf()).assertEqual(32767);

    expect(Enum2.getValueOf("One") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("One")).assertEqual(Enum2.One);
    expect(Enum2.getValueOf("One").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum2.getValueOf("one") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("one")).assertEqual(Enum2.one);
    expect(Enum2.getValueOf("one").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum2.getValueOf("oNe") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("oNe")).assertEqual(Enum2.oNe);
    expect(Enum2.getValueOf("oNe").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_7.ets
  export function runTest63(): boolean {
    expect(Enum2.getValueOf("Red") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Red")).assertEqual(Enum2.Red);
    expect(Enum2.getValueOf("Red").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Red").valueOf()).assertEqual(0);

    expect(Enum2.getValueOf("Green") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Green")).assertEqual(Enum2.Green);
    expect(Enum2.getValueOf("Green").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Green").valueOf()).assertEqual(10);

    expect(Enum2.getValueOf("Blue") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Blue")).assertEqual(Enum2.Blue);
    expect(Enum2.getValueOf("Blue").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Blue").valueOf()).assertEqual(11);

    expect(Enum2.getValueOf("First") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("First")).assertEqual(Enum2.First);
    expect(Enum2.getValueOf("First").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("First").valueOf()).assertEqual(-32768);

    expect(Enum2.getValueOf("Second") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Second")).assertEqual(Enum2.Second);
    expect(Enum2.getValueOf("Second").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Second").valueOf()).assertEqual(12345);

    expect(Enum2.getValueOf("Third") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("Third")).assertEqual(Enum2.Third);
    expect(Enum2.getValueOf("Third").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("Third").valueOf()).assertEqual(32767);

    expect(Enum2.getValueOf("One") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("One")).assertEqual(Enum2.One);
    expect(Enum2.getValueOf("One").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("One").valueOf()).assertEqual(1);

    expect(Enum2.getValueOf("one") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("one")).assertEqual(Enum2.one);
    expect(Enum2.getValueOf("one").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("one").valueOf()).assertEqual(1);

    expect(Enum2.getValueOf("oNe") instanceof Enum2).assertTrue();
    expect(Enum2.getValueOf("oNe")).assertEqual(Enum2.oNe);
    expect(Enum2.getValueOf("oNe").valueOf() instanceof short).assertTrue();
    expect(Enum2.getValueOf("oNe").valueOf()).assertEqual(1);

    return true;
  }

  // enum_explicit_type_getvalueof_8.ets
  export function runTest64(): boolean {
    expect(Enum6.getValueOf("Red") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Red")).assertEqual(Enum6.Red);
    expect(Enum6.getValueOf("Red").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Red").valueOf()).assertEqual(1.5);

    expect(Enum6.getValueOf("Green") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Green")).assertEqual(Enum6.Green);
    expect(Enum6.getValueOf("Green").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Green").valueOf()).assertEqual(10.3);

    expect(Enum6.getValueOf("Blue") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Blue")).assertEqual(Enum6.Blue);
    expect(Enum6.getValueOf("Blue").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Blue").valueOf()).assertEqual(7.6);

    expect(Enum6.getValueOf("First") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("First")).assertEqual(Enum6.First);
    expect(Enum6.getValueOf("First").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("First").valueOf()).assertEqual(-214748.3648);

    expect(Enum6.getValueOf("Second") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Second")).assertEqual(Enum6.Second);
    expect(Enum6.getValueOf("Second").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Second").valueOf()).assertEqual(123.45);

    expect(Enum6.getValueOf("Third") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Third")).assertEqual(Enum6.Third);
    expect(Enum6.getValueOf("Third").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Third").valueOf()).assertEqual(2147483.647);

    expect(Enum6.getValueOf("One") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("One")).assertEqual(Enum6.One);
    expect(Enum6.getValueOf("One").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("One").valueOf()).assertEqual(1.0);

    expect(Enum6.getValueOf("one") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("one")).assertEqual(Enum6.one);
    expect(Enum6.getValueOf("one").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("one").valueOf()).assertEqual(1.0);

    expect(Enum6.getValueOf("oNe") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("oNe")).assertEqual(Enum6.oNe);
    expect(Enum6.getValueOf("oNe").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("oNe").valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_getvalueof_9.ets
  export function runTest65(): boolean {
    expect(Enum6.getValueOf("Red") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Red")).assertEqual(Enum6.Red);
    expect(Enum6.getValueOf("Red").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Red").valueOf()).assertEqual(1.5);

    expect(Enum6.getValueOf("Green") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Green")).assertEqual(Enum6.Green);
    expect(Enum6.getValueOf("Green").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Green").valueOf()).assertEqual(10.3);

    expect(Enum6.getValueOf("Blue") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Blue")).assertEqual(Enum6.Blue);
    expect(Enum6.getValueOf("Blue").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Blue").valueOf()).assertEqual(7.6);

    expect(Enum6.getValueOf("First") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("First")).assertEqual(Enum6.First);
    expect(Enum6.getValueOf("First").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("First").valueOf()).assertEqual(-214748.3648);

    expect(Enum6.getValueOf("Second") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Second")).assertEqual(Enum6.Second);
    expect(Enum6.getValueOf("Second").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Second").valueOf()).assertEqual(123.45);

    expect(Enum6.getValueOf("Third") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("Third")).assertEqual(Enum6.Third);
    expect(Enum6.getValueOf("Third").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("Third").valueOf()).assertEqual(2147483.647);

    expect(Enum6.getValueOf("One") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("One")).assertEqual(Enum6.One);
    expect(Enum6.getValueOf("One").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("One").valueOf()).assertEqual(1.0);

    expect(Enum6.getValueOf("one") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("one")).assertEqual(Enum6.one);
    expect(Enum6.getValueOf("one").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("one").valueOf()).assertEqual(1.0);

    expect(Enum6.getValueOf("oNe") instanceof Enum6).assertTrue();
    expect(Enum6.getValueOf("oNe")).assertEqual(Enum6.oNe);
    expect(Enum6.getValueOf("oNe").valueOf() instanceof double).assertTrue();
    expect(Enum6.getValueOf("oNe").valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_getvalueof_10.ets
  export function runTest66(): boolean {
    expect(Enum5.getValueOf("Red") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Red")).assertEqual(Enum5.Red);
    expect(Enum5.getValueOf("Red").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Red").valueOf()).assertEqual(1.5);

    expect(Enum5.getValueOf("Green") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Green")).assertEqual(Enum5.Green);
    expect(Enum5.getValueOf("Green").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Green").valueOf()).assertEqual(10.3);

    expect(Enum5.getValueOf("Blue") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Blue")).assertEqual(Enum5.Blue);
    expect(Enum5.getValueOf("Blue").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Blue").valueOf()).assertEqual(7.6);

    expect(Enum5.getValueOf("First") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("First")).assertEqual(Enum5.First);
    expect(Enum5.getValueOf("First").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("First").valueOf()).assertEqual(-214748.3648);

    expect(Enum5.getValueOf("Second") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Second")).assertEqual(Enum5.Second);
    expect(Enum5.getValueOf("Second").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Second").valueOf()).assertEqual(123.45);

    expect(Enum5.getValueOf("Third") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Third")).assertEqual(Enum5.Third);
    expect(Enum5.getValueOf("Third").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Third").valueOf()).assertEqual(2147483.647);

    expect(Enum5.getValueOf("One") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("One")).assertEqual(Enum5.One);
    expect(Enum5.getValueOf("One").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("One").valueOf()).assertEqual(1.0);

    expect(Enum5.getValueOf("one") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("one")).assertEqual(Enum5.one);
    expect(Enum5.getValueOf("one").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("one").valueOf()).assertEqual(1.0);

    expect(Enum5.getValueOf("oNe") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("oNe")).assertEqual(Enum5.oNe);
    expect(Enum5.getValueOf("oNe").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("oNe").valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_getvalueof_11.ets
  export function runTest67(): boolean {
    expect(Enum5.getValueOf("Red") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Red")).assertEqual(Enum5.Red);
    expect(Enum5.getValueOf("Red").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Red").valueOf()).assertEqual(1.5);

    expect(Enum5.getValueOf("Green") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Green")).assertEqual(Enum5.Green);
    expect(Enum5.getValueOf("Green").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Green").valueOf()).assertEqual(10.3);

    expect(Enum5.getValueOf("Blue") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Blue")).assertEqual(Enum5.Blue);
    expect(Enum5.getValueOf("Blue").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Blue").valueOf()).assertEqual(7.6);

    expect(Enum5.getValueOf("First") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("First")).assertEqual(Enum5.First);
    expect(Enum5.getValueOf("First").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("First").valueOf()).assertEqual(-214748.3648);

    expect(Enum5.getValueOf("Second") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Second")).assertEqual(Enum5.Second);
    expect(Enum5.getValueOf("Second").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Second").valueOf()).assertEqual(123.45);

    expect(Enum5.getValueOf("Third") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("Third")).assertEqual(Enum5.Third);
    expect(Enum5.getValueOf("Third").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("Third").valueOf()).assertEqual(2147483.647);

    expect(Enum5.getValueOf("One") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("One")).assertEqual(Enum5.One);
    expect(Enum5.getValueOf("One").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("One").valueOf()).assertEqual(1.0);

    expect(Enum5.getValueOf("one") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("one")).assertEqual(Enum5.one);
    expect(Enum5.getValueOf("one").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("one").valueOf()).assertEqual(1.0);

    expect(Enum5.getValueOf("oNe") instanceof Enum5).assertTrue();
    expect(Enum5.getValueOf("oNe")).assertEqual(Enum5.oNe);
    expect(Enum5.getValueOf("oNe").valueOf() instanceof float).assertTrue();
    expect(Enum5.getValueOf("oNe").valueOf()).assertEqual(1.0);

    return true;
  }

  // enum_explicit_type_getvalueof_12.ets
  export function runTest68(): boolean {
    expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
    expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

    expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
    expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

    expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
    expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

    expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
    expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
    expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
    expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
    expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

    return true;
  }

  // enum_explicit_type_getvalueof_13.ets
  export function runTest69(): boolean {
    expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
    expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

    expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
    expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

    expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
    expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

    expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
    expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

    expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
    expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
    expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

    expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
    expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
    expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
    expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

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
     * 源文件：        enum_explicit_type_getvalueof_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0057
     * @tc.desc      Checking for enum with explicit int type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
      expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
      expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
      expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
      expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

      expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
      expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
      expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

      expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
      expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
      expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
      expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest56()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0058
     * @tc.desc      Checking for enum with explicit int type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.getValueOf("Red") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Red")).assertEqual(Enum3.Red);
      expect(Enum3.getValueOf("Red").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum3.getValueOf("Green") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Green")).assertEqual(Enum3.Green);
      expect(Enum3.getValueOf("Green").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum3.getValueOf("Blue") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Blue")).assertEqual(Enum3.Blue);
      expect(Enum3.getValueOf("Blue").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum3.getValueOf("First") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("First")).assertEqual(Enum3.First);
      expect(Enum3.getValueOf("First").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("First").valueOf()).assertEqual(-2147483648);

      expect(Enum3.getValueOf("Second") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Second")).assertEqual(Enum3.Second);
      expect(Enum3.getValueOf("Second").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum3.getValueOf("Third") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("Third")).assertEqual(Enum3.Third);
      expect(Enum3.getValueOf("Third").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("Third").valueOf()).assertEqual(2147483647);

      expect(Enum3.getValueOf("One") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("One")).assertEqual(Enum3.One);
      expect(Enum3.getValueOf("One").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("one") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("one")).assertEqual(Enum3.one);
      expect(Enum3.getValueOf("one").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum3.getValueOf("oNe") instanceof Enum3).assertTrue();
      expect(Enum3.getValueOf("oNe")).assertEqual(Enum3.oNe);
      expect(Enum3.getValueOf("oNe").valueOf() instanceof int).assertTrue();
      expect(Enum3.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest57()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0059
     * @tc.desc      Checking for enum with explicit long type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
      expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
      expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
      expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
      expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
      expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
      expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
      expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
      expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
      expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest58()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0060
     * @tc.desc      Checking for enum with explicit long type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.getValueOf("Red") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Red")).assertEqual(Enum4.Red);
      expect(Enum4.getValueOf("Red").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum4.getValueOf("Green") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Green")).assertEqual(Enum4.Green);
      expect(Enum4.getValueOf("Green").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum4.getValueOf("Blue") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Blue")).assertEqual(Enum4.Blue);
      expect(Enum4.getValueOf("Blue").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum4.getValueOf("First") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("First")).assertEqual(Enum4.First);
      expect(Enum4.getValueOf("First").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("First").valueOf()).assertEqual(-9223372036854775808);

      expect(Enum4.getValueOf("Second") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Second")).assertEqual(Enum4.Second);
      expect(Enum4.getValueOf("Second").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum4.getValueOf("Third") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("Third")).assertEqual(Enum4.Third);
      expect(Enum4.getValueOf("Third").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("Third").valueOf()).assertEqual(9223372036854775807);

      expect(Enum4.getValueOf("One") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("One")).assertEqual(Enum4.One);
      expect(Enum4.getValueOf("One").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("one") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("one")).assertEqual(Enum4.one);
      expect(Enum4.getValueOf("one").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum4.getValueOf("oNe") instanceof Enum4).assertTrue();
      expect(Enum4.getValueOf("oNe")).assertEqual(Enum4.oNe);
      expect(Enum4.getValueOf("oNe").valueOf() instanceof long).assertTrue();
      expect(Enum4.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest59()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0061
     * @tc.desc      Checking for enum with explicit byte type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.getValueOf("Red") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Red")).assertEqual(Enum1.Red);
      expect(Enum1.getValueOf("Red").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum1.getValueOf("Green") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Green")).assertEqual(Enum1.Green);
      expect(Enum1.getValueOf("Green").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum1.getValueOf("Blue") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Blue")).assertEqual(Enum1.Blue);
      expect(Enum1.getValueOf("Blue").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum1.getValueOf("First") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("First")).assertEqual(Enum1.First);
      expect(Enum1.getValueOf("First").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("First").valueOf()).assertEqual(-128);

      expect(Enum1.getValueOf("Second") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Second")).assertEqual(Enum1.Second);
      expect(Enum1.getValueOf("Second").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Second").valueOf()).assertEqual(123);

      expect(Enum1.getValueOf("Third") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Third")).assertEqual(Enum1.Third);
      expect(Enum1.getValueOf("Third").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Third").valueOf()).assertEqual(127);

      expect(Enum1.getValueOf("One") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("One")).assertEqual(Enum1.One);
      expect(Enum1.getValueOf("One").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum1.getValueOf("one") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("one")).assertEqual(Enum1.one);
      expect(Enum1.getValueOf("one").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum1.getValueOf("oNe") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("oNe")).assertEqual(Enum1.oNe);
      expect(Enum1.getValueOf("oNe").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest60()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0062
     * @tc.desc      Checking for enum with explicit byte type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.getValueOf("Red") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Red")).assertEqual(Enum1.Red);
      expect(Enum1.getValueOf("Red").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum1.getValueOf("Green") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Green")).assertEqual(Enum1.Green);
      expect(Enum1.getValueOf("Green").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum1.getValueOf("Blue") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Blue")).assertEqual(Enum1.Blue);
      expect(Enum1.getValueOf("Blue").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum1.getValueOf("First") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("First")).assertEqual(Enum1.First);
      expect(Enum1.getValueOf("First").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("First").valueOf()).assertEqual(-128);

      expect(Enum1.getValueOf("Second") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Second")).assertEqual(Enum1.Second);
      expect(Enum1.getValueOf("Second").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Second").valueOf()).assertEqual(123);

      expect(Enum1.getValueOf("Third") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("Third")).assertEqual(Enum1.Third);
      expect(Enum1.getValueOf("Third").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("Third").valueOf()).assertEqual(127);

      expect(Enum1.getValueOf("One") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("One")).assertEqual(Enum1.One);
      expect(Enum1.getValueOf("One").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum1.getValueOf("one") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("one")).assertEqual(Enum1.one);
      expect(Enum1.getValueOf("one").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum1.getValueOf("oNe") instanceof Enum1).assertTrue();
      expect(Enum1.getValueOf("oNe")).assertEqual(Enum1.oNe);
      expect(Enum1.getValueOf("oNe").valueOf() instanceof byte).assertTrue();
      expect(Enum1.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest61()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0063
     * @tc.desc      Checking for enum with explicit short type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.getValueOf("Red") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Red")).assertEqual(Enum2.Red);
      expect(Enum2.getValueOf("Red").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum2.getValueOf("Green") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Green")).assertEqual(Enum2.Green);
      expect(Enum2.getValueOf("Green").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum2.getValueOf("Blue") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Blue")).assertEqual(Enum2.Blue);
      expect(Enum2.getValueOf("Blue").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum2.getValueOf("First") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("First")).assertEqual(Enum2.First);
      expect(Enum2.getValueOf("First").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("First").valueOf()).assertEqual(-32768);

      expect(Enum2.getValueOf("Second") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Second")).assertEqual(Enum2.Second);
      expect(Enum2.getValueOf("Second").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum2.getValueOf("Third") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Third")).assertEqual(Enum2.Third);
      expect(Enum2.getValueOf("Third").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Third").valueOf()).assertEqual(32767);

      expect(Enum2.getValueOf("One") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("One")).assertEqual(Enum2.One);
      expect(Enum2.getValueOf("One").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum2.getValueOf("one") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("one")).assertEqual(Enum2.one);
      expect(Enum2.getValueOf("one").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum2.getValueOf("oNe") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("oNe")).assertEqual(Enum2.oNe);
      expect(Enum2.getValueOf("oNe").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest62()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0064
     * @tc.desc      Checking for enum with explicit short type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.getValueOf("Red") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Red")).assertEqual(Enum2.Red);
      expect(Enum2.getValueOf("Red").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Red").valueOf()).assertEqual(0);

      expect(Enum2.getValueOf("Green") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Green")).assertEqual(Enum2.Green);
      expect(Enum2.getValueOf("Green").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Green").valueOf()).assertEqual(10);

      expect(Enum2.getValueOf("Blue") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Blue")).assertEqual(Enum2.Blue);
      expect(Enum2.getValueOf("Blue").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Blue").valueOf()).assertEqual(11);

      expect(Enum2.getValueOf("First") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("First")).assertEqual(Enum2.First);
      expect(Enum2.getValueOf("First").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("First").valueOf()).assertEqual(-32768);

      expect(Enum2.getValueOf("Second") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Second")).assertEqual(Enum2.Second);
      expect(Enum2.getValueOf("Second").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Second").valueOf()).assertEqual(12345);

      expect(Enum2.getValueOf("Third") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("Third")).assertEqual(Enum2.Third);
      expect(Enum2.getValueOf("Third").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("Third").valueOf()).assertEqual(32767);

      expect(Enum2.getValueOf("One") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("One")).assertEqual(Enum2.One);
      expect(Enum2.getValueOf("One").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("One").valueOf()).assertEqual(1);

      expect(Enum2.getValueOf("one") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("one")).assertEqual(Enum2.one);
      expect(Enum2.getValueOf("one").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("one").valueOf()).assertEqual(1);

      expect(Enum2.getValueOf("oNe") instanceof Enum2).assertTrue();
      expect(Enum2.getValueOf("oNe")).assertEqual(Enum2.oNe);
      expect(Enum2.getValueOf("oNe").valueOf() instanceof short).assertTrue();
      expect(Enum2.getValueOf("oNe").valueOf()).assertEqual(1);

      expect(testNS.runTest63()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0065
     * @tc.desc      Checking for enum with explicit double type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.getValueOf("Red") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Red")).assertEqual(Enum6.Red);
      expect(Enum6.getValueOf("Red").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Red").valueOf()).assertEqual(1.5);

      expect(Enum6.getValueOf("Green") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Green")).assertEqual(Enum6.Green);
      expect(Enum6.getValueOf("Green").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Green").valueOf()).assertEqual(10.3);

      expect(Enum6.getValueOf("Blue") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Blue")).assertEqual(Enum6.Blue);
      expect(Enum6.getValueOf("Blue").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Blue").valueOf()).assertEqual(7.6);

      expect(Enum6.getValueOf("First") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("First")).assertEqual(Enum6.First);
      expect(Enum6.getValueOf("First").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("First").valueOf()).assertEqual(-214748.3648);

      expect(Enum6.getValueOf("Second") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Second")).assertEqual(Enum6.Second);
      expect(Enum6.getValueOf("Second").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Second").valueOf()).assertEqual(123.45);

      expect(Enum6.getValueOf("Third") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Third")).assertEqual(Enum6.Third);
      expect(Enum6.getValueOf("Third").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Third").valueOf()).assertEqual(2147483.647);

      expect(Enum6.getValueOf("One") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("One")).assertEqual(Enum6.One);
      expect(Enum6.getValueOf("One").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("One").valueOf()).assertEqual(1.0);

      expect(Enum6.getValueOf("one") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("one")).assertEqual(Enum6.one);
      expect(Enum6.getValueOf("one").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("one").valueOf()).assertEqual(1.0);

      expect(Enum6.getValueOf("oNe") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("oNe")).assertEqual(Enum6.oNe);
      expect(Enum6.getValueOf("oNe").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("oNe").valueOf()).assertEqual(1.0);

      expect(testNS.runTest64()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0066
     * @tc.desc      Checking for enum with explicit double type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.getValueOf("Red") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Red")).assertEqual(Enum6.Red);
      expect(Enum6.getValueOf("Red").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Red").valueOf()).assertEqual(1.5);

      expect(Enum6.getValueOf("Green") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Green")).assertEqual(Enum6.Green);
      expect(Enum6.getValueOf("Green").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Green").valueOf()).assertEqual(10.3);

      expect(Enum6.getValueOf("Blue") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Blue")).assertEqual(Enum6.Blue);
      expect(Enum6.getValueOf("Blue").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Blue").valueOf()).assertEqual(7.6);

      expect(Enum6.getValueOf("First") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("First")).assertEqual(Enum6.First);
      expect(Enum6.getValueOf("First").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("First").valueOf()).assertEqual(-214748.3648);

      expect(Enum6.getValueOf("Second") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Second")).assertEqual(Enum6.Second);
      expect(Enum6.getValueOf("Second").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Second").valueOf()).assertEqual(123.45);

      expect(Enum6.getValueOf("Third") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("Third")).assertEqual(Enum6.Third);
      expect(Enum6.getValueOf("Third").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("Third").valueOf()).assertEqual(2147483.647);

      expect(Enum6.getValueOf("One") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("One")).assertEqual(Enum6.One);
      expect(Enum6.getValueOf("One").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("One").valueOf()).assertEqual(1.0);

      expect(Enum6.getValueOf("one") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("one")).assertEqual(Enum6.one);
      expect(Enum6.getValueOf("one").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("one").valueOf()).assertEqual(1.0);

      expect(Enum6.getValueOf("oNe") instanceof Enum6).assertTrue();
      expect(Enum6.getValueOf("oNe")).assertEqual(Enum6.oNe);
      expect(Enum6.getValueOf("oNe").valueOf() instanceof double).assertTrue();
      expect(Enum6.getValueOf("oNe").valueOf()).assertEqual(1.0);

      expect(testNS.runTest65()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_12.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0069
     * @tc.desc      Checking for enum with explicit string type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
      expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

      expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
      expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

      expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
      expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

      expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
      expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
      expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
      expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
      expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

      expect(testNS.runTest68()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_getvalueof_13.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0070
     * @tc.desc      Checking for enum with explicit string type constant for getValueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.getValueOf("Red") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Red")).assertEqual(Enum7.Red);
      expect(Enum7.getValueOf("Red").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Red").valueOf()).assertEqual("reD");

      expect(Enum7.getValueOf("Green") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Green")).assertEqual(Enum7.Green);
      expect(Enum7.getValueOf("Green").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Green").valueOf()).assertEqual("grEen");

      expect(Enum7.getValueOf("Blue") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Blue")).assertEqual(Enum7.Blue);
      expect(Enum7.getValueOf("Blue").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Blue").valueOf()).assertEqual("Blue");

      expect(Enum7.getValueOf("Complex") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("Complex")).assertEqual(Enum7.Complex);
      expect(Enum7.getValueOf("Complex").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("Complex").valueOf()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");

      expect(Enum7.getValueOf("One") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("One")).assertEqual(Enum7.One);
      expect(Enum7.getValueOf("One").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("One").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("one") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("one")).assertEqual(Enum7.one);
      expect(Enum7.getValueOf("one").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("one").valueOf()).assertEqual("one");

      expect(Enum7.getValueOf("oNe") instanceof Enum7).assertTrue();
      expect(Enum7.getValueOf("oNe")).assertEqual(Enum7.oNe);
      expect(Enum7.getValueOf("oNe").valueOf() instanceof String).assertTrue();
      expect(Enum7.getValueOf("oNe").valueOf()).assertEqual("one");

      expect(testNS.runTest69()).assertTrue();
    });
  })
}