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

export default function Float64ArraySortTest(): void {
  describe('Float64ArraySortTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0100
     * @tc.name testFloat64ArraySort001
     * @tc.desc Verify sort with [-2147483648, -1] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(negativeOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0200
     * @tc.name testFloat64ArraySort002
     * @tc.desc Verify sort with [Double.MAX_VALUE, Double.MAX_VALUE / 2.0] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = Double.MAX_VALUE;
      const twoPointZero: number = 2.0;
      const twoValue: number = 2;
      const arr = Float64Array.of(doubleMaxValue, doubleMaxValue / twoPointZero);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(doubleMaxValue / twoPointZero);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0300
     * @tc.name testFloat64ArraySort003
     * @tc.desc Verify sort with [Double.MIN_VALUE, Double.MIN_VALUE * 2.0] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const twoValue: number = 2;
      const arr = Float64Array.of(doubleMinValue, doubleMinValue * 2.0);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(doubleMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0400
     * @tc.name testFloat64ArraySort004
     * @tc.desc Verify sort with [Double.NaN, Double.POSITIVE_INFINITY] element values and not NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = new Float64Array([nanValue, positiveInfinity]);
      arr.sort();
      expect(arr[0]).assertEqual(positiveInfinity);
      const actVal1 = Number.isNaN(arr[1]);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0500
     * @tc.name testFloat64ArraySort005
     * @tc.desc Verify sort with [Double.NEGATIVE_INFINITY, -0.0] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(negativeInfinity, negativeZero);
      arr.sort();
      expect(arr[0]).assertEqual(negativeInfinity);
      expect(arr[1]).assertEqual(negativeZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0600
     * @tc.name testFloat64ArraySort006
     * @tc.desc Verify sort with [0xFF, 0x1A] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValue1A: number = 0x1A;
      const twoValue: number = 2;
      const twentysixValue: number = 26;
      const num255Value: number = 255;
      const arr = Float64Array.of(hexValueFF, hexValue1A);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(twentysixValue);
      expect(arr[1]).assertEqual(num255Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0700
     * @tc.name testFloat64ArraySort007
     * @tc.desc Verify sort with [0b1010, 0b1111] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const binaryValue1111: number = 0b1111;
      const twoValue: number = 2;
      const tenValue: number = 10;
      const fifteenValue: number = 15;
      const arr = Float64Array.of(binaryValue1010, binaryValue1111);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(tenValue);
      expect(arr[1]).assertEqual(fifteenValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0800
     * @tc.name testFloat64ArraySort008
     * @tc.desc Verify sort with [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const twoValue: number = 2;
      const minSafeInteger2: number = -9007199254740991;
      const maxSafeInteger2: number = 9007199254740991;
      const arr = Float64Array.of(maxSafeInteger, minSafeInteger);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(minSafeInteger2);
      expect(arr[1]).assertEqual(maxSafeInteger2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_0900
     * @tc.name testFloat64ArraySort009
     * @tc.desc Verify sort with [0.1, 9007199254740991] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoValue: number = 2;
      const arr = new Float64Array([pointOne, maxSafeInteger]);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      const actVal2 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal3).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1000
     * @tc.name testFloat64ArraySort010
     * @tc.desc Verify sort with [0xDE, 0xAD] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueDE: number = 0xDE;
      const hexValueAD: number = 0xAD;
      const twoValue: number = 2;
      const num173Value: number = 173;
      const num222Value: number = 222;
      const arr = Float64Array.of(hexValueDE, hexValueAD);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(num173Value);
      expect(arr[1]).assertEqual(num222Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1100
     * @tc.name testFloat64ArraySort011
     * @tc.desc Verify sort with [0.5, 1.5] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoValue: number = 2;
      const arr = new Float64Array([pointFive, onePointFive]);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      const actVal4 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal4).assertEqual(expectVal);
      const actVal5 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal5).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1200
     * @tc.name testFloat64ArraySort012
     * @tc.desc Verify sort with [-32768, -128] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[1]).assertEqual(int8MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1300
     * @tc.name testFloat64ArraySort013
     * @tc.desc Verify sort with [0x1, 0x1] length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1: number = 0x1;
      const twoValue: number = 2;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([hexValue1, hexValue1]);
      arr.sort();
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(onePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1400
     * @tc.name testFloat64ArraySort014
     * @tc.desc Verify sort puts -Infinity before finite values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, negativeInfinity, -128]);
      arr.sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
      const expectVal2 = negativeInfinity;
      expect(arr[0]).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1500
     * @tc.name testFloat64ArraySort015
     * @tc.desc Verify custom comparator orders INT32 values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, int32MinValue, negativeOne);
      arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = int32MinValue;
      expect(arr[0]).assertEqual(expectVal);
      const expectVal2 = negativeOne;
      expect(arr[1]).assertEqual(expectVal2);
      const expectVal3 = zeroValue;
      expect(arr[2]).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1600
     * @tc.name testFloat64ArraySort016
     * @tc.desc Verify custom comparator orders MAX_SAFE mixed values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = new Float64Array([pointOne, maxSafeInteger, zeroValue]);
      arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
      const expectVal2 = pointOne;
      expect(arr[1]).assertEqual(expectVal2);
      const expectVal3 = maxSafeInteger;
      expect(arr[2]).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1700
     * @tc.name testFloat64ArraySort017
     * @tc.desc Verify custom comparator orders decimal values descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive]);
      arr.sort((a: number, b: number): Int => {
        if (a > b) {
          return -1 as Int;
        }
        if (a < b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = onePointFive;
      expect(arr[0]).assertEqual(expectVal);
      const expectVal2 = pointFive;
      expect(arr[1]).assertEqual(expectVal2);
      const expectVal3 = pointTwoFive;
      expect(arr[2]).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1800
     * @tc.name testFloat64ArraySort018
     * @tc.desc Verify sort arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const actVal6 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal8).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_1900
     * @tc.name testFloat64ArraySort019
     * @tc.desc Verify sort regular function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const cmp = (a: number, b: number): int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      };
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.sort(cmp);
      const actVal9 = arr.$_get(0);
      const expectVal = zeroValue;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = arr.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal10).assertEqual(expectVal2);
      const actVal11 = arr.$_get(2);
      const expectVal3 = maxSafeInteger;
      expect(actVal11).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2000
     * @tc.name testFloat64ArraySort020
     * @tc.desc Verify sort comparator reads external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let externalCount = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.sort((a: number, b: number): Int => {
        externalCount++;
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      })

      const expectVal = true;
      expect(externalCount > 0).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2100
     * @tc.name testFloat64ArraySort021
     * @tc.desc Verify sort comparator modifies external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0.0;
      const arr = new Float64Array([-32768, -128, 0]);
      arr.sort((a: number, b: number): Int => {
        sum += a;
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      })

      const expectVal = false;
      expect(sum > 0.0).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2200
     * @tc.name testFloat64ArraySort022
     * @tc.desc Verify sort comparator nested call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const nestedCmp = (a: number, b: number): int => {
        const helper = (x: number, y: number): int => {
          if (x < y) {
            return -1 as Int;
          }
          if (x > y) {
            return 1 as Int;
          }
          return 0 as Int;
        };
        ;
        return helper(a, b);
      }
      arr.sort(nestedCmp);
      const actVal12 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal12).assertEqual(expectVal);
      const actVal13 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal13).assertEqual(expectVal2);
      const actVal14 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal14).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2300
     * @tc.name testFloat64ArraySort023
     * @tc.desc Verify sort comparator returns boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.sort((a: number, b: number): Int => {
        return 0 as Int;
      })

      const actVal15 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal16).assertEqual(expectVal2);
      const actVal17 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal17).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2400
     * @tc.name testFloat64ArraySort024
     * @tc.desc Verify sort comparator with conditional branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.sort((a: number, b: number): Int => {
        if (a === 0.0) {
          return -1;
        }
        if (b === 0.0) {
          return 1;
        }
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      })

      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2500
     * @tc.name testFloat64ArraySort025
     * @tc.desc Verify sort comparator with multi-condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      arr.sort((a: number, b: number): Int => {
        const diff = a - b;
        if (diff < 0) {
          return -1;
        }
        if (diff > 0) {
          return 1;
        }
        return 0;
      })

      const actVal18 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal18).assertEqual(expectVal);
      const actVal19 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal19).assertEqual(expectVal2);
      const actVal20 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal20).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2600
     * @tc.name testFloat64ArraySort026
     * @tc.desc Verify sort comparator returns absolute difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      arr.sort((a: number, b: number): Int => {
        const diff = a - b;
        return diff < 0 ? -1 : (diff > 0 ? 1 : 0);
      })

      const actVal21 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal22).assertEqual(expectVal2);
      const actVal23 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal23).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2700
     * @tc.name testFloat64ArraySort027
     * @tc.desc Verify sort comparator with scientific notation literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 1.0e-1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      })

      const actVal24 = arr.$_get(0);
      const expectVal = zeroValue;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = arr.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal25).assertEqual(expectVal2);
      const actVal26 = arr.$_get(2);
      const expectVal3 = maxSafeInteger;
      expect(actVal26).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2800
     * @tc.name testFloat64ArraySort028
     * @tc.desc Verify sort with compareFn throws - RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.sort((a: number, b: number): Int => {
          throw new RangeError('test error');
        })
        expect().assertFail();

      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2900
     * @tc.name testFloat64ArraySort029
     * @tc.desc Verify sort with compareFn throws - TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.sort((a: number, b: number): Int => {
          throw new TypeError('test error');
        })
        expect().assertFail();

      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3000
     * @tc.name testFloat64ArraySort030
     * @tc.desc Verify sort with compareFn throws - Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.sort((a: number, b: number): Int => {
          throw new Error('test error');
        })
        expect().assertFail();

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3100
     * @tc.name testFloat64ArraySort031
     * @tc.desc Verify sort with compareFn throws - conditional error in comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.sort((a: number, b: number): Int => {
          if (a > b) {
            throw new Error('conditional throw');
          }
          return 0;
        })
        expect().assertFail();

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3200
     * @tc.name testFloat64ArraySort032
     * @tc.desc Verify sort with compareFn throws - loop error in comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.sort((a: number, b: number): Int => {
          let i = 0;
          while (i < 1) {
            throw new Error('loop throw');
          }
          return 0;
        })
        expect().assertFail();

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3300
     * @tc.name testFloat64ArraySort033
     * @tc.desc Verify sort with compareFn throws - comparator calls throwing function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const throwingFn = (): number => {
        throw new Error('nested throw');
      };
      try {
        arr.sort((a: number, b: number): Int => {
          throwingFn();
          return 0;
        })
        expect().assertFail();

      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3400
     * @tc.name testFloat64ArraySort034
     * @tc.desc Verify sort compareFn is not called for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const arr = new Float64Array();
      const result = arr.sort((a: number, b: number): Int => {
        called = true;
        return 0;
      });
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3500
     * @tc.name testFloat64ArraySort035
     * @tc.desc Verify sort on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      let called = false;
      arr.sort((a: number, b: number): Int => {
        called = true;
        return 0;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3600
     * @tc.name testFloat64ArraySort036
     * @tc.desc Verify sort() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array();
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
      expect(result.length).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3700
     * @tc.name testFloat64ArraySort037
     * @tc.desc Verify sort() with [0.1, 9007199254740991, 0, 3.141592653589793] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      arr.sort();
      const actVal27 = arr.$_get(0);
      const expectVal = zeroValue;
      expect(actVal27).assertEqual(expectVal);
      const actVal28 = arr.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal28).assertEqual(expectVal2);
      const actVal29 = arr.$_get(2);
      const expectVal3 = piValue;
      expect(actVal29).assertEqual(expectVal3);
      const actVal30 = arr.$_get(3);
      const expectVal4 = maxSafeInteger;
      expect(actVal30).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3800
     * @tc.name testFloat64ArraySort038
     * @tc.desc Verify sort((a: number, b: number) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array();
      const result = arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = arr;
      expect(result).assertEqual(expectVal);
      expect(result.length).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_3900
     * @tc.name testFloat64ArraySort039
     * @tc.desc Verify sort((a: number, b: number) with [0.5, 1.5, 0.25, 0.125] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const actVal31 = arr.$_get(0);
      const expectVal = pointOneTwoFive;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = arr.$_get(1);
      const expectVal2 = pointTwoFive;
      expect(actVal32).assertEqual(expectVal2);
      const actVal33 = arr.$_get(2);
      const expectVal3 = pointFive;
      expect(actVal33).assertEqual(expectVal3);
      const actVal34 = arr.$_get(3);
      const expectVal4 = onePointFive;
      expect(actVal34).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4000
     * @tc.name testFloat64ArraySort040
     * @tc.desc Verify sort return type - returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4100
     * @tc.name testFloat64ArraySort041
     * @tc.desc Verify sort return type - returns this with compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.sort((a: number, b: number): Int => {
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4200
     * @tc.name testFloat64ArraySort042
     * @tc.desc Verify sort() behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4300
     * @tc.name testFloat64ArraySort043
     * @tc.desc Verify sort return type - single element returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4400
     * @tc.name testFloat64ArraySort044
     * @tc.desc Verify sort return type - chainable call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive]);
      const result = arr.sort().sort((a: number, b: number): Int => {
        if (b < a) {
          return -1 as Int;
        }
        if (b > a) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = arr;
      expect(result).assertEqual(expectVal);
      const actVal35 = arr.$_get(0);
      const expectVal2 = onePointFive;
      expect(actVal35).assertEqual(expectVal2);
      const actVal36 = arr.$_get(1);
      const expectVal3 = pointFive;
      expect(actVal36).assertEqual(expectVal3);
      const actVal37 = arr.$_get(2);
      const expectVal4 = pointTwoFive;
      expect(actVal37).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4500
     * @tc.name testFloat64ArraySort045
     * @tc.desc Verify sort return type - chainable without compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.sort();
      const result2 = result.sort();
      expect(result).assertEqual(arr);
      expect(result2).assertEqual(arr);
      const actVal38 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal39).assertEqual(expectVal2);
      const actVal40 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal40).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4600
     * @tc.name testFloat64ArraySort046
     * @tc.desc Verify sort return type - read after in-place modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.sort();
      expect(result).assertEqual(arr);
      const actVal41 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal42).assertEqual(expectVal2);
      const actVal43 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal43).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4700
     * @tc.name testFloat64ArraySort047
     * @tc.desc Verify sort keeps element sum unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const beforeSum = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const actVal44 = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const expectVal = beforeSum;
      expect(actVal44).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4800
     * @tc.name testFloat64ArraySort048
     * @tc.desc Verify sort keeps element product unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const beforeProduct = arr.$_get(0) * arr.$_get(1) * arr.$_get(2);
      arr.sort();
      const actVal45 = arr.$_get(0) * arr.$_get(1) * arr.$_get(2);
      const expectVal = beforeProduct;
      expect(actVal45).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_4900
     * @tc.name testFloat64ArraySort049
     * @tc.desc Verify sort without compareFn orders decimal array ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.sort();
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(pointTwoFive);
      expect(arr[1]).assertEqual(pointFive);
      expect(arr[2]).assertEqual(onePointFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5000
     * @tc.name testFloat64ArraySort050
     * @tc.desc Verify sort with undefined compareFn returns same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.sort(undefined);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5100
     * @tc.name testFloat64ArraySort051
     * @tc.desc Verify sort without compareFn orders INT32 values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, negativeOne, int32MinValue);
      arr.sort();
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(negativeOne);
      expect(arr[2]).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5200
     * @tc.name testFloat64ArraySort052
     * @tc.desc Verify sort without compareFn orders MAX_SAFE mixed values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = new Float64Array([pointOne, maxSafeInteger, zeroValue]);
      arr.sort();
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[1]).assertEqual(pointOne);
      expect(arr[2]).assertEqual(maxSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5300
     * @tc.name testFloat64ArraySort053
     * @tc.desc Verify sort without compareFn orders negative finite values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = new Float64Array([int8MinValue, zeroValue, int16MinValue]);
      arr.sort();
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[1]).assertEqual(int8MinValue);
      expect(arr[2]).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5400
     * @tc.name testFloat64ArraySort054
     * @tc.desc Verify sort compareFn partial comparison records calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let callCount = 0;
      arr.sort((a: number, b: number): Int => {
        callCount++;
        if (callCount < 2) {
          return a < b ? -1 : 1;
        }
        return 0;
      })

      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
      const expectVal2 = true;
      expect(callCount > 0).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5500
     * @tc.name testFloat64ArraySort055
     * @tc.desc Verify sort compareFn call count verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      let callCount = 0;
      arr.sort((a: number, b: number): Int => {
        callCount++;
        if (a < b) {
          return -1 as Int;
        }
        if (a > b) {
          return 1 as Int;
        }
        return 0 as Int;
      })

      const expectVal = true;
      expect(callCount > 0).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5600
     * @tc.name testFloat64ArraySort056
     * @tc.desc Verify sort((a: number, b: number) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      let called = false;
      arr.sort((a: number, b: number): Int => {
        called = true;
        return 0;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5700
     * @tc.name testFloat64ArraySort057
     * @tc.desc Verify sort without compareFn default ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      values.sort();
      const actVal46 = values.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = values.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal47).assertEqual(expectVal2);
      const actVal48 = values.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal48).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5800
     * @tc.name testFloat64ArraySort058
     * @tc.desc Verify sort with compareFn ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      values.sort((a, b) => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      })

      expect(values[0]).assertEqual(zeroValue);
      expect(values[1]).assertEqual(pointOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_5900
     * @tc.name testFloat64ArraySort059
     * @tc.desc Verify sort with compareFn descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = new Float64Array([0.5, onePointFive, pointTwoFive]);
      values.sort((a, b) => {
        if (a < b) {
          return 1;
        }
        if (a > b) {
          return -1;
        }
        return 0;
      })

      expect(values[0]).assertEqual(onePointFive);
      expect(values[2]).assertEqual(pointTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6000
     * @tc.name testFloat64ArraySort060
     * @tc.desc Verify sort single element array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = new Float64Array([int16MinValue]);
      values.sort();
      const actVal49 = values.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal49).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6100
     * @tc.name testFloat64ArraySort061
     * @tc.desc Verify sort array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const nanValue: number = Double.NaN;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const values = new Float64Array([nanValue, negativeOne, zeroValue]);
      values.sort();
      const expectVal = threeValue;
      expect(values.length).assertEqual(expectVal);
      const expectVal2 = negativeOne;
      expect(values.$_get(0)).assertEqual(expectVal2);
      const actVal50 = Number.isNaN(values.$_get(2));
      const expectVal3 = true;
      expect(actVal50).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6200
     * @tc.name testFloat64ArraySort062
     * @tc.desc Verify sort with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = new Float64Array([pointOne, maxSafeInteger, zeroValue]);
      values.sort((a, b) => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      })

      const actVal50 = values.$_get(0);
      const expectVal = zeroValue;
      expect(actVal50).assertEqual(expectVal);
      const actVal51 = values.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal51).assertEqual(expectVal2);
      const actVal52 = values.$_get(2);
      const expectVal3 = maxSafeInteger;
      expect(actVal52).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6300
     * @tc.name testFloat64ArraySort063
     * @tc.desc Verify sort compareFn error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      try {
        values.sort((a, b) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6400
     * @tc.name testFloat64ArraySort064
     * @tc.desc Verify sort returns current array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      const result = values.sort();
      const expectVal = values;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6500
     * @tc.name testFloat64ArraySort065
     * @tc.desc Verify sort with identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([zeroValue, zeroValue, zeroValue]);
      values.sort();
      const actVal53 = values.$_get(0);
      const expectVal = zeroValue;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = values.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal54).assertEqual(expectVal2);
      const actVal55 = values.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal55).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6600
     * @tc.name testFloat64ArraySort066
     * @tc.desc Verify sort with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const fillValue85: number = 85.0;
      const num255Value: number = 255;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      arr.sort();
      expect(arr[0]).assertEqual(fillValue85);
      expect(arr[2]).assertEqual(num255Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6700
     * @tc.name testFloat64ArraySort067
     * @tc.desc Verify sort with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const fillValue85: number = 85.0;
      const num255Value: number = 255;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      arr.sort();
      expect(arr[0]).assertEqual(fillValue85);
      expect(arr[2]).assertEqual(num255Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6800
     * @tc.name testFloat64ArraySort068
     * @tc.desc Verify sort with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const maxValue: number = Double.MAX_VALUE;
      const arr = new Float64Array([nanValue, maxValue]);
      arr.sort();
      const firstElement: number = arr.$_get(0);
      const expectVal = maxValue;
      expect(firstElement).assertEqual(expectVal);
      const lastElement: number = arr.$_get(1);
      const actVal56 = Number.isNaN(lastElement);
      const expectVal2 = true;
      expect(actVal56).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_6900
     * @tc.name testFloat64ArraySort069
     * @tc.desc Verify sort with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      arr.sort();
      const firstElement: number = arr.$_get(0);
      const expectVal = negativeInfinity;
      expect(firstElement).assertEqual(expectVal);
      const secondElement: number = arr.$_get(1);
      const expectVal2 = positiveInfinity;
      expect(secondElement).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7000
     * @tc.name testFloat64ArraySort070
     * @tc.desc Verify sort with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      arr.sort();
      expect(arr[0]).assertEqual(doubleMinValue);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7100
     * @tc.name testFloat64ArraySort071
     * @tc.desc Verify sort() with already sorted array [1.0, 2.0, 3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      arr.sort();
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
      expect(arr[2]).assertEqual(threePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7200
     * @tc.name testFloat64ArraySort072
     * @tc.desc Verify sort() with reverse sorted array [3.0, 2.0, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(threePointZero, twoPointZero, onePointZero);
      arr.sort();
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
      expect(arr[2]).assertEqual(threePointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7300
     * @tc.name testFloat64ArraySort073
     * @tc.desc Verify sort() with negative values array [-1.0, -3.0, -2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negthreePointzero: number = -3.0;
      const negtwoPointzero: number = -2.0;
      const arr = Float64Array.of(negonePointzero, negthreePointzero, negtwoPointzero);
      arr.sort();
      expect(arr[0]).assertEqual(negthreePointzero);
      expect(arr[1]).assertEqual(negtwoPointzero);
      expect(arr[2]).assertEqual(negonePointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7400
     * @tc.name testFloat64ArraySort074
     * @tc.desc Verify sort() with decimal values array [0.5, 0.1, 0.9, 0.3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointOne: number = 0.1;
      const pointNine: number = 0.9;
      const pointThree: number = 0.3;
      const arr = new Float64Array([pointFive, pointOne, pointNine, pointThree]);
      arr.sort();
      expect(arr[0]).assertEqual(pointOne);
      expect(arr[1]).assertEqual(pointThree);
      expect(arr[2]).assertEqual(pointFive);
      expect(arr[3]).assertEqual(pointNine);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7500
     * @tc.name testFloat64ArraySort075
     * @tc.desc Verify sort() with positive and negative mixed array [-2.5, 1.5, -0.5, 0.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negtwoPointfive: number = -2.5;
      const onePointFive: number = 1.5;
      const negativeHalfValue: number = -0.5;
      const pointFive: number = 0.5;
      const arr = Float64Array.of(negtwoPointfive, onePointFive, negativeHalfValue, pointFive);
      arr.sort();
      expect(arr[0]).assertEqual(negtwoPointfive);
      expect(arr[1]).assertEqual(negativeHalfValue);
      expect(arr[2]).assertEqual(pointFive);
      expect(arr[3]).assertEqual(onePointFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7600
     * @tc.name testFloat64ArraySort076
     * @tc.desc Verify sort() with large values [1.0e+300, 1.0e+200, 1.0e+100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e300: number = 1.0e+300;
      const sciValue10e200: number = 1.0e+200;
      const sciValue10e100: number = 1.0e+100;
      const arr = new Float64Array([sciValue10e300, sciValue10e200, sciValue10e100]);
      arr.sort();
      expect(arr[0]).assertEqual(sciValue10e100);
      expect(arr[1]).assertEqual(sciValue10e200);
      expect(arr[2]).assertEqual(sciValue10e300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7700
     * @tc.name testFloat64ArraySort077
     * @tc.desc Verify sort() with tiny values [5.0e-324, 1.0e-300, 1.0e-200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue50e324: number = 5.0e-324;
      const sciValue10e300: number = 1.0e-300;
      const sciValue10e200: number = 1.0e-200;
      const arr = Float64Array.of(sciValue50e324, sciValue10e300, sciValue10e200);
      arr.sort();
      expect(arr[0]).assertEqual(sciValue50e324);
      expect(arr[1]).assertEqual(sciValue10e300);
      expect(arr[2]).assertEqual(sciValue10e200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7800
     * @tc.name testFloat64ArraySort078
     * @tc.desc Verify sort() with scientific notation [1.0e-50, 2.0e-50, 3.0e-50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e50: number = 1.0e-50;
      const sciValue20e50: number = 2.0e-50;
      const sciValue30e50: number = 3.0e-50;
      const arr = Float64Array.of(sciValue10e50, sciValue20e50, sciValue30e50);
      arr.sort();
      expect(arr[0]).assertEqual(sciValue10e50);
      expect(arr[1]).assertEqual(sciValue20e50);
      expect(arr[2]).assertEqual(sciValue30e50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_7900
     * @tc.name testFloat64ArraySort079
     * @tc.desc Verify sort() with octal literal array [0o10, 0o5, 0o20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const eightPointZero: number = 8.0;
      const sixteenPointzero: number = 16.0;
      const arr = new Float64Array([0o10, 0o5, 0o20]);
      arr.sort();
      expect(arr[0]).assertEqual(fivePointZero);
      expect(arr[1]).assertEqual(eightPointZero);
      expect(arr[2]).assertEqual(sixteenPointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8000
     * @tc.name testFloat64ArraySort080
     * @tc.desc Verify sort() with integer and float mixed array [1.0, 2, 3.0, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const arr = Float64Array.of(onePointZero, 2, threePointZero, 4);
      arr.sort();
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
      expect(arr[2]).assertEqual(threePointZero);
      expect(arr[3]).assertEqual(fourPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8100
     * @tc.name testFloat64ArraySort081
     * @tc.desc Verify sort() with duplicate elements [2.0, 1.0, 2.0, 1.0, 2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array([twoPointZero, onePointZero, twoPointZero, onePointZero, twoPointZero]);
      arr.sort();
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(onePointZero);
      expect(arr[2]).assertEqual(twoPointZero);
      expect(arr[3]).assertEqual(twoPointZero);
      expect(arr[4]).assertEqual(twoPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8200
     * @tc.name testFloat64ArraySort082
     * @tc.desc Verify sort() with all negative zero array [-0.0, -0.0, -0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const threeValue: number = 3;
      const arr = Float64Array.of(negativeZero, negativeZero, negativeZero);
      arr.sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8300
     * @tc.name testFloat64ArraySort083
     * @tc.desc Verify sort() with positive and negative zero mixed [0.0, -0.0, 1.0, -1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(0.0, -0.0, 1.0, -1.0);
      arr.sort();
      const expectVal = fourValue;
      expect(arr.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8400
     * @tc.name testFloat64ArraySort084
     * @tc.desc Verify sort() with NaN array [3.0, NaN, 1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const nanValue: number = NaN;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(threePointZero, nanValue, onePointZero);
      arr.sort();
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(threePointZero);
      const actVal57 = Number.isNaN(arr[2]);
      const expectVal = true;
      expect(actVal57).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8500
     * @tc.name testFloat64ArraySort085
     * @tc.desc Verify sort() with -Infinity, Infinity and 0.0 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const positiveInfinity: number = Infinity;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([negativeInfinity, positiveInfinity, zeroPointZero]);
      arr.sort();
      expect(arr[0]).assertEqual(negativeInfinity);
      expect(arr[1]).assertEqual(zeroPointZero);
      expect(arr[2]).assertEqual(positiveInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8600
     * @tc.name testFloat64ArraySort086
     * @tc.desc Verify sort() with -Infinity and negative values array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const negonePointzero: number = -1.0;
      const negtwoPointzero: number = -2.0;
      const arr = new Float64Array([negativeInfinity, negonePointzero, negtwoPointzero]);
      arr.sort();
      expect(arr[0]).assertEqual(negativeInfinity);
      expect(arr[1]).assertEqual(negtwoPointzero);
      expect(arr[2]).assertEqual(negonePointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8700
     * @tc.name testFloat64ArraySort087
     * @tc.desc Verify sort() with +Infinity array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array([positiveInfinity, onePointZero, twoPointZero]);
      arr.sort();
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(twoPointZero);
      expect(arr[2]).assertEqual(positiveInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8800
     * @tc.name testFloat64ArraySort088
     * @tc.desc Verify sort() with MAX_SAFE_INTEGER array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(maxSafeInteger, onePointZero, zeroPointZero);
      arr.sort();
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(onePointZero);
      expect(arr[2]).assertEqual(maxSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_8900
     * @tc.name testFloat64ArraySort089
     * @tc.desc Verify sort() with MIN_SAFE_INTEGER array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991;
      const negonePointzero: number = -1.0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(minSafeInteger, negonePointzero, zeroPointZero);
      arr.sort();
      expect(arr[0]).assertEqual(minSafeInteger);
      expect(arr[1]).assertEqual(negonePointzero);
      expect(arr[2]).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_9000
     * @tc.name testFloat64ArraySort090
     * @tc.desc Verify sort() with 2147483647 boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int32MaxValue, onePointZero, zeroPointZero);
      arr.sort();
      expect(arr[0]).assertEqual(zeroPointZero);
      expect(arr[1]).assertEqual(onePointZero);
      expect(arr[2]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_9100
     * @tc.name testFloat64ArraySort091
     * @tc.desc Verify sort() with overflow boundary [MAX_VALUE, MAX_VALUE - epsilon]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const sciValue17976931348623156e308: number = 1.7976931348623156e+308;
      const arr = Float64Array.of(doubleMaxValue, sciValue17976931348623156e308);
      arr.sort();
      expect(arr[0]).assertEqual(sciValue17976931348623156e308);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_9200
     * @tc.name testFloat64ArraySort092
     * @tc.desc Verify sort() with decimal precision boundary [0.3, 0.1, 0.2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointThree: number = 0.3;
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const arr = new Float64Array([pointThree, pointOne, pointTwo]);
      arr.sort();
      expect(arr[0]).assertEqual(pointOne);
      expect(arr[1]).assertEqual(pointTwo);
      expect(arr[2]).assertEqual(pointThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_9300
     * @tc.name testFloat64ArraySort093
     * @tc.desc Verify sort() with large negative decimal [-1.0, -999999.99, 0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negnum999999Pointninenine: number = -999999.99;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(negonePointzero, negnum999999Pointninenine, zeroPointZero);
      arr.sort();
      expect(arr[0]).assertEqual(negnum999999Pointninenine);
      expect(arr[1]).assertEqual(negonePointzero);
      expect(arr[2]).assertEqual(zeroPointZero);
    });

  })
}
