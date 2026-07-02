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

enum Enum: double { first = 1.1, second = 1.2, third = 1.3 }
enum Enum1: double { first = 10e1, second = 1.2, third = 1.1 }
enum Enum2: double { first = 1.7976931348623155e+308, second = 1.7976931348623157e+308 }
enum Enum3: double { first = 1.23, second = 1.234, third = 0.134 }
enum Enum4: double { first = -1.1, second = -1.2, third = -42.43 }
enum Enum5: int {
  Red,
  Green = 10,
  Blue,
  First = -2147483648,
  Second = 12345,
  Third = 2147483647,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum6: long {
  Red,
  Green = 10,
  Blue,
  First = -9223372036854775808,
  Second = 12345,
  Third = 9223372036854775807,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum7: byte {
  Red,
  Green = 10,
  Blue,
  First = -128,
  Second = 123,
  Third = 127,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum8: short {
  Red,
  Green = 10,
  Blue,
  First = -32768,
  Second = 12345,
  Third = 32767,
  One = 1,
  one = 1,
  oNe = 1
}

enum Enum9: double {
  Red = 1.5,
  Green = 10.3,
  Blue = 7.6,
  First = -214748.3648,
  Second = 123.45,
  Third = 2147483.647,
  One = 1.0,
  one = 1.0,
  oNe = 1.0
}

enum Enum10: float {
  Red = 1.5f,
  Green = 10.3f,
  Blue = 7.6f,
  First = -214748.3648f,
  Second = 123.45f,
  Third = 2147483.647f,
  One = 1.0f,
  one = 1.0f,
  oNe = 1.0f
}

enum Enum11: string {
  Red = "reD",
  Green = "grEen",
  Blue = "Blue",
  Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
  One = "one",
  one = "one",
  oNe = "one"
}

namespace testNS {
  export enum Enum: int {
    Red,
    Green = 10,
    Blue,
    First = -2147483648,
    Second = 12345,
    Third = 2147483647,
    One = 1,
    one = 1,
    oNe = 1
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(0);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.Red);
    expect(Enum[c]).assertEqual("Red");

    c = Enum.fromValue(10);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.Green);
    expect(Enum[c]).assertEqual("Green");

    c = Enum.fromValue(11);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.Blue);
    expect(Enum[c]).assertEqual("Blue");

    c = Enum.fromValue(-2147483648);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.First);
    expect(Enum[c]).assertEqual("First");

    c = Enum.fromValue(12345);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.Second);
    expect(Enum[c]).assertEqual("Second");

    c = Enum.fromValue(2147483647);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.Third);
    expect(Enum[c]).assertEqual("Third");

    c = Enum.fromValue(1);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof int).assertEqual(true);
    expect(c).assertEqual(Enum.oNe);
    expect(Enum[c]).assertEqual("oNe");

    return true;
  }
}

namespace testNS1 {
  export enum Enum: long {
    Red,
    Green = 10,
    Blue,
    First = -9223372036854775808,
    Second = 12345,
    Third = 9223372036854775807,
    One = 1,
    one = 1,
    oNe = 1
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(0);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.Red);
    expect(Enum[c]).assertEqual("Red");

    c = Enum.fromValue(10);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.Green);
    expect(Enum[c]).assertEqual("Green");

    c = Enum.fromValue(11);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.Blue);
    expect(Enum[c]).assertEqual("Blue");

    c = Enum.fromValue(-9223372036854775808);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.First);
    expect(Enum[c]).assertEqual("First");

    c = Enum.fromValue(12345);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.Second);
    expect(Enum[c]).assertEqual("Second");

    c = Enum.fromValue(9223372036854775807);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.Third);
    expect(Enum[c]).assertEqual("Third");

    c = Enum.fromValue(1);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof long).assertEqual(true);
    expect(c).assertEqual(Enum.oNe);
    expect(Enum[c]).assertEqual("oNe");

    return true;
  }
}

namespace testNS2 {
  export enum Enum: byte {
    Red,
    Green = 10,
    Blue,
    First = -128,
    Second = 123,
    Third = 127,
    One = 1,
    one = 1,
    oNe = 1
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(0);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.Red);
    expect(Enum[c]).assertEqual("Red");

