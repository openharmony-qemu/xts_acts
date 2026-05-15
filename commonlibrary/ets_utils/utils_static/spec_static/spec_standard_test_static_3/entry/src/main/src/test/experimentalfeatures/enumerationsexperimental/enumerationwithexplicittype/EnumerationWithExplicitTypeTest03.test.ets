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

enum Enum18: string {
  Red = "reD",
  Green = "grEen",
  Blue = "Blue",
  Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
  One = "one",
  one = "one",
  oNe = "one"
}

enum Enum19: int {
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

enum Enum20: long {
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

enum Enum21: byte {
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

namespace testNS34 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.Complex.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Complex]).assertEqual("Complex")
    expect(Enum.One.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS35 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Red]).assertEqual("Red")
    expect(Enum.Green.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Green]).assertEqual("Green")
    expect(Enum.Blue.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Blue]).assertEqual("Blue")
    expect(Enum.Complex.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.Complex]).assertEqual("Complex")
    expect(Enum.One.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.One]).assertEqual("One")
    expect(Enum.one.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.one]).assertEqual("one")
    expect(Enum.oNe.valueOf() instanceof string).assertEqual(true)
    expect(Enum[Enum.oNe]).assertEqual("oNe")
    return true
  }
}

namespace testNS36 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.Complex
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Complex")
    c = Enum.One
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS37 {
  enum Enum: string {
    Red = "reD", Green = "grEen", Blue = "Blue",
    Complex = "\x17\x2b\xef\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!",
    One = "one", one = "one", oNe = "one"
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Red")
    c = Enum.Green
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Green")
    c = Enum.Blue
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Blue")
    c = Enum.Complex
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("Complex")
    c = Enum.One
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("One")
    c = Enum.one
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("one")
    c = Enum.oNe
    expect(c.valueOf() instanceof string).assertEqual(true)
    expect(Enum[c]).assertEqual("oNe")
    return true
  }
}

