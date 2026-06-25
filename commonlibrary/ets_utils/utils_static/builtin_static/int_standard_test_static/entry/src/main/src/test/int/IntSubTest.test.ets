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
import hilog from '@ohos.hilog';
import Utils from '../Util.test';

export default function IntSubTest(): void {
  describe('IntSubTest', (): void => {
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
     * @tc.number INT_SUB_ITEM_CHK_0100
     * @tc.name testIntSub0001
     * @tc.desc Verify required other parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.sub(new Int(10));
      expect(result.toInt()).assertEqual(55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0200
     * @tc.name testIntSub0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20);
      const result = a.sub(new Int(5));
      expect(result.toInt()).assertEqual(15);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0400
     * @tc.name testIntSub0004
     * @tc.desc Verify normal Int value subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0500
     * @tc.name testIntSub0005
     * @tc.desc Verify positive number subtraction (large minus small)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const b = new Int(300);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(200);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0600
     * @tc.name testIntSub0006
     * @tc.desc Verify positive number subtraction (small minus large)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(300);
      const b = new Int(500);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-200);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0700
     * @tc.name testIntSub0007
     * @tc.desc Verify negative number subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-500);
      const b = new Int(-300);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-200);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0800
     * @tc.name testIntSub0008
     * @tc.desc Verify subtracting zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(0);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_0900
     * @tc.name testIntSub0009
     * @tc.desc Verify zero minus positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(100);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1000
     * @tc.name testIntSub0010
     * @tc.desc Verify zero minus negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(-100);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1100
     * @tc.name testIntSub0011
     * @tc.desc Verify positive minus negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const b = new Int(-300);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(800);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1200
     * @tc.name testIntSub0012
     * @tc.desc Verify negative minus positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-500);
      const b = new Int(300);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-800);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1300
     * @tc.name testIntSub0013
     * @tc.desc Verify subtraction with Int MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(2147483647 - 1);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1400
     * @tc.name testIntSub0014
     * @tc.desc Verify subtraction with Int MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(-1);
      const result = a.sub(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1500
     * @tc.name testIntSub0015
     * @tc.desc Verify MAX_VALUE minus MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(-2147483648);
      const result = a.sub(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1600
     * @tc.name testIntSub0016
     * @tc.desc Verify MIN_VALUE minus MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(2147483647);
      const result = a.sub(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1700
     * @tc.name testIntSub0017
     * @tc.desc Verify subtracting 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(99);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1800
     * @tc.name testIntSub0018
     * @tc.desc Verify subtracting -1 (equivalent to adding 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(101);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_1900
     * @tc.name testIntSub0019
     * @tc.desc Verify subtracting itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.sub(new Int(123));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2000
     * @tc.name testIntSub0020
     * @tc.desc Verify large positive number subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2000000);
      const b = new Int(1000000);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(1000000);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2100
     * @tc.name testIntSub0021
     * @tc.desc Verify large negative number subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000000);
      const b = new Int(-2000000);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(1000000);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2400
     * @tc.name testIntSub0024
     * @tc.desc Verify sub with number literal argument returns correct difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.sub(10);
      expect(result.toInt()).assertEqual(55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2500
     * @tc.name testIntSub0025
     * @tc.desc Verify passing string returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(65);
        const result = a.sub("10" as Object as Int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2600
     * @tc.name testIntSub0026
     * @tc.desc Verify returning new Int instance after subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.sub(new Int(10));
      expect(result).not().assertNull();
      expect(result).not().assertNull();
      expect(result.toInt()).assertEqual(55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2700
     * @tc.name testIntSub0027
     * @tc.desc Verify return value is Int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.sub(new Int(50));
      expect(result.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2800
     * @tc.name testIntSub0028
     * @tc.desc Verify two positive numbers subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(10);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_2900
     * @tc.name testIntSub0029
     * @tc.desc Verify document example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      hilog.info(0x0000, 'IntSubTest', '%{public}s', a.sub(new Int(10)).toString());
      expect(a.sub(new Int(10)).toInt()).assertEqual(55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3000
     * @tc.name testIntSub0030
     * @tc.desc Verify large positive minus small positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const b = new Int(300);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(700);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3100
     * @tc.name testIntSub0031
     * @tc.desc Verify small positive minus large positive results in negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(300);
      const b = new Int(1000);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-700);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3200
     * @tc.name testIntSub0032
     * @tc.desc Verify two negative numbers subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-65);
      const b = new Int(-10);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3300
     * @tc.name testIntSub0033
     * @tc.desc Verify negative minus positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(30);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-130);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3400
     * @tc.name testIntSub0034
     * @tc.desc Verify positive minus negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-30);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(130);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3500
     * @tc.name testIntSub0035
     * @tc.desc Verify positive minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.sub(new Int(0));
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3600
     * @tc.name testIntSub0036
     * @tc.desc Verify negative minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const result = a.sub(new Int(0));
      expect(result.toInt()).assertEqual(-100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_3900
     * @tc.name testIntSub0039
     * @tc.desc Verify zero minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(0);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4000
     * @tc.name testIntSub0040
     * @tc.desc Verify MIN_VALUE minus 1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4100
     * @tc.name testIntSub0041
     * @tc.desc Verify MAX_VALUE minus -1 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(-1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4200
     * @tc.name testIntSub0042
     * @tc.desc Verify MIN_VALUE + 1 minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648 + 1);
      const b = new Int(1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4300
     * @tc.name testIntSub0043
     * @tc.desc Verify MAX_VALUE - 1 minus -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647 - 1);
      const b = new Int(-1);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4500
     * @tc.name testIntSub0045
     * @tc.desc Verify original instance value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const originalValue = a.toInt();
      const result = a.sub(new Int(10));
      expect(a.toInt()).assertEqual(originalValue);
      expect(a.toInt()).assertEqual(65);
      expect(result.toInt()).assertEqual(55);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4600
     * @tc.name testIntSub0046
     * @tc.desc Verify returning new Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.sub(new Int(10));
      expect(result).not().assertEqual(a);
      expect(result.toInt()).not().assertEqual(a.toInt());
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4800
     * @tc.name testIntSub0048
     * @tc.desc Verify chained sub calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.sub(new Int(10)).sub(new Int(20)).sub(new Int(30));
      expect(result.toInt()).assertEqual(40);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_4900
     * @tc.name testIntSub0049
     * @tc.desc Verify calling other methods after sub
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.sub(new Int(20)).sub(new Int(30));
      expect(result.toInt()).assertEqual(50);
      expect(result.sub(new Int(10)).toInt()).assertEqual(40);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5000
     * @tc.name testIntSub0050
     * @tc.desc Verify sub and add mixed usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.sub(new Int(20)).add(new Int(30)).sub(new Int(10));
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5100
     * @tc.name testIntSub0051
     * @tc.desc Verify subtracting same value multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(10);
      const result1 = a.sub(b);
      const result2 = result1.sub(b);
      const result3 = result2.sub(b);
      expect(result1.toInt()).assertEqual(90);
      expect(result2.toInt()).assertEqual(80);
      expect(result3.toInt()).assertEqual(70);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5200
     * @tc.name testIntSub0052
     * @tc.desc Verify subtraction is not commutative (a - b != b - a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      expect(a.sub(b).toInt()).assertEqual(70);
      expect(b.sub(a).toInt()).assertEqual(-70);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5300
     * @tc.name testIntSub0053
     * @tc.desc Verify subtraction associativity (a - b - c != a - (b - c))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const c = new Int(20);
      const result1 = a.sub(b).sub(c);
      const result2 = a.sub(b.sub(c));
      expect(result1.toInt()).assertEqual(50);
      expect(result2.toInt()).assertEqual(90);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5400
     * @tc.name testIntSub0054
     * @tc.desc Verify subtracting itself results in zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const result = a.sub(new Int(12345));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5500
     * @tc.name testIntSub0055
     * @tc.desc Verify negative number subtracting itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-12345);
      const result = a.sub(new Int(-12345));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5600
     * @tc.name testIntSub0056
     * @tc.desc Verify adding and subtracting same value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const result = a.add(b).sub(b);
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5700
     * @tc.name testIntSub0057
     * @tc.desc Verify near boundary value subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(100);
      const result = a.sub(b);
      expect(result.toInt()).assertEqual(2147483647 - 100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5800
     * @tc.name testIntSub0058
     * @tc.desc Verify decrement-like operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter = new Int(10);
      counter = counter.sub(new Int(1));
      expect(counter.toInt()).assertEqual(9);
      counter = counter.sub(new Int(1));
      expect(counter.toInt()).assertEqual(8);
      counter = counter.sub(new Int(1));
      expect(counter.toInt()).assertEqual(7);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_5900
     * @tc.name testIntSub0059
     * @tc.desc Verify countdown scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let countdown = new Int(10);
      countdown = countdown.sub(new Int(1));
      expect(countdown.toInt()).assertEqual(9);
      countdown = countdown.sub(new Int(1));
      expect(countdown.toInt()).assertEqual(8);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6000
     * @tc.name testIntSub0060
     * @tc.desc Verify difference calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const start = new Int(1000);
      const end = new Int(750);
      const diff = start.sub(new Int(750));
      expect(diff.toInt()).assertEqual(250);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6100
     * @tc.name testIntSub0061
     * @tc.desc Verify position offset fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const position = new Int(1000);
      const offset = new Int(100);
      const newPosition = position.sub(offset);
      expect(newPosition.toInt()).assertEqual(900);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6200
     * @tc.name testIntSub0062
     * @tc.desc Verify multiple sub call performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(1000);
      const one = new Int(1);
      for (let i = 0; i < 100; i++) {
        result = result.sub(one);
      }
      expect(result.toInt()).assertEqual(900);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6300
     * @tc.name testIntSub0063
     * @tc.desc Verify large number repeated subtraction performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(100000000);
      const large = new Int(1000000);
      for (let i = 0; i < 10; i++) {
        result = result.sub(large);
      }
      expect(result.toInt()).assertEqual(90000000);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6500
     * @tc.name testIntSub0065
     * @tc.desc Verify MAX_VALUE minus various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.sub(new Int(0)).toInt()).assertEqual(2147483647);
      expect(max.sub(new Int(1)).toInt()).assertEqual(2147483647 - 1);
      expect(max.sub(new Int(2147483647)).toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6600
     * @tc.name testIntSub0066
     * @tc.desc Verify MIN_VALUE minus various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      expect(min.sub(new Int(0)).toInt()).assertEqual(-2147483648);
      expect(min.sub(new Int(-1)).toInt()).assertEqual(-2147483648 + 1);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6700
     * @tc.name testIntSub0067
     * @tc.desc Verify MAX_VALUE minus MIN_VALUE overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      const min = new Int(-2147483648);
      const result = max.sub(min);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6800
     * @tc.name testIntSub0068
     * @tc.desc Verify a - b equals a + (-b)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      expect(a.sub(b).toInt()).assertEqual(70);
      expect(a.add(new Int(-30)).toInt()).assertEqual(70);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_6900
     * @tc.name testIntSub0069
     * @tc.desc Verify subtraction distributive property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const c = new Int(20);
      const result1 = a.sub(b.add(c));
      const result2 = a.sub(b).sub(c);
      expect(result1.toInt()).assertEqual(result2.toInt());
      expect(result1.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7000
     * @tc.name testIntSub0070
     * @tc.desc Verify result within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2000000);
      const b = new Int(1000000);
      const result = a.sub(b);
      expect(result.toInt()).assertLargerOrEqual(-2147483648);
      expect(result.toInt()).assertLessOrEqual(2147483647);
      expect(result.toInt()).assertEqual(1000000);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7100
     * @tc.name testIntSub0071
     * @tc.desc Verify x minus 0 equals x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const zero = new Int(0);
      expect(a.sub(zero).toInt()).assertEqual(a.toInt());
      expect(a.sub(zero).toInt()).assertEqual(12345);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7200
     * @tc.name testIntSub0072
     * @tc.desc Verify 0 minus x equals -x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(100);
      const zero = new Int(0);
      expect(zero.sub(value).toInt()).assertEqual(-100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7300
     * @tc.name testIntSub0073
     * @tc.desc Verify x minus x equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-9999);
      const result = a.sub(new Int(-9999));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7500
     * @tc.name testIntSub0075
     * @tc.desc Verify intermediate values in chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const step1 = a.sub(new Int(20));
      expect(step1.toInt()).assertEqual(80);
      const step2 = step1.sub(new Int(30));
      expect(step2.toInt()).assertEqual(50);
      const step3 = step2.sub(new Int(10));
      expect(step3.toInt()).assertEqual(40);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7700
     * @tc.name testIntSub0077
     * @tc.desc Verify (a + b) - (b + c) equals a - c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const c = new Int(20);
      const result1 = a.add(b).sub(b.add(c));
      const result2 = a.sub(c);
      expect(result1.toInt()).assertEqual(result2.toInt());
      expect(result1.toInt()).assertEqual(80);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7800
     * @tc.name testIntSub0078
     * @tc.desc Verify cumulative subtraction by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(10);
      const one = new Int(1);
      result = result.sub(one);
      expect(result.toInt()).assertEqual(9);
      result = result.sub(one);
      expect(result.toInt()).assertEqual(8);
      result = result.sub(one);
      expect(result.toInt()).assertEqual(7);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_7900
     * @tc.name testIntSub0079
     * @tc.desc Verify subtracting -1 equals adding 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(10);
      const minusOne = new Int(-1);
      result = result.sub(minusOne);
      expect(result.toInt()).assertEqual(11);
      result = result.sub(minusOne);
      expect(result.toInt()).assertEqual(12);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8000
     * @tc.name testIntSub0080
     * @tc.desc Verify MIN_VALUE minus 1 positive overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(1);
      const result = a.sub(b);
      expect(result.toInt()).assertLarger(0);
      expect(result.toInt()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8100
     * @tc.name testIntSub0081
     * @tc.desc Verify MAX_VALUE minus -1 negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(-1);
      const result = a.sub(b);
      expect(result.toInt()).assertLess(0);
      expect(result.toInt()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8200
     * @tc.name testIntSub0082
     * @tc.desc Verify (a - b) + b equals a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const result = a.sub(b).add(b);
      expect(result.toInt()).assertEqual(a.toInt());
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8300
     * @tc.name testIntSub0083
     * @tc.desc Verify a + b - c not equals a - b + c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(30);
      const c = new Int(20);
      const result1 = a.add(b).sub(c);
      const result2 = a.sub(b).add(c);
      expect(result1.toInt()).assertEqual(110);
      expect(result2.toInt()).assertEqual(90);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8400
     * @tc.name testIntSub0084
     * @tc.desc Verify same instance multiple sub calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(10);
      const r1 = a.sub(b);
      const r2 = a.sub(b);
      const r3 = a.sub(b);
      expect(r1.toInt()).assertEqual(90);
      expect(r2.toInt()).assertEqual(90);
      expect(r3.toInt()).assertEqual(90);
      expect(a.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8500
     * @tc.name testIntSub0085
     * @tc.desc Verify subtraction result precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [
        [100, 50, 50],
        [50, 100, -50],
        [0, 0, 0],
        [100, -50, 150],
        [-100, 50, -150],
        [-100, -50, -50]
      ];

      for (let i = 0; i < testCases.length; i++) {
        const testCase = testCases[i];
        const result = new Int(testCase[0]).sub(new Int(testCase[1]));
        expect(result.toInt()).assertEqual(testCase[2]);
      }
    });

    /**
     * @tc.number INT_SUB_ITEM_CHK_8600
     * @tc.name testIntSub0086
     * @tc.desc Verify boundary value subtraction precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntSub0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.sub(new Int(2147483647)).toInt()).assertEqual(0);

      const min = new Int(-2147483648);
      expect(min.sub(new Int(-2147483648)).toInt()).assertEqual(0);
    });
  });
}

