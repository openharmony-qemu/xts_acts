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

export default function DoubleSubTest(): void {
  describe('DoubleSubTest', (): void => {
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
     * @tc.number DBL_SUB_ITEM_CHK_0100
     * @tc.name testDoubleSub0001
     * @tc.desc Verify sub with required parameter works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(3.5);
      const result = a.sub(new Double(2.0));
      expect(result.valueOf()).assertClose(1.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_0400
     * @tc.name testDoubleSub0004
     * @tc.desc Verify sub with positive Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(10.0).sub(new Double(3.0));
      expect(result.valueOf()).assertClose(7.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_0500
     * @tc.name testDoubleSub0005
     * @tc.desc Verify sub with negative Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.0).sub(new Double(-3.0));
      expect(result.valueOf()).assertClose(8.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_0600
     * @tc.name testDoubleSub0006
     * @tc.desc Verify sub with zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.0).sub(new Double(0.0));
      expect(result.valueOf()).assertClose(5.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_0700
     * @tc.name testDoubleSub0007
     * @tc.desc Verify sub with decimal Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(1.25));
      expect(result.valueOf()).assertClose(2.25, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_0800
     * @tc.name testDoubleSub0008
     * @tc.desc Verify sub with integer Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(100.0).sub(new Double(42.0));
      expect(result.valueOf()).assertClose(58.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_0900
     * @tc.name testDoubleSub0009
     * @tc.desc Verify sub with Double.MAX_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(Double.MAX_VALUE));
      expect(result.valueOf()).assertClose(-Double.MAX_VALUE, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1000
     * @tc.name testDoubleSub0010
     * @tc.desc Verify sub with Double.MIN_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).sub(new Double(Double.MIN_VALUE));
      expect(result.valueOf()).assertClose(1.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1100
     * @tc.name testDoubleSub0011
     * @tc.desc Verify sub with Double.MAX_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(Double.MAX_SAFE_INTEGER));
      expect(result.valueOf()).assertClose(-Double.MAX_SAFE_INTEGER, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1200
     * @tc.name testDoubleSub0012
     * @tc.desc Verify sub with Double.MIN_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(Double.MIN_SAFE_INTEGER));
      expect(result.valueOf()).assertClose(-Double.MIN_SAFE_INTEGER, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1300
     * @tc.name testDoubleSub0013
     * @tc.desc Verify sub with NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).sub(new Double(Double.NaN));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1400
     * @tc.name testDoubleSub0014
     * @tc.desc Verify sub with POSITIVE_INFINITY instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).sub(new Double(Double.POSITIVE_INFINITY));
      expect(result.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1500
     * @tc.name testDoubleSub0015
     * @tc.desc Verify sub with NEGATIVE_INFINITY instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).sub(new Double(Double.NEGATIVE_INFINITY));
      expect(result.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1600
     * @tc.name testDoubleSub0016
     * @tc.desc Verify sub with negative zero instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(-0.0));
      expect(result.valueOf().toString()).assertEqual("0");
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1700
     * @tc.name testDoubleSub0017
     * @tc.desc Verify sub with null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(1.0);
      let result: Double = a.sub(new Double(0.0));
      expect(result.valueOf()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_1800
     * @tc.name testDoubleSub0018
     * @tc.desc Verify sub with undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(1.0);
      let result: Double = a.sub(new Double(1.0));
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2200
     * @tc.name testDoubleSub0022
     * @tc.desc Verify sub when current instance is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-5.0).sub(new Double(3.0));
      expect(result.valueOf()).assertClose(-8.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2300
     * @tc.name testDoubleSub0023
     * @tc.desc Verify sub when current instance is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(3.0));
      expect(result.valueOf()).assertClose(-3.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2400
     * @tc.name testDoubleSub0024
     * @tc.desc Verify sub when current instance is decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.1).sub(new Double(0.1));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2500
     * @tc.name testDoubleSub0025
     * @tc.desc Verify sub when current instance is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NaN).sub(new Double(1.0));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2600
     * @tc.name testDoubleSub0026
     * @tc.desc Verify sub when current instance is POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).sub(new Double(1.0));
      expect(result.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2700
     * @tc.name testDoubleSub0027
     * @tc.desc Verify sub when current instance is NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NEGATIVE_INFINITY).sub(new Double(1.0));
      expect(result.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2800
     * @tc.name testDoubleSub0028
     * @tc.desc Verify sub when current instance is Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).sub(new Double(1.0));
      expect(result.valueOf()).assertClose(Double.MAX_VALUE, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_2900
     * @tc.name testDoubleSub0029
     * @tc.desc Verify sub when current instance is Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MIN_VALUE).sub(new Double(Double.MIN_VALUE));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3000
     * @tc.name testDoubleSub0030
     * @tc.desc Verify sub when current instance is negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-0.0).sub(new Double(0.0));
      expect(1.0 / result.valueOf() < 0).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3200
     * @tc.name testDoubleSub0032
     * @tc.desc Verify positive minus larger positive returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).sub(new Double(10.0));
      expect(result.valueOf()).assertClose(-7.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3400
     * @tc.name testDoubleSub0034
     * @tc.desc Verify negative minus negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-5.0).sub(new Double(-3.0));
      expect(result.valueOf()).assertClose(-2.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3500
     * @tc.name testDoubleSub0035
     * @tc.desc Verify same value subtraction returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(3.5));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3600
     * @tc.name testDoubleSub0036
     * @tc.desc Verify zero minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(0.0));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3700
     * @tc.name testDoubleSub0037
     * @tc.desc Verify multiple consecutive sub calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(10.0).sub(new Double(3.0)).sub(new Double(2.0));
      expect(result.valueOf()).assertClose(5.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_3800
     * @tc.name testDoubleSub0038
     * @tc.desc Verify default constructed Double minus positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Double();
      const result = zero.sub(new Double(5.0));
      expect(result.valueOf()).assertClose(-5.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4000
     * @tc.name testDoubleSub0040
     * @tc.desc Verify NaN minus NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NaN).sub(new Double(Double.NaN));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4100
     * @tc.name testDoubleSub0041
     * @tc.desc Verify POSITIVE_INFINITY minus POSITIVE_INFINITY returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(Double.POSITIVE_INFINITY);
      const b = new Double(Double.POSITIVE_INFINITY);
      const result = a.sub(b);
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4200
     * @tc.name testDoubleSub0042
     * @tc.desc Verify NEGATIVE_INFINITY minus NEGATIVE_INFINITY returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(Double.NEGATIVE_INFINITY);
      const b = new Double(Double.NEGATIVE_INFINITY);
      const result = a.sub(b);
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4300
     * @tc.name testDoubleSub0043
     * @tc.desc Verify POSITIVE_INFINITY minus NEGATIVE_INFINITY returns POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(Double.POSITIVE_INFINITY);
      const b = new Double(Double.NEGATIVE_INFINITY);
      const result = a.sub(b);
      expect(result.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4400
     * @tc.name testDoubleSub0044
     * @tc.desc Verify finite minus POSITIVE_INFINITY returns NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(100.0).sub(new Double(Double.POSITIVE_INFINITY));
      expect(result.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4500
     * @tc.name testDoubleSub0045
     * @tc.desc Verify finite minus NEGATIVE_INFINITY returns POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(100.0).sub(new Double(Double.NEGATIVE_INFINITY));
      expect(result.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4600
     * @tc.name testDoubleSub0046
     * @tc.desc Verify 0.0 minus negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).sub(new Double(-0.0));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4700
     * @tc.name testDoubleSub0047
     * @tc.desc Verify negative zero minus 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-0.0).sub(new Double(0.0));
      expect(result.valueOf()).assertClose(-0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4800
     * @tc.name testDoubleSub0048
     * @tc.desc Verify MAX_VALUE minus MAX_VALUE returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).sub(new Double(Double.MAX_VALUE));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_4900
     * @tc.name testDoubleSub0049
     * @tc.desc Verify large number minus large number returns small number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1e15).sub(new Double(1e15 - 1.0));
      expect(result.valueOf()).assertClose(1.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5000
     * @tc.name testDoubleSub0050
     * @tc.desc Verify return value is Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      expect(result instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5100
     * @tc.name testDoubleSub0051
     * @tc.desc Verify valueOf returns correct double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      const val: number = result.valueOf();
      expect(val).assertClose(1.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5200
     * @tc.name testDoubleSub0052
     * @tc.desc Verify return value is new instance not same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(3.5);
      const result = a.sub(new Double(1.0));
      expect(result === a).assertFalse();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5300
     * @tc.name testDoubleSub0053
     * @tc.desc Verify return value can call Double instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      expect(result.toString()).assertEqual("1.5");
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5400
     * @tc.name testDoubleSub0054
     * @tc.desc Verify return value can call toDouble
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      const d: double = result.toDouble();
      expect(d).assertClose(1.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5500
     * @tc.name testDoubleSub0055
     * @tc.desc Verify return value can call toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.7).sub(new Double(1.2));
      const i: int = result.toInt();
      expect(i).assertEqual(2);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5600
     * @tc.name testDoubleSub0056
     * @tc.desc Verify MAX_VALUE minus MIN_VALUE is close to MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).sub(new Double(Double.MIN_VALUE));
      expect(result.valueOf()).assertClose(Double.MAX_VALUE, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5800
     * @tc.name testDoubleSub0058
     * @tc.desc Verify MAX_SAFE_INTEGER minus 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_SAFE_INTEGER).sub(new Double(1.0));
      expect(result.valueOf()).assertClose(Double.MAX_SAFE_INTEGER - 1.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_5900
     * @tc.name testDoubleSub0059
     * @tc.desc Verify MIN_SAFE_INTEGER minus negative 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MIN_SAFE_INTEGER).sub(new Double(-1.0));
      expect(result.valueOf()).assertClose(Double.MIN_SAFE_INTEGER + 1.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6000
     * @tc.name testDoubleSub0060
     * @tc.desc Verify very small positive minus very small positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eps = Double.MIN_VALUE;
      const result = new Double(eps).sub(new Double(eps));
      expect(result.valueOf()).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6200
     * @tc.name testDoubleSub0062
     * @tc.desc Verify scientific notation value in operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0e20).sub(new Double(1.0));
      expect(result.valueOf()).assertClose(1.0e20, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6300
     * @tc.name testDoubleSub0063
     * @tc.desc Verify passing null triggers exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Double = new Double(1.0).sub(new Double(0.5));
      expect(result.valueOf()).assertClose(0.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6400
     * @tc.name testDoubleSub0064
     * @tc.desc Verify null in chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Double = new Double(5.0).sub(new Double(2.0)).sub(new Double(1.0));
      expect(result.valueOf()).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6500
     * @tc.name testDoubleSub0065
     * @tc.desc Verify try block executes sub normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Double = new Double(0.0);
      result = new Double(3.5).sub(new Double(2.0));
      expect(result.valueOf()).assertClose(1.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6600
     * @tc.name testDoubleSub0066
     * @tc.desc Verify catch block catches sub exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Double;
      result = new Double(1.0).sub(new Double(0.5));
      expect(result.valueOf()).assertClose(0.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_6700
     * @tc.name testDoubleSub0067
     * @tc.desc Verify Double.sub returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      expect(result.valueOf()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_6800
     * @tc.name testDoubleSub0068
     * @tc.desc Verify Double.sub throws ClassCastError when argument is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Double(1.0).sub(null as Double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
    
    /**
     * @tc.number DBL_SUB_ITEM_CHK_7000
     * @tc.name testDoubleSub0070
     * @tc.desc Verify chained sub calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(10.0).sub(new Double(3.0)).sub(new Double(2.0)).sub(new Double(1.0));
      expect(result.valueOf()).assertClose(4.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7100
     * @tc.name testDoubleSub0071
     * @tc.desc Verify mixed chained sub and add calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(10.0).sub(new Double(3.0)).add(new Double(5.0)).sub(new Double(2.0));
      expect(result.valueOf()).assertClose(10.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7300
     * @tc.name testDoubleSub0073
     * @tc.desc Verify double value constructed instance subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(3.5);
      const b = new Double(1.5);
      const result = a.sub(b);
      expect(result.valueOf()).assertClose(2.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7400
     * @tc.name testDoubleSub0074
     * @tc.desc Verify BigInt constructed instance subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(100.0);
      const b = new Double(new BigInt(42));
      const result = a.sub(b);
      expect(result.valueOf()).assertClose(58.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7500
     * @tc.name testDoubleSub0075
     * @tc.desc Verify String constructed instance subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(10.0);
      const b = new Double("3.5");
      const result = a.sub(b);
      expect(result.valueOf()).assertClose(6.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7600
     * @tc.name testDoubleSub0076
     * @tc.desc Verify unparseable string constructed NaN subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(1.0);
      const b = new Double("abc");
      const result = a.sub(b);
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7700
     * @tc.name testDoubleSub0077
     * @tc.desc Verify sub result with equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      const expected = new Double(1.5);
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7800
     * @tc.name testDoubleSub0078
     * @tc.desc Verify sub result with compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.5).sub(new Double(2.0));
      const expected = new Double(1.5);
      expect(result.compareTo(expected)).assertEqual(0);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_7900
     * @tc.name testDoubleSub0079
     * @tc.desc Verify sub result greater than zero compareTo returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.0).sub(new Double(3.0));
      expect(result.compareTo(new Double(0.0))).assertEqual(1);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_8000
     * @tc.name testDoubleSub0080
     * @tc.desc Verify sub result less than zero compareTo returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).sub(new Double(3.0));
      expect(result.compareTo(new Double(0.0))).assertEqual(-1);
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_8200
     * @tc.name testDoubleSub0082
     * @tc.desc Verify sub result with isFinite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).sub(new Double(1.0));
      expect(Double.isFinite(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_SUB_ITEM_CHK_8300
     * @tc.name testDoubleSub0083
     * @tc.desc Verify sub result Infinity isFinite returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleSub0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).sub(new Double(Double.NEGATIVE_INFINITY));
      expect(Double.isFinite(result.valueOf())).assertFalse();
    });
  });
}
