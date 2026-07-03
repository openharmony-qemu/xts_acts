'use static';
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import Utils from "../../../Util.test";

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';

enum IntEnum { Zero, One, Two }
enum IntEnum2 { Zero, Five = 5, Seven = 7 }
enum IntEnum3 { Three = 3, Five = 5, Six }
enum IntEnum4 { Zero, One, Two }
enum IntEnum5 { MinusOne = -1, Zero, One, Two }

export default function ExpressionsAdditiveOperatorsTest(): void {
  describe("ExpressionsAdditiveOperatorsTest", () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0100..0400
     * @tc.name      testLiternalIntExpressions
     * @tc.desc      Additive operators for numeric types: literal int expressions with parentheses
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLiternalIntExpressions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = 1 + 2 - 1 + 4;
      expect(result).assertEqual(6);
      result = (7 - 2) + 4;
      expect(result).assertEqual(9);
      result = 7 - (2 - 1);
      expect(result).assertEqual(6);
      result = (11 - 7) - (34 - 41);
      expect(result).assertEqual(11);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_0500..1100
     * @tc.name      testBigintOperations
     * @tc.desc      Additive operators for numeric types: bigint addition and subtraction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBigintOperations", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 9223372036854775807n;
      let y: bigint = 3n;
      let z: bigint = x + y;
      expect(z).assertEqual(9223372036854775810n);
      x = 9223372036854775810n;
      y = 1n;
      z = x - y;
      expect(z).assertEqual(9223372036854775809n);
      x = -9223372036854775807n;
      y = 244553n;
      z = x - y;
      expect(z).assertEqual(-9223372036855020360n);
      x = 9223372036854775807n;
      y = 0n;
      z = x + y;
      expect(z).assertEqual(9223372036854775807n);
      z = x - y;
      expect(z).assertEqual(9223372036854775807n);
      x = 0n;
      y = 0n;
      z = x + y;
      expect(z).assertEqual(0n);
      z = x - y;
      expect(z).assertEqual(0n);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1200..1600
     * @tc.name      testEnumArithmetic
     * @tc.desc      Additive operators for numeric types: enum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEnumArithmetic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(IntEnum.One + IntEnum.Two).assertEqual(3);
      expect(IntEnum2.Seven - IntEnum2.Five).assertEqual(2);
      expect(IntEnum3.Three - IntEnum3.Six).assertEqual(-3);
      expect(IntEnum4.One + 54).assertEqual(55);
      expect(IntEnum5.MinusOne + IntEnum5.One).assertEqual(0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_1700..2300
     * @tc.name      testFloatArithmetic
     * @tc.desc      Additive operators for numeric types: float with signed zero and basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFloatArithmetic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f;
      let y: float = -0.0f;
      expect((x + y)).assertEqual(0.0f);
      x = -0.0f;
      y = 0.0f;
      expect((x + y)).assertEqual(0.0f);
      x = -0.0f;
      y = -0.0f;
      expect((x + y)).assertEqual(-0.0f);
      x = 0.0f;
      y = 0.0f;
      expect((x + y)).assertEqual(0.0f);
      x = 0.0f;
      y = 1.0f;
      expect((x + y)).assertEqual(1.0f);
      x = 1.0f;
      y = 0.0f;
      expect((x + y)).assertEqual(1.0f);
      x = 1.0f;
      y = -1.0f;
      expect((x + y)).assertEqual(0.0f);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_2400..3000
     * @tc.name      testDoubleArithmetic
     * @tc.desc      Additive operators for numeric types: double with signed zero and basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDoubleArithmetic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0;
      let y: double = -0.0;
      expect((x + y)).assertEqual(0.0);
      x = -0.0;
      y = 0.0;
      expect((x + y)).assertEqual(0.0);
      x = -0.0;
      y = -0.0;
      expect((x + y)).assertEqual(-0.0);
      x = 0.0;
      y = 0.0;
      expect((x + y)).assertEqual(0.0);
      x = 0.0;
      y = 1.0;
      expect((x + y)).assertEqual(1.0);
      x = 1.0;
      y = 0.0;
      expect((x + y)).assertEqual(1.0);
      x = 1.0;
      y = -1.0;
      expect((x + y)).assertEqual(0.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3100..3800
     * @tc.name      testMixedFloatDoubleWithIntegral
     * @tc.desc      Additive operators for numeric types: mixed float/double with byte/short/int/long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMixedFloatDoubleWithIntegral", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 56.2f;
      let b: byte = 4;
      let c: float = a - b;
      expect(c instanceof float).assertTrue();
      expect(Math.abs(c - 52.2f)).assertLessOrEqual(1e-6);
      let d: byte = 12;
      let e: double = 3564.2;
      let f: double = d + e;
      expect(f instanceof double).assertTrue();
      expect(Math.abs(f - 3576.2)).assertLessOrEqual(1e-6);
      let g: float = 36.3f;
      let h: short = 11;
      let i: float = g + h;
      expect(i instanceof float).assertTrue();
      expect(Math.abs(i - 47.3f)).assertLessOrEqual(1e-6);
      let j: double = 32.8;
      let k: short = 1;
      let l: double = j - k;
      expect(l instanceof double).assertTrue();
      expect(Math.abs(l - 31.8)).assertLessOrEqual(1e-6);
      let m: int = 14;
      let n: float = 10.0f;
      let o: float = m - n;
      expect(o instanceof float).assertTrue();
      expect(Math.abs(o - 4.0f)).assertLessOrEqual(1e-6);
      let p: int = 28;
      let q: double = 1.9;
      let r: double = p + q;
      expect(r instanceof double).assertTrue();
      expect(Math.abs(r - 29.9)).assertLessOrEqual(1e-6);
      let s: long = 1;
      let t: float = 103.6f;
      let u: float = s - t;
      expect(u instanceof float).assertTrue();
      expect(Math.abs(u - -102.6f)).assertLessOrEqual(1e-6);
      let v: long = 8589934593;
      let w: double = 1.0;
      let x: double = v + w;
      expect(x instanceof double).assertTrue();
      expect(Math.abs(x - 8589934594.0)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_3900..4100
     * @tc.name      testFloatToDoubleArithmetic
     * @tc.desc      Additive operators for numeric types: float/float, float/double, double/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFloatToDoubleArithmetic", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 13.0f;
      let b: float = 10.6f;
      let c: float = a + b;
      expect(c instanceof float).assertTrue();
      expect(Math.abs(c - 23.6f)).assertLessOrEqual(1e-6);
      let d: double = 1.3;
      let e: float = 10.6f;
      let f: double = d - e;
      expect(f instanceof double).assertTrue();
      expect(Math.abs(f - -9.3)).assertLessOrEqual(1e-6);
      let g: double = 1986.3;
      let h: double = 130.6;
      let i: double = g + h;
      expect(i instanceof double).assertTrue();
      expect(Math.abs(i - 2116.9)).assertLessOrEqual(1e-6);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4200..4700
     * @tc.name      testDoubleInfinity
     * @tc.desc      Additive operators for numeric types: double with infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDoubleInfinity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1.0 + Double.POSITIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect((Double.POSITIVE_INFINITY + 1.0)).assertEqual(Double.POSITIVE_INFINITY);
      expect((Double.POSITIVE_INFINITY + Double.POSITIVE_INFINITY)).assertEqual(Double.POSITIVE_INFINITY);
      expect((1.0 + Double.NEGATIVE_INFINITY)).assertEqual(Double.NEGATIVE_INFINITY);
      expect((Double.NEGATIVE_INFINITY + 1.0)).assertEqual(Double.NEGATIVE_INFINITY);
      expect((Double.NEGATIVE_INFINITY + Double.NEGATIVE_INFINITY)).assertEqual(Double.NEGATIVE_INFINITY);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_4800..5100
     * @tc.name      testSameTypeIntegral
     * @tc.desc      Additive operators for numeric types: same-type byte, short, int, long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSameTypeIntegral", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0;
      let b: byte = 0;
      expect((a + b) === 0).assertTrue();
      let c: short = 0;
      let d: short = 1;
      expect((c + d) === 1).assertTrue();
      let e: int = 1;
      let f: int = 0;
      expect((e + f) === 1).assertTrue();
      let g: long = 1;
      let h: long = -1;
      expect((g + h) === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_5200..6100
     * @tc.name      testCrossTypeIntegralPromotion
     * @tc.desc      Additive operators for numeric types: cross-type integral promotion with instanceof check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCrossTypeIntegralPromotion", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 5;
      let b: byte = 3;
      let ab: int = a + b;
      expect(ab instanceof int).assertTrue();
      expect(ab).assertEqual(8);
      let c: byte = 6;
      let d: short = 1;
      let cd: int = c - d;
      expect(cd instanceof int).assertTrue();
      expect(cd).assertEqual(5);
      let e: int = 5;
      let f: byte = -3;
      let ef: int = e + f;
      expect(ef instanceof int).assertTrue();
      expect(ef).assertEqual(2);
      let g: byte = 11;
      let h: long = 122;
      let gh: long = g + h;
      expect(gh instanceof long).assertTrue();
      expect(gh).assertEqual(133);
      let i: short = 44;
      let j: short = 73;
      let ij: int = i - j;
      expect(ij instanceof int).assertTrue();
      expect(ij).assertEqual(-29);
      let k: short = -34;
      let l: int = 4;
      let kl: int = k - l;
      expect(kl instanceof int).assertTrue();
      expect(kl).assertEqual(-38);
      let m: long = 41;
      let n: short = 42;
      let mn: long = m + n;
      expect(mn instanceof long).assertTrue();
      expect(mn).assertEqual(83);
      let o: int = 44932;
      let p: int = 7345;
      let op: int = o - p;
      expect(op instanceof int).assertTrue();
      expect(op).assertEqual(37587);
      let q: int = 492;
      let r: long = 75;
      let qr: long = q + r;
      expect(qr instanceof long).assertTrue();
      expect(qr).assertEqual(567);
      let s: long = 9209732;
      let t: long = 759376;
      let st: long = s - t;
      expect(st instanceof long).assertTrue();
      expect(st).assertEqual(8450356);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6200..6700
     * @tc.name      testIntOverflow
     * @tc.desc      Additive operators for numeric types: int overflow at boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIntOverflow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483646;
      let y: int = 1;
      let z: int = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2147483647);
      x = 2147483647;
      y = 0;
      z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2147483647);
      x = 2147483647;
      y = 1;
      z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-2147483648);
      x = -2147483647;
      y = -1;
      z = x + y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-2147483648);
      x = -2147483648;
      y = 0;
      z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(-2147483648);
      x = -2147483648;
      y = 1;
      z = x - y;
      expect(z instanceof int).assertTrue();
      expect(z).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_6800..7300
     * @tc.name      testLongOverflow
     * @tc.desc      Additive operators for numeric types: long overflow at boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLongOverflow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 9223372036854775806;
      let y: long = 1;
      let z: long = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(9223372036854775807);
      x = 9223372036854775807;
      y = 0;
      z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(9223372036854775807);
      x = 9223372036854775807;
      y = 1;
      z = x + y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(-9223372036854775808);
      x = -9223372036854775807;
      y = 1;
      z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(-9223372036854775808);
      x = -9223372036854775808;
      y = 0;
      z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(-9223372036854775808);
      x = -9223372036854775808;
      y = 1;
      z = x - y;
      expect(z instanceof long).assertTrue();
      expect(z).assertEqual(9223372036854775807);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_ADDITIVE_OPERATORS_7400..8200
     * @tc.name      testDoubleNaN
     * @tc.desc      Additive operators for numeric types: double NaN combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDoubleNaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.NaN;
      let y: double = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue();
      x = 1.0;
      y = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.NaN;
      y = 1.0;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.NEGATIVE_INFINITY;
      y = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.POSITIVE_INFINITY;
      y = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.NaN;
      y = Double.NEGATIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.NEGATIVE_INFINITY;
      y = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.NaN;
      y = Double.POSITIVE_INFINITY;
      expect(Double.isNaN(x + y)).assertTrue();
      x = Double.POSITIVE_INFINITY;
      y = Double.NaN;
      expect(Double.isNaN(x + y)).assertTrue();
    })
  })
}