    c = Enum.fromValue(10);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.Green);
    expect(Enum[c]).assertEqual("Green");

    c = Enum.fromValue(11);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.Blue);
    expect(Enum[c]).assertEqual("Blue");

    c = Enum.fromValue(-128);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.First);
    expect(Enum[c]).assertEqual("First");

    c = Enum.fromValue(123);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.Second);
    expect(Enum[c]).assertEqual("Second");

    c = Enum.fromValue(127);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.Third);
    expect(Enum[c]).assertEqual("Third");

    c = Enum.fromValue(1);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof byte).assertEqual(true);
    expect(c).assertEqual(Enum.oNe);
    expect(Enum[c]).assertEqual("oNe");

    return true;
  }
}

namespace testNS3 {
  export enum Enum: short {
    Red,
    Green = 10,
    Blue,
    First = -32768,
    Second = 12345,
    Third = 32767,
    One = 1,
    one = 1,
    oNe = 1
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(0);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.Red);
    expect(Enum[c]).assertEqual("Red");

    c = Enum.fromValue(10);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.Green);
    expect(Enum[c]).assertEqual("Green");

    c = Enum.fromValue(11);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.Blue);
    expect(Enum[c]).assertEqual("Blue");

    c = Enum.fromValue(-32768);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.First);
    expect(Enum[c]).assertEqual("First");

    c = Enum.fromValue(12345);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.Second);
    expect(Enum[c]).assertEqual("Second");

    c = Enum.fromValue(32767);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.Third);
    expect(Enum[c]).assertEqual("Third");

    c = Enum.fromValue(1);
    expect(c instanceof Enum).assertEqual(true);
    expect(c.valueOf() instanceof short).assertEqual(true);
    expect(c).assertEqual(Enum.oNe);
    expect(Enum[c]).assertEqual("oNe");

    return true;
  }
}

namespace testNS4 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1.0, one = 1.0, oNe = 1.0
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(1.5)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Red)
    expect(Enum[c]).assertEqual("Red")

    c = Enum.fromValue(10.3)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Green)
    expect(Enum[c]).assertEqual("Green")

    c = Enum.fromValue(7.6)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Blue)
    expect(Enum[c]).assertEqual("Blue")

    c = Enum.fromValue(-214748.3648)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.First)
    expect(Enum[c]).assertEqual("First")

    c = Enum.fromValue(123.45)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Second)
    expect(Enum[c]).assertEqual("Second")

    c = Enum.fromValue(2147483.647)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Third)
    expect(Enum[c]).assertEqual("Third")

    c = Enum.fromValue(1.0)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.oNe)
    expect(Enum[c]).assertEqual("oNe")

    return true
  }
}

namespace testNS5 {
  enum Enum: double {
    Red = 1.5, Green = 10.3, Blue = 7.6,
    First = -214748.3648, Second = 123.45, Third = 2147483.647,
    One = 1.0, one = 1.0, oNe = 1.0
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(1.5)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Red)
    expect(Enum[c]).assertEqual("Red")

    c = Enum.fromValue(10.3)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Green)
    expect(Enum[c]).assertEqual("Green")

    c = Enum.fromValue(7.6)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Blue)
    expect(Enum[c]).assertEqual("Blue")

    c = Enum.fromValue(-214748.3648)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.First)
    expect(Enum[c]).assertEqual("First")

    c = Enum.fromValue(123.45)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Second)
    expect(Enum[c]).assertEqual("Second")

    c = Enum.fromValue(2147483.647)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.Third)
    expect(Enum[c]).assertEqual("Third")

    c = Enum.fromValue(1.0)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof double).assertEqual(true)
    expect(c).assertEqual(Enum.oNe)
    expect(Enum[c]).assertEqual("oNe")

    return true
  }
}

namespace testNS6 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(1.5f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Red)
    expect(Enum[c]).assertEqual("Red")

    c = Enum.fromValue(10.3f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Green)
    expect(Enum[c]).assertEqual("Green")

    c = Enum.fromValue(7.6f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Blue)
    expect(Enum[c]).assertEqual("Blue")

    c = Enum.fromValue(-214748.3648f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.First)
    expect(Enum[c]).assertEqual("First")

    c = Enum.fromValue(123.45f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Second)
    expect(Enum[c]).assertEqual("Second")

    c = Enum.fromValue(2147483.647f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Third)
    expect(Enum[c]).assertEqual("Third")

    c = Enum.fromValue(1.0f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.oNe)
    expect(Enum[c]).assertEqual("oNe")

    return true
  }
}

namespace testNS7 {
  enum Enum: float {
    Red = 1.5f, Green = 10.3f, Blue = 7.6f,
    First = -214748.3648f, Second = 123.45f, Third = 2147483.647f,
    One = 1.0f, one = 1.0f, oNe = 1.0f
  }