namespace testNS38 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof int).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-2147483648")
    expect(Enum.Second.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("12345")
    expect(Enum.Third.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("2147483647")
    expect(Enum.One.valueOf() instanceof int).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof int).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof int).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS39 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof int).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-2147483648")
    expect(Enum.Second.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("12345")
    expect(Enum.Third.valueOf() instanceof int).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("2147483647")
    expect(Enum.One.valueOf() instanceof int).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof int).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof int).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS40 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("-2147483648")
    c = Enum.Second
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("12345")
    c = Enum.Third
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("2147483647")
    c = Enum.One
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS41 {
  enum Enum: int {
    Red, Green = 10, Blue,
    First = -2147483648, Second = 12345, Third = 2147483647,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("-2147483648")
    c = Enum.Second
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("12345")
    c = Enum.Third
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("2147483647")
    c = Enum.One
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof int).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS42 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof long).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-9223372036854775808")
    expect(Enum.Second.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("12345")
    expect(Enum.Third.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("9223372036854775807")
    expect(Enum.One.valueOf() instanceof long).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof long).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof long).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS43 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof long).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-9223372036854775808")
    expect(Enum.Second.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("12345")
    expect(Enum.Third.valueOf() instanceof long).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("9223372036854775807")
    expect(Enum.One.valueOf() instanceof long).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof long).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof long).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS44 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("-9223372036854775808")
    c = Enum.Second
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("12345")
    c = Enum.Third
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("9223372036854775807")
    c = Enum.One
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS45 {
  enum Enum: long {
    Red, Green = 10, Blue,
    First = -9223372036854775808, Second = 12345, Third = 9223372036854775807,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("-9223372036854775808")
    c = Enum.Second
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("12345")
    c = Enum.Third
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("9223372036854775807")
    c = Enum.One
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof long).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS46 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-128")
    expect(Enum.Second.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("123")
    expect(Enum.Third.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("127")
    expect(Enum.One.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS47 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    expect(Enum.Red.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Red.toString()).assertEqual("0")
    expect(Enum.Green.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Green.toString()).assertEqual("10")
    expect(Enum.Blue.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Blue.toString()).assertEqual("11")
    expect(Enum.First.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.First.toString()).assertEqual("-128")
    expect(Enum.Second.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Second.toString()).assertEqual("123")
    expect(Enum.Third.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.Third.toString()).assertEqual("127")
    expect(Enum.One.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.One.toString()).assertEqual("1")
    expect(Enum.one.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.one.toString()).assertEqual("1")
    expect(Enum.oNe.valueOf() instanceof byte).assertEqual(true)
    expect(Enum.oNe.toString()).assertEqual("1")
    return true
  }
}

namespace testNS48 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("-128")
    c = Enum.Second
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("123")
    c = Enum.Third
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("127")
    c = Enum.One
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

namespace testNS49 {
  enum Enum: byte {
    Red, Green = 10, Blue,
    First = -128, Second = 123, Third = 127,
    One = 1, one = 1, oNe = 1
  }

  export function runTest(): boolean {
    let c: Enum = Enum.Red
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("0")
    c = Enum.Green
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("10")
    c = Enum.Blue
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("11")
    c = Enum.First
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("-128")
    c = Enum.Second
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("123")
    c = Enum.Third
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("127")
    c = Enum.One
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.one
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    c = Enum.oNe
    expect(c.valueOf() instanceof byte).assertEqual(true)
    expect(c.toString()).assertEqual("1")
    return true
  }
}

export default function EnumerationWithExplicitTypeTest03(): void {
  describe('EnumerationWithExplicitTypeTest03', () => {
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0053
     * @tc.desc      Checking for enum with explicit string type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum18.Red.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Red]).assertEqual("Red");
      expect(Enum18.Green.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Green]).assertEqual("Green");
      expect(Enum18.Blue.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Blue]).assertEqual("Blue");
      expect(Enum18.Complex.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Complex]).assertEqual("Complex");
      expect(Enum18.One.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.One]).assertEqual("One");
      expect(Enum18.one.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.one]).assertEqual("one");
      expect(Enum18.oNe.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.oNe]).assertEqual("oNe");
      expect(testNS34.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0054
     * @tc.desc      Checking for enum with explicit string type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum18.Red.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Red]).assertEqual("Red");
      expect(Enum18.Green.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Green]).assertEqual("Green");
      expect(Enum18.Blue.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Blue]).assertEqual("Blue");
      expect(Enum18.Complex.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.Complex]).assertEqual("Complex");
      expect(Enum18.One.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.One]).assertEqual("One");
      expect(Enum18.one.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.one]).assertEqual("one");
      expect(Enum18.oNe.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[Enum18.oNe]).assertEqual("oNe");
      expect(testNS35.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0055
     * @tc.desc      Checking for enum with explicit string type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum18 = Enum18.Red;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Red");
      c = Enum18.Green;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Green");
      c = Enum18.Blue;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Blue");
      c = Enum18.Complex;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Complex");
      c = Enum18.One;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("One");
      c = Enum18.one;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("one");
      c = Enum18.oNe;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("oNe");
      expect(testNS36.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0056
     * @tc.desc      Checking for enum with explicit string type constant get name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum18 = Enum18.Red;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Red");
      c = Enum18.Green;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Green");
      c = Enum18.Blue;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Blue");
      c = Enum18.Complex;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("Complex");
      c = Enum18.One;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("One");
      c = Enum18.one;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("one");
      c = Enum18.oNe;
      expect(c.valueOf() instanceof string).assertEqual(true);
      expect(Enum18[c]).assertEqual("oNe");
      expect(testNS37.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0057
     * @tc.desc      Checking for enum with explicit int type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum19.Red.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Red.toString()).assertEqual("0");
      expect(Enum19.Green.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Green.toString()).assertEqual("10");
      expect(Enum19.Blue.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Blue.toString()).assertEqual("11");
      expect(Enum19.First.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.First.toString()).assertEqual("-2147483648");
      expect(Enum19.Second.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Second.toString()).assertEqual("12345");
      expect(Enum19.Third.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Third.toString()).assertEqual("2147483647");
      expect(Enum19.One.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.One.toString()).assertEqual("1");
      expect(Enum19.one.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.one.toString()).assertEqual("1");
      expect(Enum19.oNe.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.oNe.toString()).assertEqual("1");
      expect(testNS38.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0058
     * @tc.desc      Checking for enum with explicit int type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum19.Red.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Red.toString()).assertEqual("0");
      expect(Enum19.Green.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Green.toString()).assertEqual("10");
      expect(Enum19.Blue.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Blue.toString()).assertEqual("11");
      expect(Enum19.First.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.First.toString()).assertEqual("-2147483648");
      expect(Enum19.Second.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Second.toString()).assertEqual("12345");
      expect(Enum19.Third.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.Third.toString()).assertEqual("2147483647");
      expect(Enum19.One.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.One.toString()).assertEqual("1");
      expect(Enum19.one.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.one.toString()).assertEqual("1");
      expect(Enum19.oNe.valueOf() instanceof int).assertEqual(true);
      expect(Enum19.oNe.toString()).assertEqual("1");
      expect(testNS39.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0059
     * @tc.desc      Checking for enum with explicit int type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum19 = Enum19.Red;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum19.Green;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum19.Blue;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum19.First;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("-2147483648");
      c = Enum19.Second;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("12345");
      c = Enum19.Third;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("2147483647");
      c = Enum19.One;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum19.one;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum19.oNe;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS40.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0060
     * @tc.desc      Checking for enum with explicit int type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum19 = Enum19.Red;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum19.Green;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum19.Blue;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum19.First;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("-2147483648");
      c = Enum19.Second;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("12345");
      c = Enum19.Third;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("2147483647");
      c = Enum19.One;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum19.one;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum19.oNe;
      expect(c.valueOf() instanceof int).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS41.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0061
     * @tc.desc      Checking for enum with explicit long type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum20.Red.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Red.toString()).assertEqual("0");
      expect(Enum20.Green.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Green.toString()).assertEqual("10");
      expect(Enum20.Blue.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Blue.toString()).assertEqual("11");
      expect(Enum20.First.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum20.Second.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Second.toString()).assertEqual("12345");
      expect(Enum20.Third.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum20.One.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.One.toString()).assertEqual("1");
      expect(Enum20.one.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.one.toString()).assertEqual("1");
      expect(Enum20.oNe.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.oNe.toString()).assertEqual("1");
      expect(testNS42.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0062
     * @tc.desc      Checking for enum with explicit long type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum20.Red.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Red.toString()).assertEqual("0");
      expect(Enum20.Green.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Green.toString()).assertEqual("10");
      expect(Enum20.Blue.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Blue.toString()).assertEqual("11");
      expect(Enum20.First.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.First.toString()).assertEqual("-9223372036854775808");
      expect(Enum20.Second.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Second.toString()).assertEqual("12345");
      expect(Enum20.Third.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.Third.toString()).assertEqual("9223372036854775807");
      expect(Enum20.One.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.One.toString()).assertEqual("1");
      expect(Enum20.one.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.one.toString()).assertEqual("1");
      expect(Enum20.oNe.valueOf() instanceof long).assertEqual(true);
      expect(Enum20.oNe.toString()).assertEqual("1");
      expect(testNS43.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0063
     * @tc.desc      Checking for enum with explicit long type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum20 = Enum20.Red;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum20.Green;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum20.Blue;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum20.First;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("-9223372036854775808");
      c = Enum20.Second;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("12345");
      c = Enum20.Third;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("9223372036854775807");
      c = Enum20.One;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum20.one;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum20.oNe;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS44.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0064
     * @tc.desc      Checking for enum with explicit long type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum20 = Enum20.Red;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum20.Green;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum20.Blue;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum20.First;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("-9223372036854775808");
      c = Enum20.Second;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("12345");
      c = Enum20.Third;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("9223372036854775807");
      c = Enum20.One;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum20.one;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum20.oNe;
      expect(c.valueOf() instanceof long).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS45.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0065
     * @tc.desc      Checking for enum with explicit byte type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum21.Red.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Red.toString()).assertEqual("0");
      expect(Enum21.Green.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Green.toString()).assertEqual("10");
      expect(Enum21.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Blue.toString()).assertEqual("11");
      expect(Enum21.First.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.First.toString()).assertEqual("-128");
      expect(Enum21.Second.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Second.toString()).assertEqual("123");
      expect(Enum21.Third.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Third.toString()).assertEqual("127");
      expect(Enum21.One.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.One.toString()).assertEqual("1");
      expect(Enum21.one.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.one.toString()).assertEqual("1");
      expect(Enum21.oNe.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.oNe.toString()).assertEqual("1");
      expect(testNS46.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0066
     * @tc.desc      Checking for enum with explicit byte type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum21.Red.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Red.toString()).assertEqual("0");
      expect(Enum21.Green.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Green.toString()).assertEqual("10");
      expect(Enum21.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Blue.toString()).assertEqual("11");
      expect(Enum21.First.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.First.toString()).assertEqual("-128");
      expect(Enum21.Second.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Second.toString()).assertEqual("123");
      expect(Enum21.Third.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.Third.toString()).assertEqual("127");
      expect(Enum21.One.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.One.toString()).assertEqual("1");
      expect(Enum21.one.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.one.toString()).assertEqual("1");
      expect(Enum21.oNe.valueOf() instanceof byte).assertEqual(true);
      expect(Enum21.oNe.toString()).assertEqual("1");
      expect(testNS47.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0067
     * @tc.desc      Checking for enum with explicit byte type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum21 = Enum21.Red;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum21.Green;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum21.Blue;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum21.First;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("-128");
      c = Enum21.Second;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("123");
      c = Enum21.Third;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("127");
      c = Enum21.One;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum21.one;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum21.oNe;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS48.runTest()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_THREE_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0068
     * @tc.desc      Checking for enum with explicit byte type constant to string conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Enum21 = Enum21.Red;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("0");
      c = Enum21.Green;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("10");
      c = Enum21.Blue;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("11");
      c = Enum21.First;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("-128");
      c = Enum21.Second;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("123");
      c = Enum21.Third;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("127");
      c = Enum21.One;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum21.one;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      c = Enum21.oNe;
      expect(c.valueOf() instanceof byte).assertEqual(true);
      expect(c.toString()).assertEqual("1");
      expect(testNS49.runTest()).assertEqual(true);
    });
  })
}