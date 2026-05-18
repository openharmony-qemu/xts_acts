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

enum ColorIntA0: int { Red, Green, Blue }
enum ColorIntA1: int { Red, Green, Blue }

enum ColorIntB0: int { Red, Green, Blue, }
enum ColorIntB1: int { Red, Green, Blue, }

enum ConstColorIntA0: int { Red, Green, Blue }
enum ConstColorIntA1: int { Red, Green, Blue }

enum ConstColorIntB0: int { Red, Green, Blue, }
enum ConstColorIntB1: int { Red, Green, Blue, }

enum ColorIntC0: int { Red, Green, Blue }
enum ConstColorIntC0: int { Red, Green, Blue }

enum EnumIntA0: int { A, B, C, D = B | C, E, F, G = D | F }
enum ConstEnumIntA0: int { A, B, C, D = B | C, E, F, G = D | F }

enum EnumIntB0: int { A = 2, B, C }
enum ConstEnumIntB0: int { A = 2, B, C }

enum EnumIntC0: int { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }
enum ConstEnumIntC0: int { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }

enum EnumIntD0: int {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 16) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum ConstEnumIntD0: int {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 16) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum EnumIntE0: int { first = 123, second, third }
enum EnumIntE1: int { first = EnumIntE0.first, second, third }

enum ConstEnumIntE0: int { first = 123, second, third }
enum ConstEnumIntE1: int { first = ConstEnumIntE0.first, second, third }

enum EnumIntE2: int { first = 123, second, third }
enum ConstEnumIntE2: int { first = EnumIntE2.first, second, third }

enum ConstEnumIntE3: int { first = 123, second, third }
enum EnumIntE3: int { first = ConstEnumIntE3.first, second, third }

enum EnumIntF0: int {
  first = 2147483647,
  second = 2147483646,
  third = 2147483645
}

enum ConstEnumIntF0: int {
  first = 2147483647,
  second = 2147483646,
  third = 2147483645
}

