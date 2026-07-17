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

export default function Float64ArrayReduceRight1Test(): void {
  describe('Float64ArrayReduceRight1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0100
     * @tc.name testFloat64ArrayReduceRight1001
     * @tc.desc Verify reduceRight with 0 arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(1.0, 2.0);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0200
     * @tc.name testFloat64ArrayReduceRight1002
     * @tc.desc Verify reduceRight with 1 argument (no init) on 3-element array returns sum 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0300
     * @tc.name testFloat64ArrayReduceRight1003
     * @tc.desc Verify reduceRight callback using all 4 arrow function parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirteenPointzero: number = 13.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => prev + curr + idx + ary.length);
      const expectVal = thirteenPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0400
     * @tc.name testFloat64ArrayReduceRight1004
     * @tc.desc Verify reduceRight callback using only the first parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(1.0, 2.0, threePointZero);
      const result = arr.reduceRight((prev) => prev);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0500
     * @tc.name testFloat64ArrayReduceRight1005
     * @tc.desc Verify reduceRight callback with explicit parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev: number, curr: number) => prev + curr);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0600
     * @tc.name testFloat64ArrayReduceRight1006
     * @tc.desc Verify reduceRight currentIndex parameter confirms right-to-left order [1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const indices: Array<number> = [];
      arr.reduceRight((prev, curr, idx) => {
        indices.push(idx);
        return prev + curr;
      });
      expect(indices[0]).assertEqual(oneValue);
      expect(indices[1]).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0700
     * @tc.name testFloat64ArrayReduceRight1007
     * @tc.desc Verify reduceRight array parameter references the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr, idx, ary) => {
        return prev + ary[0];
      });
      const expectVal = fivePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0800
     * @tc.name testFloat64ArrayReduceRight1008
     * @tc.desc Verify reduceRight currentValue parameter confirms right-to-left order [20.0,10.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const arr = Float64Array.of(tenPointZero, twentyPointZero, 30.0);
      const values: Array<number> = [];
      arr.reduceRight((prev, curr) => {
        values.push(curr);
        return prev + curr;
      });
      expect(values[0]).assertEqual(twentyPointZero);
      expect(values[1]).assertEqual(tenPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_0900
     * @tc.name testFloat64ArrayReduceRight1009
     * @tc.desc Verify reduceRight single-element array returns that element 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = Float64Array.of(fillValue42);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = fillValue42;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1000
     * @tc.name testFloat64ArrayReduceRight1010
     * @tc.desc Verify reduceRight single-element array of 0.0 returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(zeroPointZero);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1100
     * @tc.name testFloat64ArrayReduceRight1011
     * @tc.desc Verify reduceRight single-element negative array returns that negative value -5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negfivePointzero: number = -5.0;
      const arr = new Float64Array([negfivePointzero]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = negfivePointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1200
     * @tc.name testFloat64ArrayReduceRight1012
     * @tc.desc Verify reduceRight on two-element array right-to-left subtraction returns -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(onePointZero, 2.0);
      const result = arr.reduceRight((prev, curr) => prev - curr);
      const expectVal = onePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1300
     * @tc.name testFloat64ArrayReduceRight1013
     * @tc.desc Verify reduceRight on three-element array subtraction returns -4.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => prev - curr);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1400
     * @tc.name testFloat64ArrayReduceRight1014
     * @tc.desc Verify reduceRight on three-element array multiplication returns 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => prev * curr);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1500
     * @tc.name testFloat64ArrayReduceRight1015
     * @tc.desc Verify reduceRight on five-element array returns 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fifteenPointzero: number = 15.0;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = fifteenPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1600
     * @tc.name testFloat64ArrayReduceRight1016
     * @tc.desc Verify reduceRight does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      arr.reduceRight((prev, curr) => prev + curr);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
      expect(arr[2]).assertEqual(threePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1700
     * @tc.name testFloat64ArrayReduceRight1017
     * @tc.desc Verify reduceRight on empty array without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1800
     * @tc.name testFloat64ArrayReduceRight1018
     * @tc.desc Verify reduceRight callback throwing RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      try {
        arr.reduceRight((prev, curr) => {
          throw new RangeError('test');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_1900
     * @tc.name testFloat64ArrayReduceRight1019
     * @tc.desc Verify reduceRight callback throwing TypeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      try {
        arr.reduceRight((prev, curr) => {
          throw new TypeError('test');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2000
     * @tc.name testFloat64ArrayReduceRight1020
     * @tc.desc Verify reduceRight callback throwing Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      try {
        arr.reduceRight((prev, curr) => {
          throw new Error('test');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2100
     * @tc.name testFloat64ArrayReduceRight1021
     * @tc.desc Verify reduceRight callback throwing on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      try {
        arr.reduceRight((prev, curr) => {
          throw new Error('first call');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2200
     * @tc.name testFloat64ArrayReduceRight1022
     * @tc.desc Verify reduceRight callback throwing on second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.reduceRight((prev, curr, idx) => {
          if (idx === 2) {
            throw new Error('second call');
          }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('second call');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2300
     * @tc.name testFloat64ArrayReduceRight1023
     * @tc.desc Verify reduceRight single element Double.MAX_VALUE returns MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([doubleMaxValue]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2400
     * @tc.name testFloat64ArrayReduceRight1024
     * @tc.desc Verify reduceRight single element Double.MIN_VALUE returns MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array([doubleMinValue]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = doubleMinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2500
     * @tc.name testFloat64ArrayReduceRight1025
     * @tc.desc Verify reduceRight single element Infinity returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(positiveInfinity);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2600
     * @tc.name testFloat64ArrayReduceRight1026
     * @tc.desc Verify reduceRight single element -Infinity returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(negativeInfinity);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2700
     * @tc.name testFloat64ArrayReduceRight1027
     * @tc.desc Verify reduceRight single element NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const actVal1 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2800
     * @tc.name testFloat64ArrayReduceRight1028
     * @tc.desc Verify reduceRight single element -0.0 returns -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(negativeZero);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = negativeZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_2900
     * @tc.name testFloat64ArrayReduceRight1029
     * @tc.desc Verify reduceRight array containing both MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([doubleMaxValue, 5e-324]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3000
     * @tc.name testFloat64ArrayReduceRight1030
     * @tc.desc Verify reduceRight array containing Infinity and normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([1.0, positiveInfinity, 3.0]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3100
     * @tc.name testFloat64ArrayReduceRight1031
     * @tc.desc Verify reduceRight array containing -Infinity and normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(1.0, -positiveInfinity, 3.0);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3200
     * @tc.name testFloat64ArrayReduceRight1032
     * @tc.desc Verify reduceRight array containing NaN and normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([1.0, nanValue, 3.0]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const actVal2 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3300
     * @tc.name testFloat64ArrayReduceRight1033
     * @tc.desc Verify reduceRight array containing both -0.0 and 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(-0.0, zeroPointZero);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3400
     * @tc.name testFloat64ArrayReduceRight1034
     * @tc.desc Verify reduceRight with scientific notation small value 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue29999999999999997e308: number = 2.9999999999999997e-308;
      const arr = new Float64Array([1.0e-308, 2.0e-308]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = sciValue29999999999999997e308;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3500
     * @tc.name testFloat64ArrayReduceRight1035
     * @tc.desc Verify reduceRight with scientific notation large value 1.0e+307
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue30e307: number = 3.0e+307;
      const arr = Float64Array.of(1.0e+307, 2.0e+307);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = sciValue30e307;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3600
     * @tc.name testFloat64ArrayReduceRight1036
     * @tc.desc Verify reduceRight with negative scientific notation -1.0e+307
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e307: number = 1.0e+307;
      const arr = new Float64Array([-1.0e+307, 2.0e+307]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = sciValue10e307;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3700
     * @tc.name testFloat64ArrayReduceRight1037
     * @tc.desc Verify reduceRight with hex literal 0x10 and 0x20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValue20: number = 0x20;
      const fortyeightPointzero: number = 48.0;
      const arr = Float64Array.of(hexValue10, hexValue20);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = fortyeightPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3800
     * @tc.name testFloat64ArrayReduceRight1038
     * @tc.desc Verify reduceRight with octal literal 0o10 and 0o20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourPointzero: number = 24.0;
      const arr = new Float64Array([0o10, 0o20]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = twentyfourPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_3900
     * @tc.name testFloat64ArrayReduceRight1039
     * @tc.desc Verify reduceRight with binary literal 0b10 and 0b100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue10: number = 0b10;
      const binaryValue100: number = 0b100;
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([binaryValue10, binaryValue100]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4000
     * @tc.name testFloat64ArrayReduceRight1040
     * @tc.desc Verify reduceRight on all-zero array returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([zeroPointZero, zeroPointZero, zeroPointZero]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4100
     * @tc.name testFloat64ArrayReduceRight1041
     * @tc.desc Verify reduceRight on all-same array [5,5,5] returns 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const fifteenPointzero: number = 15.0;
      const arr = new Float64Array([fivePointZero, fivePointZero, fivePointZero]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = fifteenPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4200
     * @tc.name testFloat64ArrayReduceRight1042
     * @tc.desc Verify reduceRight on negative value array returns -6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsixPointzero: number = -6.0;
      const arr = new Float64Array([-1.0, -2.0, -3.0]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = negsixPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4300
     * @tc.name testFloat64ArrayReduceRight1043
     * @tc.desc Verify reduceRight on decimal precision array returns 0.6000000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointSix: number = 0.6;
      const arr = Float64Array.of(0.1, 0.2, 0.3);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = pointSix;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4400
     * @tc.name testFloat64ArrayReduceRight1044
     * @tc.desc Verify reduceRight on single-element [100.0] returns 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const arr = new Float64Array([hundredPointZero]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = hundredPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4500
     * @tc.name testFloat64ArrayReduceRight1045
     * @tc.desc Verify reduceRight on two-element [10.0,20.0] returns 30.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(10.0, 20.0);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = thirtyPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4600
     * @tc.name testFloat64ArrayReduceRight1046
     * @tc.desc Verify reduceRight on 10-element array [1..10] returns 55.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const ninePointZero: number = 9.0;
      const tenPointZero: number = 10.0;
      const fillValue55: number = 55.0;
      const arr =
        new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0,
          sevenPointZero, eightPointZero, ninePointZero, tenPointZero]);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = fillValue55;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4700
     * @tc.name testFloat64ArrayReduceRight1047
     * @tc.desc Verify reduceRight on 100-element array [1..100] returns 5050.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num5050Pointzero: number = 5050.0;
      const values: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        values.push(i + 1);
      }
      const arr = new Float64Array(values);
      const result = arr.reduceRight((prev, curr) => prev + curr);
      const expectVal = num5050Pointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4800
     * @tc.name testFloat64ArrayReduceRight1048
     * @tc.desc Verify reduceRight callback modifies external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      let counter = 0;
      const result = arr.reduceRight((prev, curr) => {
        counter++;
        return prev + curr;
      });
      const expectVal = twoValue;
      expect(counter).assertEqual(expectVal);
      const expectVal2 = sixPointZero;
      expect(result).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_4900
     * @tc.name testFloat64ArrayReduceRight1049
     * @tc.desc Verify reduceRight callback reads and modifies external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(1.0, 2.0, threePointZero);
      let externalSum = 0;
      const result = arr.reduceRight((prev, curr) => {
        externalSum += curr;
        return prev + curr;
      });
      const expectVal = threePointZero;
      expect(externalSum).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5000
     * @tc.name testFloat64ArrayReduceRight1050
     * @tc.desc Verify reduceRight callback calls external function double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev: number, curr: number) => prev + curr * 2.0);
      const expectVal = ninePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5100
     * @tc.name testFloat64ArrayReduceRight1051
     * @tc.desc Verify reduceRight callback with nested logic curr*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => {
        return prev + curr * 2;
      });
      const expectVal = ninePointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5200
     * @tc.name testFloat64ArrayReduceRight1052
     * @tc.desc Verify reduceRight callback returns Infinity when curr is 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => {
        if (curr === 3.0) {
          return Infinity;
        }
        return prev + curr;
      });
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5300
     * @tc.name testFloat64ArrayReduceRight1053
     * @tc.desc Verify reduceRight callback returns -Infinity when curr is 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => {
        if (curr === 3.0) {
          return -Infinity;
        }
        return prev + curr;
      });
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5400
     * @tc.name testFloat64ArrayReduceRight1054
     * @tc.desc Verify reduceRight callback returns NaN when curr is 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => {
        if (curr === 3.0) {
          return NaN;
        }
        return prev + curr;
      });
      const actVal3 = Number.isNaN(result);
      const expectVal = false;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5500
     * @tc.name testFloat64ArrayReduceRight1055
     * @tc.desc Verify reduceRight callback returns 0 when curr is 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixPointZero: number = 6.0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const result = arr.reduceRight((prev, curr) => {
        if (curr === 3.0) {
          return 0;
        }
        return prev + curr;
      });
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_RIGHT_1_5600
     * @tc.name testFloat64ArrayReduceRight1056
     * @tc.desc Verify reduceRight reads modified value when callback changes earlier elements during right-to-left iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduceRight1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Value: number = 999.0;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      // reduceRight iterates: index 4 → 3 → 2 → 1 → 0
      // At index 4 (value 5.0), modify index 1 from 2.0 to 999.0
      // reduceRight should use modified value 999.0 when it reaches index 1
      const result = arr.reduceRight((prev: number, val: number, index: int): number => {
        if (index === 4) {
          arr.$_set(1, num999Value);
        }
        return prev + val;
      }, 0.0);
      const expectVal = 1012.0;
      expect(result).assertEqual(expectVal);
    });
  })
}
