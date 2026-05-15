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
  // enum_implicit_type_fromvalue_0.ets
  export function runTest154(): boolean {
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

  // enum_implicit_type_fromvalue_1.ets
  export function runTest155(): boolean {
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

  // enum_implicit_type_fromvalue_3.ets
  export function runTest157(): boolean {
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

  // enum_implicit_type_fromvalue_5.ets
  export function runTest159(): boolean {
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
     * 源文件：        enum_implicit_type_fromvalue_0.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0100
     * @tc.name      testEnumerationMethods0155
     * @tc.desc      Checking for enum with implicit int type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest154()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_fromvalue_1.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0200
     * @tc.name      testEnumerationMethods0156
     * @tc.desc      Checking for enum with implicit int type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest155()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_fromvalue_2.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0300
     * @tc.name      testEnumerationMethods0157
     * @tc.desc      Checking for enum with implicit long type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * 源文件：        enum_implicit_type_fromvalue_3.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0400
     * @tc.name      testEnumerationMethods0158
     * @tc.desc      Checking for enum with implicit long type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest157()).assertTrue();
    });

    /**
     * 源文件：        enum_implicit_type_fromvalue_4.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0500
     * @tc.name      testEnumerationMethods0159
     * @tc.desc      Checking for enum with implicit string type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * 源文件：        enum_implicit_type_fromvalue_5.ets
     * @tc.number    SUB_ENUMERATION_METHODS_XTSTEST_0600
     * @tc.name      testEnumerationMethods0160
     * @tc.desc      Checking for enum with implicit string type constant for fromValue method support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumerationMethods0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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


      expect(testNS.runTest159()).assertTrue();
    });
  })
}