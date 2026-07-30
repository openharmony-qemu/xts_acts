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

enum EnumIntG0: int { A = 5, B = 5 }
enum ConstEnumIntG0: int { A = 5, B = 5 }

enum EnumIntG1: int { A = -12, B, C = -12 }
enum ConstEnumIntG1: int { A = -12, B, C = -12 }

enum EnumIntG2: int { first, second = -1, third }
enum ConstEnumIntG2: int { first, second = -1, third }

enum EnumIntG3: int { A, B, C, D, E = B | C }
enum ConstEnumIntG3: int { A, B, C, D, E = B | C }

enum EnumIntH0: int { first, second = -2147483648, third }
enum ConstEnumIntH0: int { first, second = -2147483648, third }

enum EnumIntH1: int { first = 2147483647 - 2, second, third }
enum ConstEnumIntH1: int { first = 2147483647 - 2, second, third }

enum EnumIntI0: int {
  first = 0b0011,
  second = 0o731,
  third = 0x7AFE_CAFE,
  fourth = 1_123_456
}

enum ConstEnumIntI0: int {
  first = 0b0011,
  second = 0o731,
  third = 0x7AFE_CAFE,
  fourth = 1_123_456
}

enum EnumIntJ0: int { first = -42, second, third = 17 }
enum ConstEnumIntJ0: int { first = -42, second, third = 17 }

enum EnumIntK0: int { first = -1, second, third = -42 }
enum ConstEnumIntK0: int { first = -1, second, third = -42 }
enum ColorIntD0: int { Red = 5, Green = 7, Blue = -53 }
enum ConstColorIntD0: int { Red = 5, Green = 7, Blue = -53 }

enum EnumIntL0: int { first = -1, second = 27, third }
enum ConstEnumIntL0: int { first = -1, second = 27, third }

enum EnumIntM0: int { first = 2147483647 - 1, second, third }
enum ConstEnumIntM0: int { first = 2147483647 - 1, second, third }

enum EnumIntM1: int { first = 2147483647 - 10, second, third = first + 110 }
enum ConstEnumIntM1: int { first = 2147483647 - 10, second, third = first + 110 }

enum EnumIntM2: int { first, second = -2147483648, third = second - 1 }
enum ConstEnumIntM2: int { first, second = -2147483648, third = second - 1 }

enum EnumIntM3: int { first = -2147483648 + 10, second, third = first - 110 }
enum ConstEnumIntM3: int { first = -2147483648 + 10, second, third = first - 110 }

enum ColorLongA0: long { Red, Green, Blue }
enum ColorLongA1: long { Red, Green, Blue }

enum ColorLongB0: long { Red, Green, Blue, }
enum ColorLongB1: long { Red, Green, Blue, }
enum ConstColorLongA0: long { Red, Green, Blue }
enum ConstColorLongA1: long { Red, Green, Blue }

enum ConstColorLongB0: long { Red, Green, Blue, }
enum ConstColorLongB1: long { Red, Green, Blue, }

enum ColorLongC0: long { Red, Green, Blue }
enum ConstColorLongC0: long { Red, Green, Blue }

enum EnumLongA0: long { A, B, C, D = B | C, E, F, G = D | F }
enum ConstEnumLongA0: long { A, B, C, D = B | C, E, F, G = D | F }

enum EnumLongB0: long { A = 2, B, C }
enum ConstEnumLongB0: long { A = 2, B, C }

enum EnumLongC0: long { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }
enum ConstEnumLongC0: long { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }

enum EnumLongD0: long {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 32) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum ConstEnumLongD0: long {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 32) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum EnumLongE0: long { first = 123, second, third }
enum EnumLongE1: long { first = EnumLongE0.first, second, third }

enum ConstEnumLongE0: long { first = 123, second, third }
enum ConstEnumLongE1: long { first = ConstEnumLongE0.first, second, third }

enum EnumLongE2: long { first = 123, second, third }
enum ConstEnumLongE2: long { first = EnumLongE2.first, second, third }

enum ConstEnumLongE3: long { first = 123, second, third }
enum EnumLongE3: long { first = ConstEnumLongE3.first, second, third }

enum EnumLongF0: long {
  first = 2147483648,
  second = 2147483647,
  third = 2147483646
}

enum ConstEnumLongF0: long {
  first = 2147483648,
  second = 2147483647,
  third = 2147483646
}

enum EnumLongG0: long { A = 5, B = 5 }
enum ConstEnumLongG0: long { A = 5, B = 5 }

enum EnumLongG1: long { A = -12, B, C = -12 }
enum ConstEnumLongG1: long { A = -12, B, C = -12 }

enum EnumLongG2: long { first, second = -1, third }
enum ConstEnumLongG2: long { first, second = -1, third }

enum EnumLongG3: long { A, B, C, D, E = B | C }
enum ConstEnumLongG3: long { A, B, C, D, E = B | C }

enum EnumLongH0: long { first, second = -9223372036854775808, third }
enum ConstEnumLongH0: long { first, second = -9223372036854775808, third }

enum EnumLongH1: long { first = 9223372036854775807 - 2, second, third }
enum ConstEnumLongH1: long { first = 9223372036854775807 - 2, second, third }

