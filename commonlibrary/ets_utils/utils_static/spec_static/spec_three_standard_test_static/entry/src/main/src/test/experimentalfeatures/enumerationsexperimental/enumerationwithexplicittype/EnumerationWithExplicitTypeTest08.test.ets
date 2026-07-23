'use static'
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

import Utils from '../../../Util.test'
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

enum EnumLongI0: long {
  first = 0b0011,
  second = 0o731,
  third = 0xCAFE_BAD3_7FFF,
  fourth = 9_372_036_854_775_805
}

enum ConstEnumLongI0: long {
  first = 0b0011,
  second = 0o731,
  third = 0xCAFE_BAD3_7FFF,
  fourth = 9_372_036_854_775_805
}

enum EnumLongJ0: long { first = -42, second, third = 17 }
enum ConstEnumLongJ0: long { first = -42, second, third = 17 }

enum EnumLongK0: long { first = -1, second, third = -42 }
enum ConstEnumLongK0: long { first = -1, second, third = -42 }

enum ColorLongD0: long { Red = 5, Green = 7, Blue = -53 }
enum ConstColorLongD0: long { Red = 5, Green = 7, Blue = -53 }

enum EnumLongL0: long { first = -1, second = 27, third }
enum ConstEnumLongL0: long { first = -1, second = 27, third }

enum EnumLongM0: long { first = 9223372036854775807 - 1, second, third }
enum ConstEnumLongM0: long { first = 9223372036854775807 - 1, second, third }

enum EnumLongM1: long { first = 9223372036854775807 - 10, second, third = first + 110 }
enum ConstEnumLongM1: long { first = 9223372036854775807 - 10, second, third = first + 110 }

enum EnumLongM2: long { first, second = -9223372036854775808, third = second - 1 }
enum ConstEnumLongM2: long { first, second = -9223372036854775808, third = second - 1 }

enum EnumLongM3: long { first = -9223372036854775808 + 10, second, third = first - 110 }
enum ConstEnumLongM3: long { first = -9223372036854775808 + 10, second, third = first - 110 }

enum ColorByteA0: byte { Red, Green, Blue }
enum ColorByteA1: byte { Red, Green, Blue }

enum ColorByteB0: byte { Red, Green, Blue, }
enum ColorByteB1: byte { Red, Green, Blue, }

enum ConstColorByteA0: byte { Red, Green, Blue }
enum ConstColorByteA1: byte { Red, Green, Blue }

enum ConstColorByteB0: byte { Red, Green, Blue, }
enum ConstColorByteB1: byte { Red, Green, Blue, }

enum ColorByteC0: byte { Red, Green, Blue }
enum ConstColorByteC0: byte { Red, Green, Blue }

enum EnumByteD0: byte {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 1) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum ConstEnumByteD0: byte {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 1) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum EnumByteE0: byte { first = 123, second, third }
enum EnumByteE1: byte { first = EnumByteE0.first, second, third }

enum ConstEnumByteE0: byte { first = 123, second, third }
enum ConstEnumByteE1: byte { first = ConstEnumByteE0.first, second, third }

enum EnumByteE2: byte { first = 123, second, third }
enum ConstEnumByteE2: byte { first = EnumByteE2.first, second, third }

enum ConstEnumByteE3: byte { first = 123, second, third }
enum EnumByteE3: byte { first = ConstEnumByteE3.first, second, third }

