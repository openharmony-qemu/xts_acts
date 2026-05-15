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
  // enum_explicit_type_tostring_14.ets
  export function runTest98(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.toString()).assertEqual("0");
    expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.toString()).assertEqual("10");
    expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.toString()).assertEqual("11");
    expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.toString()).assertEqual("-32768");
    expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.toString()).assertEqual("12345");
    expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.toString()).assertEqual("32767");
    expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.toString()).assertEqual("1");
    expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.toString()).assertEqual("1");
    expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.toString()).assertEqual("1");
    expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_15.ets
  export function runTest99(): boolean {
    expect(Enum2.Red.valueOf() instanceof short).assertTrue();
    expect(Enum2.Red.toString()).assertEqual("0");
    expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

    expect(Enum2.Green.valueOf() instanceof short).assertTrue();
    expect(Enum2.Green.toString()).assertEqual("10");
    expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

    expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
    expect(Enum2.Blue.toString()).assertEqual("11");
    expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

    expect(Enum2.First.valueOf() instanceof short).assertTrue();
    expect(Enum2.First.toString()).assertEqual("-32768");
    expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

    expect(Enum2.Second.valueOf() instanceof short).assertTrue();
    expect(Enum2.Second.toString()).assertEqual("12345");
    expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

    expect(Enum2.Third.valueOf() instanceof short).assertTrue();
    expect(Enum2.Third.toString()).assertEqual("32767");
    expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

    expect(Enum2.One.valueOf() instanceof short).assertTrue();
    expect(Enum2.One.toString()).assertEqual("1");
    expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

    expect(Enum2.one.valueOf() instanceof short).assertTrue();
    expect(Enum2.one.toString()).assertEqual("1");
    expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

    expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
    expect(Enum2.oNe.toString()).assertEqual("1");
    expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

    return true;
  }


  // enum_explicit_type_tostring_16.ets
  export function runTest100(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_17.ets
  export function runTest101(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_18.ets
  export function runTest102(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_19.ets
  export function runTest103(): boolean {
    expect(Enum6.Red.valueOf() instanceof double).assertTrue();
    expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

    expect(Enum6.Green.valueOf() instanceof double).assertTrue();
    expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

    expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
    expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

    expect(Enum6.First.valueOf() instanceof double).assertTrue();
    expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

    expect(Enum6.Second.valueOf() instanceof double).assertTrue();
    expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

    expect(Enum6.Third.valueOf() instanceof double).assertTrue();
    expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

    expect(Enum6.One.valueOf() instanceof double).assertTrue();
    expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

    expect(Enum6.one.valueOf() instanceof double).assertTrue();
    expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

    expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
    expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_20.ets
  export function runTest104(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum5.Red.toString()).assertEqual(Enum5.Red.valueOf().toString());

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum5.Green.toString()).assertEqual(Enum5.Green.valueOf().toString());

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum5.Blue.toString()).assertEqual(Enum5.Blue.valueOf().toString());

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum5.First.toString()).assertEqual(Enum5.First.valueOf().toString());

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum5.Second.toString()).assertEqual(Enum5.Second.valueOf().toString());

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum5.Third.toString()).assertEqual(Enum5.Third.valueOf().toString());

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.One.toString()).assertEqual(Enum5.One.valueOf().toString());

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.one.toString()).assertEqual(Enum5.one.valueOf().toString());

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.oNe.toString()).assertEqual(Enum5.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_21.ets
  export function runTest105(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum5.Red.toString()).assertEqual(Enum5.Red.valueOf().toString());

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum5.Green.toString()).assertEqual(Enum5.Green.valueOf().toString());

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum5.Blue.toString()).assertEqual(Enum5.Blue.valueOf().toString());

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum5.First.toString()).assertEqual(Enum5.First.valueOf().toString());

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum5.Second.toString()).assertEqual(Enum5.Second.valueOf().toString());

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum5.Third.toString()).assertEqual(Enum5.Third.valueOf().toString());

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.One.toString()).assertEqual(Enum5.One.valueOf().toString());

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.one.toString()).assertEqual(Enum5.one.valueOf().toString());

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.oNe.toString()).assertEqual(Enum5.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_22.ets
  export function runTest106(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum5.Red.toString()).assertEqual(Enum5.Red.valueOf().toString());

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum5.Green.toString()).assertEqual(Enum5.Green.valueOf().toString());

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum5.Blue.toString()).assertEqual(Enum5.Blue.valueOf().toString());

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum5.First.toString()).assertEqual(Enum5.First.valueOf().toString());

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum5.Second.toString()).assertEqual(Enum5.Second.valueOf().toString());

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum5.Third.toString()).assertEqual(Enum5.Third.valueOf().toString());

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.One.toString()).assertEqual(Enum5.One.valueOf().toString());

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.one.toString()).assertEqual(Enum5.one.valueOf().toString());

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.oNe.toString()).assertEqual(Enum5.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_23.ets
  export function runTest107(): boolean {
    expect(Enum5.Red.valueOf() instanceof float).assertTrue();
    expect(Enum5.Red.toString()).assertEqual(new Number(1.5).toString());
    expect(Enum5.Red.toString()).assertEqual(Enum5.Red.valueOf().toString());

    expect(Enum5.Green.valueOf() instanceof float).assertTrue();
    expect(Enum5.Green.toString()).assertEqual(new Number(10.3).toString());
    expect(Enum5.Green.toString()).assertEqual(Enum5.Green.valueOf().toString());

    expect(Enum5.Blue.valueOf() instanceof float).assertTrue();
    expect(Enum5.Blue.toString()).assertEqual(new Number(7.6).toString());
    expect(Enum5.Blue.toString()).assertEqual(Enum5.Blue.valueOf().toString());

    expect(Enum5.First.valueOf() instanceof float).assertTrue();
    expect(Enum5.First.toString()).assertEqual(new Number(-214748.3648).toString());
    expect(Enum5.First.toString()).assertEqual(Enum5.First.valueOf().toString());

    expect(Enum5.Second.valueOf() instanceof float).assertTrue();
    expect(Enum5.Second.toString()).assertEqual(new Number(123.45).toString());
    expect(Enum5.Second.toString()).assertEqual(Enum5.Second.valueOf().toString());

    expect(Enum5.Third.valueOf() instanceof float).assertTrue();
    expect(Enum5.Third.toString()).assertEqual(new Number(2147483.647).toString());
    expect(Enum5.Third.toString()).assertEqual(Enum5.Third.valueOf().toString());

    expect(Enum5.One.valueOf() instanceof float).assertTrue();
    expect(Enum5.One.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.One.toString()).assertEqual(Enum5.One.valueOf().toString());

    expect(Enum5.one.valueOf() instanceof float).assertTrue();
    expect(Enum5.one.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.one.toString()).assertEqual(Enum5.one.valueOf().toString());

    expect(Enum5.oNe.valueOf() instanceof float).assertTrue();
    expect(Enum5.oNe.toString()).assertEqual(new Number(1.0).toString());
    expect(Enum5.oNe.toString()).assertEqual(Enum5.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_24.ets
  export function runTest108(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_25.ets
  export function runTest109(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_26.ets
  export function runTest110(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

    return true;
  }

  // enum_explicit_type_tostring_27.ets
  export function runTest111(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.toString()).assertEqual("reD");
    expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.toString()).assertEqual("grEen");
    expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.toString()).assertEqual("Blue");
    expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.toString()).assertEqual(
      "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
    expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.toString()).assertEqual("one");
    expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.toString()).assertEqual("one");
    expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.toString()).assertEqual("one");
    expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

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
     * 源文件：        enum_explicit_type_tostring_14.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0099
     * @tc.desc      Checking for enum with explicit short type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.toString()).assertEqual("0");
      expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.toString()).assertEqual("10");
      expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.toString()).assertEqual("11");
      expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.toString()).assertEqual("-32768");
      expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.toString()).assertEqual("12345");
      expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.toString()).assertEqual("32767");
      expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.toString()).assertEqual("1");
      expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.toString()).assertEqual("1");
      expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.toString()).assertEqual("1");
      expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

      expect(testNS.runTest98()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_15.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0100
     * @tc.desc      Checking for enum with explicit short type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.Red.valueOf() instanceof short).assertTrue();
      expect(Enum2.Red.toString()).assertEqual("0");
      expect(Enum2.Red.toString()).assertEqual(Enum2.Red.valueOf().toString());

      expect(Enum2.Green.valueOf() instanceof short).assertTrue();
      expect(Enum2.Green.toString()).assertEqual("10");
      expect(Enum2.Green.toString()).assertEqual(Enum2.Green.valueOf().toString());

      expect(Enum2.Blue.valueOf() instanceof short).assertTrue();
      expect(Enum2.Blue.toString()).assertEqual("11");
      expect(Enum2.Blue.toString()).assertEqual(Enum2.Blue.valueOf().toString());

      expect(Enum2.First.valueOf() instanceof short).assertTrue();
      expect(Enum2.First.toString()).assertEqual("-32768");
      expect(Enum2.First.toString()).assertEqual(Enum2.First.valueOf().toString());

      expect(Enum2.Second.valueOf() instanceof short).assertTrue();
      expect(Enum2.Second.toString()).assertEqual("12345");
      expect(Enum2.Second.toString()).assertEqual(Enum2.Second.valueOf().toString());

      expect(Enum2.Third.valueOf() instanceof short).assertTrue();
      expect(Enum2.Third.toString()).assertEqual("32767");
      expect(Enum2.Third.toString()).assertEqual(Enum2.Third.valueOf().toString());

      expect(Enum2.One.valueOf() instanceof short).assertTrue();
      expect(Enum2.One.toString()).assertEqual("1");
      expect(Enum2.One.toString()).assertEqual(Enum2.One.valueOf().toString());

      expect(Enum2.one.valueOf() instanceof short).assertTrue();
      expect(Enum2.one.toString()).assertEqual("1");
      expect(Enum2.one.toString()).assertEqual(Enum2.one.valueOf().toString());

      expect(Enum2.oNe.valueOf() instanceof short).assertTrue();
      expect(Enum2.oNe.toString()).assertEqual("1");
      expect(Enum2.oNe.toString()).assertEqual(Enum2.oNe.valueOf().toString());

      expect(testNS.runTest99()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_16.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0101
     * @tc.desc      Checking for enum with explicit double type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
      expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
      expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
      expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
      expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
      expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
      expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

      expect(testNS.runTest100()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_17.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0102
     * @tc.desc      Checking for enum with explicit double type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
      expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
      expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
      expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
      expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
      expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
      expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

      expect(testNS.runTest101()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_18.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0103
     * @tc.desc      Checking for enum with explicit double type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
      expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
      expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
      expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
      expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
      expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
      expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

      expect(testNS.runTest102()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_19.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0104
     * @tc.desc      Checking for enum with explicit double type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum6.Red.valueOf() instanceof double).assertTrue();
      expect(Enum6.Red.toString()).assertEqual(new Number(1.5).toString());
      expect(Enum6.Red.toString()).assertEqual(Enum6.Red.valueOf().toString());

      expect(Enum6.Green.valueOf() instanceof double).assertTrue();
      expect(Enum6.Green.toString()).assertEqual(new Number(10.3).toString());
      expect(Enum6.Green.toString()).assertEqual(Enum6.Green.valueOf().toString());

      expect(Enum6.Blue.valueOf() instanceof double).assertTrue();
      expect(Enum6.Blue.toString()).assertEqual(new Number(7.6).toString());
      expect(Enum6.Blue.toString()).assertEqual(Enum6.Blue.valueOf().toString());

      expect(Enum6.First.valueOf() instanceof double).assertTrue();
      expect(Enum6.First.toString()).assertEqual(new Number(-214748.3648).toString());
      expect(Enum6.First.toString()).assertEqual(Enum6.First.valueOf().toString());

      expect(Enum6.Second.valueOf() instanceof double).assertTrue();
      expect(Enum6.Second.toString()).assertEqual(new Number(123.45).toString());
      expect(Enum6.Second.toString()).assertEqual(Enum6.Second.valueOf().toString());

      expect(Enum6.Third.valueOf() instanceof double).assertTrue();
      expect(Enum6.Third.toString()).assertEqual(new Number(2147483.647).toString());
      expect(Enum6.Third.toString()).assertEqual(Enum6.Third.valueOf().toString());

      expect(Enum6.One.valueOf() instanceof double).assertTrue();
      expect(Enum6.One.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.One.toString()).assertEqual(Enum6.One.valueOf().toString());

      expect(Enum6.one.valueOf() instanceof double).assertTrue();
      expect(Enum6.one.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.one.toString()).assertEqual(Enum6.one.valueOf().toString());

      expect(Enum6.oNe.valueOf() instanceof double).assertTrue();
      expect(Enum6.oNe.toString()).assertEqual(new Number(1.0).toString());
      expect(Enum6.oNe.toString()).assertEqual(Enum6.oNe.valueOf().toString());

      expect(testNS.runTest103()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_24.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0109
     * @tc.desc      Checking for enum with explicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest108()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_25.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0110
     * @tc.desc      Checking for enum with explicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest109()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_26.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1300
     * @tc.name      testEnumerationMethods0111
     * @tc.desc      Checking for enum with explicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest110()).assertTrue();
    });

    /**
     * 源文件：        enum_explicit_type_tostring_27.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1400
     * @tc.name      testEnumerationMethods0112
     * @tc.desc      Checking for enum with explicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.toString()).assertEqual("reD");
      expect(Enum7.Red.toString()).assertEqual(Enum7.Red.valueOf().toString());

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.toString()).assertEqual("grEen");
      expect(Enum7.Green.toString()).assertEqual(Enum7.Green.valueOf().toString());

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.toString()).assertEqual("Blue");
      expect(Enum7.Blue.toString()).assertEqual(Enum7.Blue.valueOf().toString());

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.toString()).assertEqual(
        "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(Enum7.Complex.toString()).assertEqual(Enum7.Complex.valueOf().toString());

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.toString()).assertEqual("one");
      expect(Enum7.One.toString()).assertEqual(Enum7.One.valueOf().toString());

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.toString()).assertEqual("one");
      expect(Enum7.one.toString()).assertEqual(Enum7.one.valueOf().toString());

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.toString()).assertEqual("one");
      expect(Enum7.oNe.toString()).assertEqual(Enum7.oNe.valueOf().toString());

      expect(testNS.runTest111()).assertTrue();
    });
  })
}