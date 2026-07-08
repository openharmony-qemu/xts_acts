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

class TestObject {
  value: number = 0;
}

export default function DoubleDivTest(): void {
  describe('DoubleDivTest', (): void => {
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
     * @tc.number DBL_DIV_ITEM_CHK_0100
     * @tc.name testDoubleDiv0001
     * @tc.desc Verify positive number division returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(2.0));
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_0400
     * @tc.name testDoubleDiv0004
     * @tc.desc Verify division returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(3.0));
      expect(result.toDouble()).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_0500
     * @tc.name testDoubleDiv0005
     * @tc.desc Verify division by negative number returns negative result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(-3.0));
      expect(result.toDouble()).assertEqual(-2.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_0600
     * @tc.name testDoubleDiv0006
     * @tc.desc Verify decimal division returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(7.5);
      let result = d.div(new Double(2.5));
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_0700
     * @tc.name testDoubleDiv0007
     * @tc.desc Verify division by 1 returns the same number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(5.0);
      let result = d.div(new Double(1.0));
      expect(result.toDouble()).assertEqual(5.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_0800
     * @tc.name testDoubleDiv0008
     * @tc.desc Verify division of equal numbers returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(4.0);
      let result = d.div(new Double(4.0));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_0900
     * @tc.name testDoubleDiv0009
     * @tc.desc Verify division by MAX_VALUE returns finite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(1.0);
      let result = d.div(new Double(Double.MAX_VALUE));
      expect(Double.isFinite(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1000
     * @tc.name testDoubleDiv0010
     * @tc.desc Verify division by MIN_VALUE returns positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(1.0);
      let result = d.div(new Double(Double.MIN_VALUE));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1100
     * @tc.name testDoubleDiv0011
     * @tc.desc Verify division by NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(Double.NaN));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1200
     * @tc.name testDoubleDiv0012
     * @tc.desc Verify division by POSITIVE_INFINITY returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(Double.POSITIVE_INFINITY));
      expect(result.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1300
     * @tc.name testDoubleDiv0013
     * @tc.desc Verify division by NEGATIVE_INFINITY returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(Double.NEGATIVE_INFINITY));
      expect(result.toDouble()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1400
     * @tc.name testDoubleDiv0014
     * @tc.desc Verify division of MAX_SAFE_INTEGER by itself returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.MAX_SAFE_INTEGER);
      let result = d.div(new Double(Double.MAX_SAFE_INTEGER));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1500
     * @tc.name testDoubleDiv0015
     * @tc.desc Verify division of MIN_SAFE_INTEGER by itself returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.MIN_SAFE_INTEGER);
      let result = d.div(new Double(Double.MIN_SAFE_INTEGER));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1600
     * @tc.name testDoubleDiv0016
     * @tc.desc Verify division by positive zero returns POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(0.0));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1700
     * @tc.name testDoubleDiv0017
     * @tc.desc Verify division by negative zero returns NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(-0.0));
      expect(result.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1800
     * @tc.name testDoubleDiv0018
     * @tc.desc Verify division of zero by zero returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(0.0);
      let result = d.div(new Double(0.0));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_1900
     * @tc.name testDoubleDiv0019
     * @tc.desc Verify division of NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.NaN);
      let result = d.div(new Double(2.0));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_2000
     * @tc.name testDoubleDiv0020
     * @tc.desc Verify division of infinity by infinity returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.POSITIVE_INFINITY);
      let result = d.div(new Double(Double.POSITIVE_INFINITY));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_2400
     * @tc.name testDoubleDiv0024
     * @tc.desc Verify passing number type parameter works (auto-boxing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(25.0);
      let result = d.div(5.0);
      expect(result.toDouble()).assertEqual(5.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_2700
     * @tc.name testDoubleDiv0027
     * @tc.desc Verify chained division returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(6.0).div(new Double(2.0));
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_2800
     * @tc.name testDoubleDiv0028
     * @tc.desc Verify division of positive by negative returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(6.0).div(new Double(-2.0));
      expect(result.toDouble()).assertEqual(-3.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_2900
     * @tc.name testDoubleDiv0029
     * @tc.desc Verify division of negative by negative returns positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-6.0).div(new Double(-2.0));
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3000
     * @tc.name testDoubleDiv0030
     * @tc.desc Verify division of negative by positive returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-6.0).div(new Double(2.0));
      expect(result.toDouble()).assertEqual(-3.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3100
     * @tc.name testDoubleDiv0031
     * @tc.desc Verify division of 1 by 3 returns correct approximation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).div(new Double(3.0));
      expect(Double.compare(result.toDouble(), 0.3333333333333333)).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3200
     * @tc.name testDoubleDiv0032
     * @tc.desc Verify division of 10 by 5 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(10.0).div(new Double(5.0));
      expect(result.toDouble()).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3300
     * @tc.name testDoubleDiv0033
     * @tc.desc Verify division of very small numbers returns finite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1e-300).div(new Double(1e150));
      expect(Double.isFinite(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3400
     * @tc.name testDoubleDiv0034
     * @tc.desc Verify division by zero returns POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(6.0).div(new Double(0.0));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3500
     * @tc.name testDoubleDiv0035
     * @tc.desc Verify division of negative by zero returns NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(-6.0).div(new Double(0.0));
      expect(result.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3600
     * @tc.name testDoubleDiv0036
     * @tc.desc Verify division of NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.NaN).div(new Double(2.0));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3700
     * @tc.name testDoubleDiv0037
     * @tc.desc Verify division by NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(2.0).div(new Double(Double.NaN));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3800
     * @tc.name testDoubleDiv0038
     * @tc.desc Verify division of infinity returns infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.POSITIVE_INFINITY).div(new Double(2.0));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_3900
     * @tc.name testDoubleDiv0039
     * @tc.desc Verify division of infinity by infinity returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.POSITIVE_INFINITY).div(new Double(Double.POSITIVE_INFINITY));
      expect(Double.isNaN(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4000
     * @tc.name testDoubleDiv0040
     * @tc.desc Verify division by infinity returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(6.0).div(new Double(Double.POSITIVE_INFINITY));
      expect(result.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4100
     * @tc.name testDoubleDiv0041
     * @tc.desc Verify division of zero returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(0.0).div(new Double(5.0));
      expect(result.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4200
     * @tc.name testDoubleDiv0042
     * @tc.desc Verify div method returns Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(6.0).div(new Double(2.0));
      expect(result instanceof Double).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4300
     * @tc.name testDoubleDiv0043
     * @tc.desc Verify div method returns new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let result = d.div(new Double(2.0));
      expect(result === d).assertEqual(false);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4400
     * @tc.name testDoubleDiv0044
     * @tc.desc Verify div method does not modify original instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(6.0);
      let original = d.toDouble();
      d.div(new Double(2.0));
      expect(d.toDouble()).assertEqual(original);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4500
     * @tc.name testDoubleDiv0045
     * @tc.desc Verify division of MAX_VALUE by itself returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MAX_VALUE).div(new Double(Double.MAX_VALUE));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4600
     * @tc.name testDoubleDiv0046
     * @tc.desc Verify division of MIN_VALUE by itself returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MIN_VALUE).div(new Double(Double.MIN_VALUE));
      expect(result.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4700
     * @tc.name testDoubleDiv0047
     * @tc.desc Verify division of MAX_VALUE by MIN_VALUE returns infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MAX_VALUE).div(new Double(Double.MIN_VALUE));
      expect(result.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4800
     * @tc.name testDoubleDiv0048
     * @tc.desc Verify division of MAX_SAFE_INTEGER by 2 returns finite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MAX_SAFE_INTEGER).div(new Double(2.0));
      expect(Double.isFinite(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_4900
     * @tc.name testDoubleDiv0049
     * @tc.desc Verify division of MIN_SAFE_INTEGER by -1 returns finite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(Double.MIN_SAFE_INTEGER).div(new Double(-1.0));
      expect(Double.isFinite(result.toDouble())).assertEqual(true);
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_5000
     * @tc.name testDoubleDiv0050
     * @tc.desc Verify passing null parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
      let d = new Double(24.0);
      try {
        d.div(null as Double);
        expect(true).assertFalse();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        catchCalled = true;
      }
      expect(catchCalled).assertTrue();
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_5100
     * @tc.name testDoubleDiv0051
     * @tc.desc Verify passing undefined parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
      let d = new Double(49.0);
      try {
        d.div(undefined as Double);
        expect(true).assertFalse();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        catchCalled = true;
      }
      expect(catchCalled).assertTrue();
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_5200
     * @tc.name testDoubleDiv0052
     * @tc.desc Verify passing string parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
      let d = new Double(64.0);
      let param: Object = "8";
      try {
        d.div(param as Double);
        expect(true).assertFalse();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        catchCalled = true;
      }
      expect(catchCalled).assertTrue();
    });

    /**
     * @tc.number DBL_DIV_ITEM_CHK_5300
     * @tc.name testDoubleDiv0053
     * @tc.desc Verify passing object parameter throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleDiv0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
      let d = new Double(81.0);
      let param: Object = new TestObject();
      try {
        d.div(param as Double);
        expect(true).assertFalse();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        catchCalled = true;
      }
      expect(catchCalled).assertTrue();
    });

  });
}