export default function EnumerationWithExplicitTypeTest08(): void {
  describe('EnumerationWithExplicitTypeTest08', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0223
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongE0.first instanceof EnumLongE0).assertEqual(true)
      expect(EnumLongE0.second instanceof EnumLongE0).assertEqual(true)
      expect(EnumLongE0.third instanceof EnumLongE0).assertEqual(true)
      expect(EnumLongE0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE0.first.valueOf()).assertEqual(123)
      expect(EnumLongE0.second.valueOf()).assertEqual(124)
      expect(EnumLongE0.third.valueOf()).assertEqual(125)
      expect(EnumLongE1.first instanceof EnumLongE1).assertEqual(true)
      expect(EnumLongE1.second instanceof EnumLongE1).assertEqual(true)
      expect(EnumLongE1.third instanceof EnumLongE1).assertEqual(true)
      expect(EnumLongE1.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE1.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE1.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE1.first.valueOf()).assertEqual(123)
      expect(EnumLongE1.second.valueOf()).assertEqual(124)
      expect(EnumLongE1.third.valueOf()).assertEqual(125)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0224
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongE0.first instanceof ConstEnumLongE0).assertEqual(true)
      expect(ConstEnumLongE0.second instanceof ConstEnumLongE0).assertEqual(true)
      expect(ConstEnumLongE0.third instanceof ConstEnumLongE0).assertEqual(true)
      expect(ConstEnumLongE0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE0.first.valueOf()).assertEqual(123)
      expect(ConstEnumLongE0.second.valueOf()).assertEqual(124)
      expect(ConstEnumLongE0.third.valueOf()).assertEqual(125)
      expect(ConstEnumLongE1.first instanceof ConstEnumLongE1).assertEqual(true)
      expect(ConstEnumLongE1.second instanceof ConstEnumLongE1).assertEqual(true)
      expect(ConstEnumLongE1.third instanceof ConstEnumLongE1).assertEqual(true)
      expect(ConstEnumLongE1.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE1.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE1.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE1.first.valueOf()).assertEqual(123)
      expect(ConstEnumLongE1.second.valueOf()).assertEqual(124)
      expect(ConstEnumLongE1.third.valueOf()).assertEqual(125)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0225
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongE2.first instanceof EnumLongE2).assertEqual(true)
      expect(EnumLongE2.second instanceof EnumLongE2).assertEqual(true)
      expect(EnumLongE2.third instanceof EnumLongE2).assertEqual(true)
      expect(EnumLongE2.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE2.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE2.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE2.first.valueOf()).assertEqual(123)
      expect(EnumLongE2.second.valueOf()).assertEqual(124)
      expect(EnumLongE2.third.valueOf()).assertEqual(125)
      expect(ConstEnumLongE2.first instanceof ConstEnumLongE2).assertEqual(true)
      expect(ConstEnumLongE2.second instanceof ConstEnumLongE2).assertEqual(true)
      expect(ConstEnumLongE2.third instanceof ConstEnumLongE2).assertEqual(true)
      expect(ConstEnumLongE2.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE2.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE2.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE2.first.valueOf()).assertEqual(123)
      expect(ConstEnumLongE2.second.valueOf()).assertEqual(124)
      expect(ConstEnumLongE2.third.valueOf()).assertEqual(125)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0226
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongE3.first instanceof ConstEnumLongE3).assertEqual(true)
      expect(ConstEnumLongE3.second instanceof ConstEnumLongE3).assertEqual(true)
      expect(ConstEnumLongE3.third instanceof ConstEnumLongE3).assertEqual(true)
      expect(ConstEnumLongE3.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE3.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE3.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongE3.first.valueOf()).assertEqual(123)
      expect(ConstEnumLongE3.second.valueOf()).assertEqual(124)
      expect(ConstEnumLongE3.third.valueOf()).assertEqual(125)
      expect(EnumLongE3.first instanceof EnumLongE3).assertEqual(true)
      expect(EnumLongE3.second instanceof EnumLongE3).assertEqual(true)
      expect(EnumLongE3.third instanceof EnumLongE3).assertEqual(true)
      expect(EnumLongE3.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE3.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE3.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongE3.first.valueOf()).assertEqual(123)
      expect(EnumLongE3.second.valueOf()).assertEqual(124)
      expect(EnumLongE3.third.valueOf()).assertEqual(125)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0227
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 2147483648
      const v2: long = 2147483648 - 1
      const v3: long = 2147483648 - 2
      expect(EnumLongF0.first instanceof EnumLongF0).assertEqual(true)
      expect(EnumLongF0.second instanceof EnumLongF0).assertEqual(true)
      expect(EnumLongF0.third instanceof EnumLongF0).assertEqual(true)
      expect(EnumLongF0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongF0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongF0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongF0.first.valueOf()).assertEqual(v1)
      expect(EnumLongF0.second.valueOf()).assertEqual(v2)
      expect(EnumLongF0.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0228
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 2147483648
      const v2: long = 2147483648 - 1
      const v3: long = 2147483648 - 2
      expect(ConstEnumLongF0.first instanceof ConstEnumLongF0).assertEqual(true)
      expect(ConstEnumLongF0.second instanceof ConstEnumLongF0).assertEqual(true)
      expect(ConstEnumLongF0.third instanceof ConstEnumLongF0).assertEqual(true)
      expect(ConstEnumLongF0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongF0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongF0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongF0.first.valueOf()).assertEqual(v1)
      expect(ConstEnumLongF0.second.valueOf()).assertEqual(v2)
      expect(ConstEnumLongF0.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0229
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongG0.A instanceof EnumLongG0).assertEqual(true)
      expect(EnumLongG0.B instanceof EnumLongG0).assertEqual(true)
      expect(EnumLongG0.A.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG0.B.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG0.A).assertEqual(5)
      expect(EnumLongG0.B).assertEqual(5)
      expect(EnumLongG0.A).assertEqual(EnumLongG0.B)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0230
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongG0.A instanceof ConstEnumLongG0).assertEqual(true)
      expect(ConstEnumLongG0.B instanceof ConstEnumLongG0).assertEqual(true)
      expect(ConstEnumLongG0.A.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG0.B.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG0.A).assertEqual(5)
      expect(ConstEnumLongG0.B).assertEqual(5)
      expect(ConstEnumLongG0.A).assertEqual(ConstEnumLongG0.B)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0231
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongG1.A instanceof EnumLongG1).assertEqual(true)
      expect(EnumLongG1.B instanceof EnumLongG1).assertEqual(true)
      expect(EnumLongG1.C instanceof EnumLongG1).assertEqual(true)
      expect(EnumLongG1.A.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG1.B.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG1.C.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG1.A).assertEqual(-12)
      expect(EnumLongG1.B).assertEqual(-11)
      expect(EnumLongG1.C).assertEqual(-12)
      expect(EnumLongG1.A).assertEqual(EnumLongG1.C)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0232
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongG1.A instanceof ConstEnumLongG1).assertEqual(true)
      expect(ConstEnumLongG1.B instanceof ConstEnumLongG1).assertEqual(true)
      expect(ConstEnumLongG1.C instanceof ConstEnumLongG1).assertEqual(true)
      expect(ConstEnumLongG1.A.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG1.B.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG1.C.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG1.A).assertEqual(-12)
      expect(ConstEnumLongG1.B).assertEqual(-11)
      expect(ConstEnumLongG1.C).assertEqual(-12)
      expect(ConstEnumLongG1.A).assertEqual(ConstEnumLongG1.C)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0233
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongG2.first instanceof EnumLongG2).assertEqual(true)
      expect(EnumLongG2.second instanceof EnumLongG2).assertEqual(true)
      expect(EnumLongG2.third instanceof EnumLongG2).assertEqual(true)
      expect(EnumLongG2.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG2.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG2.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG2.first).assertEqual(0)
      expect(EnumLongG2.second).assertEqual(-1)
      expect(EnumLongG2.third).assertEqual(0)
      expect(EnumLongG2.third).assertEqual(EnumLongG2.first)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0234
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongG2.first instanceof ConstEnumLongG2).assertEqual(true)
      expect(ConstEnumLongG2.second instanceof ConstEnumLongG2).assertEqual(true)
      expect(ConstEnumLongG2.third instanceof ConstEnumLongG2).assertEqual(true)
      expect(ConstEnumLongG2.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG2.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG2.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG2.first).assertEqual(0)
      expect(ConstEnumLongG2.second).assertEqual(-1)
      expect(ConstEnumLongG2.third).assertEqual(0)
      expect(ConstEnumLongG2.third).assertEqual(ConstEnumLongG2.first)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0235
     * @tc.desc      Values can be the same. If constant expression is omitted, then the value of the enum constant is set implicitly to an integer value. The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongG3.A instanceof EnumLongG3).assertEqual(true)
      expect(EnumLongG3.B instanceof EnumLongG3).assertEqual(true)
      expect(EnumLongG3.C instanceof EnumLongG3).assertEqual(true)
      expect(EnumLongG3.D instanceof EnumLongG3).assertEqual(true)
      expect(EnumLongG3.E instanceof EnumLongG3).assertEqual(true)
      expect(EnumLongG3.A.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG3.B.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG3.C.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG3.D.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG3.E.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongG3.A).assertEqual(0)
      expect(EnumLongG3.B).assertEqual(1)
      expect(EnumLongG3.C).assertEqual(2)
      expect(EnumLongG3.D).assertEqual(3)
      expect(EnumLongG3.E).assertEqual(3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0236
     * @tc.desc      Values can be the same. If constant expression is omitted, then the value of the enum constant is set implicitly to an integer value. The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongG3.A instanceof ConstEnumLongG3).assertEqual(true)
      expect(ConstEnumLongG3.B instanceof ConstEnumLongG3).assertEqual(true)
      expect(ConstEnumLongG3.C instanceof ConstEnumLongG3).assertEqual(true)
      expect(ConstEnumLongG3.D instanceof ConstEnumLongG3).assertEqual(true)
      expect(ConstEnumLongG3.E instanceof ConstEnumLongG3).assertEqual(true)
      expect(ConstEnumLongG3.A.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG3.B.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG3.C.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG3.D.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG3.E.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongG3.A).assertEqual(0)
      expect(ConstEnumLongG3.B).assertEqual(1)
      expect(ConstEnumLongG3.C).assertEqual(2)
      expect(ConstEnumLongG3.D).assertEqual(3)
      expect(ConstEnumLongG3.E).assertEqual(3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0237
     * @tc.desc      Checking for min value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 0
      const v2: long = -9223372036854775808
      const v3: long = -9223372036854775808 + 1
      expect(EnumLongH0.first instanceof EnumLongH0).assertEqual(true)
      expect(EnumLongH0.second instanceof EnumLongH0).assertEqual(true)
      expect(EnumLongH0.third instanceof EnumLongH0).assertEqual(true)
      expect(EnumLongH0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongH0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongH0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongH0.first.valueOf()).assertEqual(v1)
      expect(EnumLongH0.second.valueOf()).assertEqual(v2)
      expect(EnumLongH0.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1800
     * @tc.name      testEnumerationWithExplicitType0238
     * @tc.desc      Checking for min value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 0
      const v2: long = -9223372036854775808
      const v3: long = -9223372036854775808 + 1
      expect(ConstEnumLongH0.first instanceof ConstEnumLongH0).assertEqual(true)
      expect(ConstEnumLongH0.second instanceof ConstEnumLongH0).assertEqual(true)
      expect(ConstEnumLongH0.third instanceof ConstEnumLongH0).assertEqual(true)
      expect(ConstEnumLongH0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongH0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongH0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongH0.first.valueOf()).assertEqual(v1)
      expect(ConstEnumLongH0.second.valueOf()).assertEqual(v2)
      expect(ConstEnumLongH0.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0239
     * @tc.desc      Checking for max value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 9223372036854775807 - 2
      const v2: long = 9223372036854775807 - 1
      const v3: long = 9223372036854775807
      expect(EnumLongH1.first instanceof EnumLongH1).assertEqual(true)
      expect(EnumLongH1.second instanceof EnumLongH1).assertEqual(true)
      expect(EnumLongH1.third instanceof EnumLongH1).assertEqual(true)
      expect(EnumLongH1.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongH1.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongH1.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongH1.first.valueOf()).assertEqual(v1)
      expect(EnumLongH1.second.valueOf()).assertEqual(v2)
      expect(EnumLongH1.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2000
     * @tc.name      testEnumerationWithExplicitType0240
     * @tc.desc      Checking for max value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 9223372036854775807 - 2
      const v2: long = 9223372036854775807 - 1
      const v3: long = 9223372036854775807
      expect(ConstEnumLongH1.first instanceof ConstEnumLongH1).assertEqual(true)
      expect(ConstEnumLongH1.second instanceof ConstEnumLongH1).assertEqual(true)
      expect(ConstEnumLongH1.third instanceof ConstEnumLongH1).assertEqual(true)
      expect(ConstEnumLongH1.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongH1.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongH1.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongH1.first.valueOf()).assertEqual(v1)
      expect(ConstEnumLongH1.second.valueOf()).assertEqual(v2)
      expect(ConstEnumLongH1.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0241
     * @tc.desc      Using different integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 0b0011
      const v2: long = 0o731
      const v3: long = 0xCAFE_BAD3_7FFF
      const v4: long = 9_372_036_854_775_805
      expect(EnumLongI0.first instanceof EnumLongI0).assertEqual(true)
      expect(EnumLongI0.second instanceof EnumLongI0).assertEqual(true)
      expect(EnumLongI0.third instanceof EnumLongI0).assertEqual(true)
      expect(EnumLongI0.fourth instanceof EnumLongI0).assertEqual(true)
      expect(EnumLongI0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongI0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongI0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongI0.fourth.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongI0.first.valueOf()).assertEqual(v1)
      expect(EnumLongI0.second.valueOf()).assertEqual(v2)
      expect(EnumLongI0.third.valueOf()).assertEqual(v3)
      expect(EnumLongI0.fourth.valueOf()).assertEqual(v4)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2200
     * @tc.name      testEnumerationWithExplicitType0242
     * @tc.desc      Using different integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: long = 0b0011
      const v2: long = 0o731
      const v3: long = 0xCAFE_BAD3_7FFF
      const v4: long = 9_372_036_854_775_805
      expect(ConstEnumLongI0.first instanceof ConstEnumLongI0).assertEqual(true)
      expect(ConstEnumLongI0.second instanceof ConstEnumLongI0).assertEqual(true)
      expect(ConstEnumLongI0.third instanceof ConstEnumLongI0).assertEqual(true)
      expect(ConstEnumLongI0.fourth instanceof ConstEnumLongI0).assertEqual(true)
      expect(ConstEnumLongI0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongI0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongI0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongI0.fourth.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongI0.first.valueOf()).assertEqual(v1)
      expect(ConstEnumLongI0.second.valueOf()).assertEqual(v2)
      expect(ConstEnumLongI0.third.valueOf()).assertEqual(v3)
      expect(ConstEnumLongI0.fourth.valueOf()).assertEqual(v4)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0243
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongJ0.first instanceof EnumLongJ0).assertEqual(true)
      expect(EnumLongJ0.second instanceof EnumLongJ0).assertEqual(true)
      expect(EnumLongJ0.third instanceof EnumLongJ0).assertEqual(true)
      expect(EnumLongJ0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongJ0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongJ0.third.valueOf() instanceof long).assertEqual(true)
      expect("_" + EnumLongJ0.first).assertEqual("_-42")
      expect("_" + EnumLongJ0.second).assertEqual("_-41")
      expect("_" + EnumLongJ0.third).assertEqual("_17")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2400
     * @tc.name      testEnumerationWithExplicitType0244
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongJ0.first instanceof EnumLongJ0).assertEqual(true)
      expect(EnumLongJ0.second instanceof EnumLongJ0).assertEqual(true)
      expect(EnumLongJ0.third instanceof EnumLongJ0).assertEqual(true)
      expect(EnumLongJ0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongJ0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongJ0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongJ0.first + "_").assertEqual("-42_")
      expect(EnumLongJ0.second + "_").assertEqual("-41_")
      expect(EnumLongJ0.third + "_").assertEqual("17_")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2500
     * @tc.name      testEnumerationWithExplicitType0245
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongJ0.first instanceof ConstEnumLongJ0).assertEqual(true)
      expect(ConstEnumLongJ0.second instanceof ConstEnumLongJ0).assertEqual(true)
      expect(ConstEnumLongJ0.third instanceof ConstEnumLongJ0).assertEqual(true)
      expect(ConstEnumLongJ0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongJ0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongJ0.third.valueOf() instanceof long).assertEqual(true)
      expect("_" + ConstEnumLongJ0.first).assertEqual("_-42")
      expect("_" + ConstEnumLongJ0.second).assertEqual("_-41")
      expect("_" + ConstEnumLongJ0.third).assertEqual("_17")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2600
     * @tc.name      testEnumerationWithExplicitType0246
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongJ0.first instanceof ConstEnumLongJ0).assertEqual(true)
      expect(ConstEnumLongJ0.second instanceof ConstEnumLongJ0).assertEqual(true)
      expect(ConstEnumLongJ0.third instanceof ConstEnumLongJ0).assertEqual(true)
      expect(ConstEnumLongJ0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongJ0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongJ0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongJ0.first + "_").assertEqual("-42_")
      expect(ConstEnumLongJ0.second + "_").assertEqual("-41_")
      expect(ConstEnumLongJ0.third + "_").assertEqual("17_")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2700
     * @tc.name      testEnumerationWithExplicitType0247
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongK0.first instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.second instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.third instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.first).assertEqual(-1)
      expect(EnumLongK0.second).assertEqual(0)
      expect(EnumLongK0.third).assertEqual(-42)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2800
     * @tc.name      testEnumerationWithExplicitType0248
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongK0.first instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.second instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.third instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.first + 1).assertEqual(0)
      expect(EnumLongK0.second + 1).assertEqual(1)
      expect(EnumLongK0.third + 1).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_2900
     * @tc.name      testEnumerationWithExplicitType0249
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongK0.first instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.second instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.third instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(1 + EnumLongK0.first).assertEqual(0)
      expect(1 + EnumLongK0.second).assertEqual(1)
      expect(1 + EnumLongK0.third).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3000
     * @tc.name      testEnumerationWithExplicitType0250
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongK0.first instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.second instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.third instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.first == -1).assertEqual(true)
      expect(EnumLongK0.second == 0).assertEqual(true)
      expect(EnumLongK0.third == -42).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3100
     * @tc.name      testEnumerationWithExplicitType0251
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongK0.first instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.second instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.third instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.first === -1).assertEqual(true)
      expect(EnumLongK0.second === 0).assertEqual(true)
      expect(EnumLongK0.third === -42).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3200
     * @tc.name      testEnumerationWithExplicitType0252
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongK0.first instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.second instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.third instanceof EnumLongK0).assertEqual(true)
      expect(EnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongK0.first + EnumLongK0.second + EnumLongK0.third).assertEqual(-43)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3300
     * @tc.name      testEnumerationWithExplicitType0253
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongK0.first instanceof ConstEnumLongK0).assertEqual(true)
      expect(ConstEnumLongK0.second instanceof ConstEnumLongK0).assertEqual(true)
      expect(ConstEnumLongK0.third instanceof ConstEnumLongK0).assertEqual(true)
      expect(ConstEnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongK0.first).assertEqual(-1)
      expect(ConstEnumLongK0.second).assertEqual(0)
      expect(ConstEnumLongK0.third).assertEqual(-42)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3400
     * @tc.name      testEnumerationWithExplicitType0254
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongK0.first instanceof ConstEnumLongK0).assertEqual(true)
      expect(ConstEnumLongK0.second instanceof ConstEnumLongK0).assertEqual(true)
      expect(ConstEnumLongK0.third instanceof ConstEnumLongK0).assertEqual(true)
      expect(ConstEnumLongK0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongK0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongK0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongK0.first + 1).assertEqual(0)
      expect(ConstEnumLongK0.second + 1).assertEqual(1)
      expect(ConstEnumLongK0.third + 1).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3500
     * @tc.name      testEnumerationWithExplicitType0255
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + ConstEnumLongK0.first).assertEqual(0)
      expect(1 + ConstEnumLongK0.second).assertEqual(1)
      expect(1 + ConstEnumLongK0.third).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3600
     * @tc.name      testEnumerationWithExplicitType0256
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongK0.first == -1).assertEqual(true)
      expect(ConstEnumLongK0.second == 0).assertEqual(true)
      expect(ConstEnumLongK0.third == -42).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3700
     * @tc.name      testEnumerationWithExplicitType0257
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongK0.first === -1).assertEqual(true)
      expect(ConstEnumLongK0.second === 0).assertEqual(true)
      expect(ConstEnumLongK0.third === -42).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3800
     * @tc.name      testEnumerationWithExplicitType0258
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongK0.first + ConstEnumLongK0.second + ConstEnumLongK0.third).assertEqual(-43)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_3900
     * @tc.name      testEnumerationWithExplicitType0259
     * @tc.desc      Checking in switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ColorLongD0 = ColorLongD0.Green
      switch (v) {
        case ColorLongD0.Green:
          expect(v instanceof ColorLongD0).assertEqual(true)
          expect(v.valueOf() instanceof long).assertEqual(true)
          expect(v.valueOf()).assertEqual(7)
          break
        default:
          expect(false).assertEqual(true)
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4000
     * @tc.name      testEnumerationWithExplicitType0260
     * @tc.desc      Checking in switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ConstColorLongD0 = ConstColorLongD0.Green
      switch (v) {
        case ConstColorLongD0.Green:
          expect(v instanceof ConstColorLongD0).assertEqual(true)
          expect(v.valueOf() instanceof long).assertEqual(true)
          expect(v.valueOf()).assertEqual(7)
          break
        default:
          expect(false).assertEqual(true)
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4100
     * @tc.name      testEnumerationWithExplicitType0261
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongL0.first instanceof EnumLongL0).assertEqual(true)
      expect(EnumLongL0.second instanceof EnumLongL0).assertEqual(true)
      expect(EnumLongL0.third instanceof EnumLongL0).assertEqual(true)
      expect(EnumLongL0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongL0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongL0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongL0.first.valueOf()).assertEqual(-1)
      expect(EnumLongL0.second.valueOf()).assertEqual(27)
      expect(EnumLongL0.third.valueOf()).assertEqual(28)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4200
     * @tc.name      testEnumerationWithExplicitType0262
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongL0.first instanceof EnumLongL0).assertEqual(true)
      expect(EnumLongL0.second instanceof EnumLongL0).assertEqual(true)
      expect(EnumLongL0.third instanceof EnumLongL0).assertEqual(true)
      expect(EnumLongL0.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongL0.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongL0.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongL0.first.toString()).assertEqual("-1")
      expect(EnumLongL0.second.toString()).assertEqual("27")
      expect(EnumLongL0.third.toString()).assertEqual("28")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4300
     * @tc.name      testEnumerationWithExplicitType0263
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongL0.first instanceof ConstEnumLongL0).assertEqual(true)
      expect(ConstEnumLongL0.second instanceof ConstEnumLongL0).assertEqual(true)
      expect(ConstEnumLongL0.third instanceof ConstEnumLongL0).assertEqual(true)
      expect(ConstEnumLongL0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongL0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongL0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongL0.first.valueOf()).assertEqual(-1)
      expect(ConstEnumLongL0.second.valueOf()).assertEqual(27)
      expect(ConstEnumLongL0.third.valueOf()).assertEqual(28)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4400
     * @tc.name      testEnumerationWithExplicitType0264
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongL0.first instanceof ConstEnumLongL0).assertEqual(true)
      expect(ConstEnumLongL0.second instanceof ConstEnumLongL0).assertEqual(true)
      expect(ConstEnumLongL0.third instanceof ConstEnumLongL0).assertEqual(true)
      expect(ConstEnumLongL0.first.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongL0.second.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongL0.third.valueOf() instanceof long).assertEqual(true)
      expect(ConstEnumLongL0.first.toString()).assertEqual("-1")
      expect(ConstEnumLongL0.second.toString()).assertEqual("27")
      expect(ConstEnumLongL0.third.toString()).assertEqual("28")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4500
     * @tc.name      testEnumerationWithExplicitType0265
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongM0.first.valueOf()).assertEqual(9223372036854775807 - 1)
      expect(EnumLongM0.second.valueOf()).assertEqual(9223372036854775807)
      expect(EnumLongM0.third.valueOf()).assertEqual(9223372036854775807 + 1)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4700
     * @tc.name      testEnumerationWithExplicitType0267
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongM0.first.valueOf()).assertEqual(9223372036854775807 - 1)
      expect(ConstEnumLongM0.second.valueOf()).assertEqual(9223372036854775807)
      expect(ConstEnumLongM0.third.valueOf()).assertEqual(9223372036854775807 + 1)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_4900
     * @tc.name      testEnumerationWithExplicitType0269
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongM1.first.valueOf()).assertEqual(9223372036854775807 - 10)
      expect(EnumLongM1.second.valueOf()).assertEqual(9223372036854775807 - 9)
      expect(EnumLongM1.third.valueOf()).assertEqual(9223372036854775807 + 100)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_5100
     * @tc.name      testEnumerationWithExplicitType0271
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongM1.first.valueOf()).assertEqual(9223372036854775807 - 10)
      expect(ConstEnumLongM1.second.valueOf()).assertEqual(9223372036854775807 - 9)
      expect(ConstEnumLongM1.third.valueOf()).assertEqual(9223372036854775807 + 100)
    });
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_5300
     * @tc.name      testEnumerationWithExplicitType0273
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongM2.first.valueOf()).assertEqual(0);
      expect(EnumLongM2.second.valueOf()).assertEqual(-9223372036854775808);
      expect(EnumLongM2.third.valueOf()).assertEqual(-9223372036854775808 - 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_5500
     * @tc.name      testEnumerationWithExplicitType0275
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongM2.first.valueOf()).assertEqual(0);
      expect(ConstEnumLongM2.second.valueOf()).assertEqual(-9223372036854775808);
      expect(ConstEnumLongM2.third.valueOf()).assertEqual(-9223372036854775808 - 1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_5700
     * @tc.name      testEnumerationWithExplicitType0277
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongM3.first.valueOf()).assertEqual(-9223372036854775808 + 10);
      expect(EnumLongM3.second.valueOf()).assertEqual(-9223372036854775808 + 11);
      expect(EnumLongM3.third.valueOf()).assertEqual(-9223372036854775808 - 100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_5900
     * @tc.name      testEnumerationWithExplicitType0279
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumLongM3.first.valueOf()).assertEqual(-9223372036854775808 + 10);
      expect(ConstEnumLongM3.second.valueOf()).assertEqual(-9223372036854775808 + 11);
      expect(ConstEnumLongM3.third.valueOf()).assertEqual(-9223372036854775808 - 100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6100
     * @tc.name      testEnumerationWithExplicitType0281
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorByteA0 = ColorByteA0.Red;
      let g: ColorByteA0 = ColorByteA0.Green;
      let b: ColorByteA0 = ColorByteA0.Blue;
      expect(r instanceof ColorByteA0).assertEqual(true);
      expect(g instanceof ColorByteA0).assertEqual(true);
      expect(b instanceof ColorByteA0).assertEqual(true);
      expect(r instanceof ColorByteA1).assertEqual(false);
      expect(g instanceof ColorByteA1).assertEqual(false);
      expect(b instanceof ColorByteA1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6200
     * @tc.name      testEnumerationWithExplicitType0282
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorByteA0.Red;
      let g = ColorByteA0.Green;
      let b = ColorByteA0.Blue;
      expect(r instanceof ColorByteA0).assertEqual(true);
      expect(g instanceof ColorByteA0).assertEqual(true);
      expect(b instanceof ColorByteA0).assertEqual(true);
      expect(r instanceof ColorByteA1).assertEqual(false);
      expect(g instanceof ColorByteA1).assertEqual(false);
      expect(b instanceof ColorByteA1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6300
     * @tc.name      testEnumerationWithExplicitType0283
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorByteA0.Red instanceof ColorByteA0).assertEqual(true);
      expect(ColorByteA0.Green instanceof ColorByteA0).assertEqual(true);
      expect(ColorByteA0.Blue instanceof ColorByteA0).assertEqual(true);
      expect(ColorByteA0.Red instanceof ColorByteA1).assertEqual(false);
      expect(ColorByteA0.Green instanceof ColorByteA1).assertEqual(false);
      expect(ColorByteA0.Blue instanceof ColorByteA1).assertEqual(false);
      expect(ColorByteA0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteA0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteA0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteA0.Red).assertEqual(0);
      expect(ColorByteA0.Green).assertEqual(1);
      expect(ColorByteA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6400
     * @tc.name      testEnumerationWithExplicitType0284
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorByteB0 = ColorByteB0.Red;
      let g: ColorByteB0 = ColorByteB0.Green;
      let b: ColorByteB0 = ColorByteB0.Blue;
      expect(r instanceof ColorByteB0).assertEqual(true);
      expect(g instanceof ColorByteB0).assertEqual(true);
      expect(b instanceof ColorByteB0).assertEqual(true);
      expect(r instanceof ColorByteB1).assertEqual(false);
      expect(g instanceof ColorByteB1).assertEqual(false);
      expect(b instanceof ColorByteB1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6500
     * @tc.name      testEnumerationWithExplicitType0285
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorByteB0.Red;
      let g = ColorByteB0.Green;
      let b = ColorByteB0.Blue;
      expect(r instanceof ColorByteB0).assertEqual(true);
      expect(g instanceof ColorByteB0).assertEqual(true);
      expect(b instanceof ColorByteB0).assertEqual(true);
      expect(r instanceof ColorByteB1).assertEqual(false);
      expect(g instanceof ColorByteB1).assertEqual(false);
      expect(b instanceof ColorByteB1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6600
     * @tc.name      testEnumerationWithExplicitType0286
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorByteB0.Red instanceof ColorByteB0).assertEqual(true);
      expect(ColorByteB0.Green instanceof ColorByteB0).assertEqual(true);
      expect(ColorByteB0.Blue instanceof ColorByteB0).assertEqual(true);
      expect(ColorByteB0.Red instanceof ColorByteB1).assertEqual(false);
      expect(ColorByteB0.Green instanceof ColorByteB1).assertEqual(false);
      expect(ColorByteB0.Blue instanceof ColorByteB1).assertEqual(false);
      expect(ColorByteB0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteB0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteB0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteB0.Red).assertEqual(0);
      expect(ColorByteB0.Green).assertEqual(1);
      expect(ColorByteB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6700
     * @tc.name      testEnumerationWithExplicitType0287
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorByteA0 = ConstColorByteA0.Red;
      let g: ConstColorByteA0 = ConstColorByteA0.Green;
      let b: ConstColorByteA0 = ConstColorByteA0.Blue;
      expect(r instanceof ConstColorByteA0).assertEqual(true);
      expect(g instanceof ConstColorByteA0).assertEqual(true);
      expect(b instanceof ConstColorByteA0).assertEqual(true);
      expect(r instanceof ConstColorByteA1).assertEqual(false);
      expect(g instanceof ConstColorByteA1).assertEqual(false);
      expect(b instanceof ConstColorByteA1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6800
     * @tc.name      testEnumerationWithExplicitType0288
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ConstColorByteA0.Red;
      let g = ConstColorByteA0.Green;
      let b = ConstColorByteA0.Blue;
      expect(r instanceof ConstColorByteA0).assertEqual(true);
      expect(g instanceof ConstColorByteA0).assertEqual(true);
      expect(b instanceof ConstColorByteA0).assertEqual(true);
      expect(r instanceof ConstColorByteA1).assertEqual(false);
      expect(g instanceof ConstColorByteA1).assertEqual(false);
      expect(b instanceof ConstColorByteA1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_6900
     * @tc.name      testEnumerationWithExplicitType0289
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstColorByteA0.Red instanceof ConstColorByteA0).assertEqual(true);
      expect(ConstColorByteA0.Green instanceof ConstColorByteA0).assertEqual(true);
      expect(ConstColorByteA0.Blue instanceof ConstColorByteA0).assertEqual(true);
      expect(ConstColorByteA0.Red instanceof ConstColorByteA1).assertEqual(false);
      expect(ConstColorByteA0.Green instanceof ConstColorByteA1).assertEqual(false);
      expect(ConstColorByteA0.Blue instanceof ConstColorByteA1).assertEqual(false);
      expect(ConstColorByteA0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteA0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteA0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteA0.Red).assertEqual(0);
      expect(ConstColorByteA0.Green).assertEqual(1);
      expect(ConstColorByteA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7000
     * @tc.name      testEnumerationWithExplicitType0290
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorByteB0 = ConstColorByteB0.Red;
      let g: ConstColorByteB0 = ConstColorByteB0.Green;
      let b: ConstColorByteB0 = ConstColorByteB0.Blue;
      expect(r instanceof ConstColorByteB0).assertEqual(true);
      expect(g instanceof ConstColorByteB0).assertEqual(true);
      expect(b instanceof ConstColorByteB0).assertEqual(true);
      expect(r instanceof ConstColorByteB1).assertEqual(false);
      expect(g instanceof ConstColorByteB1).assertEqual(false);
      expect(b instanceof ConstColorByteB1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7100
     * @tc.name      testEnumerationWithExplicitType0291
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ConstColorByteB0.Red;
      let g = ConstColorByteB0.Green;
      let b = ConstColorByteB0.Blue;
      expect(r instanceof ConstColorByteB0).assertEqual(true);
      expect(g instanceof ConstColorByteB0).assertEqual(true);
      expect(b instanceof ConstColorByteB0).assertEqual(true);
      expect(r instanceof ConstColorByteB1).assertEqual(false);
      expect(g instanceof ConstColorByteB1).assertEqual(false);
      expect(b instanceof ConstColorByteB1).assertEqual(false);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7200
     * @tc.name      testEnumerationWithExplicitType0292
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstColorByteB0.Red instanceof ConstColorByteB0).assertEqual(true);
      expect(ConstColorByteB0.Green instanceof ConstColorByteB0).assertEqual(true);
      expect(ConstColorByteB0.Blue instanceof ConstColorByteB0).assertEqual(true);
      expect(ConstColorByteB0.Red instanceof ConstColorByteB1).assertEqual(false);
      expect(ConstColorByteB0.Green instanceof ConstColorByteB1).assertEqual(false);
      expect(ConstColorByteB0.Blue instanceof ConstColorByteB1).assertEqual(false);
      expect(ConstColorByteB0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteB0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteB0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteB0.Red).assertEqual(0);
      expect(ConstColorByteB0.Green).assertEqual(1);
      expect(ConstColorByteB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7300
     * @tc.name      testEnumerationWithExplicitType0293
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorByteC0 = ColorByteC0.Red;
      r = ColorByteC0.Blue;
      expect(ColorByteC0.Red instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Green instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Blue instanceof ColorByteC0).assertEqual(true);
      expect(r instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Red).assertEqual(0);
      expect(ColorByteC0.Green).assertEqual(1);
      expect(ColorByteC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7400
     * @tc.name      testEnumerationWithExplicitType0294
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ColorByteC0 = ColorByteC0.Green;
      g = ColorByteC0.Blue;
      expect(ColorByteC0.Red instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Green instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Blue instanceof ColorByteC0).assertEqual(true);
      expect(g instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Red).assertEqual(0);
      expect(ColorByteC0.Green).assertEqual(1);
      expect(ColorByteC0.Blue).assertEqual(2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7500
     * @tc.name      testEnumerationWithExplicitType0295
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ColorByteC0 = ColorByteC0.Blue;
      b = ColorByteC0.Red;
      expect(ColorByteC0.Red instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Green instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Blue instanceof ColorByteC0).assertEqual(true);
      expect(b instanceof ColorByteC0).assertEqual(true);
      expect(ColorByteC0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(ColorByteC0.Red).assertEqual(0);
      expect(ColorByteC0.Green).assertEqual(1);
      expect(ColorByteC0.Blue).assertEqual(2);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7600
     * @tc.name      testEnumerationWithExplicitType0296
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorByteC0 = ConstColorByteC0.Red;
      r = ConstColorByteC0.Blue;
      expect(ConstColorByteC0.Red instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Green instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Blue instanceof ConstColorByteC0).assertEqual(true);
      expect(r instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(r.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Red).assertEqual(0);
      expect(ConstColorByteC0.Green).assertEqual(1);
      expect(ConstColorByteC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7700
     * @tc.name      testEnumerationWithExplicitType0297
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ConstColorByteC0 = ConstColorByteC0.Green;
      g = ConstColorByteC0.Blue;
      expect(ConstColorByteC0.Red instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Green instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Blue instanceof ConstColorByteC0).assertEqual(true);
      expect(g instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(g.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Red).assertEqual(0);
      expect(ConstColorByteC0.Green).assertEqual(1);
      expect(ConstColorByteC0.Blue).assertEqual(2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_EIGHT_TEST_7800
     * @tc.name      testEnumerationWithExplicitType0298
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ConstColorByteC0 = ConstColorByteC0.Blue;
      b = ConstColorByteC0.Red;
      expect(ConstColorByteC0.Red instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Green instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Blue instanceof ConstColorByteC0).assertEqual(true);
      expect(b instanceof ConstColorByteC0).assertEqual(true);
      expect(ConstColorByteC0.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(b.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorByteC0.Red).assertEqual(0);
      expect(ConstColorByteC0.Green).assertEqual(1);
      expect(ConstColorByteC0.Blue).assertEqual(2);
      expect(b).assertEqual(0);
    });
  });
}
