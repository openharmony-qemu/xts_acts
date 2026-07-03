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
} from '../../../../hypium/index';
import Utils from '../Util.test';

function add026(a: number, b: number): number {
  return a + b;
}

class Counter072 {
  value: int = 0;
}

class ObjRef097 {
  count: int = 0;
}

export default function Float64ArrayReduceRight2Test(): void {
  describe('Float64ArrayReduceRight2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0100
     * @tc.name testFloat64ArrayReduceRight2001
     * @tc.desc Verify reduceRight with init overload - missing initialValue compile error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr, 0.0);
      const expectVal = twoPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0200
     * @tc.name testFloat64ArrayReduceRight2002
     * @tc.desc Verify reduceRight with init overload - 2 parameters normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0300
     * @tc.name testFloat64ArrayReduceRight2003
     * @tc.desc Verify reduceRight with init overload - 3 parameters extra param ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.reduceRight((prev, curr) => prev + curr, 0.0);
      const expectVal = negnum32896Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0400
     * @tc.name testFloat64ArrayReduceRight2004
     * @tc.desc Verify reduceRight callback arrow function sum from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1, 0, 1);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0500
     * @tc.name testFloat64ArrayReduceRight2005
     * @tc.desc Verify reduceRight callback arrow function subtract from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum9007199254740981Value: number = -9007199254740981;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev - curr, 10.0);
      const expectVal = negnum9007199254740981Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0600
     * @tc.name testFloat64ArrayReduceRight2006
     * @tc.desc Verify reduceRight callback uses currentIndex parameter to verify order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const oneValue: number = 1;
      const zeroValue: number = 0;
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const indices: Array<int> = [];
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        indices.push(idx);
        return prev + curr;
      }, 0.0);
      expect(indices[0]).assertEqual(twoValue);
      expect(indices[1]).assertEqual(oneValue);
      expect(indices[2]).assertEqual(zeroValue);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0700
     * @tc.name testFloat64ArrayReduceRight2007
     * @tc.desc Verify reduceRight callback uses array parameter to verify reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        const expectVal = arr;
        expect(ary).assertEqual(expectVal);
        return prev + curr;
      }, 0.0);
      const expectVal2 = negnum32896Value;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0800
     * @tc.name testFloat64ArrayReduceRight2008
     * @tc.desc Verify reduceRight callback on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483638Value: number = -2147483638;
      const arr = Float64Array.of(-2147483648);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 10.0);
      const expectVal = negnum2147483638Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_0900
     * @tc.name testFloat64ArrayReduceRight2009
     * @tc.desc Verify reduceRight callback returns string concatenation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.reduceRight<string>((result, value, index, array) => result + value.toString(), "");
      const expectVal = '090071992547409910.1';
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1000
     * @tc.name testFloat64ArrayReduceRight2010
     * @tc.desc Verify reduceRight callback returns Boolean all greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev && curr > 0, true);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1100
     * @tc.name testFloat64ArrayReduceRight2011
     * @tc.desc Verify reduceRight callback returns Boolean some less than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev || curr < 0, false);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1200
     * @tc.name testFloat64ArrayReduceRight2012
     * @tc.desc Verify reduceRight callback with MAX_VALUE boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1300
     * @tc.name testFloat64ArrayReduceRight2013
     * @tc.desc Verify reduceRight callback with MIN_VALUE boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = pointOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1400
     * @tc.name testFloat64ArrayReduceRight2014
     * @tc.desc Verify reduceRight callback handles +0.0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1500
     * @tc.name testFloat64ArrayReduceRight2015
     * @tc.desc Verify reduceRight callback returns large negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1600
     * @tc.name testFloat64ArrayReduceRight2016
     * @tc.desc Verify reduceRight callback reads external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      let externalSum: number = 0.0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        externalSum += curr;
        return prev + curr;
      }, 0.0);
      const expectVal = negnum2147483649Value;
      expect(externalSum).assertEqual(expectVal);
      const expectVal2 = negnum2147483649Value;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1700
     * @tc.name testFloat64ArrayReduceRight2017
     * @tc.desc Verify reduceRight callback modifies external state and returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const num9007199254740991Pointone: number = 9007199254740991.1;
      let counter: int = 0;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        counter += 1;
        return prev + curr;
      }, 0.0);
      const expectVal = threeValue;
      expect(counter).assertEqual(expectVal);
      const expectVal2 = num9007199254740991Pointone;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1800
     * @tc.name testFloat64ArrayReduceRight2018
     * @tc.desc Verify reduceRight callback nests call to helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight((prev, curr, idx, ary) => add026(prev, curr), 0.0);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_1900
     * @tc.name testFloat64ArrayReduceRight2019
     * @tc.desc Verify reduceRight callback returns constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => 42.0, 0.0);
      const expectVal = fillValue42;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2000
     * @tc.name testFloat64ArrayReduceRight2020
     * @tc.desc Verify reduceRight initialValue 0.0 numeric accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2100
     * @tc.name testFloat64ArrayReduceRight2021
     * @tc.desc Verify reduceRight initialValue negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num9007199254740981Value: number = 9007199254740981;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -10.0);
      const expectVal = num9007199254740981Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2200
     * @tc.name testFloat64ArrayReduceRight2022
     * @tc.desc Verify reduceRight initialValue Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2300
     * @tc.name testFloat64ArrayReduceRight2023
     * @tc.desc Verify reduceRight initialValue -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2400
     * @tc.name testFloat64ArrayReduceRight2024
     * @tc.desc Verify reduceRight initialValue NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, NaN);
      const actVal1 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2500
     * @tc.name testFloat64ArrayReduceRight2025
     * @tc.desc Verify reduceRight initialValue MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValueAlt: number = 1.7976931348623158e+308;
      const arr = Float64Array.of(0.1);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 1.7976931348623157e+308);
      const expectVal = doubleMaxValueAlt;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2600
     * @tc.name testFloat64ArrayReduceRight2026
     * @tc.desc Verify reduceRight initialValue MIN_VALUE tiny positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = new Float64Array([pointFive]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 5e-324);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2700
     * @tc.name testFloat64ArrayReduceRight2027
     * @tc.desc Verify reduceRight initialValue +0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = negnum32896Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2800
     * @tc.name testFloat64ArrayReduceRight2028
     * @tc.desc Verify reduceRight initialValue -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -0.0);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_2900
     * @tc.name testFloat64ArrayReduceRight2029
     * @tc.desc Verify reduceRight initialValue string type generic U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.reduceRight<string>((prev, curr, idx, ary) => prev + curr.toString(), "start");
      const expectVal = "start090071992547409910.1";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3000
     * @tc.name testFloat64ArrayReduceRight2030
     * @tc.desc Verify reduceRight initialValue boolean type generic U=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev && curr > 0, true);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3100
     * @tc.name testFloat64ArrayReduceRight2031
     * @tc.desc Verify reduceRight initialValue 0 integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.reduceRight((prev, curr) => prev + curr, 0.0);
      const expectVal = negnum32896Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3200
     * @tc.name testFloat64ArrayReduceRight2032
     * @tc.desc Verify reduceRight initialValue scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num7852516351Value: number = 7852516351;
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 1.0e10);
      const expectVal = num7852516351Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3300
     * @tc.name testFloat64ArrayReduceRight2033
     * @tc.desc Verify reduceRight initialValue hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num9007199254741008Value: number = 9007199254741008;
      const arr = new Float64Array([0.1, 9007199254740991]);
      const result = arr.reduceRight((prev, curr) => prev + curr, 0x10 * 1.0);
      const expectVal = num9007199254741008Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3400
     * @tc.name testFloat64ArrayReduceRight2034
     * @tc.desc Verify reduceRight initialValue negative scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum99998Value: number = -99998;
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -1.0e5);
      const expectVal = negnum99998Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3500
     * @tc.name testFloat64ArrayReduceRight2035
     * @tc.desc Verify reduceRight initialValue overflow boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([-32768]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 1.7976931348623158e+308);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3600
     * @tc.name testFloat64ArrayReduceRight2036
     * @tc.desc Verify reduceRight initialValue MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num9007197107257343Value: number = 9007197107257343;
      const arr = Float64Array.of(-2147483648);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 9007199254740991.0);
      const expectVal = num9007197107257343Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3700
     * @tc.name testFloat64ArrayReduceRight2037
     * @tc.desc Verify reduceRight initialValue MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991;
      const arr = Float64Array.of(0.1);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -9007199254740991.0);
      const expectVal = minSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3800
     * @tc.name testFloat64ArrayReduceRight2038
     * @tc.desc Verify reduceRight return type number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result: number = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_3900
     * @tc.name testFloat64ArrayReduceRight2039
     * @tc.desc Verify reduceRight return type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      const result: string = arr.reduceRight<string>((prev, curr, idx, ary) => prev + curr.toString(), "");
      const expectVal = "-128-32768";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4000
     * @tc.name testFloat64ArrayReduceRight2040
     * @tc.desc Verify reduceRight return type boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      const result: boolean = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev && curr > 0, true);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4100
     * @tc.name testFloat64ArrayReduceRight2041
     * @tc.desc Verify reduceRight generic explicit number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.reduceRight<number>((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4200
     * @tc.name testFloat64ArrayReduceRight2042
     * @tc.desc Verify reduceRight generic implicit number inference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight((prev, curr) => prev + curr, 0.0);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4300
     * @tc.name testFloat64ArrayReduceRight2043
     * @tc.desc Verify reduceRight generic inferred string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      const result = arr.reduceRight<string>((prev, curr, idx, ary) => prev + curr.toString(), "");
      const expectVal = "-128-32768";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4400
     * @tc.name testFloat64ArrayReduceRight2044
     * @tc.desc Verify reduceRight empty array returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array(0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 42.0);
      const expectVal = fillValue42;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4500
     * @tc.name testFloat64ArrayReduceRight2045
     * @tc.desc Verify reduceRight empty array returns string initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.reduceRight<string>((prev, curr, idx, ary) => prev + curr, "empty");
      const expectVal = "empty";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4600
     * @tc.name testFloat64ArrayReduceRight2046
     * @tc.desc Verify reduceRight empty array returns boolean initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev && true, false);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4700
     * @tc.name testFloat64ArrayReduceRight2047
     * @tc.desc Verify reduceRight single element array returns accumulation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483645Value: number = -2147483645;
      const arr = Float64Array.of(-2147483648);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 3.0);
      const expectVal = negnum2147483645Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4800
     * @tc.name testFloat64ArrayReduceRight2048
     * @tc.desc Verify reduceRight multiple elements right to left verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num9007199254740994Value: number = 9007199254740994;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = num9007199254740994Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_4900
     * @tc.name testFloat64ArrayReduceRight2049
     * @tc.desc Verify reduceRight original array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const lenBefore = arr.length;
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      expect(arr.length).assertEqual(threeValue);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5000
     * @tc.name testFloat64ArrayReduceRight2050
     * @tc.desc Verify reduceRight original array elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const val0 = arr[0];
      const val1 = arr[1];
      const val2 = arr[2];
      arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      expect(arr[0]).assertEqual(val0);
      expect(arr[1]).assertEqual(val1);
      expect(arr[2]).assertEqual(val2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5100
     * @tc.name testFloat64ArrayReduceRight2051
     * @tc.desc Verify reduceRight empty array callback not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let called: boolean = false;
      arr.reduceRight((prev, curr, idx, ary) => {
        called = true;
        return prev;
      }, 0.0);
      const expectVal = false;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5200
     * @tc.name testFloat64ArrayReduceRight2052
     * @tc.desc Verify reduceRight callback accesses valid currentIndex bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        if (idx >= 0 && idx < arr.length) {
          return prev + curr;
        }
        return prev;
      }, 0.0);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5300
     * @tc.name testFloat64ArrayReduceRight2053
     * @tc.desc Verify reduceRight generic U number default behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5400
     * @tc.name testFloat64ArrayReduceRight2054
     * @tc.desc Verify reduceRight generic U string explicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight<string>((prev, curr, idx, ary) => prev + curr.toString(), "");
      const expectVal = '0.251.50.5';
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5500
     * @tc.name testFloat64ArrayReduceRight2055
     * @tc.desc Verify reduceRight generic U boolean explicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev && curr > 0, true);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5600
     * @tc.name testFloat64ArrayReduceRight2056
     * @tc.desc Verify reduceRight generic U custom object type Counter072
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.reduceRight<Counter072>((prev, curr, idx, ary) => {
        prev.value += 1;
        return prev;
      }, new Counter072());
      const expectVal = twoValue;
      expect(result.value).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5700
     * @tc.name testFloat64ArrayReduceRight2057
     * @tc.desc Verify reduceRight generic U Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.reduceRight<Array<number>>((prev, curr, idx, ary) => {
        prev.push(curr);
        return prev;
      }, []);
      expect(result.length).assertEqual(threeValue);
      expect(result[0]).assertEqual(zeroValue);
      expect(result[1]).assertEqual(maxSafeInteger);
      expect(result[2]).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5800
     * @tc.name testFloat64ArrayReduceRight2058
     * @tc.desc Verify reduceRight empty array with zero initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_5900
     * @tc.name testFloat64ArrayReduceRight2059
     * @tc.desc Verify reduceRight empty array with Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array(0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6000
     * @tc.name testFloat64ArrayReduceRight2060
     * @tc.desc Verify reduceRight single element with NaN initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, NaN);
      const actVal2 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6100
     * @tc.name testFloat64ArrayReduceRight2061
     * @tc.desc Verify reduceRight single element with Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(-2147483648);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6200
     * @tc.name testFloat64ArrayReduceRight2062
     * @tc.desc Verify reduceRight single element with -Infinity initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(0.1);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6300
     * @tc.name testFloat64ArrayReduceRight2063
     * @tc.desc Verify reduceRight all same element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const pointFive: number = 0.5;
      const arr = new Float64Array([pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = pointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6400
     * @tc.name testFloat64ArrayReduceRight2064
     * @tc.desc Verify reduceRight alternating positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32769Value: number = -32769;
      const arr = Float64Array.of(-32768, -128, 0, 127);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = negnum32769Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6500
     * @tc.name testFloat64ArrayReduceRight2065
     * @tc.desc Verify reduceRight with MIN_VALUE tiny positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483649Value: number = -2147483649;
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6600
     * @tc.name testFloat64ArrayReduceRight2066
     * @tc.desc Verify reduceRight with MAX_VALUE huge positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const num18014398509481982Value: number = 18014398509481982;
      const arr = new Float64Array([maxSafeInteger, maxSafeInteger]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = num18014398509481982Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6700
     * @tc.name testFloat64ArrayReduceRight2067
     * @tc.desc Verify reduceRight negative zero and positive zero mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = new Float64Array([zeroValue, -1, zeroValue]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6800
     * @tc.name testFloat64ArrayReduceRight2068
     * @tc.desc Verify reduceRight long array 100+ elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = 1.0;
      }
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = hundredPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_6900
     * @tc.name testFloat64ArrayReduceRight2069
     * @tc.desc Verify reduceRight mixed positive and negative large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const maxSafeInteger: number = 9007199254740991;
      const arr = new Float64Array([zeroValue, maxSafeInteger, zeroValue]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7000
     * @tc.name testFloat64ArrayReduceRight2070
     * @tc.desc Verify reduceRight callback uses ternary operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointtwofive: number = 2.25;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight((prev, curr, idx, ary) => curr > 0 ? prev + curr : prev, 0.0);
      const expectVal = twoPointtwofive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7100
     * @tc.name testFloat64ArrayReduceRight2071
     * @tc.desc Verify reduceRight callback uses logical operator short circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev && curr, 1.0);
      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7200
     * @tc.name testFloat64ArrayReduceRight2072
     * @tc.desc Verify reduceRight callback uses bitwise operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev | curr, 0.0);
      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7300
     * @tc.name testFloat64ArrayReduceRight2073
     * @tc.desc Verify reduceRight callback uses comparison operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev > curr ? prev : curr, 0.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7400
     * @tc.name testFloat64ArrayReduceRight2074
     * @tc.desc Verify reduceRight callback returns arithmetic expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourPointfive: number = 4.5;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev * 2 + curr, 0.0);
      const expectVal = fourPointfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7500
     * @tc.name testFloat64ArrayReduceRight2075
     * @tc.desc Verify reduceRight empty array returns NaN initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, NaN);
      const actVal3 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7600
     * @tc.name testFloat64ArrayReduceRight2076
     * @tc.desc Verify reduceRight empty array returns empty string initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.reduceRight<string>((prev, curr, idx, ary) => prev + curr.toString(), "");
      const expectVal = "";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7700
     * @tc.name testFloat64ArrayReduceRight2077
     * @tc.desc Verify reduceRight empty array returns boolean true initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.reduceRight<boolean>((prev, curr, idx, ary) => prev || false, true);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7800
     * @tc.name testFloat64ArrayReduceRight2078
     * @tc.desc Verify reduceRight single element returns element times init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev * curr, 1.0);
      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_7900
     * @tc.name testFloat64ArrayReduceRight2079
     * @tc.desc Verify reduceRight two elements right to left order verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1]);
      const order: Array<int> = [];
      arr.reduceRight((prev, curr, idx, ary) => {
        order.push(idx);
        return prev + curr;
      }, 0.0);
      expect(order[0]).assertEqual(oneValue);
      expect(order[1]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8000
     * @tc.name testFloat64ArrayReduceRight2080
     * @tc.desc Verify reduceRight three elements right to left order verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const order: Array<int> = [];
      arr.reduceRight((prev, curr, idx, ary) => {
        order.push(idx);
        return prev + curr;
      }, 0.0);
      expect(order[0]).assertEqual(twoValue);
      expect(order[1]).assertEqual(oneValue);
      expect(order[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8100
     * @tc.name testFloat64ArrayReduceRight2081
     * @tc.desc Verify reduceRight initialValue negative zero positive zero equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5]);
      const result1 = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const result2 = arr.reduceRight((prev, curr, idx, ary) => prev + curr, -0.0);
      const expectVal = result2;
      expect(result1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8200
     * @tc.name testFloat64ArrayReduceRight2082
     * @tc.desc Verify reduceRight callback uses exponentiation simulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        let pow: number = 1.0;
        for (let i: int = 0; i < curr; i++) {
          pow *= prev;
        }
        return pow;
      }, 2.0);
      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8300
     * @tc.name testFloat64ArrayReduceRight2083
     * @tc.desc Verify reduceRight callback returns array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + ary.length, 0.0);
      const expectVal = ninePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8400
     * @tc.name testFloat64ArrayReduceRight2084
     * @tc.desc Verify reduceRight callback uses currentIndex verify right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const values: Array<number> = [];
      arr.reduceRight((prev, curr, idx, ary) => {
        values.push(curr);
        return prev + curr;
      }, 0.0);
      expect(values[0]).assertEqual(piValue);
      expect(values[1]).assertEqual(zeroValue);
      expect(values[2]).assertEqual(maxSafeInteger);
      expect(values[3]).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8500
     * @tc.name testFloat64ArrayReduceRight2085
     * @tc.desc Verify reduceRight callback multiplication right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointoneeightsevenfive: number = 0.1875;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev * curr, 1.0);
      const expectVal = zeroPointoneeightsevenfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8600
     * @tc.name testFloat64ArrayReduceRight2086
     * @tc.desc Verify reduceRight callback uses conditional expression returns different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32640Value: number = -32640;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => idx % 2 === 0 ? prev + curr : prev - curr, 0.0);
      const expectVal = negnum32640Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8700
     * @tc.name testFloat64ArrayReduceRight2087
     * @tc.desc Verify reduceRight callback returns string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourteenValue: number = 14;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr.toString().length, 0.0);
      const expectVal = fourteenValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8800
     * @tc.name testFloat64ArrayReduceRight2088
     * @tc.desc Verify reduceRight with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num425Pointzero: number = 425.0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const s = arr.reduceRight((a: number, v: number): number => a + v, 0x00);
      const expectVal = num425Pointzero;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_8900
     * @tc.name testFloat64ArrayReduceRight2089
     * @tc.desc Verify reduceRight with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num425Pointzero: number = 425.0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const s = arr.reduceRight((a: number, v: number): number => a + v, 0b00000000);
      const expectVal = num425Pointzero;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_9000
     * @tc.name testFloat64ArrayReduceRight2090
     * @tc.desc Verify reduceright with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const actVal4 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_9100
     * @tc.name testFloat64ArrayReduceRight2091
     * @tc.desc Verify reduceright with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const actVal5 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_9200
     * @tc.name testFloat64ArrayReduceRight2092
     * @tc.desc Verify reduceright with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr, 0.0);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_9300
     * @tc.name testFloat64ArrayReduceRight2093
     * @tc.desc Verify reduceRight callback returns object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, 1.5);
      const obj = new ObjRef097();
      const result = arr.reduceRight<ObjRef097>((prev, curr, idx, ary) => {
        obj.count += 1;
        return obj;
      }, obj);
      const expectVal = obj;
      expect(result).assertEqual(expectVal);
      expect(result.count).assertEqual(twoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_2_9400
     * @tc.name testFloat64ArrayReduceRight2094
     * @tc.desc Verify reduceRight callback throws on last call propagates error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight2094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let callCount: int = 0;
      try {
        arr.reduceRight((prev, curr, idx, ary) => {
          callCount += 1;
          if (callCount === 3) {
            throw new Error("last call error");
          }
          return prev + curr;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        const expectVal = threeValue;
        expect(callCount).assertEqual(expectVal);
        expect(e.name).assertEqual("Error");
      }
    })

  })
}