  export function runTest(): boolean {
    let c = Enum.fromValue(1.5f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Red)
    expect(Enum[c]).assertEqual("Red")

    c = Enum.fromValue(10.3f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Green)
    expect(Enum[c]).assertEqual("Green")

    c = Enum.fromValue(7.6f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Blue)
    expect(Enum[c]).assertEqual("Blue")

    c = Enum.fromValue(-214748.3648f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.First)
    expect(Enum[c]).assertEqual("First")

    c = Enum.fromValue(123.45f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Second)
    expect(Enum[c]).assertEqual("Second")

    c = Enum.fromValue(2147483.647f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.Third)
    expect(Enum[c]).assertEqual("Third")

    c = Enum.fromValue(1.0f)
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof float).assertEqual(true)
    expect(c).assertEqual(Enum.oNe)
    expect(Enum[c]).assertEqual("oNe")

    return true
  }
}

namespace testNS8 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    let c = Enum.fromValue("reD")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Red)
    expect(Enum[c]).assertEqual("Red")

    c = Enum.fromValue("grEen")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Green)
    expect(Enum[c]).assertEqual("Green")

    c = Enum.fromValue("Blue")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Blue)
    expect(Enum[c]).assertEqual("Blue")

    c = Enum.fromValue("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Complex)
    expect(Enum[c]).assertEqual("Complex")

    c = Enum.fromValue("one")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.oNe)
    expect(Enum[c]).assertEqual("oNe")

    return true
  }
}

namespace testNS9 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    let c = Enum.fromValue("reD")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Red)
    expect(Enum[c]).assertEqual("Red")

    c = Enum.fromValue("grEen")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Green)
    expect(Enum[c]).assertEqual("Green")

    c = Enum.fromValue("Blue")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Blue)
    expect(Enum[c]).assertEqual("Blue")

    c = Enum.fromValue("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.Complex)
    expect(Enum[c]).assertEqual("Complex")

    c = Enum.fromValue("one")
    expect(c instanceof Enum).assertEqual(true)
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(c).assertEqual(Enum.oNe)
    expect(Enum[c]).assertEqual("oNe")

    return true
  }
}