export default function EnumerationWithExplicitTypeTest07(): void {
  describe('EnumerationWithExplicitTypeTest07', () => {
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0145
     * @tc.desc      Values can be the same.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntG0.A instanceof EnumIntG0).assertEqual(true);
      expect(EnumIntG0.B instanceof EnumIntG0).assertEqual(true);
      expect(EnumIntG0.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG0.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG0.A).assertEqual(5);
      expect(EnumIntG0.B).assertEqual(5);
      expect(EnumIntG0.A).assertEqual(EnumIntG0.B);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0146
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntG0.A instanceof ConstEnumIntG0).assertEqual(true);
      expect(ConstEnumIntG0.B instanceof ConstEnumIntG0).assertEqual(true);
      expect(ConstEnumIntG0.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG0.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG0.A).assertEqual(5);
      expect(ConstEnumIntG0.B).assertEqual(5);
      expect(ConstEnumIntG0.A).assertEqual(ConstEnumIntG0.B);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0147
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntG1.A instanceof EnumIntG1).assertEqual(true);
      expect(EnumIntG1.B instanceof EnumIntG1).assertEqual(true);
      expect(EnumIntG1.C instanceof EnumIntG1).assertEqual(true);
      expect(EnumIntG1.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG1.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG1.C.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG1.A).assertEqual(-12);
      expect(EnumIntG1.B).assertEqual(-11);
      expect(EnumIntG1.C).assertEqual(-12);
      expect(EnumIntG1.A).assertEqual(EnumIntG1.C);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0148
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntG1.A instanceof ConstEnumIntG1).assertEqual(true);
      expect(ConstEnumIntG1.B instanceof ConstEnumIntG1).assertEqual(true);
      expect(ConstEnumIntG1.C instanceof ConstEnumIntG1).assertEqual(true);
      expect(ConstEnumIntG1.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG1.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG1.C.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG1.A).assertEqual(-12);
      expect(ConstEnumIntG1.B).assertEqual(-11);
      expect(ConstEnumIntG1.C).assertEqual(-12);
      expect(ConstEnumIntG1.A).assertEqual(ConstEnumIntG1.C);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0149
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntG2.first instanceof EnumIntG2).assertEqual(true);
      expect(EnumIntG2.second instanceof EnumIntG2).assertEqual(true);
      expect(EnumIntG2.third instanceof EnumIntG2).assertEqual(true);
      expect(EnumIntG2.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG2.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG2.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG2.first).assertEqual(0);
      expect(EnumIntG2.second).assertEqual(-1);
      expect(EnumIntG2.third).assertEqual(0);
      expect(EnumIntG2.third).assertEqual(EnumIntG2.first);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0150
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntG2.first instanceof ConstEnumIntG2).assertEqual(true);
      expect(ConstEnumIntG2.second instanceof ConstEnumIntG2).assertEqual(true);
      expect(ConstEnumIntG2.third instanceof ConstEnumIntG2).assertEqual(true);
      expect(ConstEnumIntG2.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG2.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG2.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG2.first).assertEqual(0);
      expect(ConstEnumIntG2.second).assertEqual(-1);
      expect(ConstEnumIntG2.third).assertEqual(0);
      expect(ConstEnumIntG2.third).assertEqual(ConstEnumIntG2.first);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0151
     * @tc.desc      Values can be the same. If constant expression is omitted, then the value of
    the enum constant is set implicitly to an integer value. The constant which is first
    and has no explicit value gets zero value. A constant that is not the first and
    has no explicit value takes the value of the immediately preceding constant plus
    one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntG3.A instanceof EnumIntG3).assertEqual(true);
      expect(EnumIntG3.B instanceof EnumIntG3).assertEqual(true);
      expect(EnumIntG3.C instanceof EnumIntG3).assertEqual(true);
      expect(EnumIntG3.D instanceof EnumIntG3).assertEqual(true);
      expect(EnumIntG3.E instanceof EnumIntG3).assertEqual(true);
      expect(EnumIntG3.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG3.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG3.C.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG3.D.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG3.E.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntG3.A).assertEqual(0);
      expect(EnumIntG3.B).assertEqual(1);
      expect(EnumIntG3.C).assertEqual(2);
      expect(EnumIntG3.D).assertEqual(3);
      expect(EnumIntG3.E).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0152
     * @tc.desc      Values can be the same. If constant expression is omitted, then the value of
    the enum constant is set implicitly to an integer value. The constant which is first
    and has no explicit value gets zero value. A constant that is not the first and
    has no explicit value takes the value of the immediately preceding constant plus
    one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntG3.A instanceof ConstEnumIntG3).assertEqual(true);
      expect(ConstEnumIntG3.B instanceof ConstEnumIntG3).assertEqual(true);
      expect(ConstEnumIntG3.C instanceof ConstEnumIntG3).assertEqual(true);
      expect(ConstEnumIntG3.D instanceof ConstEnumIntG3).assertEqual(true);
      expect(ConstEnumIntG3.E instanceof ConstEnumIntG3).assertEqual(true);
      expect(ConstEnumIntG3.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG3.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG3.C.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG3.D.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG3.E.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntG3.A).assertEqual(0);
      expect(ConstEnumIntG3.B).assertEqual(1);
      expect(ConstEnumIntG3.C).assertEqual(2);
      expect(ConstEnumIntG3.D).assertEqual(3);
      expect(ConstEnumIntG3.E).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0153
     * @tc.desc      Checking for min value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: int = 0;
      const v2: int = -2147483648;
      const v3: int = -2147483648 + 1;
      expect(EnumIntH0.first instanceof EnumIntH0).assertEqual(true);
      expect(EnumIntH0.second instanceof EnumIntH0).assertEqual(true);
      expect(EnumIntH0.third instanceof EnumIntH0).assertEqual(true);
      expect(EnumIntH0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntH0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntH0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntH0.first.valueOf()).assertEqual(v1);
      expect(EnumIntH0.second.valueOf()).assertEqual(v2);
      expect(EnumIntH0.third.valueOf()).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0154
     * @tc.desc      Checking for min value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: int = 0;
      const v2: int = -2147483648;
      const v3: int = -2147483648 + 1;
      expect(ConstEnumIntH0.first instanceof ConstEnumIntH0).assertEqual(true);
      expect(ConstEnumIntH0.second instanceof ConstEnumIntH0).assertEqual(true);
      expect(ConstEnumIntH0.third instanceof ConstEnumIntH0).assertEqual(true);
      expect(ConstEnumIntH0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntH0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntH0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntH0.first.valueOf()).assertEqual(v1);
      expect(ConstEnumIntH0.second.valueOf()).assertEqual(v2);
      expect(ConstEnumIntH0.third.valueOf()).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0155
     * @tc.desc      Checking for max value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: int = 2147483647 - 2;
      const v2: int = 2147483647 - 1;
      const v3: int = 2147483647;
      expect(EnumIntH1.first instanceof EnumIntH1).assertEqual(true);
      expect(EnumIntH1.second instanceof EnumIntH1).assertEqual(true);
      expect(EnumIntH1.third instanceof EnumIntH1).assertEqual(true);
      expect(EnumIntH1.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntH1.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntH1.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntH1.first.valueOf()).assertEqual(v1);
      expect(EnumIntH1.second.valueOf()).assertEqual(v2);
      expect(EnumIntH1.third.valueOf()).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0156
     * @tc.desc      Checking for max value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: int = 2147483647 - 2;
      const v2: int = 2147483647 - 1;
      const v3: int = 2147483647;
      expect(ConstEnumIntH1.first instanceof ConstEnumIntH1).assertEqual(true);
      expect(ConstEnumIntH1.second instanceof ConstEnumIntH1).assertEqual(true);
      expect(ConstEnumIntH1.third instanceof ConstEnumIntH1).assertEqual(true);
      expect(ConstEnumIntH1.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntH1.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntH1.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntH1.first.valueOf()).assertEqual(v1);
      expect(ConstEnumIntH1.second.valueOf()).assertEqual(v2);
      expect(ConstEnumIntH1.third.valueOf()).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0157
     * @tc.desc      Using different integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: int = 0b0011;
      const v2: int = 0o731;
      const v3: int = 0x7AFE_CAFE;
      const v4: int = 1_123_456;
      expect(EnumIntI0.first instanceof EnumIntI0).assertEqual(true);
      expect(EnumIntI0.second instanceof EnumIntI0).assertEqual(true);
      expect(EnumIntI0.third instanceof EnumIntI0).assertEqual(true);
      expect(EnumIntI0.fourth instanceof EnumIntI0).assertEqual(true);
      expect(EnumIntI0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntI0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntI0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntI0.fourth.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntI0.first.valueOf()).assertEqual(v1);
      expect(EnumIntI0.second.valueOf()).assertEqual(v2);
      expect(EnumIntI0.third.valueOf()).assertEqual(v3);
      expect(EnumIntI0.fourth.valueOf()).assertEqual(v4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0158
     * @tc.desc      Using different integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: int = 0b0011;
      const v2: int = 0o731;
      const v3: int = 0x7AFE_CAFE;
      const v4: int = 1_123_456;
      expect(ConstEnumIntI0.first instanceof ConstEnumIntI0).assertEqual(true);
      expect(ConstEnumIntI0.second instanceof ConstEnumIntI0).assertEqual(true);
      expect(ConstEnumIntI0.third instanceof ConstEnumIntI0).assertEqual(true);
      expect(ConstEnumIntI0.fourth instanceof ConstEnumIntI0).assertEqual(true);
      expect(ConstEnumIntI0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntI0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntI0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntI0.fourth.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntI0.first.valueOf()).assertEqual(v1);
      expect(ConstEnumIntI0.second.valueOf()).assertEqual(v2);
      expect(ConstEnumIntI0.third.valueOf()).assertEqual(v3);
      expect(ConstEnumIntI0.fourth.valueOf()).assertEqual(v4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0159
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntJ0.first instanceof EnumIntJ0).assertEqual(true);
      expect(EnumIntJ0.second instanceof EnumIntJ0).assertEqual(true);
      expect(EnumIntJ0.third instanceof EnumIntJ0).assertEqual(true);
      expect(EnumIntJ0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntJ0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntJ0.third.valueOf() instanceof int).assertEqual(true);
      expect("_" + EnumIntJ0.first).assertEqual("_-42");
      expect("_" + EnumIntJ0.second).assertEqual("_-41");
      expect("_" + EnumIntJ0.third).assertEqual("_17");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0160
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntJ0.first instanceof EnumIntJ0).assertEqual(true);
      expect(EnumIntJ0.second instanceof EnumIntJ0).assertEqual(true);
      expect(EnumIntJ0.third instanceof EnumIntJ0).assertEqual(true);
      expect(EnumIntJ0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntJ0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntJ0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntJ0.first + "_").assertEqual("-42_");
      expect(EnumIntJ0.second + "_").assertEqual("-41_");
      expect(EnumIntJ0.third + "_").assertEqual("17_");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0161
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntJ0.first instanceof ConstEnumIntJ0).assertEqual(true);
      expect(ConstEnumIntJ0.second instanceof ConstEnumIntJ0).assertEqual(true);
      expect(ConstEnumIntJ0.third instanceof ConstEnumIntJ0).assertEqual(true);
      expect(ConstEnumIntJ0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntJ0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntJ0.third.valueOf() instanceof int).assertEqual(true);
      expect("_" + ConstEnumIntJ0.first).assertEqual("_-42");
      expect("_" + ConstEnumIntJ0.second).assertEqual("_-41");
      expect("_" + ConstEnumIntJ0.third).assertEqual("_17");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1800
     * @tc.name      testEnumerationWithExplicitType0162
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntJ0.first instanceof ConstEnumIntJ0).assertEqual(true);
      expect(ConstEnumIntJ0.second instanceof ConstEnumIntJ0).assertEqual(true);
      expect(ConstEnumIntJ0.third instanceof ConstEnumIntJ0).assertEqual(true);
      expect(ConstEnumIntJ0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntJ0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntJ0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntJ0.first + "_").assertEqual("-42_");
      expect(ConstEnumIntJ0.second + "_").assertEqual("-41_");
      expect(ConstEnumIntJ0.third + "_").assertEqual("17_");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0163
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntK0.first instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.second instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.third instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.first).assertEqual(-1);
      expect(EnumIntK0.second).assertEqual(0);
      expect(EnumIntK0.third).assertEqual(-42);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2000
     * @tc.name      testEnumerationWithExplicitType0164
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntK0.first instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.second instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.third instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.first + 1).assertEqual(0);
      expect(EnumIntK0.second + 1).assertEqual(1);
      expect(EnumIntK0.third + 1).assertEqual(-41);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0165
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntK0.first instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.second instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.third instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(1 + EnumIntK0.first).assertEqual(0);
      expect(1 + EnumIntK0.second).assertEqual(1);
      expect(1 + EnumIntK0.third).assertEqual(-41);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2200
     * @tc.name      testEnumerationWithExplicitType0166
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntK0.first instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.second instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.third instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.first == -1).assertEqual(true);
      expect(EnumIntK0.second == 0).assertEqual(true);
      expect(EnumIntK0.third == -42).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0167
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntK0.first instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.second instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.third instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.first === -1).assertEqual(true);
      expect(EnumIntK0.second === 0).assertEqual(true);
      expect(EnumIntK0.third === -42).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2400
     * @tc.name      testEnumerationWithExplicitType0168
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntK0.first instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.second instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.third instanceof EnumIntK0).assertEqual(true);
      expect(EnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntK0.first + EnumIntK0.second + EnumIntK0.third).assertEqual(-43);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2500
     * @tc.name      testEnumerationWithExplicitType0169
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntK0.first instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.second instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.third instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.first).assertEqual(-1);
      expect(ConstEnumIntK0.second).assertEqual(0);
      expect(ConstEnumIntK0.third).assertEqual(-42);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2600
     * @tc.name      testEnumerationWithExplicitType0170
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntK0.first instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.second instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.third instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.first + 1).assertEqual(0);
      expect(ConstEnumIntK0.second + 1).assertEqual(1);
      expect(ConstEnumIntK0.third + 1).assertEqual(-41);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2700
     * @tc.name      testEnumerationWithExplicitType0171
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntK0.first instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.second instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.third instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(1 + ConstEnumIntK0.first).assertEqual(0);
      expect(1 + ConstEnumIntK0.second).assertEqual(1);
      expect(1 + ConstEnumIntK0.third).assertEqual(-41);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2800
     * @tc.name      testEnumerationWithExplicitType0172
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntK0.first instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.second instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.third instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.first == -1).assertEqual(true);
      expect(ConstEnumIntK0.second == 0).assertEqual(true);
      expect(ConstEnumIntK0.third == -42).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_2900
     * @tc.name      testEnumerationWithExplicitType0173
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntK0.first instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.second instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.third instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.first === -1).assertEqual(true);
      expect(ConstEnumIntK0.second === 0).assertEqual(true);
      expect(ConstEnumIntK0.third === -42).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3000
     * @tc.name      testEnumerationWithExplicitType0174
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntK0.first instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.second instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.third instanceof ConstEnumIntK0).assertEqual(true);
      expect(ConstEnumIntK0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntK0.first + ConstEnumIntK0.second + ConstEnumIntK0.third).assertEqual(-43);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3100
     * @tc.name      testEnumerationWithExplicitType0175
     * @tc.desc      Checking in switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ColorIntD0 = ColorIntD0.Green;
      switch (v) {
        case ColorIntD0.Green:
          expect(v instanceof ColorIntD0).assertEqual(true);
          expect(v.valueOf() instanceof int).assertEqual(true);
          expect(v.valueOf()).assertEqual(7);
          break;
        default:
          expect(false).assertEqual(true);
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3200
     * @tc.name      testEnumerationWithExplicitType0176
     * @tc.desc      Checking in switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ConstColorIntD0 = ConstColorIntD0.Green;
      switch (v) {
        case ConstColorIntD0.Green:
          expect(v instanceof ConstColorIntD0).assertEqual(true);
          expect(v.valueOf() instanceof int).assertEqual(true);
          expect(v.valueOf()).assertEqual(7);
          break;
        default:
          expect(false).assertEqual(true);
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3300
     * @tc.name      testEnumerationWithExplicitType0177
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntL0.first instanceof EnumIntL0).assertEqual(true);
      expect(EnumIntL0.second instanceof EnumIntL0).assertEqual(true);
      expect(EnumIntL0.third instanceof EnumIntL0).assertEqual(true);
      expect(EnumIntL0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntL0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntL0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntL0.first.valueOf()).assertEqual(-1);
      expect(EnumIntL0.second.valueOf()).assertEqual(27);
      expect(EnumIntL0.third.valueOf()).assertEqual(28);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3400
     * @tc.name      testEnumerationWithExplicitType0178
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntL0.first instanceof EnumIntL0).assertEqual(true);
      expect(EnumIntL0.second instanceof EnumIntL0).assertEqual(true);
      expect(EnumIntL0.third instanceof EnumIntL0).assertEqual(true);
      expect(EnumIntL0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntL0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntL0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntL0.first.toString()).assertEqual("-1");
      expect(EnumIntL0.second.toString()).assertEqual("27");
      expect(EnumIntL0.third.toString()).assertEqual("28");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3500
     * @tc.name      testEnumerationWithExplicitType0179
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntL0.first instanceof ConstEnumIntL0).assertEqual(true);
      expect(ConstEnumIntL0.second instanceof ConstEnumIntL0).assertEqual(true);
      expect(ConstEnumIntL0.third instanceof ConstEnumIntL0).assertEqual(true);
      expect(ConstEnumIntL0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntL0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntL0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntL0.first.valueOf()).assertEqual(-1);
      expect(ConstEnumIntL0.second.valueOf()).assertEqual(27);
      expect(ConstEnumIntL0.third.valueOf()).assertEqual(28);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3600
     * @tc.name      testEnumerationWithExplicitType0180
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntL0.first instanceof ConstEnumIntL0).assertEqual(true);
      expect(ConstEnumIntL0.second instanceof ConstEnumIntL0).assertEqual(true);
      expect(ConstEnumIntL0.third instanceof ConstEnumIntL0).assertEqual(true);
      expect(ConstEnumIntL0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntL0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntL0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntL0.first.toString()).assertEqual("-1");
      expect(ConstEnumIntL0.second.toString()).assertEqual("27");
      expect(ConstEnumIntL0.third.toString()).assertEqual("28");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3700
     * @tc.name      testEnumerationWithExplicitType0181
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntM0.first.valueOf()).assertEqual(2147483647 - 1);
      expect(EnumIntM0.second.valueOf()).assertEqual(2147483647);
      expect(EnumIntM0.third.valueOf()).assertEqual(2147483647 + 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_3900
     * @tc.name      testEnumerationWithExplicitType0183
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntM0.first.valueOf()).assertEqual(2147483647 - 1);
      expect(ConstEnumIntM0.second.valueOf()).assertEqual(2147483647);
      expect(ConstEnumIntM0.third.valueOf()).assertEqual(2147483647 + 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_4100
     * @tc.name      testEnumerationWithExplicitType0185
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntM1.first.valueOf()).assertEqual(2147483647 - 10);
      expect(EnumIntM1.second.valueOf()).assertEqual(2147483647 - 9);
      expect(EnumIntM1.third.valueOf()).assertEqual(2147483647 + 100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_4300
     * @tc.name      testEnumerationWithExplicitType0187
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntM1.first.valueOf()).assertEqual(2147483647 - 10);
      expect(ConstEnumIntM1.second.valueOf()).assertEqual(2147483647 - 9);
      expect(ConstEnumIntM1.third.valueOf()).assertEqual(2147483647 + 100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_4500
     * @tc.name      testEnumerationWithExplicitType0189
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntM2.first.valueOf()).assertEqual(0);
      expect(EnumIntM2.second.valueOf()).assertEqual(-2147483648);
      expect(EnumIntM2.third.valueOf()).assertEqual(-2147483648 - 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_4700
     * @tc.name      testEnumerationWithExplicitType0191
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntM2.first.valueOf()).assertEqual(0);
      expect(ConstEnumIntM2.second.valueOf()).assertEqual(-2147483648);
      expect(ConstEnumIntM2.third.valueOf()).assertEqual(-2147483648 - 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_4900
     * @tc.name      testEnumerationWithExplicitType0193
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntM3.first.valueOf()).assertEqual(-2147483648 + 10);
      expect(EnumIntM3.second.valueOf()).assertEqual(-2147483648 + 11);
      expect(EnumIntM3.third.valueOf()).assertEqual(-2147483648 - 100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5100
     * @tc.name      testEnumerationWithExplicitType0195
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntM3.first.valueOf()).assertEqual(-2147483648 + 10);
      expect(ConstEnumIntM3.second.valueOf()).assertEqual(-2147483648 + 11);
      expect(ConstEnumIntM3.third.valueOf()).assertEqual(-2147483648 - 100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5300
     * @tc.name      testEnumerationWithExplicitType0197
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorLongA0 = ColorLongA0.Red;
      let g: ColorLongA0 = ColorLongA0.Green;
      let b: ColorLongA0 = ColorLongA0.Blue;
      expect(r instanceof ColorLongA0).assertEqual(true);
      expect(g instanceof ColorLongA0).assertEqual(true);
      expect(b instanceof ColorLongA0).assertEqual(true);
      expect(r instanceof ColorLongA1).assertEqual(false);
      expect(g instanceof ColorLongA1).assertEqual(false);
      expect(b instanceof ColorLongA1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5400
     * @tc.name      testEnumerationWithExplicitType0198
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorLongA0.Red;
      let g = ColorLongA0.Green;
      let b = ColorLongA0.Blue;
      expect(r instanceof ColorLongA0).assertEqual(true);
      expect(g instanceof ColorLongA0).assertEqual(true);
      expect(b instanceof ColorLongA0).assertEqual(true);
      expect(r instanceof ColorLongA1).assertEqual(false);
      expect(g instanceof ColorLongA1).assertEqual(false);
      expect(b instanceof ColorLongA1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5500
     * @tc.name      testEnumerationWithExplicitType0199
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorLongA0.Red instanceof ColorLongA0).assertEqual(true);
      expect(ColorLongA0.Green instanceof ColorLongA0).assertEqual(true);
      expect(ColorLongA0.Blue instanceof ColorLongA0).assertEqual(true);
      expect(ColorLongA0.Red instanceof ColorLongA1).assertEqual(false);
      expect(ColorLongA0.Green instanceof ColorLongA1).assertEqual(false);
      expect(ColorLongA0.Blue instanceof ColorLongA1).assertEqual(false);
      expect(ColorLongA0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongA0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongA0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongA0.Red).assertEqual(0);
      expect(ColorLongA0.Green).assertEqual(1);
      expect(ColorLongA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5600
     * @tc.name      testEnumerationWithExplicitType0200
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorLongB0 = ColorLongB0.Red;
      let g: ColorLongB0 = ColorLongB0.Green;
      let b: ColorLongB0 = ColorLongB0.Blue;
      expect(r instanceof ColorLongB0).assertEqual(true);
      expect(g instanceof ColorLongB0).assertEqual(true);
      expect(b instanceof ColorLongB0).assertEqual(true);
      expect(r instanceof ColorLongB1).assertEqual(false);
      expect(g instanceof ColorLongB1).assertEqual(false);
      expect(b instanceof ColorLongB1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5700
     * @tc.name      testEnumerationWithExplicitType0201
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorLongB0.Red;
      let g = ColorLongB0.Green;
      let b = ColorLongB0.Blue;
      expect(r instanceof ColorLongB0).assertEqual(true);
      expect(g instanceof ColorLongB0).assertEqual(true);
      expect(b instanceof ColorLongB0).assertEqual(true);
      expect(r instanceof ColorLongB1).assertEqual(false);
      expect(g instanceof ColorLongB1).assertEqual(false);
      expect(b instanceof ColorLongB1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5800
     * @tc.name      testEnumerationWithExplicitType0202
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorLongB0.Red instanceof ColorLongB0).assertEqual(true);
      expect(ColorLongB0.Green instanceof ColorLongB0).assertEqual(true);
      expect(ColorLongB0.Blue instanceof ColorLongB0).assertEqual(true);
      expect(ColorLongB0.Red instanceof ColorLongB1).assertEqual(false);
      expect(ColorLongB0.Green instanceof ColorLongB1).assertEqual(false);
      expect(ColorLongB0.Blue instanceof ColorLongB1).assertEqual(false);
      expect(ColorLongB0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongB0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongB0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongB0.Red).assertEqual(0);
      expect(ColorLongB0.Green).assertEqual(1);
      expect(ColorLongB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_5900
     * @tc.name      testEnumerationWithExplicitType0203
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorLongA0 = ConstColorLongA0.Red;
      let g: ConstColorLongA0 = ConstColorLongA0.Green;
      let b: ConstColorLongA0 = ConstColorLongA0.Blue;
      expect(r instanceof ConstColorLongA0).assertEqual(true);
      expect(g instanceof ConstColorLongA0).assertEqual(true);
      expect(b instanceof ConstColorLongA0).assertEqual(true);
      expect(r instanceof ConstColorLongA1).assertEqual(false);
      expect(g instanceof ConstColorLongA1).assertEqual(false);
      expect(b instanceof ConstColorLongA1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6000
     * @tc.name      testEnumerationWithExplicitType0204
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ConstColorLongA0.Red;
      let g = ConstColorLongA0.Green;
      let b = ConstColorLongA0.Blue;
      expect(r instanceof ConstColorLongA0).assertEqual(true);
      expect(g instanceof ConstColorLongA0).assertEqual(true);
      expect(b instanceof ConstColorLongA0).assertEqual(true);
      expect(r instanceof ConstColorLongA1).assertEqual(false);
      expect(g instanceof ConstColorLongA1).assertEqual(false);
      expect(b instanceof ConstColorLongA1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6100
     * @tc.name      testEnumerationWithExplicitType0205
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstColorLongA0.Red instanceof ConstColorLongA0).assertEqual(true);
      expect(ConstColorLongA0.Green instanceof ConstColorLongA0).assertEqual(true);
      expect(ConstColorLongA0.Blue instanceof ConstColorLongA0).assertEqual(true);
      expect(ConstColorLongA0.Red instanceof ConstColorLongA1).assertEqual(false);
      expect(ConstColorLongA0.Green instanceof ConstColorLongA1).assertEqual(false);
      expect(ConstColorLongA0.Blue instanceof ConstColorLongA1).assertEqual(false);
      expect(ConstColorLongA0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongA0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongA0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongA0.Red).assertEqual(0);
      expect(ConstColorLongA0.Green).assertEqual(1);
      expect(ConstColorLongA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6200
     * @tc.name      testEnumerationWithExplicitType0206
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorLongB0 = ConstColorLongB0.Red;
      let g: ConstColorLongB0 = ConstColorLongB0.Green;
      let b: ConstColorLongB0 = ConstColorLongB0.Blue;
      expect(r instanceof ConstColorLongB0).assertEqual(true);
      expect(g instanceof ConstColorLongB0).assertEqual(true);
      expect(b instanceof ConstColorLongB0).assertEqual(true);
      expect(r instanceof ConstColorLongB1).assertEqual(false);
      expect(g instanceof ConstColorLongB1).assertEqual(false);
      expect(b instanceof ConstColorLongB1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6300
     * @tc.name      testEnumerationWithExplicitType0207
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ConstColorLongB0.Red;
      let g = ConstColorLongB0.Green;
      let b = ConstColorLongB0.Blue;
      expect(r instanceof ConstColorLongB0).assertEqual(true);
      expect(g instanceof ConstColorLongB0).assertEqual(true);
      expect(b instanceof ConstColorLongB0).assertEqual(true);
      expect(r instanceof ConstColorLongB1).assertEqual(false);
      expect(g instanceof ConstColorLongB1).assertEqual(false);
      expect(b instanceof ConstColorLongB1).assertEqual(false);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6400
     * @tc.name      testEnumerationWithExplicitType0208
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstColorLongB0.Red instanceof ConstColorLongB0).assertEqual(true);
      expect(ConstColorLongB0.Green instanceof ConstColorLongB0).assertEqual(true);
      expect(ConstColorLongB0.Blue instanceof ConstColorLongB0).assertEqual(true);
      expect(ConstColorLongB0.Red instanceof ConstColorLongB1).assertEqual(false);
      expect(ConstColorLongB0.Green instanceof ConstColorLongB1).assertEqual(false);
      expect(ConstColorLongB0.Blue instanceof ConstColorLongB1).assertEqual(false);
      expect(ConstColorLongB0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongB0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongB0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongB0.Red).assertEqual(0);
      expect(ConstColorLongB0.Green).assertEqual(1);
      expect(ConstColorLongB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6500
     * @tc.name      testEnumerationWithExplicitType0209
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorLongC0 = ColorLongC0.Red;
      r = ColorLongC0.Blue;
      expect(ColorLongC0.Red instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Green instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Blue instanceof ColorLongC0).assertEqual(true);
      expect(r instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Red).assertEqual(0);
      expect(ColorLongC0.Green).assertEqual(1);
      expect(ColorLongC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6600
     * @tc.name      testEnumerationWithExplicitType0210
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ColorLongC0 = ColorLongC0.Green;
      g = ColorLongC0.Blue;
      expect(ColorLongC0.Red instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Green instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Blue instanceof ColorLongC0).assertEqual(true);
      expect(g instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(g.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Red).assertEqual(0);
      expect(ColorLongC0.Green).assertEqual(1);
      expect(ColorLongC0.Blue).assertEqual(2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6700
     * @tc.name      testEnumerationWithExplicitType0211
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ColorLongC0 = ColorLongC0.Blue;
      b = ColorLongC0.Red;
      expect(ColorLongC0.Red instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Green instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Blue instanceof ColorLongC0).assertEqual(true);
      expect(b instanceof ColorLongC0).assertEqual(true);
      expect(ColorLongC0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(b.valueOf() instanceof long).assertEqual(true);
      expect(ColorLongC0.Red).assertEqual(0);
      expect(ColorLongC0.Green).assertEqual(1);
      expect(ColorLongC0.Blue).assertEqual(2);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6800
     * @tc.name      testEnumerationWithExplicitType0212
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorLongC0 = ConstColorLongC0.Red;
      r = ConstColorLongC0.Blue;
      expect(ConstColorLongC0.Red instanceof ConstColorLongC0).assertEqual(true);
      expect(ConstColorLongC0.Green instanceof ConstColorLongC0).assertEqual(true);
      expect(ConstColorLongC0.Blue instanceof ConstColorLongC0).assertEqual(true);
      expect(r instanceof ConstColorLongC0).assertEqual(true);
      expect(ConstColorLongC0.Red.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongC0.Green.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongC0.Blue.valueOf() instanceof long).assertEqual(true);
      expect(r.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorLongC0.Red).assertEqual(0);
      expect(ConstColorLongC0.Green).assertEqual(1);
      expect(ConstColorLongC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_6900
     * @tc.name      testEnumerationWithExplicitType0213
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ConstColorLongC0 = ConstColorLongC0.Green
      g = ConstColorLongC0.Blue
      expect(ConstColorLongC0.Red instanceof ConstColorLongC0).assertEqual(true)
      expect(ConstColorLongC0.Green instanceof ConstColorLongC0).assertEqual(true)
      expect(ConstColorLongC0.Blue instanceof ConstColorLongC0).assertEqual(true)
      expect(g instanceof ConstColorLongC0).assertEqual(true)
      expect(ConstColorLongC0.Red.valueOf() instanceof long).assertEqual(true)
      expect(ConstColorLongC0.Green.valueOf() instanceof long).assertEqual(true)
      expect(ConstColorLongC0.Blue.valueOf() instanceof long).assertEqual(true)
      expect(g.valueOf() instanceof long).assertEqual(true)
      expect(ConstColorLongC0.Red).assertEqual(0)
      expect(ConstColorLongC0.Green).assertEqual(1)
      expect(ConstColorLongC0.Blue).assertEqual(2)
      expect(g).assertEqual(2)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7000
     * @tc.name      testEnumerationWithExplicitType0214
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ConstColorLongC0 = ConstColorLongC0.Blue
      b = ConstColorLongC0.Red
      expect(ConstColorLongC0.Red instanceof ConstColorLongC0).assertEqual(true)
      expect(ConstColorLongC0.Green instanceof ConstColorLongC0).assertEqual(true)
      expect(ConstColorLongC0.Blue instanceof ConstColorLongC0).assertEqual(true)
      expect(b instanceof ConstColorLongC0).assertEqual(true)
      expect(ConstColorLongC0.Red.valueOf() instanceof long).assertEqual(true)
      expect(ConstColorLongC0.Green.valueOf() instanceof long).assertEqual(true)
      expect(ConstColorLongC0.Blue.valueOf() instanceof long).assertEqual(true)
      expect(b.valueOf() instanceof long).assertEqual(true)
      expect(ConstColorLongC0.Red).assertEqual(0)
      expect(ConstColorLongC0.Green).assertEqual(1)
      expect(ConstColorLongC0.Blue).assertEqual(2)
      expect(b).assertEqual(0)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7100
     * @tc.name      testEnumerationWithExplicitType0215
     * @tc.desc      Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongA0.A instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.B instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.C instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.D instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.E instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.F instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.G instanceof EnumLongA0).assertEqual(true)
      expect(EnumLongA0.A.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.B.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.C.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.D.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.E.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.F.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.G.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongA0.A).assertEqual(0)
      expect(EnumLongA0.B).assertEqual(1)
      expect(EnumLongA0.C).assertEqual(2)
      expect(EnumLongA0.D).assertEqual(3)
      expect(EnumLongA0.E).assertEqual(4)
      expect(EnumLongA0.F).assertEqual(5)
      expect(EnumLongA0.G).assertEqual(7)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7200
     * @tc.name      testEnumerationWithExplicitType0216
     * @tc.desc      Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongA0.A instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.B instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.C instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.D instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.E instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.F instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.G instanceof ConstEnumLongA0).assertEqual(true)
      expect(ConstEnumLongA0.A.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.B.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.C.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.D.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.E.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.F.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.G.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongA0.A).assertEqual(0)
      expect(ConstEnumLongA0.B).assertEqual(1)
      expect(ConstEnumLongA0.C).assertEqual(2)
      expect(ConstEnumLongA0.D).assertEqual(3)
      expect(ConstEnumLongA0.E).assertEqual(4)
      expect(ConstEnumLongA0.F).assertEqual(5)
      expect(ConstEnumLongA0.G).assertEqual(7)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7300
     * @tc.name      testEnumerationWithExplicitType0217
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongB0.A instanceof EnumLongB0).assertEqual(true)
      expect(EnumLongB0.B instanceof EnumLongB0).assertEqual(true)
      expect(EnumLongB0.C instanceof EnumLongB0).assertEqual(true)
      expect(EnumLongB0.A.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongB0.B.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongB0.C.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongB0.A).assertEqual(2)
      expect(EnumLongB0.B).assertEqual(3)
      expect(EnumLongB0.C).assertEqual(4)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7400
     * @tc.name      testEnumerationWithExplicitType0218
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongB0.A instanceof ConstEnumLongB0).assertEqual(true)
      expect(ConstEnumLongB0.B instanceof ConstEnumLongB0).assertEqual(true)
      expect(ConstEnumLongB0.C instanceof ConstEnumLongB0).assertEqual(true)
      expect(ConstEnumLongB0.A.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongB0.B.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongB0.C.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongB0.A).assertEqual(2)
      expect(ConstEnumLongB0.B).assertEqual(3)
      expect(ConstEnumLongB0.C).assertEqual(4)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7500
     * @tc.name      testEnumerationWithExplicitType0219
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongC0.A instanceof EnumLongC0).assertEqual(true)
      expect(EnumLongC0.B instanceof EnumLongC0).assertEqual(true)
      expect(EnumLongC0.C instanceof EnumLongC0).assertEqual(true)
      expect(EnumLongC0.D instanceof EnumLongC0).assertEqual(true)
      expect(EnumLongC0.E instanceof EnumLongC0).assertEqual(true)
      expect(EnumLongC0.A.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongC0.B.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongC0.C.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongC0.D.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongC0.E.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongC0.A).assertEqual(0)
      expect(EnumLongC0.B).assertEqual(2)
      expect(EnumLongC0.C).assertEqual(4)
      expect(EnumLongC0.D).assertEqual(6)
      expect(EnumLongC0.E).assertEqual(12)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SEVEN_TEST_7600
     * @tc.name      testEnumerationWithExplicitType0220
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongC0.A instanceof ConstEnumLongC0).assertEqual(true)
      expect(ConstEnumLongC0.B instanceof ConstEnumLongC0).assertEqual(true)
      expect(ConstEnumLongC0.C instanceof ConstEnumLongC0).assertEqual(true)
      expect(ConstEnumLongC0.D instanceof ConstEnumLongC0).assertEqual(true)
      expect(ConstEnumLongC0.E instanceof ConstEnumLongC0).assertEqual(true)
      expect(ConstEnumLongC0.A.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongC0.B.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongC0.C.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongC0.D.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongC0.E.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongC0.A).assertEqual(0)
      expect(ConstEnumLongC0.B).assertEqual(2)
      expect(ConstEnumLongC0.C).assertEqual(4)
      expect(ConstEnumLongC0.D).assertEqual(6)
      expect(ConstEnumLongC0.E).assertEqual(12)
    });
  })
}
