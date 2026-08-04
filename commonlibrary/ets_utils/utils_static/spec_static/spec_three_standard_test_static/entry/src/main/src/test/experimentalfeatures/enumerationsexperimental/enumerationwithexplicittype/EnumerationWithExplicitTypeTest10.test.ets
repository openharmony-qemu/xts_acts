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
enum ColorShortA0: short { Red, Green, Blue }
enum ColorShortA1: short { Red, Green, Blue }

enum ColorShortB0: short { Red, Green, Blue, }
enum ColorShortB1: short { Red, Green, Blue, }

enum ColorShortC0: short { Red, Green, Blue }

enum EnumShortA0: short { A, B, C, D = B | C, E, F, G = D | F }

enum EnumShortB0: short { A = 2, B, C }

enum EnumShortC0: short { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }

enum EnumShortD0: short {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 8) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum EnumShortE0: short { first = 123, second, third }
enum EnumShortE1: short { first = EnumShortE0.first, second, third }

/*const shortConstA0: short = 32767*/
enum EnumShortF0: short { first = 32767, second = 32767 - 1, third = 32767 - 2 }

enum EnumShortG0: short { A = 5, B = 5 }
enum EnumShortG1: short { A = -12, B, C = -12 }
enum EnumShortG2: short { first, second = -1, third }
enum EnumShortG3: short { A, B, C, D, E = B | C }

enum EnumShortH0: short { first, second = -32768, third }
enum EnumShortH1: short { first = 32767 - 2, second, third }

enum EnumShortI0: short { first = 0b0011, second = 0o731, third = 0x7AFE, fourth = 32_757 }

enum EnumShortJ0: short { first = -42, second, third = 17 }

enum EnumShortK0: short { first = -1, second, third = -42 }

