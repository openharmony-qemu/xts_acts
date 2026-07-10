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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function float64ArrayToStringTest(): void {
  describe('Float64ArrayToStringTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0100
     * @tc.name testFloat64ArrayToString001
     * @tc.desc Verify toString on multi-element array returns comma-separated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      const result = values.toString();
      const expectVal = "1,2,3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0200
     * @tc.name testFloat64ArrayToString002
     * @tc.desc Verify toString on single decimal element returns exact numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([2.5]);
      const result = values.toString();
      const expectVal = "2.5";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0300
     * @tc.name testFloat64ArrayToString003
     * @tc.desc Verify toString on negative decimal returns exact numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(-1.5);
      const result = values.toString();
      const expectVal = "-1.5";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0400
     * @tc.name testFloat64ArrayToString004
     * @tc.desc Verify toString on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array();
      const result = values.toString();
      const expectVal = "";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0500
     * @tc.name testFloat64ArrayToString005
     * @tc.desc Verify toString on single positive element returns its string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0);
      const result = values.toString();
      const expectVal = "1";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0600
     * @tc.name testFloat64ArrayToString006
     * @tc.desc Verify toString on single negative element returns its string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-1.0]);
      const result = values.toString();
      const expectVal = "-1";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0700
     * @tc.name testFloat64ArrayToString007
     * @tc.desc Verify toString on single zero element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.0]);
      const result = values.toString();
      const expectVal = "0";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0800
     * @tc.name testFloat64ArrayToString008
     * @tc.desc Verify toString on single negative zero element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(-0.0);
      const result = values.toString();
      const expectVal = "0";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_0900
     * @tc.name testFloat64ArrayToString009
     * @tc.desc Verify toString on single NaN element returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const values = new Float64Array([nanValue]);
      const result = values.toString();
      const expectVal = "NaN";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1000
     * @tc.name testFloat64ArrayToString010
     * @tc.desc Verify toString on single positive infinity element returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const values = new Float64Array([positiveInfinity]);
      const result = values.toString();
      const expectVal = "Infinity";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1100
     * @tc.name testFloat64ArrayToString011
     * @tc.desc Verify toString on single negative infinity element returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const values = new Float64Array([negativeInfinity]);
      const result = values.toString();
      const expectVal = "-Infinity";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1200
     * @tc.name testFloat64ArrayToString012
     * @tc.desc Verify toString on single MIN_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([5e-324]);
      const result = values.toString();
      const expectVal = "5e-324";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1300
     * @tc.name testFloat64ArrayToString013
     * @tc.desc Verify toString on single MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.7976931348623157e+308]);
      const result = values.toString();
      const expectVal = "1.7976931348623157e+308";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1400
     * @tc.name testFloat64ArrayToString014
     * @tc.desc Verify toString on single decimal element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5]);
      const result = values.toString();
      const expectVal = "0.5";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1500
     * @tc.name testFloat64ArrayToString015
     * @tc.desc Verify toString on two positive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0);
      const result = values.toString();
      const expectVal = "1,2";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1600
     * @tc.name testFloat64ArrayToString016
     * @tc.desc Verify toString on multi-element array with all negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-1.0, -2.0, -3.0]);
      const result = values.toString();
      const expectVal = "-1,-2,-3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1700
     * @tc.name testFloat64ArrayToString017
     * @tc.desc Verify toString on multi-element array with all zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const values = Float64Array.of(zeroPointZero, zeroPointZero, zeroPointZero);
      const result = values.toString();
      const expectVal = "0,0,0";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1800
     * @tc.name testFloat64ArrayToString018
     * @tc.desc Verify toString on mixed positive and negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-1.0, 0.0, 1.0]);
      const result = values.toString();
      const expectVal = "-1,0,1";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_1900
     * @tc.name testFloat64ArrayToString019
     * @tc.desc Verify toString on array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const values = Float64Array.of(1.0, nanValue, 3.0);
      const result = values.toString();
      const expectVal = "1,NaN,3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2000
     * @tc.name testFloat64ArrayToString020
     * @tc.desc Verify toString on array containing positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const values = Float64Array.of(1.0, positiveInfinity, 3.0);
      const result = values.toString();
      const expectVal = "1,Infinity,3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2100
     * @tc.name testFloat64ArrayToString021
     * @tc.desc Verify toString on array containing negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const values = Float64Array.of(1.0, negativeInfinity, 3.0);
      const result = values.toString();
      const expectVal = "1,-Infinity,3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2200
     * @tc.name testFloat64ArrayToString022
     * @tc.desc Verify toString on all NaN array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const values = Float64Array.of(nanValue, nanValue);
      const result = values.toString();
      const expectVal = "NaN,NaN";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2300
     * @tc.name testFloat64ArrayToString023
     * @tc.desc Verify toString on all infinity array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const values = new Float64Array([positiveInfinity, positiveInfinity]);
      const result = values.toString();
      const expectVal = "Infinity,Infinity";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2400
     * @tc.name testFloat64ArrayToString024
     * @tc.desc Verify toString on array with decimal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 0.2, 0.3]);
      const result = values.toString();
      const expectVal = "0.1,0.2,0.3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2500
     * @tc.name testFloat64ArrayToString025
     * @tc.desc Verify toString on array with scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.0e-10, 2.0e+10]);
      const result = values.toString();
      const expectVal = "1e-10,20000000000";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2600
     * @tc.name testFloat64ArrayToString026
     * @tc.desc Verify toString on array with MIN_VALUE and MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(5e-324, 1.7976931348623157e+308);
      const result = values.toString();
      const expectVal = "5e-324,1.7976931348623157e+308";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2700
     * @tc.name testFloat64ArrayToString027
     * @tc.desc Verify toString on single element returns its string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([42.0]);
      const actVal1 = values.toString();
      const expectVal = "42";
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2800
     * @tc.name testFloat64ArrayToString028
     * @tc.desc Verify toString on multi elements returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const actVal2 = values.toString();
      const expectVal = "1,2,3,4,5";
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_2900
     * @tc.name testFloat64ArrayToString029
     * @tc.desc Verify toString on array with NaN and Infinity returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const values = Float64Array.of(nanValue, positiveInfinity);
      const actVal3 = values.toString();
      const expectVal = "NaN,Infinity";
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3000
     * @tc.name testFloat64ArrayToString030
     * @tc.desc Verify toString on array with negatives returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-100.0, -0.0, 100.0]);
      const actVal4 = values.toString();
      const expectVal = "-100,0,100";
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3100
     * @tc.name testFloat64ArrayToString031
     * @tc.desc Verify toString on array with decimals returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.123, 456.789]);
      const actVal5 = values.toString();
      const expectVal = "0.123,456.789";
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3200
     * @tc.name testFloat64ArrayToString032
     * @tc.desc Verify toString on array with scientific notation returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0e-308, 1.0e+308);
      const actVal6 = values.toString();
      const expectVal = "1e-308,1e+308";
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3300
     * @tc.name testFloat64ArrayToString033
     * @tc.desc Verify positive zero stringifies to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(+0.0);
      const result = values.toString();
      const expectVal = "0";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3400
     * @tc.name testFloat64ArrayToString034
     * @tc.desc Verify toString on mixed positive and negative zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.0, -0.0);
      const result = values.toString();
      const expectVal = "0,0";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3500
     * @tc.name testFloat64ArrayToString035
     * @tc.desc Verify toString on MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(9007199254740991.0);
      const result = values.toString();
      const expectVal = "9007199254740991";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3600
     * @tc.name testFloat64ArrayToString036
     * @tc.desc Verify toString on MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-9007199254740991.0]);
      const result = values.toString();
      const expectVal = "-9007199254740991";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3700
     * @tc.name testFloat64ArrayToString037
     * @tc.desc Verify toString on int boundary 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([2147483647.0]);
      const result = values.toString();
      const expectVal = "2147483647";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3800
     * @tc.name testFloat64ArrayToString038
     * @tc.desc Verify toString on int boundary -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648.0]);
      const result = values.toString();
      const expectVal = "-2147483648";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_3900
     * @tc.name testFloat64ArrayToString039
     * @tc.desc Verify toString does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, 2.0, 3.0);
      const beforeLength = values.length;
      const before0 = values.$_get(0);
      const before1 = values.$_get(1);
      const before2 = values.$_get(2);
      values.toString();
      expect(values.length).assertEqual(beforeLength);
      const actVal7 = values.$_get(0);
      const expectVal = before0;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = values.$_get(1);
      const expectVal2 = before1;
      expect(actVal8).assertEqual(expectVal2);
      const actVal9 = values.$_get(2);
      const expectVal3 = before2;
      expect(actVal9).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4000
     * @tc.name testFloat64ArrayToString040
     * @tc.desc Verify toString does not modify array with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const values = new Float64Array([nanValue, positiveInfinity, zeroPointZero]);
      const before0 = values.$_get(0);
      const before1 = values.$_get(1);
      const before2 = values.$_get(2);
      const result = values.toString();
      const expectVal = "NaN,Infinity,0";
      expect(result).assertEqual(expectVal);
      const firstValueIsNaN: boolean = Number.isNaN(values.$_get(0));
      const expectVal2 = true;
      expect(firstValueIsNaN).assertEqual(expectVal2);
      const actVal10 = values.$_get(1);
      const expectVal3 = positiveInfinity;
      expect(actVal10).assertEqual(expectVal3);
      const actVal11 = values.$_get(2);
      const expectVal4 = zeroPointZero;
      expect(actVal11).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4100
     * @tc.name testFloat64ArrayToString041
     * @tc.desc Verify toString result contains no extra separator characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = Float64Array.of(1.0, 2.0);
      const result = values.toString();
      const actVal12 = result.indexOf("|");
      const expectVal = negativeOne;
      expect(actVal12).assertEqual(expectVal);
      const actVal13 = result.indexOf(";");
      const expectVal2 = negativeOne;
      expect(actVal13).assertEqual(expectVal2);
      const actVal14 = result.indexOf(" ");
      const expectVal3 = negativeOne;
      expect(actVal14).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4200
     * @tc.name testFloat64ArrayToString042
     * @tc.desc Verify toString result has no leading or trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0, -2.5);
      const result = values.toString();
      const expectVal = "1,-2.5";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4300
     * @tc.name testFloat64ArrayToString043
     * @tc.desc Verify toString does not throw on normal array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const values = new Float64Array([1.0]);
        values.toString();
      } catch (e) {
        expect(e).assertNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4400
     * @tc.name testFloat64ArrayToString044
     * @tc.desc Verify toString does not throw on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const values = new Float64Array();
        values.toString();
      } catch (e) {
        expect(e).assertNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4500
     * @tc.name testFloat64ArrayToString045
     * @tc.desc Verify toString does not throw on array with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      try {
        const values = new Float64Array([nanValue, positiveInfinity, negativeInfinity]);
        values.toString();
      } catch (e) {
        expect(e).assertNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4600
     * @tc.name testFloat64ArrayToString046
     * @tc.desc Verify toString on new Float64Array(3) zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(3);
      const result = values.toString();
      const expectVal = "0,0,0";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4700
     * @tc.name testFloat64ArrayToString047
     * @tc.desc Verify toString on array constructed from iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.0, 2.0, 3.0]);
      const result = values.toString();
      const expectVal = "1,2,3";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4800
     * @tc.name testFloat64ArrayToString048
     * @tc.desc Verify toString on Float64Array.of created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(10.0, 20.0, 30.0);
      const result = values.toString();
      const expectVal = "10,20,30";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_4900
     * @tc.name testFloat64ArrayToString049
     * @tc.desc Verify toString on copy constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Float64Array([5.0, 6.0]);
      const values = new Float64Array(source);
      const result = values.toString();
      const expectVal = "5,6";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5000
     * @tc.name testFloat64ArrayToString050
     * @tc.desc Verify toString on 100-element zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const values = new Float64Array(100);
      const result = values.toString();
      const actVal15 = result.split(",").length;
      const expectVal = hundredValue;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5100
     * @tc.name testFloat64ArrayToString051
     * @tc.desc Verify toString on ascending elements 1-10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const ninePointZero: number = 9.0;
      const tenPointZero: number = 10.0;
      const values =
        new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0,
          sevenPointZero, eightPointZero, ninePointZero, tenPointZero]);
      const result = values.toString();
      const expectVal = "1,2,3,4,5,6,7,8,9,10";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5200
     * @tc.name testFloat64ArrayToString052
     * @tc.desc Verify toString on 0.1+0.2 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1 + 0.2]);
      const result = values.toString();
      const expectVal = "0.30000000000000004";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5300
     * @tc.name testFloat64ArrayToString053
     * @tc.desc Verify toString on multi-digit decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([3.14159265358979]);
      const result = values.toString();
      const expectVal = "3.14159265358979";
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5400
     * @tc.name testFloat64ArrayToString054
     * @tc.desc Verify toString result is a primitive string via concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0);
      const result = values.toString();
      const concatenated = result + "suffix";
      const expectVal = "1suffix";
      expect(concatenated).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5500
     * @tc.name testFloat64ArrayToString055
     * @tc.desc Verify toString result is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(1.0);
      const result = values.toString();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5600
     * @tc.name testFloat64ArrayToString056
     * @tc.desc Verify toString on nonzero byteOffset view serializes only view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(40);
      const a = new Float64Array(b);
      a.$_set(0, 1.0);
      a.$_set(1, 2.0);
      a.$_set(2, 3.0);
      a.$_set(3, 4.0);
      a.$_set(4, 5.0);
      const v = new Float64Array(b, 8, 3);
      const actVal16 = v.toString();
      const expectVal = "2,3,4";
      expect(actVal16).assertEqual(expectVal);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5700
     * @tc.name testFloat64ArrayToString057
     * @tc.desc Verify toString on subarray reflects source mutation before serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([5.0, 6.0, 7.0, 8.0]);
      const v = a.subarray(1, 3);
      a.$_set(2, 70.0);
      const actVal17 = v.toString();
      const expectVal = "6,70";
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = a.toString();
      const expectVal2 = "5,6,70,8";
      expect(actVal18).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5800
     * @tc.name testFloat64ArrayToString058
     * @tc.desc Verify toString on toReversed copy keeps original order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      const r = a.toReversed();
      const actVal19 = r.toString();
      const expectVal = "3,2,1";
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = a.toString();
      const expectVal2 = "1,2,3";
      expect(actVal20).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_5900
     * @tc.name testFloat64ArrayToString059
     * @tc.desc Verify toString on toSorted copy keeps source order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(3.0, 1.0, 2.0);
      const s = a.toSorted();
      const actVal21 = s.toString();
      const expectVal = "1,2,3";
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = a.toString();
      const expectVal2 = "3,1,2";
      expect(actVal22).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_6000
     * @tc.name testFloat64ArrayToString060
     * @tc.desc Verify toString serializes double min and max values exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(Double.MIN_VALUE, Double.MAX_VALUE);
      const actVal23 = a.toString();
      const expectVal = "5e-324,1.7976931348623157e+308";
      expect(actVal23).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_6100
     * @tc.name testFloat64ArrayToString061
     * @tc.desc Verify toString serializes infinities and NaN tokens in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([Infinity, -Infinity, NaN]);
      const actVal24 = a.toString();
      const expectVal = "Infinity,-Infinity,NaN";
      expect(actVal24).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_6200
     * @tc.name testFloat64ArrayToString062
     * @tc.desc Verify toString normalizes signed zero text while value sign remains stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(-0.0, 0.0);
      const actVal25 = a.toString();
      const expectVal = "0,0";
      expect(actVal25).assertEqual(expectVal);
      const actVal26 = 1 / a.$_get(0);
      const expectVal2 = -Infinity;
      expect(actVal26).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_6300
     * @tc.name testFloat64ArrayToString063
     * @tc.desc Verify toString reflects fill mutation across all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float64Array([1.0, 2.0, 3.0]);
      a.fill(4.5);
      const actVal27 = a.toString();
      const expectVal = "4.5,4.5,4.5";
      expect(actVal27).assertEqual(expectVal);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOSTRING_6400
     * @tc.name testFloat64ArrayToString064
     * @tc.desc Verify toString on sliced copy stays stable after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(9.0, 8.0, 7.0, 6.0);
      const copy = a.slice(1, 3);
      a.$_set(1, 80.0);
      const actVal28 = copy.toString();
      const expectVal = "8,7";
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = a.toString();
      const expectVal2 = "9,80,7,6";
      expect(actVal29).assertEqual(expectVal2);
    });

  })
}
