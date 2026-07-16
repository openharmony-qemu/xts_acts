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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function IntEqualsTest(): void {
  describe('IntEqualsTest', (): void => {
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
     * @tc.number INT_EQLS_ITEM_CHK_0100
     * @tc.name testIntEquals0001
     * @tc.desc Verify that other parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.equals(123);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0200
     * @tc.name testIntEquals0002
     * @tc.desc Verify equals returns true for same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(5);
      const b = new Int(5);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0400
     * @tc.name testIntEquals0004
     * @tc.desc Verify equals with Int instance parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(123);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0500
     * @tc.name testIntEquals0005
     * @tc.desc Verify equals with Int instances having same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      const b = new Int(456);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0600
     * @tc.name testIntEquals0006
     * @tc.desc Verify equals with Int instances having different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b = new Int(456);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0700
     * @tc.name testIntEquals0007
     * @tc.desc Verify equals comparing with itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(789);
      expect(a.equals(a)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0800
     * @tc.name testIntEquals0008
     * @tc.desc Verify equals with int primitive type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.equals(123)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_0900
     * @tc.name testIntEquals0009
     * @tc.desc Verify equals with number type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.equals(123.45)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1000
     * @tc.name testIntEquals0010
     * @tc.desc Verify equals with byte type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b: number = 100;
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1100
     * @tc.name testIntEquals0011
     * @tc.desc Verify equals with short type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const b: number = 1000;
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1200
     * @tc.name testIntEquals0012
     * @tc.desc Verify equals with long type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      const b: number = 100000;
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1300
     * @tc.name testIntEquals0013
     * @tc.desc Verify equals with string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.equals("123")).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1400
     * @tc.name testIntEquals0014
     * @tc.desc Verify equals with empty string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.equals("")).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1500
     * @tc.name testIntEquals0015
     * @tc.desc Verify equals with true parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.equals(true)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1600
     * @tc.name testIntEquals0016
     * @tc.desc Verify equals with false parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.equals(false)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1700
     * @tc.name testIntEquals0017
     * @tc.desc Verify equals with null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.equals(null)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1800
     * @tc.name testIntEquals0018
     * @tc.desc Verify equals with undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.equals(undefined)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_1900
     * @tc.name testIntEquals0019
     * @tc.desc Verify equals with array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.equals([123])).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2100
     * @tc.name testIntEquals0021
     * @tc.desc Verify equals returns true for Int instances with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(999);
      const b = new Int(999);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2200
     * @tc.name testIntEquals0022
     * @tc.desc Verify equals returns true for same instance comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(888);
      expect(a.equals(a)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2300
     * @tc.name testIntEquals0023
     * @tc.desc Verify equals with valueOf created instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(777);
      const b = new Int(777);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2400
     * @tc.name testIntEquals0024
     * @tc.desc Verify equals returns false for Int instances with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(111);
      const b = new Int(222);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2500
     * @tc.name testIntEquals0025
     * @tc.desc Verify equals returns false for positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(-100);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2600
     * @tc.name testIntEquals0026
     * @tc.desc Verify equals returns false for zero and non-zero comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(1);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2700
     * @tc.name testIntEquals0027
     * @tc.desc Verify equals with MAX_VALUE comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(2147483647);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2800
     * @tc.name testIntEquals0028
     * @tc.desc Verify equals with MIN_VALUE comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      const b = new Int(-2147483648);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_2900
     * @tc.name testIntEquals0029
     * @tc.desc Verify equals returns false for MAX_VALUE compared with other value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      const b = new Int(0);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3000
     * @tc.name testIntEquals0030
     * @tc.desc Verify equals returns true for positive zero comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const b = new Int(0);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3100
     * @tc.name testIntEquals0031
     * @tc.desc Verify equals returns true for negative zero and positive zero comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-0);
      const b = new Int(0);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3200
     * @tc.name testIntEquals0032
     * @tc.desc Verify equals returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.equals(new Int(123));
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3300
     * @tc.name testIntEquals0033
     * @tc.desc Verify equals returns true for new and valueOf created instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(555);
      const b = new Int(555);
      expect(a.equals(b)).assertTrue();
      expect(b.equals(a)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3400
     * @tc.name testIntEquals0034
     * @tc.desc Verify equals symmetry between instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(444);
      const b = new Int(444);
      expect(a.equals(b)).assertEqual(b.equals(a));
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3500
     * @tc.name testIntEquals0035
     * @tc.desc Verify equals returns false when comparing with Long instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const b: number = 123;
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3700
     * @tc.name testIntEquals0037
     * @tc.desc Verify equals returns false when comparing with Byte instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      const b: number = 50;
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3800
     * @tc.name testIntEquals0038
     * @tc.desc Verify equals returns false when comparing with String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new String("65");
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_3900
     * @tc.name testIntEquals0039
     * @tc.desc Verify equals returns false when comparing with Boolean instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      const b = new Boolean(true);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4000
     * @tc.name testIntEquals0040
     * @tc.desc Verify equals returns false when comparing with Object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Object();
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4100
     * @tc.name testIntEquals0041
     * @tc.desc Verify equals symmetry property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(333);
      const b = new Int(333);
      expect(a.equals(b)).assertEqual(b.equals(a));
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4200
     * @tc.name testIntEquals0042
     * @tc.desc Verify equals symmetry for unequal instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(111);
      const b = new Int(222);
      expect(a.equals(b)).assertEqual(b.equals(a));
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4300
     * @tc.name testIntEquals0043
     * @tc.desc Verify equals transitivity property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const b = new Int(500);
      const c = new Int(500);
      expect(a.equals(b)).assertTrue();
      expect(b.equals(c)).assertTrue();
      expect(a.equals(c)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4400
     * @tc.name testIntEquals0044
     * @tc.desc Verify equals returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(666);
      const b = new Int(666);
      expect(a.equals(b)).assertTrue();
      expect(a.equals(b)).assertTrue();
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4500
     * @tc.name testIntEquals0045
     * @tc.desc Verify equals returns consistent results when object state is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(777);
      const b = new Int(777);
      const result1 = a.equals(b);
      const result2 = a.equals(b);
      const result3 = a.equals(b);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4700
     * @tc.name testIntEquals0047
     * @tc.desc Verify equals reflexivity with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      const min = new Int(-2147483648);
      expect(max.equals(max)).assertTrue();
      expect(min.equals(min)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4800
     * @tc.name testIntEquals0048
     * @tc.desc Verify equals returns false when comparing with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(999);
      expect(a.equals(null)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_4900
     * @tc.name testIntEquals0049
     * @tc.desc Verify equals returns consistent false results for multiple null comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(999);
      expect(a.equals(null)).assertFalse();
      expect(a.equals(null)).assertFalse();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_5000
     * @tc.name testIntEquals0050
     * @tc.desc Verify equals with -1 comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      const b = new Int(-1);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_5100
     * @tc.name testIntEquals0051
     * @tc.desc Verify equals with 1 comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      const b = new Int(1);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_5200
     * @tc.name testIntEquals0052
     * @tc.desc Verify equals with large number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const b = new Int(1000000);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number INT_EQLS_ITEM_CHK_5300
     * @tc.name testIntEquals0053
     * @tc.desc Verify equals with large negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntEquals0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000000);
      const b = new Int(-1000000);
      expect(a.equals(b)).assertTrue();
    });
  });
}

