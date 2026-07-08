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

export default function DoubleStaticConstantsTest(): void {
  describe('DoubleStaticConstantsTest', (): void => {
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
     * @tc.number DBL_CNSTN_ITEM_CHK_0100
     * @tc.name doubleStaticConstants0001
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MIN_VALUE > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0200
     * @tc.name doubleStaticConstants0002
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let smaller: double = Double.MIN_VALUE / 2.0;
      expect(smaller === 0.0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0300
     * @tc.name doubleStaticConstants0003
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MIN_VALUE !== 0.0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0400
     * @tc.name doubleStaticConstants0004
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MAX_VALUE > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0500
     * @tc.name doubleStaticConstants0005
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let overflow: double = Double.MAX_VALUE * 2.0;
      expect(overflow === Double.POSITIVE_INFINITY).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0600
     * @tc.name doubleStaticConstants0006
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.MAX_VALUE)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0700
     * @tc.name doubleStaticConstants0007
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MAX_SAFE_INTEGER > 0).assertTrue();
      expect(Double.isInteger(Double.MAX_SAFE_INTEGER)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0800
     * @tc.name doubleStaticConstants0008
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isSafeInteger(Double.MAX_SAFE_INTEGER)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_0900
     * @tc.name doubleStaticConstants0009
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let unsafeValue: double = Double.MAX_SAFE_INTEGER + 1.0;
      expect(Double.isSafeInteger(unsafeValue)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1000
     * @tc.name doubleStaticConstants0010
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MIN_SAFE_INTEGER < 0).assertTrue();
      expect(Double.isInteger(Double.MIN_SAFE_INTEGER)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1100
     * @tc.name doubleStaticConstants0011
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isSafeInteger(Double.MIN_SAFE_INTEGER)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1200
     * @tc.name doubleStaticConstants0012
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let unsafeValue: double = Double.MIN_SAFE_INTEGER - 1.0;
      expect(Double.isSafeInteger(unsafeValue)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1300
     * @tc.name doubleStaticConstants0013
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MIN_SAFE_INTEGER === -Double.MAX_SAFE_INTEGER).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1400
     * @tc.name doubleStaticConstants0014
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isNaN(Double.NaN)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1500
     * @tc.name doubleStaticConstants0015
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.NaN === Double.NaN).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1600
     * @tc.name doubleStaticConstants0016
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isNaN(Double.NaN)).assertTrue();
      expect(Double.isNaN(1.0)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1700
     * @tc.name doubleStaticConstants0017
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.NaN)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1800
     * @tc.name doubleStaticConstants0018
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.POSITIVE_INFINITY > Double.MAX_VALUE).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_1900
     * @tc.name doubleStaticConstants0019
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.POSITIVE_INFINITY)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2000
     * @tc.name doubleStaticConstants0020
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isNaN(Double.POSITIVE_INFINITY)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2100
     * @tc.name doubleStaticConstants0021
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: double = 1.0 / 0.0;
      expect(result === Double.POSITIVE_INFINITY).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2200
     * @tc.name doubleStaticConstants0022
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.NEGATIVE_INFINITY < -Double.MAX_VALUE).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2300
     * @tc.name doubleStaticConstants0023
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.NEGATIVE_INFINITY)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2400
     * @tc.name doubleStaticConstants0024
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(-Double.POSITIVE_INFINITY === Double.NEGATIVE_INFINITY).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2500
     * @tc.name doubleStaticConstants0025
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: double = -1.0 / 0.0;
      expect(result === Double.NEGATIVE_INFINITY).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2600
     * @tc.name doubleStaticConstants0026
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.DELTA > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2700
     * @tc.name doubleStaticConstants0027
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.DELTA)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2800
     * @tc.name doubleStaticConstants0028
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0028
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let a: double = 1.0;
      let b: double = 1.0 + Double.DELTA / 2.0;
      expect(Double.compare(a, b)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_2900
     * @tc.name doubleStaticConstants0029
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0029
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.EPSILON > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3000
     * @tc.name doubleStaticConstants0030
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.EPSILON === Double.DELTA).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3100
     * @tc.name doubleStaticConstants0031
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.EPSILON)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3200
     * @tc.name doubleStaticConstants0032
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BIT_SIZE === 64).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3300
     * @tc.name doubleStaticConstants0033
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0033
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BIT_SIZE > 0).assertTrue();
      expect(Double.BIT_SIZE <= 127).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3400
     * @tc.name doubleStaticConstants0034
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0034
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BIT_SIZE.toString()).assertEqual("64");
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3500
     * @tc.name doubleStaticConstants0035
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0035
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BYTE_SIZE === 8).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3600
     * @tc.name doubleStaticConstants0036
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BYTE_SIZE * 8 === Double.BIT_SIZE).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3700
     * @tc.name doubleStaticConstants0037
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BYTE_SIZE.toString()).assertEqual("8");
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3800
     * @tc.name doubleStaticConstants0038
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0038
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.PRECISION > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_3900
     * @tc.name doubleStaticConstants0039
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.PRECISION <= 127).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4000
     * @tc.name doubleStaticConstants0040
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0040
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let precisionStr: String = Double.PRECISION.toString();
      expect(precisionStr.length > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4100
     * @tc.name doubleStaticConstants0041
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let minVal: double = Double.MIN_VALUE;
      let maxVal: double = Double.MAX_VALUE;
      let maxSafe: double = Double.MAX_SAFE_INTEGER;
      let minSafe: double = Double.MIN_SAFE_INTEGER;
      let nan: double = Double.NaN;
      let posInf: double = Double.POSITIVE_INFINITY;
      let negInf: double = Double.NEGATIVE_INFINITY;
      let delta: double = Double.DELTA;
      let epsilon: double = Double.EPSILON;
      expect(minVal > 0).assertTrue();
      expect(maxVal > 0).assertTrue();
      expect(Double.isNaN(nan)).assertTrue();
      expect(Double.isFinite(posInf)).assertFalse();
      expect(Double.isFinite(negInf)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4200
     * @tc.name doubleStaticConstants0042
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0042
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let instance = new Double(1.0);
      expect(Double.MIN_VALUE > 0).assertTrue();
      expect(Double.MAX_VALUE > 0).assertTrue();
      expect(Double.BIT_SIZE === 64).assertTrue();
      expect(Double.BYTE_SIZE === 8).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4300
     * @tc.name doubleStaticConstants0043
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isNaN(Double.NaN)).assertTrue();
      expect(Double.isNaN(0.0)).assertFalse();
      expect(Double.isNaN(Double.POSITIVE_INFINITY)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4400
     * @tc.name doubleStaticConstants0044
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isFinite(Double.POSITIVE_INFINITY)).assertFalse();
      expect(Double.isFinite(1.0)).assertTrue();
      expect(Double.isFinite(Double.MAX_VALUE)).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4500
     * @tc.name doubleStaticConstants0046
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0046
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isSafeInteger(Double.MAX_SAFE_INTEGER)).assertTrue();
      expect(Double.isSafeInteger(Double.MAX_SAFE_INTEGER + 1.0)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4600
     * @tc.name doubleStaticConstants0047
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0047
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.isSafeInteger(Double.MIN_SAFE_INTEGER)).assertTrue();
      expect(Double.isSafeInteger(Double.MIN_SAFE_INTEGER - 1.0)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4700
     * @tc.name doubleStaticConstants0048
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let value = new Double(Double.NaN);
      expect(value.isNaN()).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_4900
     * @tc.name doubleStaticConstants0050
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let value = new Double(Double.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5000
     * @tc.name doubleStaticConstants0051
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0051
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let a: double = 1.0;
      let b: double = 1.0 + Double.DELTA * 0.5;
      expect(Double.compare(a, b)).assertTrue();
      let c: double = 1.0;
      let d: double = 1.0 + Double.DELTA * 2.0;
      expect(Double.compare(c, d)).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5100
     * @tc.name doubleStaticConstants0052
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0052
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let value = new Double(Double.MIN_VALUE);
      expect(value.valueOf() === Double.MIN_VALUE).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5200
     * @tc.name doubleStaticConstants0053
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0053
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let maxVal = new Double(Double.MAX_VALUE);
      let normalVal = new Double(1.0);
      expect(maxVal.compareTo(normalVal) === 1).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5300
     * @tc.name doubleStaticConstants0054
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0054
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MAX_VALUE > Double.MIN_VALUE).assertTrue();
      expect(Double.MAX_VALUE / Double.MIN_VALUE > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5400
     * @tc.name doubleStaticConstants0055
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0055
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.MAX_SAFE_INTEGER < Double.MAX_VALUE).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5500
     * @tc.name doubleStaticConstants0056
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0056
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.DELTA === Double.EPSILON).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5600
     * @tc.name doubleStaticConstants0057
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0057
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.BIT_SIZE === Double.BYTE_SIZE * 8).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5700
     * @tc.name doubleStaticConstants0059
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0059
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.NaN > 0).assertFalse();
      expect(Double.NaN < 0).assertFalse();
      expect(Double.NaN === Double.NaN).assertFalse();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5800
     * @tc.name doubleStaticConstants0060
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0060
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let str: String = Double.MAX_VALUE.toString();
      expect(str.length > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_5900
     * @tc.name doubleStaticConstants0061
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0061
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let str: String = Double.MIN_VALUE.toString();
      expect(str.length > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_6000
     * @tc.name doubleStaticConstants0062
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0062
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let nanInstance = new Double(Double.NaN);
      let str: String = nanInstance.toString();
      expect(str.length > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_6100
     * @tc.name doubleStaticConstants0063
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0063
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let infInstance = new Double(Double.POSITIVE_INFINITY);
      let str: String = infInstance.toString();
      expect(str.length > 0).assertTrue();
    });

        /**
     * @tc.number DBL_CNSTN_ITEM_CHK_6200
     * @tc.name doubleStaticConstants0064
     * @tc.desc Verify Double Static Constants behavior for doubleStaticConstants0064
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
it('doubleStaticConstants0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let negInfInstance = new Double(Double.NEGATIVE_INFINITY);
      let str: String = negInfInstance.toString();
      expect(str.length > 0).assertTrue();
    });

      });
}
