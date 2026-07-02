'use static';
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


  // enum_explicit_type_tostring_0.ets
  export function runTest84(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.toString()).assertEqual("0");
    expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.toString()).assertEqual("10");
    expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.toString()).assertEqual("11");
    expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.toString()).assertEqual("-2147483648");
    expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.toString()).assertEqual("12345");
    expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.toString()).assertEqual("2147483647");
    expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.toString()).assertEqual("1");
    expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.toString()).assertEqual("1");
    expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.toString()).assertEqual("1");
    expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

    return true;
  }




  // enum_explicit_type_tostring_4.ets
  export function runTest88(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.toString()).assertEqual("0");
    expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.toString()).assertEqual("10");
    expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.toString()).assertEqual("11");
    expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
    expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.toString()).assertEqual("12345");
    expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
    expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.toString()).assertEqual("1");
    expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.toString()).assertEqual("1");
    expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.toString()).assertEqual("1");
    expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

    return true;
  }




  // enum_explicit_type_tostring_8.ets
  export function runTest92(): boolean {
    expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Red.toString()).assertEqual("0");
    expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

    expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Green.toString()).assertEqual("10");
    expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

    expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Blue.toString()).assertEqual("11");
    expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

    expect(Enum1.First.valueOf() instanceof byte).assertTrue();
    expect(Enum1.First.toString()).assertEqual("-128");
    expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

    expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Second.toString()).assertEqual("123");
    expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

    expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
    expect(Enum1.Third.toString()).assertEqual("127");
    expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

    expect(Enum1.One.valueOf() instanceof byte).assertTrue();
    expect(Enum1.One.toString()).assertEqual("1");
    expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

    expect(Enum1.one.valueOf() instanceof byte).assertTrue();
    expect(Enum1.one.toString()).assertEqual("1");
    expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

    expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
    expect(Enum1.oNe.toString()).assertEqual("1");
    expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

    return true;
  }


  // enum_explicit_type_tostring_12.ets
  export function runTest96(): boolean {
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



  // enum_implicit_type_tostring_0.ets
  export function runTest190(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.toString()).assertEqual("0");
    expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.toString()).assertEqual("10");
    expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.toString()).assertEqual("11");
    expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.toString()).assertEqual("-2147483648");
    expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.toString()).assertEqual("12345");
    expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.toString()).assertEqual("2147483647");
    expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.toString()).assertEqual("1");
    expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.toString()).assertEqual("1");
    expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.toString()).assertEqual("1");
    expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

    return true;
  }




  // enum_implicit_type_tostring_4.ets
  export function runTest194(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.toString()).assertEqual("0");
    expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.toString()).assertEqual("10");
    expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.toString()).assertEqual("11");
    expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
    expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.toString()).assertEqual("12345");
    expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
    expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.toString()).assertEqual("1");
    expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.toString()).assertEqual("1");
    expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.toString()).assertEqual("1");
    expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

    return true;
  }




  // enum_implicit_type_tostring_8.ets
  export function runTest198(): boolean {
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




  // enum_explicit_type_values_0.ets
  export function runTest140(): boolean {
    let values = Enum3.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum3).assertTrue();
    expect(values[0]).assertEqual(Enum3.Red);
    expect(values[0].valueOf() instanceof int).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum3.Red.valueOf());
    expect(Enum3[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum3).assertTrue();
    expect(values[1]).assertEqual(Enum3.Green);
    expect(values[1].valueOf() instanceof int).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum3.Green.valueOf());
    expect(Enum3[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum3).assertTrue();
    expect(values[2]).assertEqual(Enum3.Blue);
    expect(values[2].valueOf() instanceof int).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum3.Blue.valueOf());
    expect(Enum3[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum3).assertTrue();
    expect(values[3]).assertEqual(Enum3.First);
    expect(values[3].valueOf() instanceof int).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum3.First.valueOf());
    expect(Enum3[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum3).assertTrue();
    expect(values[4]).assertEqual(Enum3.Second);
    expect(values[4].valueOf() instanceof int).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum3.Second.valueOf());
    expect(Enum3[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum3).assertTrue();
    expect(values[5]).assertEqual(Enum3.Third);
    expect(values[5].valueOf() instanceof int).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum3.Third.valueOf());
    expect(Enum3[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum3).assertTrue();
    expect(values[6]).assertEqual(Enum3.One);
    expect(values[6].valueOf() instanceof int).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum3.One.valueOf());
    expect(Enum3[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum3).assertTrue();
    expect(values[7]).assertEqual(Enum3.one);
    expect(values[7].valueOf() instanceof int).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum3.one.valueOf());
    expect(Enum3[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum3).assertTrue();
    expect(values[8]).assertEqual(Enum3.oNe);
    expect(values[8].valueOf() instanceof int).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum3.oNe.valueOf());
    expect(Enum3[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_2.ets
  export function runTest142(): boolean {
    let values = Enum4.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum4).assertTrue();
    expect(values[0]).assertEqual(Enum4.Red);
    expect(values[0].valueOf() instanceof long).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum4.Red.valueOf());
    expect(Enum4[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum4).assertTrue();
    expect(values[1]).assertEqual(Enum4.Green);
    expect(values[1].valueOf() instanceof long).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum4.Green.valueOf());
    expect(Enum4[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum4).assertTrue();
    expect(values[2]).assertEqual(Enum4.Blue);
    expect(values[2].valueOf() instanceof long).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum4.Blue.valueOf());
    expect(Enum4[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum4).assertTrue();
    expect(values[3]).assertEqual(Enum4.First);
    expect(values[3].valueOf() instanceof long).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum4.First.valueOf());
    expect(Enum4[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum4).assertTrue();
    expect(values[4]).assertEqual(Enum4.Second);
    expect(values[4].valueOf() instanceof long).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum4.Second.valueOf());
    expect(Enum4[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum4).assertTrue();
    expect(values[5]).assertEqual(Enum4.Third);
    expect(values[5].valueOf() instanceof long).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum4.Third.valueOf());
    expect(Enum4[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum4).assertTrue();
    expect(values[6]).assertEqual(Enum4.One);
    expect(values[6].valueOf() instanceof long).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum4.One.valueOf());
    expect(Enum4[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum4).assertTrue();
    expect(values[7]).assertEqual(Enum4.one);
    expect(values[7].valueOf() instanceof long).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum4.one.valueOf());
    expect(Enum4[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum4).assertTrue();
    expect(values[8]).assertEqual(Enum4.oNe);
    expect(values[8].valueOf() instanceof long).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum4.oNe.valueOf());
    expect(Enum4[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_4.ets
  export function runTest144(): boolean {
    let values = Enum1.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum1).assertTrue();
    expect(values[0]).assertEqual(Enum1.Red);
    expect(values[0].valueOf() instanceof byte).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum1.Red.valueOf());
    expect(Enum1[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum1).assertTrue();
    expect(values[1]).assertEqual(Enum1.Green);
    expect(values[1].valueOf() instanceof byte).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum1.Green.valueOf());
    expect(Enum1[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum1).assertTrue();
    expect(values[2]).assertEqual(Enum1.Blue);
    expect(values[2].valueOf() instanceof byte).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum1.Blue.valueOf());
    expect(Enum1[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum1).assertTrue();
    expect(values[3]).assertEqual(Enum1.First);
    expect(values[3].valueOf() instanceof byte).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum1.First.valueOf());
    expect(Enum1[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum1).assertTrue();
    expect(values[4]).assertEqual(Enum1.Second);
    expect(values[4].valueOf() instanceof byte).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum1.Second.valueOf());
    expect(Enum1[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum1).assertTrue();
    expect(values[5]).assertEqual(Enum1.Third);
    expect(values[5].valueOf() instanceof byte).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum1.Third.valueOf());
    expect(Enum1[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum1).assertTrue();
    expect(values[6]).assertEqual(Enum1.One);
    expect(values[6].valueOf() instanceof byte).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum1.One.valueOf());
    expect(Enum1[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum1).assertTrue();
    expect(values[7]).assertEqual(Enum1.one);
    expect(values[7].valueOf() instanceof byte).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum1.one.valueOf());
    expect(Enum1[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum1).assertTrue();
    expect(values[8]).assertEqual(Enum1.oNe);
    expect(values[8].valueOf() instanceof byte).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum1.oNe.valueOf());
    expect(Enum1[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_6.ets
  export function runTest146(): boolean {
    let values = Enum2.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum2).assertTrue();
    expect(values[0]).assertEqual(Enum2.Red);
    expect(values[0].valueOf() instanceof short).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum2.Red.valueOf());
    expect(Enum2[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum2).assertTrue();
    expect(values[1]).assertEqual(Enum2.Green);
    expect(values[1].valueOf() instanceof short).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
    expect(Enum2[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum2).assertTrue();
    expect(values[2]).assertEqual(Enum2.Blue);
    expect(values[2].valueOf() instanceof short).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum2.Blue.valueOf());
    expect(Enum2[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum2).assertTrue();
    expect(values[3]).assertEqual(Enum2.First);
    expect(values[3].valueOf() instanceof short).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum2.First.valueOf());
    expect(Enum2[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum2).assertTrue();
    expect(values[4]).assertEqual(Enum2.Second);
    expect(values[4].valueOf() instanceof short).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum2.Second.valueOf());
    expect(Enum2[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum2).assertTrue();
    expect(values[5]).assertEqual(Enum2.Third);
    expect(values[5].valueOf() instanceof short).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum2.Third.valueOf());
    expect(Enum2[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum2).assertTrue();
    expect(values[6]).assertEqual(Enum2.One);
    expect(values[6].valueOf() instanceof short).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum2.One.valueOf());
    expect(Enum2[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum2).assertTrue();
    expect(values[7]).assertEqual(Enum2.one);
    expect(values[7].valueOf() instanceof short).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum2.one.valueOf());
    expect(Enum2[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum2).assertTrue();
    expect(values[8]).assertEqual(Enum2.oNe);
    expect(values[8].valueOf() instanceof short).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum2.oNe.valueOf());
    expect(Enum2[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_8.ets
  export function runTest148(): boolean {
    let values = Enum6.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum6).assertTrue();
    expect(values[0]).assertEqual(Enum6.Red);
    expect(values[0].valueOf() instanceof double).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum6.Red.valueOf());
    expect(Enum6[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum6).assertTrue();
    expect(values[1]).assertEqual(Enum6.Green);
    expect(values[1].valueOf() instanceof double).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum6.Green.valueOf());
    expect(Enum6[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum6).assertTrue();
    expect(values[2]).assertEqual(Enum6.Blue);
    expect(values[2].valueOf() instanceof double).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum6.Blue.valueOf());
    expect(Enum6[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum6).assertTrue();
    expect(values[3]).assertEqual(Enum6.First);
    expect(values[3].valueOf() instanceof double).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum6.First.valueOf());
    expect(Enum6[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum6).assertTrue();
    expect(values[4]).assertEqual(Enum6.Second);
    expect(values[4].valueOf() instanceof double).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum6.Second.valueOf());
    expect(Enum6[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum6).assertTrue();
    expect(values[5]).assertEqual(Enum6.Third);
    expect(values[5].valueOf() instanceof double).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum6.Third.valueOf());
    expect(Enum6[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum6).assertTrue();
    expect(values[6]).assertEqual(Enum6.One);
    expect(values[6].valueOf() instanceof double).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum6.One.valueOf());
    expect(Enum6[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum6).assertTrue();
    expect(values[7]).assertEqual(Enum6.one);
    expect(values[7].valueOf() instanceof double).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum6.one.valueOf());
    expect(Enum6[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum6).assertTrue();
    expect(values[8]).assertEqual(Enum6.oNe);
    expect(values[8].valueOf() instanceof double).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum6.oNe.valueOf());
    expect(Enum6[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_10.ets
  export function runTest150(): boolean {
    let values = Enum5.values();
    expect(values.length).assertEqual(9);

    expect(values[0] instanceof Enum5).assertTrue();
    expect(values[0]).assertEqual(Enum5.Red);
    expect(values[0].valueOf() instanceof float).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum5.Red.valueOf());
    expect(Enum5[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum5).assertTrue();
    expect(values[1]).assertEqual(Enum5.Green);
    expect(values[1].valueOf() instanceof float).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum5.Green.valueOf());
    expect(Enum5[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum5).assertTrue();
    expect(values[2]).assertEqual(Enum5.Blue);
    expect(values[2].valueOf() instanceof float).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum5.Blue.valueOf());
    expect(Enum5[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum5).assertTrue();
    expect(values[3]).assertEqual(Enum5.First);
    expect(values[3].valueOf() instanceof float).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum5.First.valueOf());
    expect(Enum5[values[3]]).assertEqual("First");

    expect(values[4] instanceof Enum5).assertTrue();
    expect(values[4]).assertEqual(Enum5.Second);
    expect(values[4].valueOf() instanceof float).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum5.Second.valueOf());
    expect(Enum5[values[4]]).assertEqual("Second");

    expect(values[5] instanceof Enum5).assertTrue();
    expect(values[5]).assertEqual(Enum5.Third);
    expect(values[5].valueOf() instanceof float).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum5.Third.valueOf());
    expect(Enum5[values[5]]).assertEqual("Third");

    expect(values[6] instanceof Enum5).assertTrue();
    expect(values[6]).assertEqual(Enum5.One);
    expect(values[6].valueOf() instanceof float).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum5.One.valueOf());
    expect(Enum5[values[6]]).assertEqual("One");

    expect(values[7] instanceof Enum5).assertTrue();
    expect(values[7]).assertEqual(Enum5.one);
    expect(values[7].valueOf() instanceof float).assertTrue();
    expect(values[7].valueOf()).assertEqual(Enum5.one.valueOf());
    expect(Enum5[values[7]]).assertEqual("one");

    expect(values[8] instanceof Enum5).assertTrue();
    expect(values[8]).assertEqual(Enum5.oNe);
    expect(values[8].valueOf() instanceof float).assertTrue();
    expect(values[8].valueOf()).assertEqual(Enum5.oNe.valueOf());
    expect(Enum5[values[8]]).assertEqual("oNe");

    return true;
  }

  // enum_explicit_type_values_12.ets
  export function runTest152(): boolean {
    let values = Enum7.values();
    expect(values.length).assertEqual(7);

    expect(values[0] instanceof Enum7).assertTrue();
    expect(values[0]).assertEqual(Enum7.Red);
    expect(values[0].valueOf() instanceof String).assertTrue();
    expect(values[0].valueOf()).assertEqual(Enum7.Red.valueOf());
    expect(Enum7[values[0]]).assertEqual("Red");

    expect(values[1] instanceof Enum7).assertTrue();
    expect(values[1]).assertEqual(Enum7.Green);
    expect(values[1].valueOf() instanceof String).assertTrue();
    expect(values[1].valueOf()).assertEqual(Enum7.Green.valueOf());
    expect(Enum7[values[1]]).assertEqual("Green");

    expect(values[2] instanceof Enum7).assertTrue();
    expect(values[2]).assertEqual(Enum7.Blue);
    expect(values[2].valueOf() instanceof String).assertTrue();
    expect(values[2].valueOf()).assertEqual(Enum7.Blue.valueOf());
    expect(Enum7[values[2]]).assertEqual("Blue");

    expect(values[3] instanceof Enum7).assertTrue();
    expect(values[3]).assertEqual(Enum7.Complex);
    expect(values[3].valueOf() instanceof String).assertTrue();
    expect(values[3].valueOf()).assertEqual(Enum7.Complex.valueOf());
    expect(Enum7[values[3]]).assertEqual("Complex");

    expect(values[4] instanceof Enum7).assertTrue();
    expect(values[4]).assertEqual(Enum7.One);
    expect(values[4].valueOf() instanceof String).assertTrue();
    expect(values[4].valueOf()).assertEqual(Enum7.One.valueOf());
    expect(Enum7[values[4]]).assertEqual("One");

    expect(values[5] instanceof Enum7).assertTrue();
    expect(values[5]).assertEqual(Enum7.one);
    expect(values[5].valueOf() instanceof String).assertTrue();
    expect(values[5].valueOf()).assertEqual(Enum7.one.valueOf());
    expect(Enum7[values[5]]).assertEqual("one");

    expect(values[6] instanceof Enum7).assertTrue();
    expect(values[6]).assertEqual(Enum7.oNe);
    expect(values[6].valueOf() instanceof String).assertTrue();
    expect(values[6].valueOf()).assertEqual(Enum7.oNe.valueOf());
    expect(Enum7[values[6]]).assertEqual("oNe");

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

// enum_type_methods_getname.ets
enum Color {Red, Green, Blue};

enum Color1 {Red = "r1", Blue = "b1", Green = "g1"};

enum Color2 {Red = "r1", Green = "g1", Blue = "b1"};

enum Color3 {Red = 1, Green = 2, Blue};

enum Color4 {Red = 777, Blue = 55, Green = 2};

enum GeneratedEnum {
  A,
  AA,
  AAA,
  AAAA,
  AAAAA,
  AAAAAA,
  AAAAAAA,
  AAAAAAAA,
  AAAAAAAAA
};

enum GeneratedEnum1 {
  A = "A" ,
  AA = "AA" ,
  AAA = "AAA" ,
  AAAA = "AAAA" ,
  AAAAA = "AAAAA" ,
  AAAAAA = "AAAAAA" ,
  AAAAAAA = "AAAAAAA" ,
  AAAAAAAA = "AAAAAAAA" ,
  AAAAAAAAA = "AAAAAAAAA"
};

function f(a: FixedArray<Color>): number {
  return a.length;
}

function f(a: Object): int {
  return 2;
}

export default function EnumerationMethodsTest02(): void {
  describe('EnumerationMethodsTest02', () => {
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
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2000
     * @tc.name      testEnumerationMethods0020
     * @tc.desc      Checking for enum with explicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.toString()).assertEqual("0");
      expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.toString()).assertEqual("10");
      expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.toString()).assertEqual("11");
      expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.toString()).assertEqual("-2147483648");
      expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.toString()).assertEqual("12345");
      expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.toString()).assertEqual("2147483647");
      expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.toString()).assertEqual("1");
      expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.toString()).assertEqual("1");
      expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.toString()).assertEqual("1");
      expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());

      expect(testNS.runTest84()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2100
     * @tc.name      testEnumerationMethods0021
     * @tc.desc      Checking for enum with explicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.toString()).assertEqual("0");
      expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.toString()).assertEqual("10");
      expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.toString()).assertEqual("11");
      expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.toString()).assertEqual("12345");
      expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.toString()).assertEqual("1");
      expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.toString()).assertEqual("1");
      expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.toString()).assertEqual("1");
      expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

      expect(testNS.runTest88()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2200
     * @tc.name      testEnumerationMethods0022
     * @tc.desc      Checking for enum with explicit byte type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.Red.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Red.toString()).assertEqual("0");
      expect(Enum1.Red.toString()).assertEqual(Enum1.Red.valueOf().toString());

      expect(Enum1.Green.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Green.toString()).assertEqual("10");
      expect(Enum1.Green.toString()).assertEqual(Enum1.Green.valueOf().toString());

      expect(Enum1.Blue.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Blue.toString()).assertEqual("11");
      expect(Enum1.Blue.toString()).assertEqual(Enum1.Blue.valueOf().toString());

      expect(Enum1.First.valueOf() instanceof byte).assertTrue();
      expect(Enum1.First.toString()).assertEqual("-128");
      expect(Enum1.First.toString()).assertEqual(Enum1.First.valueOf().toString());

      expect(Enum1.Second.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Second.toString()).assertEqual("123");
      expect(Enum1.Second.toString()).assertEqual(Enum1.Second.valueOf().toString());

      expect(Enum1.Third.valueOf() instanceof byte).assertTrue();
      expect(Enum1.Third.toString()).assertEqual("127");
      expect(Enum1.Third.toString()).assertEqual(Enum1.Third.valueOf().toString());

      expect(Enum1.One.valueOf() instanceof byte).assertTrue();
      expect(Enum1.One.toString()).assertEqual("1");
      expect(Enum1.One.toString()).assertEqual(Enum1.One.valueOf().toString());

      expect(Enum1.one.valueOf() instanceof byte).assertTrue();
      expect(Enum1.one.toString()).assertEqual("1");
      expect(Enum1.one.toString()).assertEqual(Enum1.one.valueOf().toString());

      expect(Enum1.oNe.valueOf() instanceof byte).assertTrue();
      expect(Enum1.oNe.toString()).assertEqual("1");
      expect(Enum1.oNe.toString()).assertEqual(Enum1.oNe.valueOf().toString());

      expect(testNS.runTest92()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2300
     * @tc.name      testEnumerationMethods0023
     * @tc.desc      Checking for enum with explicit short type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest96()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2400
     * @tc.name      testEnumerationMethods0024
     * @tc.desc      Checking for enum with explicit short type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2500
     * @tc.name      testEnumerationMethods0025
     * @tc.desc      Checking for enum with explicit double type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2600
     * @tc.name      testEnumerationMethods0026
     * @tc.desc      Checking for enum with explicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2700
     * @tc.name      testEnumerationMethods0027
     * @tc.desc      Checking for enum with implicit int type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.toString()).assertEqual("0");
      expect(Enum3.Red.toString()).assertEqual(Enum3.Red.valueOf().toString());

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.toString()).assertEqual("10");
      expect(Enum3.Green.toString()).assertEqual(Enum3.Green.valueOf().toString());

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.toString()).assertEqual("11");
      expect(Enum3.Blue.toString()).assertEqual(Enum3.Blue.valueOf().toString());

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.toString()).assertEqual("-2147483648");
      expect(Enum3.First.toString()).assertEqual(Enum3.First.valueOf().toString());

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.toString()).assertEqual("12345");
      expect(Enum3.Second.toString()).assertEqual(Enum3.Second.valueOf().toString());

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.toString()).assertEqual("2147483647");
      expect(Enum3.Third.toString()).assertEqual(Enum3.Third.valueOf().toString());

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.toString()).assertEqual("1");
      expect(Enum3.One.toString()).assertEqual(Enum3.One.valueOf().toString());

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.toString()).assertEqual("1");
      expect(Enum3.one.toString()).assertEqual(Enum3.one.valueOf().toString());

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.toString()).assertEqual("1");
      expect(Enum3.oNe.toString()).assertEqual(Enum3.oNe.valueOf().toString());


      expect(testNS.runTest190()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2800
     * @tc.name      testEnumerationMethods0028
     * @tc.desc      Checking for enum with implicit long type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.toString()).assertEqual("0");
      expect(Enum4.Red.toString()).assertEqual(Enum4.Red.valueOf().toString());

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.toString()).assertEqual("10");
      expect(Enum4.Green.toString()).assertEqual(Enum4.Green.valueOf().toString());

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.toString()).assertEqual("11");
      expect(Enum4.Blue.toString()).assertEqual(Enum4.Blue.valueOf().toString());

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum4.First.toString()).assertEqual(Enum4.First.valueOf().toString());

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.toString()).assertEqual("12345");
      expect(Enum4.Second.toString()).assertEqual(Enum4.Second.valueOf().toString());

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum4.Third.toString()).assertEqual(Enum4.Third.valueOf().toString());

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.toString()).assertEqual("1");
      expect(Enum4.One.toString()).assertEqual(Enum4.One.valueOf().toString());

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.toString()).assertEqual("1");
      expect(Enum4.one.toString()).assertEqual(Enum4.one.valueOf().toString());

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.toString()).assertEqual("1");
      expect(Enum4.oNe.toString()).assertEqual(Enum4.oNe.valueOf().toString());

      expect(testNS.runTest194()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_2900
     * @tc.name      testEnumerationMethods0029
     * @tc.desc      Checking for enum with implicit string type constant that methods c.toString() and
     *               c.valueOf().toString() return the same value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest198()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3000
     * @tc.name      testEnumerationMethods0030
     * @tc.desc      Checking for enum with explicit int type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum3.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum3).assertTrue();
      expect(values[0]).assertEqual(Enum3.Red);
      expect(values[0].valueOf() instanceof int).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum3.Red.valueOf());
      expect(Enum3[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum3).assertTrue();
      expect(values[1]).assertEqual(Enum3.Green);
      expect(values[1].valueOf() instanceof int).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum3.Green.valueOf());
      expect(Enum3[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum3).assertTrue();
      expect(values[2]).assertEqual(Enum3.Blue);
      expect(values[2].valueOf() instanceof int).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum3.Blue.valueOf());
      expect(Enum3[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum3).assertTrue();
      expect(values[3]).assertEqual(Enum3.First);
      expect(values[3].valueOf() instanceof int).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum3.First.valueOf());
      expect(Enum3[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum3).assertTrue();
      expect(values[4]).assertEqual(Enum3.Second);
      expect(values[4].valueOf() instanceof int).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum3.Second.valueOf());
      expect(Enum3[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum3).assertTrue();
      expect(values[5]).assertEqual(Enum3.Third);
      expect(values[5].valueOf() instanceof int).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum3.Third.valueOf());
      expect(Enum3[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum3).assertTrue();
      expect(values[6]).assertEqual(Enum3.One);
      expect(values[6].valueOf() instanceof int).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum3.One.valueOf());
      expect(Enum3[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum3).assertTrue();
      expect(values[7]).assertEqual(Enum3.one);
      expect(values[7].valueOf() instanceof int).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum3.one.valueOf());
      expect(Enum3[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum3).assertTrue();
      expect(values[8]).assertEqual(Enum3.oNe);
      expect(values[8].valueOf() instanceof int).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum3.oNe.valueOf());
      expect(Enum3[values[8]]).assertEqual("oNe");

      expect(testNS.runTest140()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3100
     * @tc.name      testEnumerationMethods0031
     * @tc.desc      Checking for enum with explicit long type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum4.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum4).assertTrue();
      expect(values[0]).assertEqual(Enum4.Red);
      expect(values[0].valueOf() instanceof long).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum4.Red.valueOf());
      expect(Enum4[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum4).assertTrue();
      expect(values[1]).assertEqual(Enum4.Green);
      expect(values[1].valueOf() instanceof long).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum4.Green.valueOf());
      expect(Enum4[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum4).assertTrue();
      expect(values[2]).assertEqual(Enum4.Blue);
      expect(values[2].valueOf() instanceof long).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum4.Blue.valueOf());
      expect(Enum4[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum4).assertTrue();
      expect(values[3]).assertEqual(Enum4.First);
      expect(values[3].valueOf() instanceof long).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum4.First.valueOf());
      expect(Enum4[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum4).assertTrue();
      expect(values[4]).assertEqual(Enum4.Second);
      expect(values[4].valueOf() instanceof long).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum4.Second.valueOf());
      expect(Enum4[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum4).assertTrue();
      expect(values[5]).assertEqual(Enum4.Third);
      expect(values[5].valueOf() instanceof long).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum4.Third.valueOf());
      expect(Enum4[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum4).assertTrue();
      expect(values[6]).assertEqual(Enum4.One);
      expect(values[6].valueOf() instanceof long).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum4.One.valueOf());
      expect(Enum4[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum4).assertTrue();
      expect(values[7]).assertEqual(Enum4.one);
      expect(values[7].valueOf() instanceof long).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum4.one.valueOf());
      expect(Enum4[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum4).assertTrue();
      expect(values[8]).assertEqual(Enum4.oNe);
      expect(values[8].valueOf() instanceof long).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum4.oNe.valueOf());
      expect(Enum4[values[8]]).assertEqual("oNe");

      expect(testNS.runTest142()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3200
     * @tc.name      testEnumerationMethods0032
     * @tc.desc      Checking for enum with explicit byte type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum1.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum1).assertTrue();
      expect(values[0]).assertEqual(Enum1.Red);
      expect(values[0].valueOf() instanceof byte).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum1.Red.valueOf());
      expect(Enum1[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum1).assertTrue();
      expect(values[1]).assertEqual(Enum1.Green);
      expect(values[1].valueOf() instanceof byte).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum1.Green.valueOf());
      expect(Enum1[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum1).assertTrue();
      expect(values[2]).assertEqual(Enum1.Blue);
      expect(values[2].valueOf() instanceof byte).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum1.Blue.valueOf());
      expect(Enum1[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum1).assertTrue();
      expect(values[3]).assertEqual(Enum1.First);
      expect(values[3].valueOf() instanceof byte).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum1.First.valueOf());
      expect(Enum1[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum1).assertTrue();
      expect(values[4]).assertEqual(Enum1.Second);
      expect(values[4].valueOf() instanceof byte).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum1.Second.valueOf());
      expect(Enum1[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum1).assertTrue();
      expect(values[5]).assertEqual(Enum1.Third);
      expect(values[5].valueOf() instanceof byte).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum1.Third.valueOf());
      expect(Enum1[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum1).assertTrue();
      expect(values[6]).assertEqual(Enum1.One);
      expect(values[6].valueOf() instanceof byte).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum1.One.valueOf());
      expect(Enum1[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum1).assertTrue();
      expect(values[7]).assertEqual(Enum1.one);
      expect(values[7].valueOf() instanceof byte).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum1.one.valueOf());
      expect(Enum1[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum1).assertTrue();
      expect(values[8]).assertEqual(Enum1.oNe);
      expect(values[8].valueOf() instanceof byte).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum1.oNe.valueOf());
      expect(Enum1[values[8]]).assertEqual("oNe");

      expect(testNS.runTest144()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3300
     * @tc.name      testEnumerationMethods0033
     * @tc.desc      Checking for enum with explicit short type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum2.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum2).assertTrue();
      expect(values[0]).assertEqual(Enum2.Red);
      expect(values[0].valueOf() instanceof short).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum2.Red.valueOf());
      expect(Enum2[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum2).assertTrue();
      expect(values[1]).assertEqual(Enum2.Green);
      expect(values[1].valueOf() instanceof short).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum2.Green.valueOf());
      expect(Enum2[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum2).assertTrue();
      expect(values[2]).assertEqual(Enum2.Blue);
      expect(values[2].valueOf() instanceof short).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum2.Blue.valueOf());
      expect(Enum2[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum2).assertTrue();
      expect(values[3]).assertEqual(Enum2.First);
      expect(values[3].valueOf() instanceof short).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum2.First.valueOf());
      expect(Enum2[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum2).assertTrue();
      expect(values[4]).assertEqual(Enum2.Second);
      expect(values[4].valueOf() instanceof short).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum2.Second.valueOf());
      expect(Enum2[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum2).assertTrue();
      expect(values[5]).assertEqual(Enum2.Third);
      expect(values[5].valueOf() instanceof short).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum2.Third.valueOf());
      expect(Enum2[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum2).assertTrue();
      expect(values[6]).assertEqual(Enum2.One);
      expect(values[6].valueOf() instanceof short).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum2.One.valueOf());
      expect(Enum2[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum2).assertTrue();
      expect(values[7]).assertEqual(Enum2.one);
      expect(values[7].valueOf() instanceof short).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum2.one.valueOf());
      expect(Enum2[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum2).assertTrue();
      expect(values[8]).assertEqual(Enum2.oNe);
      expect(values[8].valueOf() instanceof short).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum2.oNe.valueOf());
      expect(Enum2[values[8]]).assertEqual("oNe");

      expect(testNS.runTest146()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3400
     * @tc.name      testEnumerationMethods0034
     * @tc.desc      Checking for enum with explicit double type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum6.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum6).assertTrue();
      expect(values[0]).assertEqual(Enum6.Red);
      expect(values[0].valueOf() instanceof double).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum6.Red.valueOf());
      expect(Enum6[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum6).assertTrue();
      expect(values[1]).assertEqual(Enum6.Green);
      expect(values[1].valueOf() instanceof double).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum6.Green.valueOf());
      expect(Enum6[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum6).assertTrue();
      expect(values[2]).assertEqual(Enum6.Blue);
      expect(values[2].valueOf() instanceof double).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum6.Blue.valueOf());
      expect(Enum6[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum6).assertTrue();
      expect(values[3]).assertEqual(Enum6.First);
      expect(values[3].valueOf() instanceof double).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum6.First.valueOf());
      expect(Enum6[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum6).assertTrue();
      expect(values[4]).assertEqual(Enum6.Second);
      expect(values[4].valueOf() instanceof double).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum6.Second.valueOf());
      expect(Enum6[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum6).assertTrue();
      expect(values[5]).assertEqual(Enum6.Third);
      expect(values[5].valueOf() instanceof double).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum6.Third.valueOf());
      expect(Enum6[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum6).assertTrue();
      expect(values[6]).assertEqual(Enum6.One);
      expect(values[6].valueOf() instanceof double).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum6.One.valueOf());
      expect(Enum6[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum6).assertTrue();
      expect(values[7]).assertEqual(Enum6.one);
      expect(values[7].valueOf() instanceof double).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum6.one.valueOf());
      expect(Enum6[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum6).assertTrue();
      expect(values[8]).assertEqual(Enum6.oNe);
      expect(values[8].valueOf() instanceof double).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum6.oNe.valueOf());
      expect(Enum6[values[8]]).assertEqual("oNe");

      expect(testNS.runTest148()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3500
     * @tc.name      testEnumerationMethods0035
     * @tc.desc      Checking for enum with explicit float type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum5.values();
      expect(values.length).assertEqual(9);

      expect(values[0] instanceof Enum5).assertTrue();
      expect(values[0]).assertEqual(Enum5.Red);
      expect(values[0].valueOf() instanceof float).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum5.Red.valueOf());
      expect(Enum5[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum5).assertTrue();
      expect(values[1]).assertEqual(Enum5.Green);
      expect(values[1].valueOf() instanceof float).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum5.Green.valueOf());
      expect(Enum5[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum5).assertTrue();
      expect(values[2]).assertEqual(Enum5.Blue);
      expect(values[2].valueOf() instanceof float).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum5.Blue.valueOf());
      expect(Enum5[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum5).assertTrue();
      expect(values[3]).assertEqual(Enum5.First);
      expect(values[3].valueOf() instanceof float).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum5.First.valueOf());
      expect(Enum5[values[3]]).assertEqual("First");

      expect(values[4] instanceof Enum5).assertTrue();
      expect(values[4]).assertEqual(Enum5.Second);
      expect(values[4].valueOf() instanceof float).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum5.Second.valueOf());
      expect(Enum5[values[4]]).assertEqual("Second");

      expect(values[5] instanceof Enum5).assertTrue();
      expect(values[5]).assertEqual(Enum5.Third);
      expect(values[5].valueOf() instanceof float).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum5.Third.valueOf());
      expect(Enum5[values[5]]).assertEqual("Third");

      expect(values[6] instanceof Enum5).assertTrue();
      expect(values[6]).assertEqual(Enum5.One);
      expect(values[6].valueOf() instanceof float).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum5.One.valueOf());
      expect(Enum5[values[6]]).assertEqual("One");

      expect(values[7] instanceof Enum5).assertTrue();
      expect(values[7]).assertEqual(Enum5.one);
      expect(values[7].valueOf() instanceof float).assertTrue();
      expect(values[7].valueOf()).assertEqual(Enum5.one.valueOf());
      expect(Enum5[values[7]]).assertEqual("one");

      expect(values[8] instanceof Enum5).assertTrue();
      expect(values[8]).assertEqual(Enum5.oNe);
      expect(values[8].valueOf() instanceof float).assertTrue();
      expect(values[8].valueOf()).assertEqual(Enum5.oNe.valueOf());
      expect(Enum5[values[8]]).assertEqual("oNe");

      expect(testNS.runTest150()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3600
     * @tc.name      testEnumerationMethods0036
     * @tc.desc      Checking for enum with explicit string type constant for values method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = Enum7.values();
      expect(values.length).assertEqual(7);

      expect(values[0] instanceof Enum7).assertTrue();
      expect(values[0]).assertEqual(Enum7.Red);
      expect(values[0].valueOf() instanceof String).assertTrue();
      expect(values[0].valueOf()).assertEqual(Enum7.Red.valueOf());
      expect(Enum7[values[0]]).assertEqual("Red");

      expect(values[1] instanceof Enum7).assertTrue();
      expect(values[1]).assertEqual(Enum7.Green);
      expect(values[1].valueOf() instanceof String).assertTrue();
      expect(values[1].valueOf()).assertEqual(Enum7.Green.valueOf());
      expect(Enum7[values[1]]).assertEqual("Green");

      expect(values[2] instanceof Enum7).assertTrue();
      expect(values[2]).assertEqual(Enum7.Blue);
      expect(values[2].valueOf() instanceof String).assertTrue();
      expect(values[2].valueOf()).assertEqual(Enum7.Blue.valueOf());
      expect(Enum7[values[2]]).assertEqual("Blue");

      expect(values[3] instanceof Enum7).assertTrue();
      expect(values[3]).assertEqual(Enum7.Complex);
      expect(values[3].valueOf() instanceof String).assertTrue();
      expect(values[3].valueOf()).assertEqual(Enum7.Complex.valueOf());
      expect(Enum7[values[3]]).assertEqual("Complex");

      expect(values[4] instanceof Enum7).assertTrue();
      expect(values[4]).assertEqual(Enum7.One);
      expect(values[4].valueOf() instanceof String).assertTrue();
      expect(values[4].valueOf()).assertEqual(Enum7.One.valueOf());
      expect(Enum7[values[4]]).assertEqual("One");

      expect(values[5] instanceof Enum7).assertTrue();
      expect(values[5]).assertEqual(Enum7.one);
      expect(values[5].valueOf() instanceof String).assertTrue();
      expect(values[5].valueOf()).assertEqual(Enum7.one.valueOf());
      expect(Enum7[values[5]]).assertEqual("one");

      expect(values[6] instanceof Enum7).assertTrue();
      expect(values[6]).assertEqual(Enum7.oNe);
      expect(values[6].valueOf() instanceof String).assertTrue();
      expect(values[6].valueOf()).assertEqual(Enum7.oNe.valueOf());
      expect(Enum7[values[6]]).assertEqual("oNe");

      expect(testNS.runTest152()).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3700
     * @tc.name      testEnumerationMethods0037
     * @tc.desc      Method getName() returns the name of an enumeration constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Color.Green;
      expect(c.getName()).assertEqual("Green");
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3800
     * @tc.name      testEnumerationMethods0038
     * @tc.desc      Method getName() returns the name of an enumeration constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Color1.Blue;
      expect(c.getName()).assertEqual("Blue");
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_3900
     * @tc.name      testEnumerationMethods0039
     * @tc.desc      valueOf() returns a value of enumeration constant which is either of int or string type.
     *               Int enum used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(GeneratedEnum.A.valueOf()).assertEqual(0);
      expect(GeneratedEnum.AA.valueOf()).assertEqual(1);
      expect(GeneratedEnum.AAA.valueOf()).assertEqual(2);
      expect(GeneratedEnum.AAAA.valueOf()).assertEqual(3);
      expect(GeneratedEnum.AAAAA.valueOf()).assertEqual(4);
      expect(GeneratedEnum.AAAAAA.valueOf()).assertEqual(5);
      expect(GeneratedEnum.AAAAAAA.valueOf()).assertEqual(6);
      expect(GeneratedEnum.AAAAAAAA.valueOf()).assertEqual(7);
      expect(GeneratedEnum.AAAAAAAAA.valueOf()).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_4000
     * @tc.name      testEnumerationMethods0040
     * @tc.desc      valueOf() returns a value of enumeration constant which is either of int or string type.
     *               String enum used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(GeneratedEnum1.A.valueOf()).assertEqual("A");
      expect(GeneratedEnum1.AA.valueOf()).assertEqual("AA");
      expect(GeneratedEnum1.AAA.valueOf()).assertEqual("AAA");
      expect(GeneratedEnum1.AAAA.valueOf()).assertEqual("AAAA");
      expect(GeneratedEnum1.AAAAA.valueOf()).assertEqual("AAAAA");
      expect(GeneratedEnum1.AAAAAA.valueOf()).assertEqual("AAAAAA");
      expect(GeneratedEnum1.AAAAAAA.valueOf()).assertEqual("AAAAAAA");
      expect(GeneratedEnum1.AAAAAAAA.valueOf()).assertEqual("AAAAAAAA");
      expect(GeneratedEnum1.AAAAAAAAA.valueOf()).assertEqual("AAAAAAAAA");
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_4100
     * @tc.name      testEnumerationMethods0041
     * @tc.desc      c.toString() returns the same value as c.valueOf().toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color2 = Color2.Green;
      expect(c.toString()).assertEqual(c.valueOf().toString());
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_4200
     * @tc.name      testEnumerationMethods0042
     * @tc.desc      c.toString() returns the same value as c.valueOf().toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color3 = Color3.Green;
      expect(c.toString()).assertEqual((c.valueOf() as Int).toString());
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_4300
     * @tc.name      testEnumerationMethods0043
     * @tc.desc      getValueOf(string) returns an enumeration constant with the given name, or throws an error if no
     *               constant with such name exists.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color = Color.Red;
      let colors = Color.values();
      let red = Color.getValueOf("Red");
      expect(red).assertEqual(colors[0]);
      expect(c == red).assertTrue();
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_4400
     * @tc.name      testEnumerationMethods0044
     * @tc.desc      'Method getName() returns the name of an enumeration constant. Method valueOf() returns an int or
     *               string value of an enumeration constant depending on the type of the enumeration constant.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Color4.Red.getName()).assertEqual("Red");
      expect(Color4.Red.valueOf()).assertEqual(777);
    });

    /**
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_4500
     * @tc.name      testEnumerationMethods0045
     * @tc.desc      values() returns an array of enumeration constants in the order of declaration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let colors = Color.values();
      expect(colors[0]).assertEqual(Color.Red);
      expect(colors[1]).assertEqual(Color.Green);
      expect(colors[2]).assertEqual(Color.Blue);
      expect(f(colors)).assertEqual(3);
    });
  })
}