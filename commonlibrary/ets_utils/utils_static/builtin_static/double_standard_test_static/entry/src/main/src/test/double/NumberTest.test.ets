/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function NumberTest(): void {
  describe('NumberTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0100
     * @tc.name testNumber0001
     * @tc.desc Verify Number type can receive Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      expect(value != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0200
     * @tc.name testNumber0002
     * @tc.desc Verify Double type variable can be assigned to Number type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Double = new Double(2.5);
      const n: Number = d;
      expect(n.valueOf()).assertEqual(2.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0300
     * @tc.name testNumber0003
     * @tc.desc Verify reverse assignment for type compatibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Number = new Double(3.5);
      const d: Double = n;
      expect(d.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0400
     * @tc.name testNumber0004
     * @tc.desc Verify Number created with Double no-arg constructor has value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double();
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0500
     * @tc.name testNumber0005
     * @tc.desc Verify Number created with double value constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      expect(value.valueOf()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0600
     * @tc.name testNumber0006
     * @tc.desc Verify Number created with BigInt value constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(new BigInt(42));
      expect(value.valueOf()).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0700
     * @tc.name testNumber0007
     * @tc.desc Verify Number created with valid numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("3.5");
      expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0800
     * @tc.name testNumber0008
     * @tc.desc Verify Number created with unparseable string results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("abc");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_0900
     * @tc.name testNumber0009
     * @tc.desc Verify Number created with empty string results in 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1000
     * @tc.name testNumber0010
     * @tc.desc Verify Number created with "Infinity" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("Infinity");
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1100
     * @tc.name testNumber0011
     * @tc.desc Verify Number created with "-Infinity" string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("-Infinity");
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1200
     * @tc.name testNumber0012
     * @tc.desc Verify Number created with Double.$_invoke() no-arg has value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke();
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1300
     * @tc.name testNumber0013
     * @tc.desc Verify Number created with Double.$_invoke(String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke("3.5");
      expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1400
     * @tc.name testNumber0014
     * @tc.desc Verify Number created with Double.$_invoke(Number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke(new Double(1.5));
      expect(value.valueOf()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1500
     * @tc.name testNumber0015
     * @tc.desc Verify Number created with Double.$_invoke(BigInt)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke(new BigInt(42));
      expect(value.valueOf()).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1600
     * @tc.name testNumber0016
     * @tc.desc Verify Number created with Double.$_invoke(undefined) results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke(undefined);
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1700
     * @tc.name testNumber0017
     * @tc.desc Verify Number created with Double.$_invoke(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke(null);
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1800
     * @tc.name testNumber0018
     * @tc.desc Verify Number created with Double.$_invoke(invalid string) results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = Double.$_invoke("abc");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_1900
     * @tc.name testNumber0019
     * @tc.desc Verify Number valueOf returns correct number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      const result: number = value.valueOf();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2000
     * @tc.name testNumber0020
     * @tc.desc Verify Number toString returns correct string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      const result: String = value.toString();
      expect(result).assertEqual("1.5");
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2100
     * @tc.name testNumber0021
     * @tc.desc Verify Number toDouble returns correct double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      const result: double = value.toDouble();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2200
     * @tc.name testNumber0022
     * @tc.desc Verify Number toInt returns truncated int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(123.5);
      const result: int = value.toInt();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2300
     * @tc.name testNumber0023
     * @tc.desc Verify Number toLong returns truncated long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(123.5);
      const result: long = value.toLong();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2400
     * @tc.name testNumber0024
     * @tc.desc Verify Number toFloat returns float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      const result: float = value.toFloat();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2500
     * @tc.name testNumber0025
     * @tc.desc Verify Number toByte returns byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.0);
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2600
     * @tc.name testNumber0026
     * @tc.desc Verify Number toShort returns short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(123.0);
      const result: short = value.toShort();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2700
     * @tc.name testNumber0027
     * @tc.desc Verify Number holds NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.NaN);
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2800
     * @tc.name testNumber0028
     * @tc.desc Verify Number holds positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.POSITIVE_INFINITY);
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_2900
     * @tc.name testNumber0029
     * @tc.desc Verify Number holds negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.NEGATIVE_INFINITY);
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3000
     * @tc.name testNumber0030
     * @tc.desc Verify Number holds 0.0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(0.0);
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3100
     * @tc.name testNumber0031
     * @tc.desc Verify Number holds -0.0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(-0.0);
      expect(value.valueOf()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3200
     * @tc.name testNumber0032
     * @tc.desc Verify Number holds Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.MAX_VALUE);
      expect(value.valueOf()).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3300
     * @tc.name testNumber0033
     * @tc.desc Verify Number holds Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.MIN_VALUE);
      expect(value.valueOf()).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3400
     * @tc.name testNumber0034
     * @tc.desc Verify Number holds negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(-3.14);
      expect(value.valueOf()).assertEqual(-3.14);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3500
     * @tc.name testNumber0035
     * @tc.desc Verify typeof Number valueOf result is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      expect(typeof value.valueOf()).assertEqual("number");
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3600
     * @tc.name testNumber0036
     * @tc.desc Verify Number compareTo returns int comparison result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Number = new Double(1.0);
      const right: Number = new Double(2.0);
      const result: int = left.compareTo(right);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3700
     * @tc.name testNumber0037
     * @tc.desc Verify Number equals returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: Number = new Double(1.5);
      const right: Number = new Double(1.5);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3800
     * @tc.name testNumber0038
     * @tc.desc Verify Number isNaN returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.NaN);
      expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_3900
     * @tc.name testNumber0039
     * @tc.desc Verify Number isFinite returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.0);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4000
     * @tc.name testNumber0040
     * @tc.desc Verify Number isInteger returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(2.0);
      expect(value.isInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4100
     * @tc.name testNumber0041
     * @tc.desc Verify Number isSafeInteger returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(2.0);
      expect(value.isSafeInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4200
     * @tc.name testNumber0042
     * @tc.desc Verify Number add returns new Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(1.5);
      const result: Double = a.add(new Double(2.0));
      expect(result.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4300
     * @tc.name testNumber0043
     * @tc.desc Verify Number sub returns new Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(3.5);
      const result: Double = a.sub(new Double(2.0));
      expect(result.valueOf()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4400
     * @tc.name testNumber0044
     * @tc.desc Verify Number mul returns new Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(3.0);
      const result: Double = a.mul(new Double(2.0));
      expect(result.valueOf()).assertEqual(6.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4500
     * @tc.name testNumber0045
     * @tc.desc Verify Number div returns new Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(6.0);
      const result: Double = a.div(new Double(2.0));
      expect(result.valueOf()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4600
     * @tc.name testNumber0046
     * @tc.desc Verify Number isLessThan returns correct comparison result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(1.0);
      expect(a.isLessThan(new Double(2.0))).assertTrue();
      expect(a.isLessThan(new Double(0.5))).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4700
     * @tc.name testNumber0047
     * @tc.desc Verify Number isLessEqualThan returns correct comparison result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(2.0);
      expect(a.isLessEqualThan(new Double(2.0))).assertTrue();
      expect(a.isLessEqualThan(new Double(1.0))).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4800
     * @tc.name testNumber0048
     * @tc.desc Verify Number isGreaterThan returns correct comparison result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(3.0);
      expect(a.isGreaterThan(new Double(2.0))).assertTrue();
      expect(a.isGreaterThan(new Double(4.0))).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_4900
     * @tc.name testNumber0049
     * @tc.desc Verify Number isGreaterEqualThan returns correct comparison result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Number = new Double(3.0);
      expect(a.isGreaterEqualThan(new Double(3.0))).assertTrue();
      expect(a.isGreaterEqualThan(new Double(4.0))).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5000
     * @tc.name testNumber0050
     * @tc.desc Verify Number toExponentialWithNoDigit returns exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.5);
      const result: String = value.toExponentialWithNoDigit();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5100
     * @tc.name testNumber0051
     * @tc.desc Verify Number toExponential returns exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.5);
      const result: String = value.toExponential();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5200
     * @tc.name testNumber0052
     * @tc.desc Verify Number toExponential with fraction digits returns formatted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.5);
      const result: String = value.toExponential(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5300
     * @tc.name testNumber0053
     * @tc.desc Verify Number toPrecision with precision returns formatted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.345);
      const result: String = value.toPrecision(4.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5400
     * @tc.name testNumber0054
     * @tc.desc Verify Number toPrecision returns default string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.345);
      const result: String = value.toPrecision();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5500
     * @tc.name testNumber0055
     * @tc.desc Verify Number toFixedImpl returns fixed-point notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.345);
      const result: String = value.toFixedImpl(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5600
     * @tc.name testNumber0056
     * @tc.desc Verify Number toFixed returns fixed-point notation string with zero decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.345);
      const result: String = value.toFixed();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5700
     * @tc.name testNumber0057
     * @tc.desc Verify Number toFixed with fraction digits returns fixed-point string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(12.345);
      const result: String = value.toFixed(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_5800
     * @tc.name testNumber0058
     * @tc.desc Verify Number toLocaleString returns localized string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1234.5);
      const result: String = value.toLocaleString("en-US");
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6000
     * @tc.name testNumber0060
     * @tc.desc Verify Number equals with String type returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numValue: Number = new Double(1.5);
      expect(numValue.equals("1.5")).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6100
     * @tc.name testNumber0061
     * @tc.desc Verify Number NaN arithmetic operation result is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: Number = new Double(Double.NaN);
      const result = nanValue.add(new Double(1.0));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6200
     * @tc.name testNumber0062
     * @tc.desc Verify Number NaN compareTo returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: Number = new Double(Double.NaN);
      const normalValue: Number = new Double(1.0);
      expect(nanValue.compareTo(normalValue)).assertEqual(1);
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6400
     * @tc.name testNumber0064
     * @tc.desc Verify Number NaN value isFinite returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.NaN);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6500
     * @tc.name testNumber0065
     * @tc.desc Verify Number positive infinity isFinite returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6600
     * @tc.name testNumber0066
     * @tc.desc Verify Number negative infinity isFinite returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(Double.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6700
     * @tc.name testNumber0067
     * @tc.desc Verify Number infinity division results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Number = new Double(Double.POSITIVE_INFINITY);
      const result = inf.div(new Double(Double.POSITIVE_INFINITY));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6800
     * @tc.name testNumber0068
     * @tc.desc Verify Number zero divided by zero results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero: Number = new Double(0.0);
      const result = zero.div(new Double(0.0));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_6900
     * @tc.name testNumber0069
     * @tc.desc Verify Number exceeding byte range toByte truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(128.0);
      const result: byte = value.toByte();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_7000
     * @tc.name testNumber0070
     * @tc.desc Verify Number exceeding short range toShort truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(32768.0);
      const result: short = value.toShort();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_7100
     * @tc.name testNumber0071
     * @tc.desc Verify Number large value toInt truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(2147483648.0);
      const result: int = value.toInt();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_7200
     * @tc.name testNumber0072
     * @tc.desc Verify Number negative value toByte truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(-1.0);
      const result: byte = value.toByte();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_7300
     * @tc.name testNumber0073
     * @tc.desc Verify Number created with unparseable string results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("not_a_number");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_NMBR_ITEM_CHK_7500
     * @tc.name testNumber0075
     * @tc.desc Verify Number created with special character string results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNumber0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double("@#$%");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });
  });
}