export default function EnumerationWithExplicitTypeTest10(): void {
  describe('EnumerationWithExplicitTypeTest10', () => {
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0365
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorShortA0 = ColorShortA0.Red;
      let g: ColorShortA0 = ColorShortA0.Green;
      let b: ColorShortA0 = ColorShortA0.Blue;
      expect(r instanceof ColorShortA0).assertEqual(true);
      expect(g instanceof ColorShortA0).assertEqual(true);
      expect(b instanceof ColorShortA0).assertEqual(true);
      expect(r instanceof ColorShortA1).assertEqual(false);
      expect(g instanceof ColorShortA1).assertEqual(false);
      expect(b instanceof ColorShortA1).assertEqual(false);
      expect(r.valueOf() instanceof short).assertEqual(true);
      expect(g.valueOf() instanceof short).assertEqual(true);
      expect(b.valueOf() instanceof short).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0366
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorShortA0.Red;
      let g = ColorShortA0.Green;
      let b = ColorShortA0.Blue;
      expect(r instanceof ColorShortA0).assertEqual(true);
      expect(g instanceof ColorShortA0).assertEqual(true);
      expect(b instanceof ColorShortA0).assertEqual(true);
      expect(r instanceof ColorShortA1).assertEqual(false);
      expect(g instanceof ColorShortA1).assertEqual(false);
      expect(b instanceof ColorShortA1).assertEqual(false);
      expect(r.valueOf() instanceof short).assertEqual(true);
      expect(g.valueOf() instanceof short).assertEqual(true);
      expect(b.valueOf() instanceof short).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0367
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorShortA0.Red instanceof ColorShortA0).assertEqual(true);
      expect(ColorShortA0.Green instanceof ColorShortA0).assertEqual(true);
      expect(ColorShortA0.Blue instanceof ColorShortA0).assertEqual(true);
      expect(ColorShortA0.Red instanceof ColorShortA1).assertEqual(false);
      expect(ColorShortA0.Green instanceof ColorShortA1).assertEqual(false);
      expect(ColorShortA0.Blue instanceof ColorShortA1).assertEqual(false);
      expect(ColorShortA0.Red.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortA0.Green.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortA0.Blue.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortA0.Red).assertEqual(0);
      expect(ColorShortA0.Green).assertEqual(1);
      expect(ColorShortA0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0368
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorShortB0 = ColorShortB0.Red;
      let g: ColorShortB0 = ColorShortB0.Green;
      let b: ColorShortB0 = ColorShortB0.Blue;
      expect(r instanceof ColorShortB0).assertEqual(true);
      expect(g instanceof ColorShortB0).assertEqual(true);
      expect(b instanceof ColorShortB0).assertEqual(true);
      expect(r instanceof ColorShortB1).assertEqual(false);
      expect(g instanceof ColorShortB1).assertEqual(false);
      expect(b instanceof ColorShortB1).assertEqual(false);
      expect(r.valueOf() instanceof short).assertEqual(true);
      expect(g.valueOf() instanceof short).assertEqual(true);
      expect(b.valueOf() instanceof short).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0369
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ColorShortB0.Red;
      let g = ColorShortB0.Green;
      let b = ColorShortB0.Blue;
      expect(r instanceof ColorShortB0).assertEqual(true);
      expect(g instanceof ColorShortB0).assertEqual(true);
      expect(b instanceof ColorShortB0).assertEqual(true);
      expect(r instanceof ColorShortB1).assertEqual(false);
      expect(g instanceof ColorShortB1).assertEqual(false);
      expect(b instanceof ColorShortB1).assertEqual(false);
      expect(r.valueOf() instanceof short).assertEqual(true);
      expect(g.valueOf() instanceof short).assertEqual(true);
      expect(b.valueOf() instanceof short).assertEqual(true);
      expect(r).assertEqual(0);
      expect(g).assertEqual(1);
      expect(b).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0370
     * @tc.desc      If explicit type is an integer type then omitted values for constants allowed, the same rules applied as for enum with non-explicit type (see Enumeration Integer Values). The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ColorShortB0.Red instanceof ColorShortB0).assertEqual(true);
      expect(ColorShortB0.Green instanceof ColorShortB0).assertEqual(true);
      expect(ColorShortB0.Blue instanceof ColorShortB0).assertEqual(true);
      expect(ColorShortB0.Red instanceof ColorShortB1).assertEqual(false);
      expect(ColorShortB0.Green instanceof ColorShortB1).assertEqual(false);
      expect(ColorShortB0.Blue instanceof ColorShortB1).assertEqual(false);
      expect(ColorShortB0.Red.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortB0.Green.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortB0.Blue.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortB0.Red).assertEqual(0);
      expect(ColorShortB0.Green).assertEqual(1);
      expect(ColorShortB0.Blue).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0377
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorShortC0 = ColorShortC0.Red;
      r = ColorShortC0.Blue;
      expect(ColorShortC0.Red instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Green instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Blue instanceof ColorShortC0).assertEqual(true);
      expect(r instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Red.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Green.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Blue.valueOf() instanceof short).assertEqual(true);
      expect(r.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Red).assertEqual(0);
      expect(ColorShortC0.Green).assertEqual(1);
      expect(ColorShortC0.Blue).assertEqual(2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0378
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: ColorShortC0 = ColorShortC0.Green;
      g = ColorShortC0.Blue;
      expect(ColorShortC0.Red instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Green instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Blue instanceof ColorShortC0).assertEqual(true);
      expect(g instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Red.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Green.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Blue.valueOf() instanceof short).assertEqual(true);
      expect(g.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Red).assertEqual(0);
      expect(ColorShortC0.Green).assertEqual(1);
      expect(ColorShortC0.Blue).assertEqual(2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0379
     * @tc.desc      Modifying enum variable by other named constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: ColorShortC0 = ColorShortC0.Blue;
      b = ColorShortC0.Red;
      expect(ColorShortC0.Red instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Green instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Blue instanceof ColorShortC0).assertEqual(true);
      expect(b instanceof ColorShortC0).assertEqual(true);
      expect(ColorShortC0.Red.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Green.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Blue.valueOf() instanceof short).assertEqual(true);
      expect(b.valueOf() instanceof short).assertEqual(true);
      expect(ColorShortC0.Red).assertEqual(0);
      expect(ColorShortC0.Green).assertEqual(1);
      expect(ColorShortC0.Blue).assertEqual(2);
      expect(b).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_2500
     * @tc.name      testEnumerationWithExplicitType0389
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: short = 5
      const b: short = (1 << 1) * 2
      const c: short = (1 << 3) * 3
      const d: short = (b | c)
      const e: short = ((b | c) << 8) * 2
      const f: short = a % 4
      const g: short = (a + f) / 3
      const h: short = (g | (f & a))
      const i: short = f ^ a
      const j: short = ~a
      const k: short = -b
      const l: short = e >> 2
      const m: short = e >>> 2
      expect(EnumShortD0.A instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.B instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.C instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.D instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.E instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.F instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.G instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.H instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.I instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.J instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.K instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.L instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.M instanceof EnumShortD0).assertEqual(true)
      expect(EnumShortD0.A.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.B.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.C.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.D.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.E.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.F.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.G.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.H.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.I.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.J.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.K.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.L.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.M.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortD0.A).assertEqual(a)
      expect(EnumShortD0.B).assertEqual(b)
      expect(EnumShortD0.C).assertEqual(c)
      expect(EnumShortD0.D).assertEqual(d)
      expect(EnumShortD0.E).assertEqual(e)
      expect(EnumShortD0.F).assertEqual(f)
      expect(EnumShortD0.G).assertEqual(g)
      expect(EnumShortD0.H).assertEqual(h)
      expect(EnumShortD0.I).assertEqual(i)
      expect(EnumShortD0.J).assertEqual(j)
      expect(EnumShortD0.K).assertEqual(k)
      expect(EnumShortD0.L).assertEqual(l)
      expect(EnumShortD0.M).assertEqual(m)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_2800
     * @tc.name      testEnumerationWithExplicitType0392
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortE0.first instanceof EnumShortE0).assertEqual(true)
      expect(EnumShortE0.second instanceof EnumShortE0).assertEqual(true)
      expect(EnumShortE0.third instanceof EnumShortE0).assertEqual(true)
      expect(EnumShortE0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortE0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortE0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortE0.first.valueOf()).assertEqual(123)
      expect(EnumShortE0.second.valueOf()).assertEqual(124)
      expect(EnumShortE0.third.valueOf()).assertEqual(125)
      expect(EnumShortE1.first instanceof EnumShortE1).assertEqual(true)
      expect(EnumShortE1.second instanceof EnumShortE1).assertEqual(true)
      expect(EnumShortE1.third instanceof EnumShortE1).assertEqual(true)
      expect(EnumShortE1.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortE1.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortE1.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortE1.first.valueOf()).assertEqual(123)
      expect(EnumShortE1.second.valueOf()).assertEqual(124)
      expect(EnumShortE1.third.valueOf()).assertEqual(125)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_3100
     * @tc.name      testEnumerationWithExplicitType0395
     * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: short = 32767
      const v2: short = 32767 - 1
      const v3: short = 32767 - 2
      expect(EnumShortF0.first instanceof EnumShortF0).assertEqual(true)
      expect(EnumShortF0.second instanceof EnumShortF0).assertEqual(true)
      expect(EnumShortF0.third instanceof EnumShortF0).assertEqual(true)
      expect(EnumShortF0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortF0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortF0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortF0.first.valueOf()).assertEqual(v1)
      expect(EnumShortF0.second.valueOf()).assertEqual(v2)
      expect(EnumShortF0.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_3300
     * @tc.name      testEnumerationWithExplicitType0397
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortG0.A instanceof EnumShortG0).assertEqual(true)
      expect(EnumShortG0.B instanceof EnumShortG0).assertEqual(true)
      expect(EnumShortG0.A.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG0.B.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG0.A).assertEqual(5)
      expect(EnumShortG0.B).assertEqual(5)
      expect(EnumShortG0.A).assertEqual(EnumShortG0.B)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_3500
     * @tc.name      testEnumerationWithExplicitType0399
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortG1.A instanceof EnumShortG1).assertEqual(true)
      expect(EnumShortG1.B instanceof EnumShortG1).assertEqual(true)
      expect(EnumShortG1.C instanceof EnumShortG1).assertEqual(true)
      expect(EnumShortG1.A.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG1.B.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG1.C.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG1.A).assertEqual(-12)
      expect(EnumShortG1.B).assertEqual(-11)
      expect(EnumShortG1.C).assertEqual(-12)
      expect(EnumShortG1.A).assertEqual(EnumShortG1.C)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_3700
     * @tc.name      testEnumerationWithExplicitType0401
     * @tc.desc      Values can be the same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortG2.first instanceof EnumShortG2).assertEqual(true)
      expect(EnumShortG2.second instanceof EnumShortG2).assertEqual(true)
      expect(EnumShortG2.third instanceof EnumShortG2).assertEqual(true)
      expect(EnumShortG2.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG2.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG2.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG2.first).assertEqual(0)
      expect(EnumShortG2.second).assertEqual(-1)
      expect(EnumShortG2.third).assertEqual(0)
      expect(EnumShortG2.third).assertEqual(EnumShortG2.first)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_3900
     * @tc.name      testEnumerationWithExplicitType0403
     * @tc.desc      Values can be the same. If constant expression is omitted, then the value of the enum constant is set implicitly to an integer value. The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortG3.A instanceof EnumShortG3).assertEqual(true)
      expect(EnumShortG3.B instanceof EnumShortG3).assertEqual(true)
      expect(EnumShortG3.C instanceof EnumShortG3).assertEqual(true)
      expect(EnumShortG3.D instanceof EnumShortG3).assertEqual(true)
      expect(EnumShortG3.E instanceof EnumShortG3).assertEqual(true)
      expect(EnumShortG3.A.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG3.B.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG3.C.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG3.D.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG3.E.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortG3.A).assertEqual(0)
      expect(EnumShortG3.B).assertEqual(1)
      expect(EnumShortG3.C).assertEqual(2)
      expect(EnumShortG3.D).assertEqual(3)
      expect(EnumShortG3.E).assertEqual(3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_4100
     * @tc.name      testEnumerationWithExplicitType0405
     * @tc.desc      Checking for min value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: short = 0
      const v2: short = -32768
      const v3: short = -32768 + 1
      expect(EnumShortH0.first instanceof EnumShortH0).assertEqual(true)
      expect(EnumShortH0.second instanceof EnumShortH0).assertEqual(true)
      expect(EnumShortH0.third instanceof EnumShortH0).assertEqual(true)
      expect(EnumShortH0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortH0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortH0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortH0.first.valueOf()).assertEqual(v1)
      expect(EnumShortH0.second.valueOf()).assertEqual(v2)
      expect(EnumShortH0.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_4300
     * @tc.name      testEnumerationWithExplicitType0407
     * @tc.desc      Checking for max value in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: short = 32767 - 2
      const v2: short = 32767 - 1
      const v3: short = 32767
      expect(EnumShortH1.first instanceof EnumShortH1).assertEqual(true)
      expect(EnumShortH1.second instanceof EnumShortH1).assertEqual(true)
      expect(EnumShortH1.third instanceof EnumShortH1).assertEqual(true)
      expect(EnumShortH1.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortH1.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortH1.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortH1.first.valueOf()).assertEqual(v1)
      expect(EnumShortH1.second.valueOf()).assertEqual(v2)
      expect(EnumShortH1.third.valueOf()).assertEqual(v3)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_4500
     * @tc.name      testEnumerationWithExplicitType0409
     * @tc.desc      Using different integer literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: short = 0b0011
      const v2: short = 0o731
      const v3: short = 0x7AFE
      const v4: short = 32_757
      expect(EnumShortI0.first instanceof EnumShortI0).assertEqual(true)
      expect(EnumShortI0.second instanceof EnumShortI0).assertEqual(true)
      expect(EnumShortI0.third instanceof EnumShortI0).assertEqual(true)
      expect(EnumShortI0.fourth instanceof EnumShortI0).assertEqual(true)
      expect(EnumShortI0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortI0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortI0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortI0.fourth.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortI0.first.valueOf()).assertEqual(v1)
      expect(EnumShortI0.second.valueOf()).assertEqual(v2)
      expect(EnumShortI0.third.valueOf()).assertEqual(v3)
      expect(EnumShortI0.fourth.valueOf()).assertEqual(v4)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_4700
     * @tc.name      testEnumerationWithExplicitType0411
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortJ0.first instanceof EnumShortJ0).assertEqual(true)
      expect(EnumShortJ0.second instanceof EnumShortJ0).assertEqual(true)
      expect(EnumShortJ0.third instanceof EnumShortJ0).assertEqual(true)
      expect(EnumShortJ0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortJ0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortJ0.third.valueOf() instanceof short).assertEqual(true)
      expect("_" + EnumShortJ0.first).assertEqual("_-42")
      expect("_" + EnumShortJ0.second).assertEqual("_-41")
      expect("_" + EnumShortJ0.third).assertEqual("_17")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_4800
     * @tc.name      testEnumerationWithExplicitType0412
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortJ0.first instanceof EnumShortJ0).assertEqual(true)
      expect(EnumShortJ0.second instanceof EnumShortJ0).assertEqual(true)
      expect(EnumShortJ0.third instanceof EnumShortJ0).assertEqual(true)
      expect(EnumShortJ0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortJ0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortJ0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortJ0.first + "_").assertEqual("-42_")
      expect(EnumShortJ0.second + "_").assertEqual("-41_")
      expect(EnumShortJ0.third + "_").assertEqual("17_")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_5100
     * @tc.name      testEnumerationWithExplicitType0415
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortK0.first instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.second instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.third instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.first).assertEqual(-1)
      expect(EnumShortK0.second).assertEqual(0)
      expect(EnumShortK0.third).assertEqual(-42)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_5200
     * @tc.name      testEnumerationWithExplicitType0416
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortK0.first instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.second instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.third instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.first + 1).assertEqual(0)
      expect(EnumShortK0.second + 1).assertEqual(1)
      expect(EnumShortK0.third + 1).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_5300
     * @tc.name      testEnumerationWithExplicitType0417
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortK0.first instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.second instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.third instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.third.valueOf() instanceof short).assertEqual(true)
      expect(1 + EnumShortK0.first).assertEqual(0)
      expect(1 + EnumShortK0.second).assertEqual(1)
      expect(1 + EnumShortK0.third).assertEqual(-41)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_5400
     * @tc.name      testEnumerationWithExplicitType0418
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortK0.first instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.second instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.third instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.first == -1).assertEqual(true)
      expect(EnumShortK0.second == 0).assertEqual(true)
      expect(EnumShortK0.third == -42).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_5500
     * @tc.name      testEnumerationWithExplicitType0419
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortK0.first instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.second instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.third instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.first === -1).assertEqual(true)
      expect(EnumShortK0.second === 0).assertEqual(true)
      expect(EnumShortK0.third === -42).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_TEN_TEST_5600
     * @tc.name      testEnumerationWithExplicitType0420
     * @tc.desc      Using in numeric operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortK0.first instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.second instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.third instanceof EnumShortK0).assertEqual(true)
      expect(EnumShortK0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortK0.first + EnumShortK0.second + EnumShortK0.third).assertEqual(-43)
    });
  })
}