export default function EnumerationWithExplicitTypeTest06(): void {
  describe('EnumerationWithExplicitTypeTest06', () => {
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0113
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.


     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorIntA0 = ColorIntA0.Red;
      let g: ColorIntA0 = ColorIntA0.Green;
      let b: ColorIntA0 = ColorIntA0.Blue;
      expect(r instanceof ColorIntA0).assertEqual(true);
      expect(g instanceof ColorIntA0).assertEqual(true);
      expect(b instanceof ColorIntA0).assertEqual(true);
      expect(r instanceof ColorIntA1).assertEqual(false);
      expect(g instanceof ColorIntA1).assertEqual(false);
      expect(b instanceof ColorIntA1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0114
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.


     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorIntA0.Red;
      let g = ColorIntA0.Green;
      let b = ColorIntA0.Blue;
      expect(r instanceof ColorIntA0).assertEqual(true);
      expect(g instanceof ColorIntA0).assertEqual(true);
      expect(b instanceof ColorIntA0).assertEqual(true);
      expect(r instanceof ColorIntA1).assertEqual(false);
      expect(g instanceof ColorIntA1).assertEqual(false);
      expect(b instanceof ColorIntA1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0115
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorIntA0.Red instanceof ColorIntA0).assertEqual(true);
      expect(ColorIntA0.Green instanceof ColorIntA0).assertEqual(true);
      expect(ColorIntA0.Blue instanceof ColorIntA0).assertEqual(true);
      expect(ColorIntA0.Red instanceof ColorIntA1).assertEqual(false);
      expect(ColorIntA0.Green instanceof ColorIntA1).assertEqual(false);
      expect(ColorIntA0.Blue instanceof ColorIntA1).assertEqual(false);
      expect(ColorIntA0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntA0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntA0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntA0.Red).assertEqual(0);
      expect(ColorIntA0.Green).assertEqual(1);
      expect(ColorIntA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0116
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorIntB0 = ColorIntB0.Red;
      let g: ColorIntB0 = ColorIntB0.Green;
      let b: ColorIntB0 = ColorIntB0.Blue;
      expect(r instanceof ColorIntB0).assertEqual(true);
      expect(g instanceof ColorIntB0).assertEqual(true);
      expect(b instanceof ColorIntB0).assertEqual(true);
      expect(r instanceof ColorIntB1).assertEqual(false);
      expect(g instanceof ColorIntB1).assertEqual(false);
      expect(b instanceof ColorIntB1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0117
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorIntB0.Red;
      let g = ColorIntB0.Green;
      let b = ColorIntB0.Blue;
      expect(r instanceof ColorIntB0).assertEqual(true);
      expect(g instanceof ColorIntB0).assertEqual(true);
      expect(b instanceof ColorIntB0).assertEqual(true);
      expect(r instanceof ColorIntB1).assertEqual(false);
      expect(g instanceof ColorIntB1).assertEqual(false);
      expect(b instanceof ColorIntB1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0118
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorIntB0.Red instanceof ColorIntB0).assertEqual(true);
      expect(ColorIntB0.Green instanceof ColorIntB0).assertEqual(true);
      expect(ColorIntB0.Blue instanceof ColorIntB0).assertEqual(true);
      expect(ColorIntB0.Red instanceof ColorIntB1).assertEqual(false);
      expect(ColorIntB0.Green instanceof ColorIntB1).assertEqual(false);
      expect(ColorIntB0.Blue instanceof ColorIntB1).assertEqual(false);
      expect(ColorIntB0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntB0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntB0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntB0.Red).assertEqual(0);
      expect(ColorIntB0.Green).assertEqual(1);
      expect(ColorIntB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0119
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorIntA0 = ConstColorIntA0.Red;
      let g: ConstColorIntA0 = ConstColorIntA0.Green;
      let b: ConstColorIntA0 = ConstColorIntA0.Blue;
      expect(r instanceof ConstColorIntA0).assertEqual(true);
      expect(g instanceof ConstColorIntA0).assertEqual(true);
      expect(b instanceof ConstColorIntA0).assertEqual(true);
      expect(r instanceof ConstColorIntA1).assertEqual(false);
      expect(g instanceof ConstColorIntA1).assertEqual(false);
      expect(b instanceof ConstColorIntA1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0120
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ConstColorIntA0.Red;
      let g = ConstColorIntA0.Green;
      let b = ConstColorIntA0.Blue;
      expect(r instanceof ConstColorIntA0).assertEqual(true);
      expect(g instanceof ConstColorIntA0).assertEqual(true);
      expect(b instanceof ConstColorIntA0).assertEqual(true);
      expect(r instanceof ConstColorIntA1).assertEqual(false);
      expect(g instanceof ConstColorIntA1).assertEqual(false);
      expect(b instanceof ConstColorIntA1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0121
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstColorIntA0.Red instanceof ConstColorIntA0).assertEqual(true);
      expect(ConstColorIntA0.Green instanceof ConstColorIntA0).assertEqual(true);
      expect(ConstColorIntA0.Blue instanceof ConstColorIntA0).assertEqual(true);
      expect(ConstColorIntA0.Red instanceof ConstColorIntA1).assertEqual(false);
      expect(ConstColorIntA0.Green instanceof ConstColorIntA1).assertEqual(false);
      expect(ConstColorIntA0.Blue instanceof ConstColorIntA1).assertEqual(false);
      expect(ConstColorIntA0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntA0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntA0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntA0.Red).assertEqual(0);
      expect(ConstColorIntA0.Green).assertEqual(1);
      expect(ConstColorIntA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0122
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorIntB0 = ConstColorIntB0.Red;
      let g: ConstColorIntB0 = ConstColorIntB0.Green;
      let b: ConstColorIntB0 = ConstColorIntB0.Blue;
      expect(r instanceof ConstColorIntB0).assertEqual(true);
      expect(g instanceof ConstColorIntB0).assertEqual(true);
      expect(b instanceof ConstColorIntB0).assertEqual(true);
      expect(r instanceof ConstColorIntB1).assertEqual(false);
      expect(g instanceof ConstColorIntB1).assertEqual(false);
      expect(b instanceof ConstColorIntB1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0123
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ConstColorIntB0.Red;
      let g = ConstColorIntB0.Green;
      let b = ConstColorIntB0.Blue;
      expect(r instanceof ConstColorIntB0).assertEqual(true);
      expect(g instanceof ConstColorIntB0).assertEqual(true);
      expect(b instanceof ConstColorIntB0).assertEqual(true);
      expect(r instanceof ConstColorIntB1).assertEqual(false);
      expect(g instanceof ConstColorIntB1).assertEqual(false);
      expect(b instanceof ConstColorIntB1).assertEqual(false);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0124
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed,
    the same rules applied as for enum with non-explicit type (see Enumeration Integer
    Values). The constant which is first and has no explicit value gets zero value.
    A constant that is not the first and has no explicit value takes the value of the
    immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstColorIntB0.Red instanceof ConstColorIntB0).assertEqual(true);
      expect(ConstColorIntB0.Green instanceof ConstColorIntB0).assertEqual(true);
      expect(ConstColorIntB0.Blue instanceof ConstColorIntB0).assertEqual(true);
      expect(ConstColorIntB0.Red instanceof ConstColorIntB1).assertEqual(false);
      expect(ConstColorIntB0.Green instanceof ConstColorIntB1).assertEqual(false);
      expect(ConstColorIntB0.Blue instanceof ConstColorIntB1).assertEqual(false);
      expect(ConstColorIntB0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntB0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntB0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntB0.Red).assertEqual(0);
      expect(ConstColorIntB0.Green).assertEqual(1);
      expect(ConstColorIntB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0125
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorIntC0 = ColorIntC0.Red;
      r = ColorIntC0.Blue;
      expect(ColorIntC0.Red instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Green instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Blue instanceof ColorIntC0).assertEqual(true);
      expect(r instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Red).assertEqual(0);
      expect(ColorIntC0.Green).assertEqual(1);
      expect(ColorIntC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0126
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ColorIntC0 = ColorIntC0.Green;
      g = ColorIntC0.Blue;
      expect(ColorIntC0.Red instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Green instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Blue instanceof ColorIntC0).assertEqual(true);
      expect(g instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Red).assertEqual(0);
      expect(ColorIntC0.Green).assertEqual(1);
      expect(ColorIntC0.Blue).assertEqual(2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0127
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ColorIntC0 = ColorIntC0.Blue;
      b = ColorIntC0.Red;
      expect(ColorIntC0.Red instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Green instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Blue instanceof ColorIntC0).assertEqual(true);
      expect(b instanceof ColorIntC0).assertEqual(true);
      expect(ColorIntC0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(ColorIntC0.Red).assertEqual(0);
      expect(ColorIntC0.Green).assertEqual(1);
      expect(ColorIntC0.Blue).assertEqual(2);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0128
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorIntC0 = ConstColorIntC0.Red;
      r = ConstColorIntC0.Blue;
      expect(ConstColorIntC0.Red instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Green instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Blue instanceof ConstColorIntC0).assertEqual(true);
      expect(r instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(r.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Red).assertEqual(0);
      expect(ConstColorIntC0.Green).assertEqual(1);
      expect(ConstColorIntC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0129
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ConstColorIntC0 = ConstColorIntC0.Green;
      g = ConstColorIntC0.Blue;
      expect(ConstColorIntC0.Red instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Green instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Blue instanceof ConstColorIntC0).assertEqual(true);
      expect(g instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(g.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Red).assertEqual(0);
      expect(ConstColorIntC0.Green).assertEqual(1);
      expect(ConstColorIntC0.Blue).assertEqual(2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1800
     * @tc.name      testEnumerationWithExplicitType0130
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ConstColorIntC0 = ConstColorIntC0.Blue;
      b = ConstColorIntC0.Red;
      expect(ConstColorIntC0.Red instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Green instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Blue instanceof ConstColorIntC0).assertEqual(true);
      expect(b instanceof ConstColorIntC0).assertEqual(true);
      expect(ConstColorIntC0.Red.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Green.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Blue.valueOf() instanceof int).assertEqual(true);
      expect(b.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorIntC0.Red).assertEqual(0);
      expect(ConstColorIntC0.Green).assertEqual(1);
      expect(ConstColorIntC0.Blue).assertEqual(2);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0131
     * @tc.desc      Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntA0.A instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.B instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.C instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.D instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.E instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.F instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.G instanceof EnumIntA0).assertEqual(true);
      expect(EnumIntA0.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.C.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.D.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.E.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.F.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.G.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntA0.A).assertEqual(0);
      expect(EnumIntA0.B).assertEqual(1);
      expect(EnumIntA0.C).assertEqual(2);
      expect(EnumIntA0.D).assertEqual(3);
      expect(EnumIntA0.E).assertEqual(4);
      expect(EnumIntA0.F).assertEqual(5);
      expect(EnumIntA0.G).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2000
     * @tc.name      testEnumerationWithExplicitType0132
     * @tc.desc      Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntA0.A instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.B instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.C instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.D instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.E instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.F instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.G instanceof ConstEnumIntA0).assertEqual(true);
      expect(ConstEnumIntA0.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.C.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.D.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.E.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.F.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.G.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntA0.A).assertEqual(0);
      expect(ConstEnumIntA0.B).assertEqual(1);
      expect(ConstEnumIntA0.C).assertEqual(2);
      expect(ConstEnumIntA0.D).assertEqual(3);
      expect(ConstEnumIntA0.E).assertEqual(4);
      expect(ConstEnumIntA0.F).assertEqual(5);
      expect(ConstEnumIntA0.G).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0133
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression. A constant that is not the first and has no
    explicit value takes the value of the immediately preceding constant plus one.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntB0.A instanceof EnumIntB0).assertEqual(true);
      expect(EnumIntB0.B instanceof EnumIntB0).assertEqual(true);
      expect(EnumIntB0.C instanceof EnumIntB0).assertEqual(true);
      expect(EnumIntB0.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntB0.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntB0.C.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntB0.A).assertEqual(2);
      expect(EnumIntB0.B).assertEqual(3);
      expect(EnumIntB0.C).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2200
     * @tc.name      testEnumerationWithExplicitType0134
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression. A constant that is not the first and has no
    explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntB0.A instanceof ConstEnumIntB0).assertEqual(true);
      expect(ConstEnumIntB0.B instanceof ConstEnumIntB0).assertEqual(true);
      expect(ConstEnumIntB0.C instanceof ConstEnumIntB0).assertEqual(true);
      expect(ConstEnumIntB0.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntB0.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntB0.C.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntB0.A).assertEqual(2);
      expect(ConstEnumIntB0.B).assertEqual(3);
      expect(ConstEnumIntB0.C).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0135
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntC0.A instanceof EnumIntC0).assertEqual(true);
      expect(EnumIntC0.B instanceof EnumIntC0).assertEqual(true);
      expect(EnumIntC0.C instanceof EnumIntC0).assertEqual(true);
      expect(EnumIntC0.D instanceof EnumIntC0).assertEqual(true);
      expect(EnumIntC0.E instanceof EnumIntC0).assertEqual(true);
      expect(EnumIntC0.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntC0.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntC0.C.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntC0.D.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntC0.E.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntC0.A).assertEqual(0);
      expect(EnumIntC0.B).assertEqual(2);
      expect(EnumIntC0.C).assertEqual(4);
      expect(EnumIntC0.D).assertEqual(6);
      expect(EnumIntC0.E).assertEqual(12);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2400
     * @tc.name      testEnumerationWithExplicitType0136
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntC0.A instanceof ConstEnumIntC0).assertEqual(true);
      expect(ConstEnumIntC0.B instanceof ConstEnumIntC0).assertEqual(true);
      expect(ConstEnumIntC0.C instanceof ConstEnumIntC0).assertEqual(true);
      expect(ConstEnumIntC0.D instanceof ConstEnumIntC0).assertEqual(true);
      expect(ConstEnumIntC0.E instanceof ConstEnumIntC0).assertEqual(true);
      expect(ConstEnumIntC0.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntC0.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntC0.C.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntC0.D.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntC0.E.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntC0.A).assertEqual(0);
      expect(ConstEnumIntC0.B).assertEqual(2);
      expect(ConstEnumIntC0.C).assertEqual(4);
      expect(ConstEnumIntC0.D).assertEqual(6);
      expect(ConstEnumIntC0.E).assertEqual(12);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2500
     * @tc.name      testEnumerationWithExplicitType0137
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression. Qualification by type is mandatory to access
    the enumeration constant, except enumeration constant initialization expressions.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: int = 5;
      const b: int = (1 << 1) * 2;
      const c: int = (1 << 3) * 3;
      const d: int = (b | c);
      const e: int = ((b | c) << 16) * 2;
      const f: int = a % 4;
      const g: int = (a + f) / 3;
      const h: int = (g | (f & a));
      const i: int = f ^ a;
      const j: int = ~a;
      const k: int = -b;
      const l: int = e >> 2;
      const m: int = e >>> 2;
      expect(EnumIntD0.A instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.B instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.C instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.D instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.E instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.F instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.G instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.H instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.I instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.J instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.K instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.L instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.M instanceof EnumIntD0).assertEqual(true);
      expect(EnumIntD0.A.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.B.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.C.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.D.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.E.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.F.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.G.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.H.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.I.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.J.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.K.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.L.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.M.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntD0.A).assertEqual(a);
      expect(EnumIntD0.B).assertEqual(b);
      expect(EnumIntD0.C).assertEqual(c);
      expect(EnumIntD0.D).assertEqual(d);
      expect(EnumIntD0.E).assertEqual(e);
      expect(EnumIntD0.F).assertEqual(f);
      expect(EnumIntD0.G).assertEqual(g);
      expect(EnumIntD0.H).assertEqual(h);
      expect(EnumIntD0.I).assertEqual(i);
      expect(EnumIntD0.J).assertEqual(j);
      expect(EnumIntD0.K).assertEqual(k);
      expect(EnumIntD0.L).assertEqual(l);
      expect(EnumIntD0.M).assertEqual(m);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2600
     * @tc.name      testEnumerationWithExplicitType0138
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression. Qualification by type is mandatory to access
    the enumeration constant, except enumeration constant initialization expressions.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: int = 5;
      const b: int = (1 << 1) * 2;
      const c: int = (1 << 3) * 3;
      const d: int = (b | c);
      const e: int = ((b | c) << 16) * 2;
      const f: int = a % 4;
      const g: int = (a + f) / 3;
      const h: int = (g | (f & a));
      const i: int = f ^ a;
      const j: int = ~a;
      const k: int = -b;
      const l: int = e >> 2;
      const m: int = e >>> 2;
      expect(ConstEnumIntD0.A instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.B instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.C instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.D instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.E instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.F instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.G instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.H instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.I instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.J instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.K instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.L instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.M instanceof ConstEnumIntD0).assertEqual(true);
      expect(ConstEnumIntD0.A.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.B.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.C.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.D.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.E.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.F.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.G.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.H.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.I.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.J.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.K.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.L.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.M.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntD0.A).assertEqual(a);
      expect(ConstEnumIntD0.B).assertEqual(b);
      expect(ConstEnumIntD0.C).assertEqual(c);
      expect(ConstEnumIntD0.D).assertEqual(d);
      expect(ConstEnumIntD0.E).assertEqual(e);
      expect(ConstEnumIntD0.F).assertEqual(f);
      expect(ConstEnumIntD0.G).assertEqual(g);
      expect(ConstEnumIntD0.H).assertEqual(h);
      expect(ConstEnumIntD0.I).assertEqual(i);
      expect(ConstEnumIntD0.J).assertEqual(j);
      expect(ConstEnumIntD0.K).assertEqual(k);
      expect(ConstEnumIntD0.L).assertEqual(l);
      expect(ConstEnumIntD0.M).assertEqual(m);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2700
     * @tc.name      testEnumerationWithExplicitType0139
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntE0.first instanceof EnumIntE0).assertEqual(true);
      expect(EnumIntE0.second instanceof EnumIntE0).assertEqual(true);
      expect(EnumIntE0.third instanceof EnumIntE0).assertEqual(true);
      expect(EnumIntE0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE0.first.valueOf()).assertEqual(123);
      expect(EnumIntE0.second.valueOf()).assertEqual(124);
      expect(EnumIntE0.third.valueOf()).assertEqual(125);
      expect(EnumIntE1.first instanceof EnumIntE1).assertEqual(true);
      expect(EnumIntE1.second instanceof EnumIntE1).assertEqual(true);
      expect(EnumIntE1.third instanceof EnumIntE1).assertEqual(true);
      expect(EnumIntE1.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE1.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE1.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE1.first.valueOf()).assertEqual(123);
      expect(EnumIntE1.second.valueOf()).assertEqual(124);
      expect(EnumIntE1.third.valueOf()).assertEqual(125);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2800
     * @tc.name      testEnumerationWithExplicitType0140
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntE0.first instanceof ConstEnumIntE0).assertEqual(true);
      expect(ConstEnumIntE0.second instanceof ConstEnumIntE0).assertEqual(true);
      expect(ConstEnumIntE0.third instanceof ConstEnumIntE0).assertEqual(true);
      expect(ConstEnumIntE0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE0.first.valueOf()).assertEqual(123);
      expect(ConstEnumIntE0.second.valueOf()).assertEqual(124);
      expect(ConstEnumIntE0.third.valueOf()).assertEqual(125);
      expect(ConstEnumIntE1.first instanceof ConstEnumIntE1).assertEqual(true);
      expect(ConstEnumIntE1.second instanceof ConstEnumIntE1).assertEqual(true);
      expect(ConstEnumIntE1.third instanceof ConstEnumIntE1).assertEqual(true);
      expect(ConstEnumIntE1.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE1.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE1.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE1.first.valueOf()).assertEqual(123);
      expect(ConstEnumIntE1.second.valueOf()).assertEqual(124);
      expect(ConstEnumIntE1.third.valueOf()).assertEqual(125);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_2900
     * @tc.name      testEnumerationWithExplicitType0141
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntE2.first instanceof EnumIntE2).assertEqual(true);
      expect(EnumIntE2.second instanceof EnumIntE2).assertEqual(true);
      expect(EnumIntE2.third instanceof EnumIntE2).assertEqual(true);
      expect(EnumIntE2.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE2.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE2.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE2.first.valueOf()).assertEqual(123);
      expect(EnumIntE2.second.valueOf()).assertEqual(124);
      expect(EnumIntE2.third.valueOf()).assertEqual(125);
      expect(ConstEnumIntE2.first instanceof ConstEnumIntE2).assertEqual(true);
      expect(ConstEnumIntE2.second instanceof ConstEnumIntE2).assertEqual(true);
      expect(ConstEnumIntE2.third instanceof ConstEnumIntE2).assertEqual(true);
      expect(ConstEnumIntE2.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE2.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE2.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE2.first.valueOf()).assertEqual(123);
      expect(ConstEnumIntE2.second.valueOf()).assertEqual(124);
      expect(ConstEnumIntE2.third.valueOf()).assertEqual(125);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_3000
     * @tc.name      testEnumerationWithExplicitType0142
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntE3.first instanceof ConstEnumIntE3).assertEqual(true);
      expect(ConstEnumIntE3.second instanceof ConstEnumIntE3).assertEqual(true);
      expect(ConstEnumIntE3.third instanceof ConstEnumIntE3).assertEqual(true);
      expect(ConstEnumIntE3.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE3.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE3.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntE3.first.valueOf()).assertEqual(123);
      expect(ConstEnumIntE3.second.valueOf()).assertEqual(124);
      expect(ConstEnumIntE3.third.valueOf()).assertEqual(125);
      expect(EnumIntE3.first instanceof EnumIntE3).assertEqual(true);
      expect(EnumIntE3.second instanceof EnumIntE3).assertEqual(true);
      expect(EnumIntE3.third instanceof EnumIntE3).assertEqual(true);
      expect(EnumIntE3.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE3.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE3.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntE3.first.valueOf()).assertEqual(123);
      expect(EnumIntE3.second.valueOf()).assertEqual(124);
      expect(EnumIntE3.third.valueOf()).assertEqual(125);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_3100
     * @tc.name      testEnumerationWithExplicitType0143
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumIntF0.first instanceof EnumIntF0).assertEqual(true);
      expect(EnumIntF0.second instanceof EnumIntF0).assertEqual(true);
      expect(EnumIntF0.third instanceof EnumIntF0).assertEqual(true);
      expect(EnumIntF0.first.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntF0.second.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntF0.third.valueOf() instanceof int).assertEqual(true);
      expect(EnumIntF0.first.valueOf()).assertEqual(2147483647);
      expect(EnumIntF0.second.valueOf()).assertEqual(2147483646);
      expect(EnumIntF0.third.valueOf()).assertEqual(2147483645);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_SIX_TEST_3200
     * @tc.name      testEnumerationWithExplicitType0144
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric
    constant expression or to a constant expression of type string; or * Implicitly
    by omitting the constant expression.

     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ConstEnumIntF0.first instanceof ConstEnumIntF0).assertEqual(true);
      expect(ConstEnumIntF0.second instanceof ConstEnumIntF0).assertEqual(true);
      expect(ConstEnumIntF0.third instanceof ConstEnumIntF0).assertEqual(true);
      expect(ConstEnumIntF0.first.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntF0.second.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntF0.third.valueOf() instanceof int).assertEqual(true);
      expect(ConstEnumIntF0.first.valueOf()).assertEqual(2147483647);
      expect(ConstEnumIntF0.second.valueOf()).assertEqual(2147483646);
      expect(ConstEnumIntF0.third.valueOf()).assertEqual(2147483645);
    });
  })
}