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

export default function DoubleMulTest(): void {
  describe('DoubleMulTest', (): void => {
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
     * @tc.number DBL_MUL_ITEM_CHK_0100
     * @tc.name testDoubleMul0001
     * @tc.desc Verify mul with required parameter other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(2.0));
      expect(result.valueOf()).assertEqual(6.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_0500
     * @tc.name testDoubleMul0005
     * @tc.desc Verify mul with negative Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(-2.0));
      expect(result.valueOf()).assertEqual(-6.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_0600
     * @tc.name testDoubleMul0006
     * @tc.desc Verify mul with zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.0).mul(new Double(0.0));
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_0700
     * @tc.name testDoubleMul0007
     * @tc.desc Verify mul with decimal Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.5).mul(new Double(2.5));
      expect(result.valueOf()).assertEqual(3.75);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_0800
     * @tc.name testDoubleMul0008
     * @tc.desc Verify mul with negative zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(-0.0));
      expect(result.valueOf()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_0900
     * @tc.name testDoubleMul0009
     * @tc.desc Verify mul with NaN Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(Double.NaN));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1000
     * @tc.name testDoubleMul0010
     * @tc.desc Verify mul with POSITIVE_INFINITY Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(Double.POSITIVE_INFINITY));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1100
     * @tc.name testDoubleMul0011
     * @tc.desc Verify mul with NEGATIVE_INFINITY Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(Double.NEGATIVE_INFINITY));
      expect(result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1200
     * @tc.name testDoubleMul0012
     * @tc.desc Verify mul with MAX_VALUE Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).mul(new Double(Double.MAX_VALUE));
      expect(result.valueOf() == Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1300
     * @tc.name testDoubleMul0013
     * @tc.desc Verify mul with MIN_VALUE Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).mul(new Double(Double.MIN_VALUE));
      expect(result.valueOf() == Double.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1400
     * @tc.name testDoubleMul0014
     * @tc.desc Verify mul with MAX_SAFE_INTEGER Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(2.0).mul(new Double(Double.MAX_SAFE_INTEGER));
      expect(Double.isFinite(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1500
     * @tc.name testDoubleMul0015
     * @tc.desc Verify mul with MIN_SAFE_INTEGER Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(2.0).mul(new Double(Double.MIN_SAFE_INTEGER));
      expect(Double.isFinite(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1600
     * @tc.name testDoubleMul0016
     * @tc.desc Verify mul with DELTA Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).mul(new Double(Double.DELTA));
      expect(result.valueOf() == Double.DELTA).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_1700
     * @tc.name testDoubleMul0017
     * @tc.desc Verify mul with EPSILON Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(1.0).mul(new Double(Double.EPSILON));
      expect(result.valueOf() == Double.EPSILON).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2300
     * @tc.name testDoubleMul0023
     * @tc.desc Verify mul when caller value is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NaN).mul(new Double(2.0));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2400
     * @tc.name testDoubleMul0024
     * @tc.desc Verify mul when caller value is POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).mul(new Double(2.0));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2500
     * @tc.name testDoubleMul0025
     * @tc.desc Verify mul when caller value is NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NEGATIVE_INFINITY).mul(new Double(2.0));
      expect(result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2600
     * @tc.name testDoubleMul0026
     * @tc.desc Verify mul when caller value is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).mul(new Double(2.0));
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2700
     * @tc.name testDoubleMul0027
     * @tc.desc Verify mul when caller value is negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-0.0).mul(new Double(2.0));
      expect(result.valueOf()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2800
     * @tc.name testDoubleMul0028
     * @tc.desc Verify mul when caller value is MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).mul(new Double(1.0));
      expect(result.valueOf() == Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_2900
     * @tc.name testDoubleMul0029
     * @tc.desc Verify mul when caller value is MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MIN_VALUE).mul(new Double(1.0));
      expect(result.valueOf() == Double.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3200
     * @tc.name testDoubleMul0032
     * @tc.desc Verify negative multiplied by negative returns positive result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-3.0).mul(new Double(-2.0));
      expect(result.valueOf()).assertEqual(6.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3400
     * @tc.name testDoubleMul0034
     * @tc.desc Verify decimal multiplied by integer returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.1).mul(new Double(10.0));
      expect(result.valueOf()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3500
     * @tc.name testDoubleMul0035
     * @tc.desc Verify multiplying by one returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.5).mul(new Double(1.0));
      expect(result.valueOf()).assertEqual(5.5);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3600
     * @tc.name testDoubleMul0036
     * @tc.desc Verify multiplying by zero returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(99.99).mul(new Double(0.0));
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3700
     * @tc.name testDoubleMul0037
     * @tc.desc Verify multiplying by negative one returns negation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.0).mul(new Double(-1.0));
      expect(result.valueOf()).assertEqual(-5.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3800
     * @tc.name testDoubleMul0038
     * @tc.desc Verify finite value multiplied by NaN results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(5.0).mul(new Double(Double.NaN));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_3900
     * @tc.name testDoubleMul0039
     * @tc.desc Verify NaN multiplied by finite value results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NaN).mul(new Double(5.0));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4000
     * @tc.name testDoubleMul0040
     * @tc.desc Verify NaN multiplied by NaN results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NaN).mul(new Double(Double.NaN));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4100
     * @tc.name testDoubleMul0041
     * @tc.desc Verify NaN multiplied by infinity results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NaN).mul(new Double(Double.POSITIVE_INFINITY));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4400
     * @tc.name testDoubleMul0044
     * @tc.desc Verify negative finite multiplied by positive infinity returns negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-3.0).mul(new Double(Double.POSITIVE_INFINITY));
      expect(result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4500
     * @tc.name testDoubleMul0045
     * @tc.desc Verify negative finite multiplied by negative infinity returns positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-3.0).mul(new Double(Double.NEGATIVE_INFINITY));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4600
     * @tc.name testDoubleMul0046
     * @tc.desc Verify positive infinity multiplied by positive infinity returns positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).mul(new Double(Double.POSITIVE_INFINITY));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4700
     * @tc.name testDoubleMul0047
     * @tc.desc Verify positive infinity multiplied by negative infinity returns negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.POSITIVE_INFINITY).mul(new Double(Double.NEGATIVE_INFINITY));
      expect(result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4800
     * @tc.name testDoubleMul0048
     * @tc.desc Verify negative infinity multiplied by negative infinity returns positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.NEGATIVE_INFINITY).mul(new Double(Double.NEGATIVE_INFINITY));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_4900
     * @tc.name testDoubleMul0049
     * @tc.desc Verify positive zero multiplied by positive infinity results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).mul(new Double(Double.POSITIVE_INFINITY));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5000
     * @tc.name testDoubleMul0050
     * @tc.desc Verify negative zero multiplied by positive infinity results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-0.0).mul(new Double(Double.POSITIVE_INFINITY));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5100
     * @tc.name testDoubleMul0051
     * @tc.desc Verify positive zero multiplied by negative infinity results in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).mul(new Double(Double.NEGATIVE_INFINITY));
      expect(Double.isNaN(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5200
     * @tc.name testDoubleMul0052
     * @tc.desc Verify positive zero multiplied by positive finite returns positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).mul(new Double(5.0));
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5300
     * @tc.name testDoubleMul0053
     * @tc.desc Verify negative zero multiplied by positive finite returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-0.0).mul(new Double(5.0));
      expect(1.0 / result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5400
     * @tc.name testDoubleMul0054
     * @tc.desc Verify positive zero multiplied by negative finite returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(0.0).mul(new Double(-5.0));
      expect(1.0 / result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5500
     * @tc.name testDoubleMul0055
     * @tc.desc Verify negative zero multiplied by negative zero returns positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-0.0).mul(new Double(-0.0));
      expect(1.0 / result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5600
     * @tc.name testDoubleMul0056
     * @tc.desc Verify return value is Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(2.0));
      expect(result instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5700
     * @tc.name testDoubleMul0057
     * @tc.desc Verify return value is new instance not same as caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(3.0);
      const result = a.mul(new Double(2.0));
      expect(result === a).assertFalse();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5800
     * @tc.name testDoubleMul0058
     * @tc.desc Verify return value is new instance not same as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Double(2.0);
      const result = new Double(3.0).mul(b);
      expect(result === b).assertFalse();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_5900
     * @tc.name testDoubleMul0059
     * @tc.desc Verify valueOf returns correct double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(2.0));
      expect(result.valueOf()).assertEqual(6.0);
      expect(typeof result.valueOf() === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6000
     * @tc.name testDoubleMul0060
     * @tc.desc Verify toDouble returns correct double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(2.0));
      expect(result.toDouble()).assertEqual(6.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6100
     * @tc.name testDoubleMul0061
     * @tc.desc Verify toString returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(3.0).mul(new Double(2.0));
      expect(result.toString()).assertEqual("6");
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6200
     * @tc.name testDoubleMul0062
     * @tc.desc Verify mul result can be chained with another mul call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(2.0).mul(new Double(3.0)).mul(new Double(4.0));
      expect(result.valueOf()).assertEqual(24.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6300
     * @tc.name testDoubleMul0063
     * @tc.desc Verify mul result can call other Double methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(2.0).mul(new Double(3.0));
      expect(result.add(new Double(1.0)).valueOf()).assertEqual(7.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6400
     * @tc.name testDoubleMul0064
     * @tc.desc Verify MAX_VALUE multiplied by MAX_VALUE overflows to positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).mul(new Double(Double.MAX_VALUE));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6500
     * @tc.name testDoubleMul0065
     * @tc.desc Verify MAX_VALUE multiplied by 2 overflows to positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_VALUE).mul(new Double(2.0));
      expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6600
     * @tc.name testDoubleMul0066
     * @tc.desc Verify negative MAX_VALUE multiplied by MAX_VALUE results in negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(-Double.MAX_VALUE).mul(new Double(Double.MAX_VALUE));
      expect(result.valueOf() == Double.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6700
     * @tc.name testDoubleMul0067
     * @tc.desc Verify MIN_VALUE multiplied by MIN_VALUE underflows to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MIN_VALUE).mul(new Double(Double.MIN_VALUE));
      expect(result.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6800
     * @tc.name testDoubleMul0068
     * @tc.desc Verify MIN_VALUE multiplied by 0.5 underflows to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MIN_VALUE).mul(new Double(0.5));
      expect(result.valueOf() == 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_6900
     * @tc.name testDoubleMul0069
     * @tc.desc Verify MAX_SAFE_INTEGER multiplied by 2 exceeds safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_SAFE_INTEGER).mul(new Double(2.0));
      expect(Double.isSafeInteger(result.valueOf())).assertFalse();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_7000
     * @tc.name testDoubleMul0070
     * @tc.desc Verify MIN_SAFE_INTEGER multiplied by 2 exceeds safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MIN_SAFE_INTEGER).mul(new Double(2.0));
      expect(Double.isSafeInteger(result.valueOf())).assertFalse();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_7100
     * @tc.name testDoubleMul0071
     * @tc.desc Verify MAX_SAFE_INTEGER multiplied by 1 stays within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Double(Double.MAX_SAFE_INTEGER).mul(new Double(1.0));
      expect(Double.isSafeInteger(result.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_8200
     * @tc.name testDoubleMul0082
     * @tc.desc Verify mul normal call does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let noError = true;
      try {
        const result = new Double(3.0).mul(new Double(2.0));
        expect(result.valueOf()).assertEqual(6.0);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        noError = false;
      }
      expect(noError).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_8300
     * @tc.name testDoubleMul0083
     * @tc.desc Verify NaN in multiplication does not throw exception and result is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let noError = true;
      try {
        const result = new Double(Double.NaN).mul(new Double(2.0));
        expect(Double.isNaN(result.valueOf())).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        noError = false;
      }
      expect(noError).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_8400
     * @tc.name testDoubleMul0084
     * @tc.desc Verify infinity in multiplication does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let noError = true;
      try {
        const result = new Double(Double.POSITIVE_INFINITY).mul(new Double(2.0));
        expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        noError = false;
      }
      expect(noError).assertTrue();
    });

    /**
     * @tc.number DBL_MUL_ITEM_CHK_8500
     * @tc.name testDoubleMul0085
     * @tc.desc Verify overflow does not throw exception and returns infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleMul0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let noError = true;
      try {
        const result = new Double(Double.MAX_VALUE).mul(new Double(Double.MAX_VALUE));
        expect(result.valueOf() == Double.POSITIVE_INFINITY).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        noError = false;
      }
      expect(noError).assertTrue();
    });
  });
}
