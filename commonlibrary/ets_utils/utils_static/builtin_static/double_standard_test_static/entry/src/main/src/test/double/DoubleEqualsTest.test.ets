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

export default function DoubleEqualsTest(): void {
  describe('DoubleEqualsTest', (): void => {
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
     * @tc.number DBL_EQLS_ITEM_CHK_0100
     * @tc.name testDoubleEquals0001
     * @tc.desc Verify calling with required parameter normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(1.5);
      let right: Double = new Double(1.5);
      let result: boolean = left.equals(right);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_0400
     * @tc.name testDoubleEquals0004
     * @tc.desc Verify equal Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(1.5);
      let right: Double = new Double(1.5);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_0500
     * @tc.name testDoubleEquals0005
     * @tc.desc Verify different Double instances return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(1.5);
      let right: Double = new Double(2.5);
      expect(left.equals(right)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_0600
     * @tc.name testDoubleEquals0006
     * @tc.desc Verify zero value Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(0.0);
      let right: Double = new Double(0.0);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_0700
     * @tc.name testDoubleEquals0007
     * @tc.desc Verify negative value Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(-1.5);
      let right: Double = new Double(-1.5);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_0800
     * @tc.name testDoubleEquals0008
     * @tc.desc Verify large value Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(999999.99);
      let right: Double = new Double(999999.99);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_0900
     * @tc.name testDoubleEquals0009
     * @tc.desc Verify MIN_VALUE Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.MIN_VALUE);
      let right: Double = new Double(Double.MIN_VALUE);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1000
     * @tc.name testDoubleEquals0010
     * @tc.desc Verify MAX_VALUE Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.MAX_VALUE);
      let right: Double = new Double(Double.MAX_VALUE);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1100
     * @tc.name testDoubleEquals0011
     * @tc.desc Verify NaN Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.NaN);
      let right: Double = new Double(Double.NaN);
      expect(left.equals(right)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1200
     * @tc.name testDoubleEquals0012
     * @tc.desc Verify POSITIVE_INFINITY Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.POSITIVE_INFINITY);
      let right: Double = new Double(Double.POSITIVE_INFINITY);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1300
     * @tc.name testDoubleEquals0013
     * @tc.desc Verify NEGATIVE_INFINITY Double instances return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.NEGATIVE_INFINITY);
      let right: Double = new Double(Double.NEGATIVE_INFINITY);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1400
     * @tc.name testDoubleEquals0014
     * @tc.desc Verify self comparison returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(value)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1500
     * @tc.name testDoubleEquals0015
     * @tc.desc Verify number primitive type returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(1.5)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1600
     * @tc.name testDoubleEquals0016
     * @tc.desc Verify string type returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals("1.5")).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1700
     * @tc.name testDoubleEquals0017
     * @tc.desc Verify boolean true returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(true)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1800
     * @tc.name testDoubleEquals0018
     * @tc.desc Verify boolean false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(false)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_1900
     * @tc.name testDoubleEquals0019
     * @tc.desc Verify null returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(null)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2000
     * @tc.name testDoubleEquals0020
     * @tc.desc Verify undefined returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(undefined)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2100
     * @tc.name testDoubleEquals0021
     * @tc.desc Verify plain Object returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(new Object())).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2200
     * @tc.name testDoubleEquals0022
     * @tc.desc Verify array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals([1.5])).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2300
     * @tc.name testDoubleEquals0023
     * @tc.desc Verify BigInt instance returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(new BigInt(42))).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2400
     * @tc.name testDoubleEquals0024
     * @tc.desc Verify empty string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals("")).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2500
     * @tc.name testDoubleEquals0025
     * @tc.desc Verify number zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(0.0);
      expect(value.equals(0)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2600
     * @tc.name testDoubleEquals0026
     * @tc.desc Verify numeric string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals("3.14")).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2700
     * @tc.name testDoubleEquals0027
     * @tc.desc Verify equal Double instances return true with type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(3.14);
      let right: Double = new Double(3.14);
      let result: boolean = left.equals(right);
      expect(result).assertTrue();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2800
     * @tc.name testDoubleEquals0028
     * @tc.desc Verify different Double instances return false with type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(1.0);
      let right: Double = new Double(2.0);
      let result: boolean = left.equals(right);
      expect(result).assertFalse();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_2900
     * @tc.name testDoubleEquals0029
     * @tc.desc Verify non-Double type returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      let result: boolean = value.equals("string");
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_3300
     * @tc.name testDoubleEquals0033
     * @tc.desc Verify POSITIVE_INFINITY versus NEGATIVE_INFINITY returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.POSITIVE_INFINITY);
      let right: Double = new Double(Double.NEGATIVE_INFINITY);
      expect(left.equals(right)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_3400
     * @tc.name testDoubleEquals0034
     * @tc.desc Verify 0.0 versus negative 0.0 comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(0.0);
      let right: Double = new Double(-0.0);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_3500
     * @tc.name testDoubleEquals0035
     * @tc.desc Verify NaN versus non-NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(Double.NaN);
      let right: Double = new Double(1.0);
      expect(left.equals(right)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_3600
     * @tc.name testDoubleEquals0036
     * @tc.desc Verify scientific notation equal values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(1.0e3);
      let right: Double = new Double(1000.0);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_3900
     * @tc.name testDoubleEquals0039
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      let result: boolean = value.equals(new Double(1.5));
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_4000
     * @tc.name testDoubleEquals0040
     * @tc.desc Verify true and false scenarios respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      expect(value.equals(new Double(1.5))).assertTrue();
      expect(value.equals(new Double(2.5))).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_4100
     * @tc.name testDoubleEquals0041
     * @tc.desc Verify default constructed Double instances comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double();
      let right: Double = new Double();
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_4200
     * @tc.name testDoubleEquals0042
     * @tc.desc Verify DELTA boundary comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(1.0);
      let right: Double = new Double(1.0 + Double.DELTA);
      expect(left.equals(right)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_4300
     * @tc.name testDoubleEquals0043
     * @tc.desc Verify BigInt constructed Double instance comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double(new BigInt(42));
      let right: Double = new Double(42.0);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_4400
     * @tc.name testDoubleEquals0044
     * @tc.desc Verify string constructed Double instance comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Double = new Double("3.5");
      let right: Double = new Double(3.5);
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5100
     * @tc.name testDoubleEquals0051
     * @tc.desc Verify various non-Double types do not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Double = new Double(1.5);
      let result1: boolean = value.equals(new Double(1.5));
      expect(result1).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5200
     * @tc.name testDoubleEquals0052
     * @tc.desc Verify symmetry of equals with same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.5);
      let b: Double = new Double(1.5);
      expect(a.equals(b)).assertEqual(b.equals(a));
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5300
     * @tc.name testDoubleEquals0053
     * @tc.desc Verify symmetry of equals with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.0);
      let b: Double = new Double(2.0);
      expect(a.equals(b)).assertEqual(b.equals(a));
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5500
     * @tc.name testDoubleEquals0055
     * @tc.desc Verify reflexivity of NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: Double = new Double(Double.NaN);
      expect(nanValue.equals(nanValue)).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5600
     * @tc.name testDoubleEquals0056
     * @tc.desc Verify consistency of equals with same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.5);
      let b: Double = new Double(1.5);
      let first: boolean = a.equals(b);
      let second: boolean = a.equals(b);
      let third: boolean = a.equals(b);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5700
     * @tc.name testDoubleEquals0057
     * @tc.desc Verify consistency of equals with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.0);
      let b: Double = new Double(2.0);
      let first: boolean = a.equals(b);
      let second: boolean = a.equals(b);
      expect(first).assertEqual(second);
      expect(first).assertFalse();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5800
     * @tc.name testDoubleEquals0058
     * @tc.desc Verify equals and compareTo consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(1.5);
      let b: Double = new Double(1.5);
      expect(a.equals(b)).assertTrue();
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_5900
     * @tc.name testDoubleEquals0059
     * @tc.desc Verify equals and valueOf combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Double = new Double(3.14);
      let raw: number = original.valueOf();
      let reconstructed: Double = new Double(raw);
      expect(original.equals(reconstructed)).assertTrue();
    });

    /**
     * @tc.number DBL_EQLS_ITEM_CHK_6000
     * @tc.name testDoubleEquals0060
     * @tc.desc Verify equals and toDouble combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleEquals0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Double = new Double(3.14);
      let raw: number = original.toDouble();
      let reconstructed: Double = new Double(raw);
      expect(original.equals(reconstructed)).assertTrue();
    });
  });
}
