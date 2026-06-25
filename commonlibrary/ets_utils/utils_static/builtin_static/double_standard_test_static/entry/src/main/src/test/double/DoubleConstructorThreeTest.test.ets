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

export default function DoubleConstructorThreeTest(): void {
  describe('DoubleConstructorThreeTest', () : void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
/**
     * @tc.number DBL_CNSTR_THREE_CHK_0200
     * @tc.name testDoubleConstructorThree0002
     * @tc.desc Verify calling no-argument constructor creates instance with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      expect(value.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_0400
     * @tc.name testDoubleConstructorThree0004
     * @tc.desc Verify positive integer BigInt creates Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      expect(value.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_0500
     * @tc.name testDoubleConstructorThree0005
     * @tc.desc Verify negative integer BigInt creates Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(-100));
      expect(value.valueOf()).assertClose(-100.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_0600
     * @tc.name testDoubleConstructorThree0006
     * @tc.desc Verify BigInt(0) creates Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(0));
      expect(value.valueOf()).assertClose(0.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_0700
     * @tc.name testDoubleConstructorThree0007
     * @tc.desc Verify BigInt(1) creates Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(1));
      expect(value.valueOf()).assertClose(1.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_0800
     * @tc.name testDoubleConstructorThree0008
     * @tc.desc Verify large positive integer BigInt creates Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(123456789));
      expect(value.valueOf()).assertClose(123456789.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_0900
     * @tc.name testDoubleConstructorThree0009
     * @tc.desc Verify BigInt representing double max safe integer (2^53-1) creates instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInt = new BigInt(Number.MAX_SAFE_INTEGER);
      const value = new Double(maxSafeInt);
      expect(value.valueOf()).assertClose(Number.MAX_SAFE_INTEGER, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1000
     * @tc.name testDoubleConstructorThree0010
     * @tc.desc Verify BigInt representing double min safe integer (-(2^53-1)) creates instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInt = new BigInt(Number.MIN_SAFE_INTEGER);
      const value = new Double(minSafeInt);
      expect(value.valueOf()).assertClose(Number.MIN_SAFE_INTEGER, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1100
     * @tc.name testDoubleConstructorThree0011
     * @tc.desc Verify super large BigInt beyond double precise range creates instance with precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigValue = new BigInt("9007199254740993");
      const value = new Double(bigValue);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1200
     * @tc.name testDoubleConstructorThree0012
     * @tc.desc Verify super large BigInt beyond double range results in POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hugeValue = new BigInt("1" + "0".repeat(400));
      const value = new Double(hugeValue);
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1300
     * @tc.name testDoubleConstructorThree0013
     * @tc.desc Verify super large negative BigInt beyond double range results in NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hugeNegValue = new BigInt("-1" + "0".repeat(400));
      const value = new Double(hugeNegValue);
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1400
     * @tc.name testDoubleConstructorThree0014
     * @tc.desc Verify BigInt(2^53) just beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beyondSafe = new BigInt("9007199254740992");
      const value = new Double(beyondSafe);
      expect(value.valueOf()).assertClose(9007199254740992.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1800
     * @tc.name testDoubleConstructorThree0018
     * @tc.desc Verify passing String type returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt("42"));
      expect(value.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_1900
     * @tc.name testDoubleConstructorThree0019
     * @tc.desc Verify passing object type returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(100));
      expect(value.valueOf()).assertClose(100.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2100
     * @tc.name testDoubleConstructorThree0021
     * @tc.desc Verify BigInt negative integer converted to Double valueOf returns correct negative double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(-99));
      expect(value.valueOf()).assertClose(-99.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2300
     * @tc.name testDoubleConstructorThree0023
     * @tc.desc Verify Double instance created from BigInt toString output is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      expect(value.toString()).assertEqual("42");
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2400
     * @tc.name testDoubleConstructorThree0024
     * @tc.desc Verify BigInt(0) creates Double instance with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(0));
      expect(value.valueOf()).assertClose(0.0, Double.EPSILON);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2500
     * @tc.name testDoubleConstructorThree0025
     * @tc.desc Verify positive BigInt creates positive Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(1));
      expect(value.valueOf()).assertClose(1.0, Double.EPSILON);
      expect(value.isGreaterThan(new Double(0.0))).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2600
     * @tc.name testDoubleConstructorThree0026
     * @tc.desc Verify negative BigInt creates negative Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(-1));
      expect(value.valueOf()).assertClose(-1.0, Double.EPSILON);
      expect(value.isLessThan(new Double(0.0))).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2700
     * @tc.name testDoubleConstructorThree0027
     * @tc.desc Verify super large BigInt converted to Double results in POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hugeValue = new BigInt("1" + "0".repeat(400));
      const value = new Double(hugeValue);
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2800
     * @tc.name testDoubleConstructorThree0028
     * @tc.desc Verify super large negative BigInt converted to Double results in NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hugeNegValue = new BigInt("-1" + "0".repeat(400));
      const value = new Double(hugeNegValue);
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_2900
     * @tc.name testDoubleConstructorThree0029
     * @tc.desc Verify BigInt beyond safe integer range conversion has precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beyondSafe = new BigInt("9007199254740993");
      const value = new Double(beyondSafe);
      expect(value.isFinite()).assertTrue();
      expect(Double.isInteger(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3000
     * @tc.name testDoubleConstructorThree0030
     * @tc.desc Verify constructor returns Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      expect(value instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3100
     * @tc.name testDoubleConstructorThree0031
     * @tc.desc Verify valueOf method returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result: number = value.valueOf();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3200
     * @tc.name testDoubleConstructorThree0032
     * @tc.desc Verify toDouble method returns double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result: double = value.toDouble();
      expect(result).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3300
     * @tc.name testDoubleConstructorThree0033
     * @tc.desc Verify two Double instances created from same BigInt value equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(new BigInt(42));
      const right = new Double(new BigInt(42));
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3400
     * @tc.name testDoubleConstructorThree0034
     * @tc.desc Verify two Double instances created from different BigInt values equals returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(new BigInt(42));
      const right = new Double(new BigInt(99));
      expect(left.equals(right)).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3500
     * @tc.name testDoubleConstructorThree0035
     * @tc.desc Verify BigInt representing value close to double MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bigValue = new BigInt("179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368");
      const value = new Double(bigValue);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_3700
     * @tc.name testDoubleConstructorThree0037
     * @tc.desc Verify BigInt(-1) maximum negative integer converts to Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(-1));
      expect(value.valueOf()).assertClose(-1.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_4300
     * @tc.name testDoubleConstructorThree0043
     * @tc.desc Verify normal BigInt value conversion in try block does not enter catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
        const value = new Double(new BigInt(42));
  expect(value.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_4500
     * @tc.name testDoubleConstructorThree0045
     * @tc.desc Verify BigInt and double constructor produce consistent results for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromBigInt = new Double(new BigInt(42));
      const fromDouble = new Double(42.0);
      expect(fromBigInt.equals(fromDouble)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_4600
     * @tc.name testDoubleConstructorThree0046
     * @tc.desc Verify BigInt and String constructor produce consistent results for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromBigInt = new Double(new BigInt(42));
      const fromString = new Double("42");
      expect(fromBigInt.equals(fromString)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_4700
     * @tc.name testDoubleConstructorThree0047
     * @tc.desc Verify BigInt(0) and no-argument constructor produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromBigInt = new Double(new BigInt(0));
      const fromDefault = new Double();
      expect(fromBigInt.equals(fromDefault)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_4800
     * @tc.name testDoubleConstructorThree0048
     * @tc.desc Verify Double instance from BigInt can call add method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(new BigInt(10));
      const b = new Double(new BigInt(20));
      const result = a.add(b);
      expect(result.valueOf()).assertClose(30.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_4900
     * @tc.name testDoubleConstructorThree0049
     * @tc.desc Verify Double instance from BigInt can call sub method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(new BigInt(50));
      const b = new Double(new BigInt(20));
      const result = a.sub(b);
      expect(result.valueOf()).assertClose(30.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5000
     * @tc.name testDoubleConstructorThree0050
     * @tc.desc Verify Double instance from BigInt can call mul method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(new BigInt(6));
      const b = new Double(new BigInt(7));
      const result = a.mul(b);
      expect(result.valueOf()).assertClose(42.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5100
     * @tc.name testDoubleConstructorThree0051
     * @tc.desc Verify Double instance from BigInt can call div method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(new BigInt(100));
      const b = new Double(new BigInt(4));
      const result = a.div(b);
      expect(result.valueOf()).assertClose(25.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5200
     * @tc.name testDoubleConstructorThree0052
     * @tc.desc Verify Double instance from BigInt can call compareTo method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Double(new BigInt(10));
      const right = new Double(new BigInt(20));
      expect(left.compareTo(right)).assertEqual(-1);
      expect(right.compareTo(left)).assertEqual(1);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5300
     * @tc.name testDoubleConstructorThree0053
     * @tc.desc Verify Double instance from BigInt can call isLessThan/isGreaterThan methods normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(new BigInt(10));
      const b = new Double(new BigInt(20));
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isGreaterThan(a)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5400
     * @tc.name testDoubleConstructorThree0054
     * @tc.desc Verify Double instance from BigInt can call toByte method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(12));
      const result: byte = value.toByte();
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5500
     * @tc.name testDoubleConstructorThree0055
     * @tc.desc Verify Double instance from BigInt can call toInt method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(123));
      const result: int = value.toInt();
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5600
     * @tc.name testDoubleConstructorThree0056
     * @tc.desc Verify Double instance from BigInt can call toLong method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(123456));
      const result: long = value.toLong();
      expect(result).assertEqual(123456);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5700
     * @tc.name testDoubleConstructorThree0057
     * @tc.desc Verify Double instance from BigInt can call toFixed method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      expect(value.toFixed()).assertEqual("42");
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5800
     * @tc.name testDoubleConstructorThree0058
     * @tc.desc Verify Double instance from BigInt can call toExponential method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      expect(value.toExponential()).assertEqual("4.2e+1");
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_5900
     * @tc.name testDoubleConstructorThree0059
     * @tc.desc Verify Double instance from BigInt can call toLocaleString method normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(1234));
      expect(value.toLocaleString("en-US")).assertEqual("1,234");
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_6000
     * @tc.name testDoubleConstructorThree0060
     * @tc.desc Verify precision boundary at 2^53 (safe integer boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const safeMax = new BigInt(Number.MAX_SAFE_INTEGER);
      const value = new Double(safeMax);
      expect(value.valueOf()).assertClose(Number.MAX_SAFE_INTEGER, Double.EPSILON);
      expect(Double.isSafeInteger(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_6100
     * @tc.name testDoubleConstructorThree0061
     * @tc.desc Verify precision boundary at 2^53+1 (beyond safe integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beyondSafe = new BigInt(Number.MAX_SAFE_INTEGER + 1);
      const value = new Double(beyondSafe);
      expect(Double.isSafeInteger(value.valueOf())).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_6200
     * @tc.name testDoubleConstructorThree0062
     * @tc.desc Verify BigInt(2^10) equals 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(1024));
      expect(value.valueOf()).assertClose(1024.0, Double.EPSILON);
    });

    /**
     * @tc.number DBL_CNSTR_THREE_CHK_6300
     * @tc.name testDoubleConstructorThree0063
     * @tc.desc Verify BigInt(2^52) precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorThree0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(4503599627370496));
      expect(value.valueOf()).assertClose(4503599627370496.0, Double.EPSILON);
    });
  });
}
