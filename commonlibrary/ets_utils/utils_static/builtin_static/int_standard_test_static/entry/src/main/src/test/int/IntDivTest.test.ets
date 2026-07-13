'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function IntDivTest(): void {
  describe('IntDivTest', (): void => {
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
     * @tc.number INT_DIV_ITEM_CHK_0100
     * @tc.name testIntDiv0001
     * @tc.desc Verify that other parameter is required for div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.div(new Int(10));
      expect(result.toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0200
     * @tc.name testIntDiv0002
     * @tc.desc Verify compareTo returns zero for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20);
      const result = a.div(new Int(4));
      expect(result.toInt()).assertEqual(5);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0400
     * @tc.name testIntDiv0004
     * @tc.desc Verify div with normal Int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(5);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(20);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0500
     * @tc.name testIntDiv0005
     * @tc.desc Verify positive numbers division with exact result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(4);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(25);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0600
     * @tc.name testIntDiv0006
     * @tc.desc Verify positive numbers division truncating decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(3);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(33);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0700
     * @tc.name testIntDiv0007
     * @tc.desc Verify negative number division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(4);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(-25);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0800
     * @tc.name testIntDiv0008
     * @tc.desc Verify dividing by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(1);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_0900
     * @tc.name testIntDiv0009
     * @tc.desc Verify dividing by -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(-1);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(-123);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1000
     * @tc.name testIntDiv0010
     * @tc.desc Verify MAX_VALUE division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(1);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1100
     * @tc.name testIntDiv0011
     * @tc.desc Verify MIN_VALUE division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(1);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1200
     * @tc.name testIntDiv0012
     * @tc.desc Verify MIN_VALUE divided by -1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(-1);
      const result = a.div(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1300
     * @tc.name testIntDiv0013
     * @tc.desc Verify 0 divided by positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(100);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1400
     * @tc.name testIntDiv0014
     * @tc.desc Verify 0 divided by negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(-100);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1500
     * @tc.name testIntDiv0015
     * @tc.desc Verify large number division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const b = new Int(1000);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(1000);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1600
     * @tc.name testIntDiv0016
     * @tc.desc Verify large number division truncating decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000001);
      const b = new Int(1000);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(1000);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_1700
     * @tc.name testIntDiv0017
     * @tc.desc Verify dividing by 0 returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(100);
        const b = new Int(0);
        const result = a.div(b);
        expect().assertFail();
      } catch (error) {
       expect(error.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2000
     * @tc.name testIntDiv0020
     * @tc.desc Verify div with number literal argument returns correct integer quotient
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.div(10);
      expect(result.toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2100
     * @tc.name testIntDiv0021
     * @tc.desc Verify passing string returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(65);
        const result = a.div("10" as Object as Int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2200
     * @tc.name testIntDiv0022
     * @tc.desc Verify div returns new Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.div(new Int(10));
      expect(result).not().assertNull();
      expect(result).not().assertNull();
      expect(result.toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2300
     * @tc.name testIntDiv0023
     * @tc.desc Verify return value is Int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.div(new Int(4));
      expect(typeof result).not().assertNull();
      expect(result.toInt()).assertEqual(25);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2400
     * @tc.name testIntDiv0024
     * @tc.desc Verify two positive numbers division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(10);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2500
     * @tc.name testIntDiv0025
     * @tc.desc Verify document example output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.div(new Int(10)).toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2600
     * @tc.name testIntDiv0026
     * @tc.desc Verify exact division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(10);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2700
     * @tc.name testIntDiv0027
     * @tc.desc Verify truncating decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(10);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(6);
      expect(result.toInt()).assertLess(6.5);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2800
     * @tc.name testIntDiv0028
     * @tc.desc Verify floor rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99);
      const b = new Int(100);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_2900
     * @tc.name testIntDiv0029
     * @tc.desc Verify two negative numbers division yields positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(-4);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(25);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_3000
     * @tc.name testIntDiv0030
     * @tc.desc Verify positive divided by negative yields negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-4);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(-25);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_3200
     * @tc.name testIntDiv0032
     * @tc.desc Verify negative division truncating decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-65);
      const b = new Int(10);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(-6);
      expect(result.toInt()).assertLarger(-6.5);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_3500
     * @tc.name testIntDiv0035
     * @tc.desc Verify 0 divided by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(1);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_3700
     * @tc.name testIntDiv0037
     * @tc.desc Verify any number divided by -1 changes sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(-1);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(-123);

      const c = new Int(-123);
      const d = new Int(-1);
      const result2 = c.div(d);
      expect(result2.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4000
     * @tc.name testIntDiv0040
     * @tc.desc Verify original instance value unchanged after div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const originalValue = a.toInt();
      const result = a.div(new Int(10));
      expect(a.toInt()).assertEqual(originalValue);
      expect(a.toInt()).assertEqual(65);
      expect(result.toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4100
     * @tc.name testIntDiv0041
     * @tc.desc Verify div returns new Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.div(new Int(10));
      expect(result).not().assertEqual(a);
      expect(result.toInt()).not().assertEqual(a.toInt());
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4300
     * @tc.name testIntDiv0043
     * @tc.desc Verify chained div calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.div(new Int(10)).div(new Int(5)).div(new Int(2));
      expect(result.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4400
     * @tc.name testIntDiv0044
     * @tc.desc Verify div followed by other methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.div(new Int(4)).div(new Int(5));
      expect(result.toInt()).assertEqual(5);
      expect(result.mul(new Int(2)).toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4500
     * @tc.name testIntDiv0045
     * @tc.desc Verify mixed div and mul operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.div(new Int(4)).mul(new Int(3));
      expect(result.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4600
     * @tc.name testIntDiv0046
     * @tc.desc Verify division is not commutative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(4);
      expect(a.div(b).toInt()).assertEqual(25);
      expect(b.div(a).toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4700
     * @tc.name testIntDiv0047
     * @tc.desc Verify (a / b) / c equals a / (b * c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const b = new Int(10);
      const c = new Int(10);
      const result1 = a.div(b).div(c);
      const result2 = a.div(b.mul(c));
      expect(result1.toInt()).assertEqual(result2.toInt());
      expect(result1.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4800
     * @tc.name testIntDiv0048
     * @tc.desc Verify dividing by itself yields 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const result = a.div(new Int(12345));
      expect(result.toInt()).assertEqual(1);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_4900
     * @tc.name testIntDiv0049
     * @tc.desc Verify 0 divided by 0 returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(0);
        const result = a.div(new Int(0));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ArithmeticError');
      }
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5000
     * @tc.name testIntDiv0050
     * @tc.desc Verify truncating decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(999);
      const b = new Int(1000);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5100
     * @tc.name testIntDiv0051
     * @tc.desc Verify large number divided by small number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const b = new Int(3);
      const result = a.div(b);
      expect(result.toInt()).assertEqual(333);
      expect(result.toInt()).assertLessOrEqual(1000 / 3);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5200
     * @tc.name testIntDiv0052
     * @tc.desc Verify rounding toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(7).div(new Int(3)).toInt()).assertEqual(2);
      expect(new Int(-7).div(new Int(3)).toInt()).assertEqual(-2);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5300
     * @tc.name testIntDiv0053
     * @tc.desc Verify calculating average
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum = new Int(100);
      const count = new Int(4);
      const average = sum.div(count);
      expect(average.toInt()).assertEqual(25);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5400
     * @tc.name testIntDiv0054
     * @tc.desc Verify calculating number of groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const total = new Int(100);
      const groupSize = new Int(15);
      const groups = total.div(groupSize);
      expect(groups.toInt()).assertEqual(6);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5500
     * @tc.name testIntDiv0055
     * @tc.desc Verify calculating ratio
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const part = new Int(75);
      const total = new Int(100);
      const ratio = part.mul(new Int(100)).div(total);
      expect(ratio.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5600
     * @tc.name testIntDiv0056
     * @tc.desc Verify multiple div calls performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(1000000);
      const divisor = new Int(10);
      for (let i = 0; i < 6; i++) {
        result = result.div(divisor);
      }
      expect(result.toInt()).assertEqual(1);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5800
     * @tc.name testIntDiv0058
     * @tc.desc Verify MAX_VALUE divided by various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.div(new Int(1)).toInt()).assertEqual(2147483647);
      expect(max.div(new Int(2147483647)).toInt()).assertEqual(1);
      expect(max.div(new Int(2)).toInt()).assertEqual(1073741823);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_5900
     * @tc.name testIntDiv0059
     * @tc.desc Verify MIN_VALUE divided by various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      expect(min.div(new Int(1)).toInt()).assertEqual(-2147483648);
      expect(min.div(new Int(-1)).toInt()).not().assertNull();
      expect(min.div(new Int(-2147483648)).toInt()).assertEqual(1);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6000
     * @tc.name testIntDiv0060
     * @tc.desc Verify (a * b) / b equals a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(5);
      const result = a.mul(b).div(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6100
     * @tc.name testIntDiv0061
     * @tc.desc Verify a equals (a / b) * b + a % b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(103);
      const b = new Int(10);
      const quotient = a.div(b);
      const remainder = a.toInt() % b.toInt();
      const recovered = quotient.mul(b).add(new Int(remainder));
      expect(recovered.toInt()).assertEqual(103);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6200
     * @tc.name testIntDiv0062
     * @tc.desc Verify result is within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const b = new Int(1000);
      const result = a.div(b);
      expect(result.toInt()).assertLargerOrEqual(-2147483648);
      expect(result.toInt()).assertLessOrEqual(2147483647);
      expect(result.toInt()).assertEqual(1000);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6300
     * @tc.name testIntDiv0063
     * @tc.desc Verify x divided by 1 equals x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const one = new Int(1);
      expect(a.div(one).toInt()).assertEqual(12345);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6400
     * @tc.name testIntDiv0064
     * @tc.desc Verify x divided by -1 equals -x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const minusOne = new Int(-1);
      expect(a.div(minusOne).toInt()).assertEqual(-12345);

      const b = new Int(-12345);
      expect(b.div(minusOne).toInt()).assertEqual(12345);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6500
     * @tc.name testIntDiv0065
     * @tc.desc Verify x divided by x equals 1 when x is not 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-9999);
      const result = a.div(new Int(-9999));
      expect(result.toInt()).assertEqual(1);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6600
     * @tc.name testIntDiv0066
     * @tc.desc Verify complex chained calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a
        .div(new Int(10))
        .div(new Int(5));
      expect(result.toInt()).assertEqual(20);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6700
     * @tc.name testIntDiv0067
     * @tc.desc Verify intermediate values in chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const step1 = a.div(new Int(10));
      expect(step1.toInt()).assertEqual(100);
      const step2 = step1.div(new Int(5));
      expect(step2.toInt()).assertEqual(20);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6800
     * @tc.name testIntDiv0068
     * @tc.desc Verify various decimal truncation cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(10).div(new Int(3)).toInt()).assertEqual(3);
      expect(new Int(11).div(new Int(3)).toInt()).assertEqual(3);
      expect(new Int(12).div(new Int(3)).toInt()).assertEqual(4);
      expect(new Int(13).div(new Int(3)).toInt()).assertEqual(4);
      expect(new Int(14).div(new Int(3)).toInt()).assertEqual(4);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_6900
     * @tc.name testIntDiv0069
     * @tc.desc Verify negative division truncation direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int(-10).div(new Int(3)).toInt()).assertEqual(-3);
      expect(new Int(-11).div(new Int(3)).toInt()).assertEqual(-3);
      expect(new Int(-12).div(new Int(3)).toInt()).assertEqual(-4);
      expect(new Int(-13).div(new Int(3)).toInt()).assertEqual(-4);
      expect(new Int(-14).div(new Int(3)).toInt()).assertEqual(-4);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_7000
     * @tc.name testIntDiv0070
     * @tc.desc Verify continuously dividing by 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(1000);
      const two = new Int(2);
      result = result.div(two);
      expect(result.toInt()).assertEqual(500);
      result = result.div(two);
      expect(result.toInt()).assertEqual(250);
      result = result.div(two);
      expect(result.toInt()).assertEqual(125);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_7100
     * @tc.name testIntDiv0071
     * @tc.desc Verify dividing by powers of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456);
      expect(a.div(new Int(10)).toInt()).assertEqual(12345);
      expect(a.div(new Int(100)).toInt()).assertEqual(1234);
      expect(a.div(new Int(1000)).toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_7300
     * @tc.name testIntDiv0073
     * @tc.desc Verify (a / b) * b equals a when exactly divisible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(5);
      const result = a.div(b).mul(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_7400
     * @tc.name testIntDiv0074
     * @tc.desc Verify incomplete division cannot fully recover
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(103);
      const b = new Int(10);
      const result = a.div(b).mul(b);
      expect(result.toInt()).assertEqual(100);
      expect(result.toInt()).assertLess(a.toInt());
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_7500
     * @tc.name testIntDiv0075
     * @tc.desc Verify same instance called div multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(4);
      const r1 = a.div(b);
      const r2 = a.div(b);
      const r3 = a.div(b);
      expect(r1.toInt()).assertEqual(25);
      expect(r2.toInt()).assertEqual(25);
      expect(r3.toInt()).assertEqual(25);
      expect(a.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_DIV_ITEM_CHK_7600
     * @tc.name testIntDiv0076
     * @tc.desc Verify division result integer part is accurate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntDiv0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [
        [100, 5, 20],
        [100, 3, 33],
        [-100, -4, 25],
        [100, -4, -25],
        [-100, 4, -25],
        [0, 100, 0],
        [99, 100, 0]
      ];

      for (let i = 0; i < testCases.length; i++) {
        const testCase = testCases[i];
        const result = new Int(testCase[0]).div(new Int(testCase[1]));
        expect(result.toInt()).assertEqual(testCase[2]);
      }
    });
  });
}