export default function EnumerationWithExplicitTypeTest01(): void {
  describe('EnumerationWithExplicitTypeTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0001
     * @tc.desc      A double value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum.first instanceof Enum).assertEqual(true);
      expect(Enum.second instanceof Enum).assertEqual(true);
      expect(Enum.third instanceof Enum).assertEqual(true);
      expect(Enum.first.valueOf() instanceof double).assertEqual(true);
      expect(Enum.second.valueOf() instanceof double).assertEqual(true);
      expect(Enum.third.valueOf() instanceof double).assertEqual(true);
      expect(Enum.first.valueOf()).assertEqual(1.1);
      expect(Enum.second.valueOf()).assertEqual(1.2);
      expect(Enum.third.valueOf()).assertEqual(1.3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0003
     * @tc.desc      A double value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.first instanceof Enum1).assertEqual(true);
      expect(Enum1.second instanceof Enum1).assertEqual(true);
      expect(Enum1.third instanceof Enum1).assertEqual(true);
      expect(Enum1.first.valueOf() instanceof double).assertEqual(true);
      expect(Enum1.second.valueOf() instanceof double).assertEqual(true);
      expect(Enum1.third.valueOf() instanceof double).assertEqual(true);
      expect(Enum1.first.valueOf()).assertEqual(100);
      expect(Enum1.second.valueOf()).assertEqual(1.2);
      expect(Enum1.third.valueOf()).assertEqual(1.1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0005
     * @tc.desc      A double value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.first instanceof Enum2).assertEqual(true);
      expect(Enum2.second instanceof Enum2).assertEqual(true);
      expect(Enum2.first.valueOf() instanceof double).assertEqual(true);
      expect(Enum2.second.valueOf() instanceof double).assertEqual(true);
      expect(Enum2.first.valueOf()).assertEqual(1.7976931348623155e+308);
      expect(Enum2.second.valueOf()).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0007
     * @tc.desc      A double value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.first instanceof Enum3).assertEqual(true);
      expect(Enum3.second instanceof Enum3).assertEqual(true);
      expect(Enum3.third instanceof Enum3).assertEqual(true);
      expect(Enum3.first.valueOf() instanceof double).assertEqual(true);
      expect(Enum3.second.valueOf() instanceof double).assertEqual(true);
      expect(Enum3.third.valueOf() instanceof double).assertEqual(true);
      expect(Enum3.first.valueOf()).assertEqual(1.23);
      expect(Enum3.second.valueOf()).assertEqual(1.234);
      expect(Enum3.third.valueOf()).assertEqual(0.134);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0009
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.first instanceof Enum4).assertEqual(true);
      expect(Enum4.second instanceof Enum4).assertEqual(true);
      expect(Enum4.third instanceof Enum4).assertEqual(true);
      expect("_" + Enum4.first).assertEqual("_-1.1");
      expect("_" + Enum4.second).assertEqual("_-1.2");
      expect("_" + Enum4.third).assertEqual("_-42.43");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0010
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum4.first instanceof Enum4).assertEqual(true);
      expect(Enum4.second instanceof Enum4).assertEqual(true);
      expect(Enum4.third instanceof Enum4).assertEqual(true);
      expect(Enum4.first + "_").assertEqual("-1.1_");
      expect(Enum4.second + "_").assertEqual("-1.2_");
      expect(Enum4.third + "_").assertEqual("-42.43_");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0013
     * @tc.desc      A value of enumeration type with an explicitly declared type of constants is converted to the declared type. This conversion never causes a runtime error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = Enum4.first;
      let v2: double = Enum4.second;
      let v3: double = Enum4.third;
      expect(Enum4.first instanceof Enum4).assertEqual(true);
      expect(Enum4.second instanceof Enum4).assertEqual(true);
      expect(Enum4.third instanceof Enum4).assertEqual(true);
      expect(Enum4.first.valueOf() instanceof double).assertEqual(true);
      expect(Enum4.second.valueOf() instanceof double).assertEqual(true);
      expect(Enum4.third.valueOf() instanceof double).assertEqual(true);
      expect(v1).assertEqual(-1.1);
      expect(v2).assertEqual(-1.2);
      expect(v3).assertEqual(-42.43);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0015
     * @tc.desc      Checking for enum with explicit int type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum5.fromValue(0);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.Red);
      expect(Enum5[c]).assertEqual("Red");

      c = Enum5.fromValue(10);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.Green);
      expect(Enum5[c]).assertEqual("Green");

      c = Enum5.fromValue(11);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.Blue);
      expect(Enum5[c]).assertEqual("Blue");

      c = Enum5.fromValue(-2147483648);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.First);
      expect(Enum5[c]).assertEqual("First");

      c = Enum5.fromValue(12345);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.Second);
      expect(Enum5[c]).assertEqual("Second");

      c = Enum5.fromValue(2147483647);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.Third);
      expect(Enum5[c]).assertEqual("Third");

      c = Enum5.fromValue(1);
      expect(c instanceof Enum5).assertEqual(true);
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c).assertEqual(Enum5.oNe);
      expect(Enum5[c]).assertEqual("oNe");

      expect(testNS.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0017
     * @tc.desc      Checking for enum with explicit long type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum6.fromValue(0);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.Red);
      expect(Enum6[c]).assertEqual("Red");

      c = Enum6.fromValue(10);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.Green);
      expect(Enum6[c]).assertEqual("Green");

      c = Enum6.fromValue(11);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.Blue);
      expect(Enum6[c]).assertEqual("Blue");

      c = Enum6.fromValue(-9223372036854775808);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.First);
      expect(Enum6[c]).assertEqual("First");

      c = Enum6.fromValue(12345);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.Second);
      expect(Enum6[c]).assertEqual("Second");

      c = Enum6.fromValue(9223372036854775807);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.Third);
      expect(Enum6[c]).assertEqual("Third");

      c = Enum6.fromValue(1);
      expect(c instanceof Enum6).assertEqual(true);
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c).assertEqual(Enum6.oNe);
      expect(Enum6[c]).assertEqual("oNe");

      expect(testNS1.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0019
     * @tc.desc      Checking for enum with explicit byte type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum7.fromValue(0);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.Red);
      expect(Enum7[c]).assertEqual("Red");

      c = Enum7.fromValue(10);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.Green);
      expect(Enum7[c]).assertEqual("Green");

      c = Enum7.fromValue(11);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.Blue);
      expect(Enum7[c]).assertEqual("Blue");

      c = Enum7.fromValue(-128);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.First);
      expect(Enum7[c]).assertEqual("First");

      c = Enum7.fromValue(123);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.Second);
      expect(Enum7[c]).assertEqual("Second");

      c = Enum7.fromValue(127);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.Third);
      expect(Enum7[c]).assertEqual("Third");

      c = Enum7.fromValue(1);
      expect(c instanceof Enum7).assertEqual(true);
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c).assertEqual(Enum7.oNe);
      expect(Enum7[c]).assertEqual("oNe");

      expect(testNS2.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0021
     * @tc.desc      Checking for enum with explicit short type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum8.fromValue(0);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.Red);
      expect(Enum8[c]).assertEqual("Red");

      c = Enum8.fromValue(10);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.Green);
      expect(Enum8[c]).assertEqual("Green");

      c = Enum8.fromValue(11);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.Blue);
      expect(Enum8[c]).assertEqual("Blue");

      c = Enum8.fromValue(-32768);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.First);
      expect(Enum8[c]).assertEqual("First");

      c = Enum8.fromValue(12345);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.Second);
      expect(Enum8[c]).assertEqual("Second");

      c = Enum8.fromValue(32767);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.Third);
      expect(Enum8[c]).assertEqual("Third");

      c = Enum8.fromValue(1);
      expect(c instanceof Enum8).assertEqual(true);
      expect(c.valueOf() instanceof short).assertEqual(true);
      expect(c).assertEqual(Enum8.oNe);
      expect(Enum8[c]).assertEqual("oNe");

      expect(testNS3.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0023
     * @tc.desc      Checking for enum with explicit double type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum9.fromValue(1.5);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.Red);
      expect(Enum9[c]).assertEqual("Red");

      c = Enum9.fromValue(10.3);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.Green);
      expect(Enum9[c]).assertEqual("Green");

      c = Enum9.fromValue(7.6);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.Blue);
      expect(Enum9[c]).assertEqual("Blue");

      c = Enum9.fromValue(-214748.3648);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.First);
      expect(Enum9[c]).assertEqual("First");

      c = Enum9.fromValue(123.45);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.Second);
      expect(Enum9[c]).assertEqual("Second");

      c = Enum9.fromValue(2147483.647);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.Third);
      expect(Enum9[c]).assertEqual("Third");

      c = Enum9.fromValue(1.0);
      expect(c instanceof Enum9).assertEqual(true);
      expect(c.valueOf() instanceof double).assertEqual(true);
      expect(c).assertEqual(Enum9.oNe);
      expect(Enum9[c]).assertEqual("oNe");

      expect(testNS4.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_2500
     * @tc.name      testEnumerationWithExplicitType0025
     * @tc.desc      Checking for enum with explicit float type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum10.fromValue(1.5f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.Red);
      expect(Enum10[c]).assertEqual("Red");

      c = Enum10.fromValue(10.3f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.Green);
      expect(Enum10[c]).assertEqual("Green");

      c = Enum10.fromValue(7.6f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.Blue);
      expect(Enum10[c]).assertEqual("Blue");

      c = Enum10.fromValue(-214748.3648f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.First);
      expect(Enum10[c]).assertEqual("First");

      c = Enum10.fromValue(123.45f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.Second);
      expect(Enum10[c]).assertEqual("Second");

      c = Enum10.fromValue(2147483.647f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.Third);
      expect(Enum10[c]).assertEqual("Third");

      c = Enum10.fromValue(1.0f);
      expect(c instanceof Enum10).assertEqual(true);
      expect(c.valueOf() instanceof float).assertEqual(true);
      expect(c).assertEqual(Enum10.oNe);
      expect(Enum10[c]).assertEqual("oNe");

      expect(testNS6.runTest()).assertEqual(true);
    });


    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ONE_TEST_2700
     * @tc.name      testEnumerationWithExplicitType0027
     * @tc.desc      Checking for enum with explicit string type constant for get constant from value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Enum11.fromValue("reD");
      expect(c instanceof Enum11).assertEqual(true);
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c).assertEqual(Enum11.Red);
      expect(Enum11[c]).assertEqual("Red");

      c = Enum11.fromValue("grEen");
      expect(c instanceof Enum11).assertEqual(true);
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c).assertEqual(Enum11.Green);
      expect(Enum11[c]).assertEqual("Green");

      c = Enum11.fromValue("Blue");
      expect(c instanceof Enum11).assertEqual(true);
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c).assertEqual(Enum11.Blue);
      expect(Enum11[c]).assertEqual("Blue");

      c = Enum11.fromValue("\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!");
      expect(c instanceof Enum11).assertEqual(true);
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c).assertEqual(Enum11.Complex);
      expect(Enum11[c]).assertEqual("Complex");

      c = Enum11.fromValue("one");
      expect(c instanceof Enum11).assertEqual(true);
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(c).assertEqual(Enum11.oNe);
      expect(Enum11[c]).assertEqual("oNe");

      expect(testNS8.runTest()).assertEqual(true);
    });

  })
}
