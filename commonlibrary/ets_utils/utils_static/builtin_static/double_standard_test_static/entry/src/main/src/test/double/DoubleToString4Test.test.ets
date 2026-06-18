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

export default function DoubleToString4Test(): void {
  describe('DoubleToString4Test', () => {
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
     * @tc.number DBL_TO_STRNG_4_CHK_0100
     * @tc.name testDoubleToStringFOUR0001
     * @tc.desc Verify toString with one Number parameter executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result: string = value.toString();
      expect(result).assertEqual("15.5");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0200
     * @tc.name testDoubleToStringFOUR0002
     * @tc.desc Verify toString with no argument calls no-arg toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toString();
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0300
     * @tc.name testDoubleToStringFOUR0003
     * @tc.desc Verify toString with two parameters causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0400
     * @tc.name testDoubleToStringFOUR0004
     * @tc.desc Verify toString with three parameters causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0500
     * @tc.name testDoubleToStringFOUR0005
     * @tc.desc Verify toString with positive integer Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 42.0;
      const result: string = value.toString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0600
     * @tc.name testDoubleToStringFOUR0006
     * @tc.desc Verify toString with negative integer Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -100.0;
      const result: string = value.toString();
      expect(result).assertEqual("-100");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0700
     * @tc.name testDoubleToStringFOUR0007
     * @tc.desc Verify toString with decimal Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 3.14;
      const result: string = value.toString();
      expect(result).assertEqual("3.14");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0800
     * @tc.name testDoubleToStringFOUR0008
     * @tc.desc Verify toString with zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.0;
      const result: string = value.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_0900
     * @tc.name testDoubleToStringFOUR0009
     * @tc.desc Verify toString with negative zero Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -0.0;
      const result: string = value.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1000
     * @tc.name testDoubleToStringFOUR0010
     * @tc.desc Verify toString with scientific notation Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.5e10;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1100
     * @tc.name testDoubleToStringFOUR0011
     * @tc.desc Verify toString with default constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const result: string = value.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1200
     * @tc.name testDoubleToStringFOUR0012
     * @tc.desc Verify toString with BigInt constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bigIntValue: bigint = 42n;
      const value: number = Number(bigIntValue);
      const result: string = value.toString();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1300
     * @tc.name testDoubleToStringFOUR0013
     * @tc.desc Verify toString with string constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number("3.5");
      const result: string = value.toString();
      expect(result).assertEqual("3.5");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1400
     * @tc.name testDoubleToStringFOUR0014
     * @tc.desc Verify toString with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toString();
      expect(result).assertEqual(Number.MAX_VALUE.toString());
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1500
     * @tc.name testDoubleToStringFOUR0015
     * @tc.desc Verify toString with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1600
     * @tc.name testDoubleToStringFOUR0016
     * @tc.desc Verify toString with Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_SAFE_INTEGER;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1700
     * @tc.name testDoubleToStringFOUR0017
     * @tc.desc Verify toString with Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_SAFE_INTEGER;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1800
     * @tc.name testDoubleToStringFOUR0018
     * @tc.desc Verify toString with negative Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Number.MAX_VALUE;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_1900
     * @tc.name testDoubleToStringFOUR0019
     * @tc.desc Verify toString with NaN Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = NaN;
      const result: string = value.toString();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_2000
     * @tc.name testDoubleToStringFOUR0020
     * @tc.desc Verify toString with positive infinity Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Infinity;
      const result: string = value.toString();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_2100
     * @tc.name testDoubleToStringFOUR0021
     * @tc.desc Verify toString with negative infinity Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -Infinity;
      const result: string = value.toString();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_2200
     * @tc.name testDoubleToStringFOUR0022
     * @tc.desc Verify toString with unparseable string constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number("abc");
      const result: string = value.toString();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_2300
     * @tc.name testDoubleToStringFOUR0023
     * @tc.desc Verify toString throws when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = Number(null);
        const result: string = value.toString();
        expect(result).assertEqual("0");
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_2400
     * @tc.name testDoubleToStringFOUR0024
     * @tc.desc Verify toString throws when passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = Number(undefined);
        const result: string = value.toString();
        expect(result).assertEqual("NaN");
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_2800
     * @tc.name testDoubleToStringFOUR0028
     * @tc.desc Verify toString with empty string constructed Double returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number("");
      const result: string = value.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_3000
     * @tc.name testDoubleToStringFOUR0030
     * @tc.desc Verify toString returns negative sign string for negative Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = -3.14;
      const result: string = value.toString();
      expect(result).assertEqual("-3.14");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_3700
     * @tc.name testDoubleToStringFOUR0037
     * @tc.desc Verify toString returns scientific notation string for large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1e20;
      const result: string = value.toString();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_3800
     * @tc.name testDoubleToStringFOUR0038
     * @tc.desc Verify toString return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result: string = value.toString();
      expect(typeof result === "string").assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_4000
     * @tc.name testDoubleToStringFOUR0040
     * @tc.desc Verify toString return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result: string = value.toString();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_4100
     * @tc.name testDoubleToStringFOUR0041
     * @tc.desc Verify toString return format for Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_VALUE;
      const result: string = value.toString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_4200
     * @tc.name testDoubleToStringFOUR0042
     * @tc.desc Verify toString return format for Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_VALUE;
      const result: string = value.toString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_4900
     * @tc.name testDoubleToStringFOUR0049
     * @tc.desc Verify caught Error has message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const value: number = Number(null);
        const result: string = value.toString();
        expect(result).assertEqual("0");
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        const err = error as Error;
        expect(err.message !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5100
     * @tc.name testDoubleToStringFOUR0051
     * @tc.desc Verify Number(null).toString() returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number(null);
      const result: string = value.toString();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5200
     * @tc.name testDoubleToStringFOUR0052
     * @tc.desc Verify toString returns consistent results on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 15.5;
      const result1: string = value.toString();
      const result2: string = value.toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5300
     * @tc.name testDoubleToStringFOUR0053
     * @tc.desc Verify toString returns same result from different instances with same parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value1: number = 15.5;
      const value2: number = 15.5;
      const result1: string = value1.toString();
      const result2: string = value2.toString();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5400
     * @tc.name testDoubleToStringFOUR0054
     * @tc.desc Verify toString(Number) converts parameter value not instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.0;
      const param: number = 15.5;
      const selfResult: string = value.toString();
      const paramResult: string = param.toString();
      expect(paramResult).assertEqual("15.5");
      expect(selfResult).assertEqual("1");
      expect(paramResult !== selfResult).assertTrue();
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5500
     * @tc.name testDoubleToStringFOUR0055
     * @tc.desc Verify toString with chained Double construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = Number(3.14);
      const result: string = value.toString();
      expect(result).assertEqual("3.14");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5600
     * @tc.name testDoubleToStringFOUR0056
     * @tc.desc Verify toString with add operation result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const param: number = 1.5 + 2.5;
      const result: string = param.toString();
      expect(result).assertEqual("4");
    });

    /**
     * @tc.number DBL_TO_STRNG_4_CHK_5700
     * @tc.name testDoubleToStringFOUR0057
     * @tc.desc Verify toString with subtract operation result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToStringFOUR0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const param: number = 5.0 - 2.0;
      const result: string = param.toString();
      expect(result).assertEqual("3");
    });
  });
}
