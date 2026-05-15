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

  // enum_implicit_type_getname_0.ets
  export function runTest166(): boolean {
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

  // enum_implicit_type_getname_1.ets
  export function runTest167(): boolean {
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

  // enum_implicit_type_getname_2.ets
  export function runTest168(): boolean {
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

  // enum_implicit_type_getname_3.ets
  export function runTest169(): boolean {
    expect(Enum3.Red.valueOf() instanceof int).assertTrue();
    expect(Enum3.Red.getName() instanceof String).assertTrue();
    expect(Enum3.Red.getName()).assertEqual("Red");

    expect(Enum3.Green.valueOf() instanceof int).assertTrue();
    expect(Enum3.Green.getName() instanceof String).assertTrue();
    expect(Enum3.Green.getName()).assertEqual("Green");

    expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
    expect(Enum3.Blue.getName() instanceof String).assertTrue();
    expect(Enum3.Blue.getName()).assertEqual("Blue");

    expect(Enum3.First.valueOf() instanceof int).assertTrue();
    expect(Enum3.First.getName() instanceof String).assertTrue();
    expect(Enum3.First.getName()).assertEqual("First");

    expect(Enum3.Second.valueOf() instanceof int).assertTrue();
    expect(Enum3.Second.getName() instanceof String).assertTrue();
    expect(Enum3.Second.getName()).assertEqual("Second");

    expect(Enum3.Third.valueOf() instanceof int).assertTrue();
    expect(Enum3.Third.getName() instanceof String).assertTrue();
    expect(Enum3.Third.getName()).assertEqual("Third");

    expect(Enum3.One.valueOf() instanceof int).assertTrue();
    expect(Enum3.One.getName() instanceof String).assertTrue();
    expect(Enum3.One.getName()).assertEqual("One");

    expect(Enum3.one.valueOf() instanceof int).assertTrue();
    expect(Enum3.one.getName() instanceof String).assertTrue();
    expect(Enum3.one.getName()).assertEqual("one");

    expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
    expect(Enum3.oNe.getName() instanceof String).assertTrue();
    expect(Enum3.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_4.ets
  export function runTest170(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.getName() instanceof string).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.getName() instanceof string).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.getName() instanceof string).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.getName() instanceof string).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.getName() instanceof string).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.getName() instanceof string).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.getName() instanceof string).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.getName() instanceof string).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.getName() instanceof string).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_5.ets
  export function runTest171(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.getName() instanceof string).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.getName() instanceof string).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.getName() instanceof string).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.getName() instanceof string).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.getName() instanceof string).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.getName() instanceof string).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.getName() instanceof string).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.getName() instanceof string).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.getName() instanceof string).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_6.ets
  export function runTest172(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.getName() instanceof string).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.getName() instanceof string).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.getName() instanceof string).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.getName() instanceof string).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.getName() instanceof string).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.getName() instanceof string).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.getName() instanceof string).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.getName() instanceof string).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.getName() instanceof string).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_7.ets
  export function runTest173(): boolean {
    expect(Enum4.Red.valueOf() instanceof long).assertTrue();
    expect(Enum4.Red.getName() instanceof string).assertTrue();
    expect(Enum4.Red.getName()).assertEqual("Red");

    expect(Enum4.Green.valueOf() instanceof long).assertTrue();
    expect(Enum4.Green.getName() instanceof string).assertTrue();
    expect(Enum4.Green.getName()).assertEqual("Green");

    expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
    expect(Enum4.Blue.getName() instanceof string).assertTrue();
    expect(Enum4.Blue.getName()).assertEqual("Blue");

    expect(Enum4.First.valueOf() instanceof long).assertTrue();
    expect(Enum4.First.getName() instanceof string).assertTrue();
    expect(Enum4.First.getName()).assertEqual("First");

    expect(Enum4.Second.valueOf() instanceof long).assertTrue();
    expect(Enum4.Second.getName() instanceof string).assertTrue();
    expect(Enum4.Second.getName()).assertEqual("Second");

    expect(Enum4.Third.valueOf() instanceof long).assertTrue();
    expect(Enum4.Third.getName() instanceof string).assertTrue();
    expect(Enum4.Third.getName()).assertEqual("Third");

    expect(Enum4.One.valueOf() instanceof long).assertTrue();
    expect(Enum4.One.getName() instanceof string).assertTrue();
    expect(Enum4.One.getName()).assertEqual("One");

    expect(Enum4.one.valueOf() instanceof long).assertTrue();
    expect(Enum4.one.getName() instanceof string).assertTrue();
    expect(Enum4.one.getName()).assertEqual("one");

    expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
    expect(Enum4.oNe.getName() instanceof string).assertTrue();
    expect(Enum4.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_8.ets
  export function runTest174(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_9.ets
  export function runTest175(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_10.ets
  export function runTest176(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

    return true;
  }

  // enum_implicit_type_getname_11.ets
  export function runTest177(): boolean {
    expect(Enum7.Red.valueOf() instanceof String).assertTrue();
    expect(Enum7.Red.getName() instanceof String).assertTrue();
    expect(Enum7.Red.getName()).assertEqual("Red");

    expect(Enum7.Green.valueOf() instanceof String).assertTrue();
    expect(Enum7.Green.getName() instanceof String).assertTrue();
    expect(Enum7.Green.getName()).assertEqual("Green");

    expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
    expect(Enum7.Blue.getName() instanceof String).assertTrue();
    expect(Enum7.Blue.getName()).assertEqual("Blue");

    expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
    expect(Enum7.Complex.getName() instanceof String).assertTrue();
    expect(Enum7.Complex.getName()).assertEqual("Complex");

    expect(Enum7.One.valueOf() instanceof String).assertTrue();
    expect(Enum7.One.getName() instanceof String).assertTrue();
    expect(Enum7.One.getName()).assertEqual("One");

    expect(Enum7.one.valueOf() instanceof String).assertTrue();
    expect(Enum7.one.getName() instanceof String).assertTrue();
    expect(Enum7.one.getName()).assertEqual("one");

    expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
    expect(Enum7.oNe.getName() instanceof String).assertTrue();
    expect(Enum7.oNe.getName()).assertEqual("oNe");

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
     * 源文件：        enum_implicit_type_getname_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0167
     * @tc.desc      Checking for enum with implicit int type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest166()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0168
     * @tc.desc      Checking for enum with implicit int type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest167()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0169
     * @tc.desc      Checking for enum with implicit int type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest168()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0170
     * @tc.desc      Checking for enum with implicit int type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.Red.valueOf() instanceof int).assertTrue();
      expect(Enum3.Red.getName() instanceof String).assertTrue();
      expect(Enum3.Red.getName()).assertEqual("Red");

      expect(Enum3.Green.valueOf() instanceof int).assertTrue();
      expect(Enum3.Green.getName() instanceof String).assertTrue();
      expect(Enum3.Green.getName()).assertEqual("Green");

      expect(Enum3.Blue.valueOf() instanceof int).assertTrue();
      expect(Enum3.Blue.getName() instanceof String).assertTrue();
      expect(Enum3.Blue.getName()).assertEqual("Blue");

      expect(Enum3.First.valueOf() instanceof int).assertTrue();
      expect(Enum3.First.getName() instanceof String).assertTrue();
      expect(Enum3.First.getName()).assertEqual("First");

      expect(Enum3.Second.valueOf() instanceof int).assertTrue();
      expect(Enum3.Second.getName() instanceof String).assertTrue();
      expect(Enum3.Second.getName()).assertEqual("Second");

      expect(Enum3.Third.valueOf() instanceof int).assertTrue();
      expect(Enum3.Third.getName() instanceof String).assertTrue();
      expect(Enum3.Third.getName()).assertEqual("Third");

      expect(Enum3.One.valueOf() instanceof int).assertTrue();
      expect(Enum3.One.getName() instanceof String).assertTrue();
      expect(Enum3.One.getName()).assertEqual("One");

      expect(Enum3.one.valueOf() instanceof int).assertTrue();
      expect(Enum3.one.getName() instanceof String).assertTrue();
      expect(Enum3.one.getName()).assertEqual("one");

      expect(Enum3.oNe.valueOf() instanceof int).assertTrue();
      expect(Enum3.oNe.getName() instanceof String).assertTrue();
      expect(Enum3.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest169()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0171
     * @tc.desc      Checking for enum with implicit long type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.getName() instanceof string).assertTrue();
      expect(Enum4.Red.getName()).assertEqual("Red");

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.getName() instanceof string).assertTrue();
      expect(Enum4.Green.getName()).assertEqual("Green");

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.getName() instanceof string).assertTrue();
      expect(Enum4.Blue.getName()).assertEqual("Blue");

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.getName() instanceof string).assertTrue();
      expect(Enum4.First.getName()).assertEqual("First");

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.getName() instanceof string).assertTrue();
      expect(Enum4.Second.getName()).assertEqual("Second");

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.getName() instanceof string).assertTrue();
      expect(Enum4.Third.getName()).assertEqual("Third");

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.getName() instanceof string).assertTrue();
      expect(Enum4.One.getName()).assertEqual("One");

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.getName() instanceof string).assertTrue();
      expect(Enum4.one.getName()).assertEqual("one");

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.getName() instanceof string).assertTrue();
      expect(Enum4.oNe.getName()).assertEqual("oNe");


      expect(testNS.runTest170()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0172
     * @tc.desc      Checking for enum with implicit long type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.getName() instanceof string).assertTrue();
      expect(Enum4.Red.getName()).assertEqual("Red");

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.getName() instanceof string).assertTrue();
      expect(Enum4.Green.getName()).assertEqual("Green");

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.getName() instanceof string).assertTrue();
      expect(Enum4.Blue.getName()).assertEqual("Blue");

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.getName() instanceof string).assertTrue();
      expect(Enum4.First.getName()).assertEqual("First");

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.getName() instanceof string).assertTrue();
      expect(Enum4.Second.getName()).assertEqual("Second");

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.getName() instanceof string).assertTrue();
      expect(Enum4.Third.getName()).assertEqual("Third");

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.getName() instanceof string).assertTrue();
      expect(Enum4.One.getName()).assertEqual("One");

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.getName() instanceof string).assertTrue();
      expect(Enum4.one.getName()).assertEqual("one");

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.getName() instanceof string).assertTrue();
      expect(Enum4.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest171()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0173
     * @tc.desc      Checking for enum with implicit long type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.getName() instanceof string).assertTrue();
      expect(Enum4.Red.getName()).assertEqual("Red");

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.getName() instanceof string).assertTrue();
      expect(Enum4.Green.getName()).assertEqual("Green");

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.getName() instanceof string).assertTrue();
      expect(Enum4.Blue.getName()).assertEqual("Blue");

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.getName() instanceof string).assertTrue();
      expect(Enum4.First.getName()).assertEqual("First");

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.getName() instanceof string).assertTrue();
      expect(Enum4.Second.getName()).assertEqual("Second");

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.getName() instanceof string).assertTrue();
      expect(Enum4.Third.getName()).assertEqual("Third");

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.getName() instanceof string).assertTrue();
      expect(Enum4.One.getName()).assertEqual("One");

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.getName() instanceof string).assertTrue();
      expect(Enum4.one.getName()).assertEqual("one");

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.getName() instanceof string).assertTrue();
      expect(Enum4.oNe.getName()).assertEqual("oNe");


      expect(testNS.runTest172()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0174
     * @tc.desc      Checking for enum with implicit long type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.Red.valueOf() instanceof long).assertTrue();
      expect(Enum4.Red.getName() instanceof string).assertTrue();
      expect(Enum4.Red.getName()).assertEqual("Red");

      expect(Enum4.Green.valueOf() instanceof long).assertTrue();
      expect(Enum4.Green.getName() instanceof string).assertTrue();
      expect(Enum4.Green.getName()).assertEqual("Green");

      expect(Enum4.Blue.valueOf() instanceof long).assertTrue();
      expect(Enum4.Blue.getName() instanceof string).assertTrue();
      expect(Enum4.Blue.getName()).assertEqual("Blue");

      expect(Enum4.First.valueOf() instanceof long).assertTrue();
      expect(Enum4.First.getName() instanceof string).assertTrue();
      expect(Enum4.First.getName()).assertEqual("First");

      expect(Enum4.Second.valueOf() instanceof long).assertTrue();
      expect(Enum4.Second.getName() instanceof string).assertTrue();
      expect(Enum4.Second.getName()).assertEqual("Second");

      expect(Enum4.Third.valueOf() instanceof long).assertTrue();
      expect(Enum4.Third.getName() instanceof string).assertTrue();
      expect(Enum4.Third.getName()).assertEqual("Third");

      expect(Enum4.One.valueOf() instanceof long).assertTrue();
      expect(Enum4.One.getName() instanceof string).assertTrue();
      expect(Enum4.One.getName()).assertEqual("One");

      expect(Enum4.one.valueOf() instanceof long).assertTrue();
      expect(Enum4.one.getName() instanceof string).assertTrue();
      expect(Enum4.one.getName()).assertEqual("one");

      expect(Enum4.oNe.valueOf() instanceof long).assertTrue();
      expect(Enum4.oNe.getName() instanceof string).assertTrue();
      expect(Enum4.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest173()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0175
     * @tc.desc      Checking for enum with implicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest174()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0176
     * @tc.desc      Checking for enum with implicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest175()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0177
     * @tc.desc      Checking for enum with implicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest176()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_getname_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0178
     * @tc.desc      Checking for enum with implicit string type constant for getName method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum7.Red.valueOf() instanceof String).assertTrue();
      expect(Enum7.Red.getName() instanceof String).assertTrue();
      expect(Enum7.Red.getName()).assertEqual("Red");

      expect(Enum7.Green.valueOf() instanceof String).assertTrue();
      expect(Enum7.Green.getName() instanceof String).assertTrue();
      expect(Enum7.Green.getName()).assertEqual("Green");

      expect(Enum7.Blue.valueOf() instanceof String).assertTrue();
      expect(Enum7.Blue.getName() instanceof String).assertTrue();
      expect(Enum7.Blue.getName()).assertEqual("Blue");

      expect(Enum7.Complex.valueOf() instanceof String).assertTrue();
      expect(Enum7.Complex.getName() instanceof String).assertTrue();
      expect(Enum7.Complex.getName()).assertEqual("Complex");

      expect(Enum7.One.valueOf() instanceof String).assertTrue();
      expect(Enum7.One.getName() instanceof String).assertTrue();
      expect(Enum7.One.getName()).assertEqual("One");

      expect(Enum7.one.valueOf() instanceof String).assertTrue();
      expect(Enum7.one.getName() instanceof String).assertTrue();
      expect(Enum7.one.getName()).assertEqual("one");

      expect(Enum7.oNe.valueOf() instanceof String).assertTrue();
      expect(Enum7.oNe.getName() instanceof String).assertTrue();
      expect(Enum7.oNe.getName()).assertEqual("oNe");

      expect(testNS.runTest177()).assertTrue();
    });
  })
}