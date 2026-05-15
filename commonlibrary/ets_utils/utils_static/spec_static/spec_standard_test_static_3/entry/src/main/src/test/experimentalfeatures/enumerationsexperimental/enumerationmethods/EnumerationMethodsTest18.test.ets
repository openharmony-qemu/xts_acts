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

  // enum_implicit_type_valueof_1.ets
  export function runTest203(): boolean {
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

  // enum_implicit_type_valueof_2.ets
  export function runTest204(): boolean {
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

  // enum_implicit_type_valueof_3.ets
  export function runTest205(): boolean {
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

  // enum_implicit_type_valueof_5.ets
  export function runTest207(): boolean {
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

  // enum_implicit_type_valueof_6.ets
  export function runTest208(): boolean {
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

  // enum_implicit_type_valueof_7.ets
  export function runTest209(): boolean {
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

  // enum_implicit_type_valueof_9.ets
  export function runTest211(): boolean {
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

  // enum_implicit_type_valueof_10.ets
  export function runTest212(): boolean {
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

  // enum_implicit_type_valueof_11.ets
  export function runTest213(): boolean {
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
     * 源文件：        enum_implicit_type_valueof_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0203
     * @tc.desc      Checking for enum with implicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * 源文件：        enum_implicit_type_valueof_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0204
     * @tc.desc      Checking for enum with implicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest203()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0205
     * @tc.desc      Checking for enum with implicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest204()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0206
     * @tc.desc      Checking for enum with implicit int type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest205()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0207
     * @tc.desc      Checking for enum with implicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * 源文件：        enum_implicit_type_valueof_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0208
     * @tc.desc      Checking for enum with implicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest207()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_6.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0700
     * @tc.name      testEnumerationMethods0209
     * @tc.desc      Checking for enum with implicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest208()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_7.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0800
     * @tc.name      testEnumerationMethods0210
     * @tc.desc      Checking for enum with implicit long type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest209()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_8.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0900
     * @tc.name      testEnumerationMethods0211
     * @tc.desc      Checking for enum with implicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * 源文件：        enum_implicit_type_valueof_9.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1000
     * @tc.name      testEnumerationMethods0212
     * @tc.desc      Checking for enum with implicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest211()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_10.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1100
     * @tc.name      testEnumerationMethods0213
     * @tc.desc      Checking for enum with implicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest212()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_valueof_11.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_1200
     * @tc.name      testEnumerationMethods0214
     * @tc.desc      Checking for enum with implicit string type constant for valueOf method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

      expect(testNS.runTest213()).assertTrue();
    });
  })
}