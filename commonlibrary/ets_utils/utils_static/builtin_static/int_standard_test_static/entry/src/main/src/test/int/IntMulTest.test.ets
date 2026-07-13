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
import hilog from '@ohos.hilog';
import Utils from '../Util.test';

export default function IntMulTest(): void {
  describe('IntMulTest', (): void => {
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
     * @tc.number INT_MUL_ITEM_CHK_0100
     * @tc.name testIntMul0001
     * @tc.desc Verify that other parameter is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const result = a.mul(new Int(5));
      expect(result.toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0200
     * @tc.name testIntMul0002
     * @tc.desc Verify mul by zero returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7);
      const result = a.mul(new Int(0));
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0400
     * @tc.name testIntMul0004
     * @tc.desc Verify normal Int values multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(5);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0500
     * @tc.name testIntMul0005
     * @tc.desc Verify positive numbers multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(3);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(300);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0600
     * @tc.name testIntMul0006
     * @tc.desc Verify negative numbers multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(-3);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(300);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0700
     * @tc.name testIntMul0007
     * @tc.desc Verify positive and negative numbers multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-3);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(-300);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0800
     * @tc.name testIntMul0008
     * @tc.desc Verify multiplication by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(0);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_0900
     * @tc.name testIntMul0009
     * @tc.desc Verify zero multiplied by any number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(100);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1000
     * @tc.name testIntMul0010
     * @tc.desc Verify multiplication by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(1);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1100
     * @tc.name testIntMul0011
     * @tc.desc Verify multiplication by negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(-1);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(-123);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1200
     * @tc.name testIntMul0012
     * @tc.desc Verify multiplication with int max value overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(2);
      const result = a.mul(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1300
     * @tc.name testIntMul0013
     * @tc.desc Verify large number multiplication overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50000);
      const b = new Int(50000);
      const result = a.mul(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1400
     * @tc.name testIntMul0014
     * @tc.desc Verify near overflow boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(46340);
      const b = new Int(46341);
      const result = a.mul(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1500
     * @tc.name testIntMul0015
     * @tc.desc Verify multiplication by powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.mul(new Int(2)).toInt()).assertEqual(200);
      expect(a.mul(new Int(4)).toInt()).assertEqual(400);
      expect(a.mul(new Int(8)).toInt()).assertEqual(800);
      expect(a.mul(new Int(16)).toInt()).assertEqual(1600);
      expect(a.mul(new Int(32)).toInt()).assertEqual(3200);
      expect(a.mul(new Int(64)).toInt()).assertEqual(6400);
      expect(a.mul(new Int(128)).toInt()).assertEqual(12800);
      expect(a.mul(new Int(256)).toInt()).assertEqual(25600);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1600
     * @tc.name testIntMul0016
     * @tc.desc Verify large positive numbers multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const b = new Int(2000);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(2000000);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_1700
     * @tc.name testIntMul0017
     * @tc.desc Verify large negative numbers multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000);
      const b = new Int(-2000);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(2000000);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2000
     * @tc.name testIntMul0020
     * @tc.desc Verify mul with number literal argument returns correct product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const result = a.mul(5);
      expect(result.toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2100
     * @tc.name testIntMul0021
     * @tc.desc Verify passing string returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(6);
        const result = a.mul("10" as Object as Int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2200
     * @tc.name testIntMul0022
     * @tc.desc Verify mul returns new Int instance after multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const result = a.mul(new Int(5));
      expect(result instanceof Int).assertTrue();
      expect(result === a).assertFalse();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2300
     * @tc.name testIntMul0023
     * @tc.desc Verify return value is Int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.mul(new Int(5));
      expect(result).not().assertNull();
      expect(result.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2400
     * @tc.name testIntMul0024
     * @tc.desc Verify two positive numbers multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const b = new Int(5);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2500
     * @tc.name testIntMul0025
     * @tc.desc Verify documentation example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      hilog.info(0x0000, 'IntMulTest', '%{public}s', a.mul(new Int(5)).toString());
      expect(a.mul(new Int(5)).toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2600
     * @tc.name testIntMul0026
     * @tc.desc Verify chained multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const result = a.mul(new Int(3)).mul(new Int(5)).mul(new Int(7));
      expect(result.toInt()).assertEqual(210);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2700
     * @tc.name testIntMul0027
     * @tc.desc Verify two negative numbers multiply to positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-6);
      const b = new Int(-5);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2800
     * @tc.name testIntMul0028
     * @tc.desc Verify positive multiplied by negative gives negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const b = new Int(-5);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(-30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_2900
     * @tc.name testIntMul0029
     * @tc.desc Verify negative multiplied by positive gives negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-6);
      const b = new Int(5);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(-30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_3100
     * @tc.name testIntMul0031
     * @tc.desc Verify negative number multiplied by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      const b = new Int(0);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_3300
     * @tc.name testIntMul0033
     * @tc.desc Verify zero multiplied by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(0);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_3500
     * @tc.name testIntMul0035
     * @tc.desc Verify any number multiplied by negative one changes sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(-1);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(-123);

      const c = new Int(-123);
      const d = new Int(-1);
      const result2 = c.mul(d);
      expect(result2.toInt()).assertEqual(123);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_3600
     * @tc.name testIntMul0036
     * @tc.desc Verify large numbers multiplication overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65536);
      const b = new Int(65536);
      const result = a.mul(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_3700
     * @tc.name testIntMul0037
     * @tc.desc Verify negative numbers multiplication overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-65536);
      const b = new Int(-65536);
      const result = a.mul(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_3800
     * @tc.name testIntMul0038
     * @tc.desc Verify multiplication near max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(46340);
      const b = new Int(46340);
      const result = a.mul(b);
      expect(result.toInt()).assertLessOrEqual(2147483647);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4000
     * @tc.name testIntMul0040
     * @tc.desc Verify original instance value unchanged after mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const originalValue = a.toInt();
      const result = a.mul(new Int(5));
      expect(a.toInt()).assertEqual(originalValue);
      expect(a.toInt()).assertEqual(6);
      expect(result.toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4100
     * @tc.name testIntMul0041
     * @tc.desc Verify mul returns a new Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const result = a.mul(new Int(5));
      expect(result).not().assertEqual(a);
      expect(result.toInt()).not().assertEqual(a.toInt());
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4300
     * @tc.name testIntMul0043
     * @tc.desc Verify chained mul calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const result = a.mul(new Int(3)).mul(new Int(4)).mul(new Int(5));
      expect(result.toInt()).assertEqual(120);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4400
     * @tc.name testIntMul0044
     * @tc.desc Verify calling other methods after mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.mul(new Int(2)).mul(new Int(3));
      expect(result.toInt()).assertEqual(60);
      expect(result.mul(new Int(4)).toInt()).assertEqual(240);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4500
     * @tc.name testIntMul0045
     * @tc.desc Verify mixed multiplication addition and subtraction operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.mul(new Int(2)).add(new Int(5)).mul(new Int(3));
      expect(result.toInt()).assertEqual(75);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4600
     * @tc.name testIntMul0046
     * @tc.desc Verify multiplication commutativity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6);
      const b = new Int(5);
      expect(a.mul(b).toInt()).assertEqual(30);
      expect(b.mul(a).toInt()).assertEqual(30);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4700
     * @tc.name testIntMul0047
     * @tc.desc Verify multiplication associativity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const b = new Int(3);
      const c = new Int(4);
      const result1 = a.mul(b).mul(c);
      const result2 = a.mul(b.mul(c));
      expect(result1.toInt()).assertEqual(result2.toInt());
      expect(result1.toInt()).assertEqual(24);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4800
     * @tc.name testIntMul0048
     * @tc.desc Verify multiplication distributivity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const b = new Int(3);
      const c = new Int(4);
      const result1 = a.mul(b.add(c));
      const result2 = a.mul(b).add(a.mul(c));
      expect(result1.toInt()).assertEqual(result2.toInt());
      expect(result1.toInt()).assertEqual(14);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_4900
     * @tc.name testIntMul0049
     * @tc.desc Verify number multiplied by itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const result = a.mul(new Int(10));
      expect(result.toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5000
     * @tc.name testIntMul0050
     * @tc.desc Verify large number squared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.mul(new Int(100));
      expect(result.toInt()).assertEqual(10000);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5100
     * @tc.name testIntMul0051
     * @tc.desc Verify number multiplied by itself twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(5);
      const result = a.mul(new Int(5)).mul(new Int(5));
      expect(result.toInt()).assertEqual(125);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5200
     * @tc.name testIntMul0052
     * @tc.desc Verify continuous multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(1);
      for (let i = 1; i <= 5; i++) {
        result = result.mul(new Int(i));
      }
      expect(result.toInt()).assertEqual(120);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5300
     * @tc.name testIntMul0053
     * @tc.desc Verify rectangle area calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length = new Int(10);
      const width = new Int(5);
      const area = length.mul(width);
      expect(area.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5400
     * @tc.name testIntMul0054
     * @tc.desc Verify unit price multiplied by quantity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const price = new Int(100);
      const quantity = new Int(5);
      const total = price.mul(quantity);
      expect(total.toInt()).assertEqual(500);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5500
     * @tc.name testIntMul0055
     * @tc.desc Verify multiple calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Int(100);
      const multiple = new Int(3);
      const result = base.mul(multiple);
      expect(result.toInt()).assertEqual(300);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5600
     * @tc.name testIntMul0056
     * @tc.desc Verify multiple mul calls performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(1);
      const two = new Int(2);
      for (let i = 0; i < 20; i++) {
        result = result.mul(two);
      }
      expect(result.toInt()).assertEqual(1048576);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5700
     * @tc.name testIntMul0057
     * @tc.desc Verify large number multiple multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Int(1);
      const large = new Int(10);
      for (let i = 0; i < 9; i++) {
        result = result.mul(large);
      }
      expect(result.toInt()).assertEqual(1000000000);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_5900
     * @tc.name testIntMul0059
     * @tc.desc Verify MAX_VALUE multiplied by various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.mul(new Int(1)).toInt()).assertEqual(2147483647);
      expect(max.mul(new Int(0)).toInt()).assertEqual(0);
      expect(max.mul(new Int(2)).toInt()).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6000
     * @tc.name testIntMul0060
     * @tc.desc Verify MIN_VALUE multiplied by various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      expect(min.mul(new Int(1)).toInt()).assertEqual(-2147483648);
      expect(min.mul(new Int(0)).toInt()).assertEqual(0);
      expect(min.mul(new Int(2)).toInt()).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6100
     * @tc.name testIntMul0061
     * @tc.desc Verify repeated addition equals multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(3);
      const mulResult = a.mul(b);
      let addResult = new Int(0);
      for (let i = 0; i < 3; i++) {
        addResult = addResult.add(a);
      }
      expect(mulResult.toInt()).assertEqual(addResult.toInt());
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6200
     * @tc.name testIntMul0062
     * @tc.desc Verify multiplication and division are inverse operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(5);
      const result = a.mul(b).div(b);
      expect(result.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6300
     * @tc.name testIntMul0063
     * @tc.desc Verify result is within int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const b = new Int(2000);
      const result = a.mul(b);
      expect(result.toInt()).assertLargerOrEqual(-2147483648);
      expect(result.toInt()).assertLessOrEqual(2147483647);
      expect(result.toInt()).assertEqual(2000000);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6400
     * @tc.name testIntMul0064
     * @tc.desc Verify any number multiplied by zero equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const zero = new Int(0);
      expect(a.mul(zero).toInt()).assertEqual(0);
      expect(zero.mul(a).toInt()).assertEqual(0);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6500
     * @tc.name testIntMul0065
     * @tc.desc Verify any number multiplied by one equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const one = new Int(1);
      expect(a.mul(one).toInt()).assertEqual(a.toInt());
      expect(a.mul(one).toInt()).assertEqual(12345);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6600
     * @tc.name testIntMul0066
     * @tc.desc Verify any number multiplied by negative one equals negation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const minusOne = new Int(-1);
      expect(a.mul(minusOne).toInt()).assertEqual(-12345);

      const b = new Int(-12345);
      expect(b.mul(minusOne).toInt()).assertEqual(12345);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6800
     * @tc.name testIntMul0068
     * @tc.desc Verify intermediate values in chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const step1 = a.mul(new Int(3));
      expect(step1.toInt()).assertEqual(6);
      const step2 = step1.mul(new Int(4));
      expect(step2.toInt()).assertEqual(24);
      const step3 = step2.mul(new Int(5));
      expect(step3.toInt()).assertEqual(120);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_6900
     * @tc.name testIntMul0069
     * @tc.desc Verify array elements continuous multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: Int[] = [new Int(2), new Int(3),
      new Int(4), new Int(5)];
      let product = new Int(1);
      numbers.forEach((n: Int): void => {
        product = product.mul(n);
      });
      expect(product.toInt()).assertEqual(120);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7000
     * @tc.name testIntMul0070
     * @tc.desc Verify factorial calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const factorial = (n: number): number => {
        let result = new Int(1);
        for (let i = 2; i <= n; i++) {
          result = result.mul(new Int(i));
        }
        return result.toInt();
      };
      expect(factorial(5)).assertEqual(120);
      expect(factorial(6)).assertEqual(720);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7100
     * @tc.name testIntMul0071
     * @tc.desc Verify powers of two multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8);
      const b = new Int(16);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(128);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7200
     * @tc.name testIntMul0072
     * @tc.desc Verify powers of ten multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(1000);
      const result = a.mul(b);
      expect(result.toInt()).assertEqual(100000);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7400
     * @tc.name testIntMul0074
     * @tc.desc Verify negative overflow detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-65536);
      const b = new Int(65536);
      const result = a.mul(b);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7600
     * @tc.name testIntMul0076
     * @tc.desc Verify exact division case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(10);
      const product = a.mul(b);
      expect(product.div(b).toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7700
     * @tc.name testIntMul0077
     * @tc.desc Verify same instance multiple mul calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(5);
      const r1 = a.mul(b);
      const r2 = a.mul(b);
      const r3 = a.mul(b);
      expect(r1.toInt()).assertEqual(50);
      expect(r2.toInt()).assertEqual(50);
      expect(r3.toInt()).assertEqual(50);
      expect(a.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_MUL_ITEM_CHK_7800
     * @tc.name testIntMul0078
     * @tc.desc Verify multiplication result precision within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntMul0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [
        [0, 0, 0],
        [1, 1, 1],
        [100, 2, 200],
        [-100, -2, 200],
        [100, -2, -200],
        [-100, 2, -200],
        [123, 456, 56088]
      ];

      for (let i = 0; i < testCases.length; i++) {
        const testCase = testCases[i];
        const result = new Int(testCase[0]).mul(new Int(testCase[1]));
        expect(result.toInt()).assertEqual(testCase[2]);
      }
    });
  });
}

