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
import Utils from './../Util.test';

export default function Float64ArrayChainExtension2Test(): void {
  describe('Float64ArrayChainExtension2Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0100
     * @tc.name testFloat64ArrayChainExtension2001
     * @tc.desc Verify sliding window sum size 2 at positions 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0, 20.0, 30.0, 40.0]);
      const w0: number = arr.subarray(0, 2).reduce((a: number, v: number): number => a + v, 0.0);
      const w1: number = arr.subarray(1, 3).reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = w0;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = w1;
      const expectedResultSecond: number = 50.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0200
     * @tc.name testFloat64ArrayChainExtension2002
     * @tc.desc Verify sliding window sum size 3 at positions 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const w0: number = arr.subarray(0, 3).reduce((a: number, v: number): number => a + v, 0.0);
      const w1: number = arr.subarray(1, 4).reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = w0;
      const expectedResult: number = 60.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = w1;
      const expectedResultSecond: number = 90.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0300
     * @tc.name testFloat64ArrayChainExtension2003
     * @tc.desc Verify sliding window max size 2 at positions 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 7.0, 2.0, 8.0]);
      const w0: number = arr.subarray(0, 2).reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const w1: number = arr.subarray(1, 3).reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const actualResult = w0;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = w1;
      const expectedResultSecond: number = 7.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0400
     * @tc.name testFloat64ArrayChainExtension2004
     * @tc.desc Verify sliding window max size 3 at positions 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 7.0, 2.0, 8.0, 1.0]);
      const w0: number = arr.subarray(0, 3).reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const w1: number = arr.subarray(2, 5).reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const actualResult = w0;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = w1;
      const expectedResultSecond: number = 8.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0500
     * @tc.name testFloat64ArrayChainExtension2005
     * @tc.desc Verify sliding window min size 2 at multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 7.0, 2.0, 8.0]);
      const w0: number = arr.subarray(0, 2).reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const w1: number = arr.subarray(2, 4).reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const actualResult = w0;
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = w1;
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0600
     * @tc.name testFloat64ArrayChainExtension2006
     * @tc.desc Verify sliding window average size 2 at positions 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0, 20.0, 30.0, 40.0]);
      const w0: number = arr.subarray(0, 2).reduce((a: number, v: number): number => a + v, 0.0) / 2.0;
      const w1: number = arr.subarray(1, 3).reduce((a: number, v: number): number => a + v, 0.0) / 2.0;
      const actualResult = w0;
      const expectedResult: number = 15.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = w1;
      const expectedResultSecond: number = 25.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0700
     * @tc.name testFloat64ArrayChainExtension2007
     * @tc.desc Verify sliding window average size 3 at middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10.0, 20.0, 30.0, 40.0]);
      const avg: number = arr.subarray(1, 4).reduce((a: number, v: number): number => a + v, 0.0) / 3.0;
      const actualResult = avg;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0800
     * @tc.name testFloat64ArrayChainExtension2008
     * @tc.desc Verify sliding window sum on edge positions (first and last window)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 15.0, 25.0]);
      const first: number = arr.subarray(0, 2).reduce((a: number, v: number): number => a + v, 0.0);
      const last: number = arr.subarray(1, 3).reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = first;
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = last;
      const expectedResultSecond: number = 40.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_0900
     * @tc.name testFloat64ArrayChainExtension2009
     * @tc.desc Verify filter removes NaN from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 2.0, NaN, 3.0]);
      const r = arr.filter((v: number): boolean => {
        return !isNaN(v);
      });
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1000
     * @tc.name testFloat64ArrayChainExtension2010
     * @tc.desc Verify filter removes Infinity from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, Infinity, 2.0, Infinity]);
      const r = arr.filter((v: number): boolean => {
        return v !== Infinity;
      });
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1100
     * @tc.name testFloat64ArrayChainExtension2011
     * @tc.desc Verify filter removes -Infinity from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -Infinity, 2.0]);
      const r = arr.filter((v: number): boolean => {
        return v !== -Infinity;
      });
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1200
     * @tc.name testFloat64ArrayChainExtension2012
     * @tc.desc Verify map converts NaN to 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, 1.0, NaN]);
      const r = arr.map((v: number): number => {
        return isNaN(v) ? 0.0 : v;
      });
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1300
     * @tc.name testFloat64ArrayChainExtension2013
     * @tc.desc Verify map converts Infinity to Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Infinity, 1.0, -Infinity]);
      const r = arr.map((v: number): number => {
        if (v === Infinity) {
          return Number.MAX_VALUE;
        }
        if (v === -Infinity) {
          return -Number.MAX_VALUE;
        }
        return v;
      });
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = Number.MAX_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = -Number.MAX_VALUE;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1400
     * @tc.name testFloat64ArrayChainExtension2014
     * @tc.desc Verify filter distinguishes -0.0 from 0.0 via 1/v check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, -0.0, 1.0]);
      const posZeros = arr.filter((v: number): boolean => {
        return 1.0 / v === Infinity;
      });
      const negZeros = arr.filter((v: number): boolean => {
        return 1.0 / v === -Infinity;
      });
      const actualLength = posZeros.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = negZeros.length;
      const expectedLengthSecond: int = 1;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1500
     * @tc.name testFloat64ArrayChainExtension2015
     * @tc.desc Verify ETL chain filter out NaN then map multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0, NaN, 5.0]);
      const r = arr.filter((v: number): boolean => {
        return !isNaN(v);
      }).map((v: number): number => v * 2.0);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 10.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1600
     * @tc.name testFloat64ArrayChainExtension2016
     * @tc.desc Verify ETL chain filter non-finite then map add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, Infinity, 3.0, -Infinity, 5.0]);
      const r = arr.filter((v: number): boolean => {
        return v !== Infinity && v !== -Infinity;
      }).map((v: number): number => v + 1.0);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 6.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1700
     * @tc.name testFloat64ArrayChainExtension2017
     * @tc.desc Verify variance of [1,2,3,4,5] via map+reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const variance: number = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      }).reduce((a: number, v: number): number => a + v, 0.0) / n;
      const actualResult = variance;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1800
     * @tc.name testFloat64ArrayChainExtension2018
     * @tc.desc Verify variance of all zeros is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const variance: number = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      }).reduce((a: number, v: number): number => a + v, 0.0) / n;
      const actualResult = variance;
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_1900
     * @tc.name testFloat64ArrayChainExtension2019
     * @tc.desc Verify variance of two extreme values via map+reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 100.0]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const variance: number = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      }).reduce((a: number, v: number): number => a + v, 0.0) / n;
      const actualResult = variance;
      const expectedResult: number = 2450.25;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2000
     * @tc.name testFloat64ArrayChainExtension2020
     * @tc.desc Verify variance of [-4,0,4] via map+reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-4.0, 0.0, 4.0]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const variance: number = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      }).reduce((a: number, v: number): number => a + v, 0.0) / n;
      expect(variance).assertEqual(32.0 / 3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2100
     * @tc.name testFloat64ArrayChainExtension2021
     * @tc.desc Verify variance of [1.5,2.5,3.5] via map+reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.5, 2.5, 3.5]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const variance: number = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      }).reduce((a: number, v: number): number => a + v, 0.0) / n;
      expect(variance).assertEqual(2.0 / 3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2200
     * @tc.name testFloat64ArrayChainExtension2022
     * @tc.desc Verify variance of [0.1,0.2,0.3] via map+reduce handles float precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.1, 0.2, 0.3]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const sq: Float64Array = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      });
      const variance: number = sq.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const actualElement0 = sq.$_get(0);
      const expectedElement0: number = 0.010000000000000007;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sq.$_get(1);
      const expectedElement1: number = 7.703719777548943e-34;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = sq.$_get(2);
      const expectedElement2: number = 0.00999999999999999;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualResult = variance;
      const expectedResult: number = 0.006666666666666665;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2300
     * @tc.name testFloat64ArrayChainExtension2023
     * @tc.desc Verify variance of large numbers [1e10,1e10+1] via map+reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([10000000000.0, 10000000001.0]);
      const n: int = arr.length;
      const mean: number = arr.reduce((a: number, v: number): number => a + v, 0.0) / n;
      const variance: number = arr.map((v: number): number => {
        const diff = v - mean;
        return diff * diff;
      }).reduce((a: number, v: number): number => a + v, 0.0) / n;
      const actualResult = variance;
      const expectedResult: number = 0.25;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2400
     * @tc.name testFloat64ArrayChainExtension2024
     * @tc.desc Verify normalize with zero range all same positive values produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 1.0, 1.0, 1.0]);
      const n: int = arr.length;
      let min: number = arr.reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      let max: number = arr.reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const range: number = max - min;
      const normalized: Float64Array = arr.map((v: number): number => (v - min) / range);
      for (let i: int = 0; i < n; i++) {
        expect(isNaN(normalized.$_get(i))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2500
     * @tc.name testFloat64ArrayChainExtension2025
     * @tc.desc Verify normalize with zero range all same value 5 produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 5.0, 5.0]);
      const min: number = arr.reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const max: number = arr.reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const range: number = max - min;
      const r = arr.map((v: number): number => (v - min) / range);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      expect(isNaN(r.$_get(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2600
     * @tc.name testFloat64ArrayChainExtension2026
     * @tc.desc Verify normalize with zero range all same negative values produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-3.0, -3.0, -3.0]);
      const min: number = arr.reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const max: number = arr.reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const range: number = max - min;
      const r = arr.map((v: number): number => (v - min) / range);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      expect(isNaN(r.$_get(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2700
     * @tc.name testFloat64ArrayChainExtension2027
     * @tc.desc Verify normalize with zero range all zeros produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0, 0.0]);
      const min: number = arr.reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const max: number = arr.reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const range: number = max - min;
      const r = arr.map((v: number): number => (v - min) / range);
      const actualLength = r.length;
      const expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
      expect(isNaN(r.$_get(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2800
     * @tc.name testFloat64ArrayChainExtension2028
     * @tc.desc Verify normalize with all NaN values produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, NaN, NaN]);
      const min: number = arr.reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const max: number = arr.reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const range: number = max - min;
      const r = arr.map((v: number): number => (v - min) / range);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      expect(isNaN(r.$_get(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_2900
     * @tc.name testFloat64ArrayChainExtension2029
     * @tc.desc Verify normalize with all Infinity values produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Infinity, Infinity, Infinity]);
      const min: number = arr.reduce((a: number, v: number): number => a < v ? a : v, Infinity);
      const max: number = arr.reduce((a: number, v: number): number => a > v ? a : v, -Infinity);
      const range: number = max - min;
      const r = arr.map((v: number): number => (v - min) / range);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      expect(isNaN(r.$_get(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3000
     * @tc.name testFloat64ArrayChainExtension2030
     * @tc.desc Verify fill partial range then indexOf finds first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      arr.fill(7.0, 1, 3);
      const actualIndex = arr.indexOf(7.0);
      const expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.indexOf(0.0);
      const expectedIndexSecond: int = 0;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3100
     * @tc.name testFloat64ArrayChainExtension2031
     * @tc.desc Verify fill then lastIndexOf finds last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      arr.fill(9.0, 1, 4);
      const actualIndex = arr.lastIndexOf(9.0);
      const expectedIndex: int = 3;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.lastIndexOf(0.0);
      const expectedIndexSecond: int = 4;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3200
     * @tc.name testFloat64ArrayChainExtension2032
     * @tc.desc Verify fill then indexOf with fromIndex parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      arr.fill(5.0, 2, 4);
      const actualIndex = arr.indexOf(5.0, 0);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.indexOf(5.0, 3);
      const expectedIndexSecond: int = 3;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
      const actualIndexThird = arr.indexOf(5.0, 4);
      const expectedIndexThird: int = -1;
      expect(actualIndexThird).assertEqual(expectedIndexThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3300
     * @tc.name testFloat64ArrayChainExtension2033
     * @tc.desc Verify fill with NaN then includes finds NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(NaN);
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3400
     * @tc.name testFloat64ArrayChainExtension2034
     * @tc.desc Verify fill with Infinity then indexOf finds position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      arr.fill(Infinity);
      const actualIndex = arr.indexOf(Infinity);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
      expect(arr.includes(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3500
     * @tc.name testFloat64ArrayChainExtension2035
     * @tc.desc Verify fill then indexOf vs lastIndexOf match for single fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0]);
      arr.fill(3.0, 1, 3);
      const actualIndex = arr.indexOf(3.0);
      const expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = arr.lastIndexOf(3.0);
      const expectedIndexSecond: int = 2;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3600
     * @tc.name testFloat64ArrayChainExtension2036
     * @tc.desc Verify every() returns false when NaN present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const r = arr.every((v: number): boolean => {
        return !isNaN(v);
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3700
     * @tc.name testFloat64ArrayChainExtension2037
     * @tc.desc Verify some() returns true when NaN present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const r = arr.some((v: number): boolean => {
        return isNaN(v);
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3800
     * @tc.name testFloat64ArrayChainExtension2038
     * @tc.desc Verify every() returns false when Infinity present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, Infinity, 3.0]);
      const r = arr.every((v: number): boolean => {
        return v !== Infinity && v !== -Infinity;
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_3900
     * @tc.name testFloat64ArrayChainExtension2039
     * @tc.desc Verify some() returns true when -Infinity present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -Infinity, 3.0]);
      const r = arr.some((v: number): boolean => {
        return v === -Infinity;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4000
     * @tc.name testFloat64ArrayChainExtension2040
     * @tc.desc Verify every() returns true when all values are finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const r = arr.every((v: number): boolean => {
        return v !== Infinity && v !== -Infinity && !isNaN(v);
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4100
     * @tc.name testFloat64ArrayChainExtension2041
     * @tc.desc Verify some() returns false when no special values present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const hasNaN = arr.some((v: number): boolean => {
        return isNaN(v);
      });
      const hasInf = arr.some((v: number): boolean => {
        return v === Infinity || v === -Infinity;
      });
      expect(hasNaN).assertFalse();
      expect(hasInf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4200
     * @tc.name testFloat64ArrayChainExtension2042
     * @tc.desc Verify with().with() immutable chain preserves original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.with(0, 99.0).with(1, 88.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = r.$_get(1);
      const expectedElement1Second: number = 88.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4300
     * @tc.name testFloat64ArrayChainExtension2043
     * @tc.desc Verify $_set then $_get readback chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4400
     * @tc.name testFloat64ArrayChainExtension2044
     * @tc.desc Verify fill then map then filter 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      arr.fill(3.0);
      const r = arr.map((v: number): number => v * 2.0).filter((v: number): boolean => v > 5.0);
      const actualLength = r.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 6.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4500
     * @tc.name testFloat64ArrayChainExtension2045
     * @tc.desc Verify map then filter then reduce 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r = arr.map((v: number): number => v * 3.0)
        .filter((v: number): boolean => v > 6.0)
        .reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 36.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4600
     * @tc.name testFloat64ArrayChainExtension2046
     * @tc.desc Verify filter then map then every 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r = arr.filter((v: number): boolean => v > 2.0)
        .map((v: number): number => v * 2.0)
        .every((v: number): boolean => v > 0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4700
     * @tc.name testFloat64ArrayChainExtension2047
     * @tc.desc Verify slice then with then filter chain (mixed mut/immut)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s = src.slice(1, 4);
      const w = s.with(0, 99.0);
      const f = w.filter((v: number): boolean => v > 3.0);
      const actualLength = f.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = f.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = f.$_get(1);
      const expectedElement1: number = 4.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4800
     * @tc.name testFloat64ArrayChainExtension2048
     * @tc.desc Verify reverse then with chain (mutable then immutable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const r = arr.with(0, 99.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_4900
     * @tc.name testFloat64ArrayChainExtension2049
     * @tc.desc Verify fill then copyWithin chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(0.0, 0, 2).copyWithin(2, 0, 2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 0.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5000
     * @tc.name testFloat64ArrayChainExtension2050
     * @tc.desc Verify sort orders equal numeric values without observable identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 3.0, 2.0]);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5100
     * @tc.name testFloat64ArrayChainExtension2051
     * @tc.desc Verify sort with Infinity and -Infinity moves them to ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, Infinity, 1.0, -Infinity, 2.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 3.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElementAt4 = arr.$_get(4);
      const expectedElementAt4: number = Infinity;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5200
     * @tc.name testFloat64ArrayChainExtension2052
     * @tc.desc Verify sort treats 0 and -0 as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, -0.0, 1.0, -1.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
      let negativeZeroCount: int = 0;
      let positiveZeroCount: int = 0;
      for (let i: int = 1; i <= 2; i++) {
        if (1.0 / arr.$_get(i) === -Infinity) {
          negativeZeroCount++;
        }
        if (1.0 / arr.$_get(i) === Infinity) {
          positiveZeroCount++;
        }
      }
      expect(negativeZeroCount).assertEqual(1);
      expect(positiveZeroCount).assertEqual(1);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 1.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5300
     * @tc.name testFloat64ArrayChainExtension2053
     * @tc.desc Verify toSorted returns new sorted array, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.toSorted();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5400
     * @tc.name testFloat64ArrayChainExtension2054
     * @tc.desc Verify sort then toString produces sorted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const actualString = arr.toString();
      const expectedString: string = "1,2,3";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5500
     * @tc.name testFloat64ArrayChainExtension2055
     * @tc.desc Verify filter then toString produces filtered string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r = arr.filter((v: number): boolean => v > 2.0);
      const actualString = r.toString();
      const expectedString: string = "3,4,5";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5600
     * @tc.name testFloat64ArrayChainExtension2056
     * @tc.desc Verify sort then join with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const actualString = arr.join(" - ");
      const expectedString: string = "1 - 2 - 3";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5700
     * @tc.name testFloat64ArrayChainExtension2057
     * @tc.desc Verify reverse then join with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      const actualString = arr.join("|");
      const expectedString: string = "3|2|1";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5800
     * @tc.name testFloat64ArrayChainExtension2058
     * @tc.desc Verify filter then join with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const r = arr.filter((v: number): boolean => v % 2.0 === 0.0);
      const actualString = r.join(",");
      const expectedString: string = "2,4";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_5900
     * @tc.name testFloat64ArrayChainExtension2059
     * @tc.desc Verify subarray then toString produces correct slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const sub = arr.subarray(1, 4);
      const actualString = sub.toString();
      const expectedString: string = "20,30,40";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6000
     * @tc.name testFloat64ArrayChainExtension2060
     * @tc.desc Verify copyWithin then join chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2, 4);
      const actualString = arr.join(",");
      const expectedString: string = "3,4,3,4";
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6100
     * @tc.name testFloat64ArrayChainExtension2061
     * @tc.desc Verify filter then map differs from map then filter under threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const a: Float64Array = arr.filter((v: number): boolean => v > 1.0).map((v: number): number => v * 2.0);
      const b: Float64Array = arr.map((v: number): number => v * 2.0).filter((v: number): boolean => v > 1.0);
      const actualLength = a.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = b.length;
      const expectedLengthSecond: int = 3;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6200
     * @tc.name testFloat64ArrayChainExtension2062
     * @tc.desc Verify slice then sort keeps source unsorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.slice().sort();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6300
     * @tc.name testFloat64ArrayChainExtension2063
     * @tc.desc Verify sort then slice mutates source before copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.sort().slice(0, 2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6400
     * @tc.name testFloat64ArrayChainExtension2064
     * @tc.desc Verify subarray reverse mutates parent local range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.subarray(1, 3).reverse();
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6500
     * @tc.name testFloat64ArrayChainExtension2065
     * @tc.desc Verify slice reverse keeps parent local range unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: Float64Array = arr.slice(1, 3).reverse();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6600
     * @tc.name testFloat64ArrayChainExtension2066
     * @tc.desc Verify with reduce does not mutate source while fill reduce does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const a: number = arr.with(0, 10.0).reduce((x: number, v: number): number => x + v, 0.0);
      const b: number = arr.fill(5.0).reduce((x: number, v: number): number => x + v, 0.0);
      const actualResult = a;
      const expectedResult: number = 12.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = b;
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6700
     * @tc.name testFloat64ArrayChainExtension2067
     * @tc.desc Verify copyWithin before filter changes filtered content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: Float64Array = arr.copyWithin(1, 3, 4).filter((v: number): boolean => v > 2.0);
      const actualLength = r.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6800
     * @tc.name testFloat64ArrayChainExtension2068
     * @tc.desc Verify filter before copyWithin changes only filtered copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: Float64Array = arr.filter((v: number): boolean => v > 2.0).copyWithin(1, 0, 1);
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 2.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_6900
     * @tc.name testFloat64ArrayChainExtension2069
     * @tc.desc Verify map then find returns mapped value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r = arr.map((v: number): number => v * 10.0).find((v: number): boolean => v > 10.0);
      const actualResult = r;
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7000
     * @tc.name testFloat64ArrayChainExtension2070
     * @tc.desc Verify subarray fill slice captures shared local mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: Float64Array = arr.subarray(1, 3).fill(9.0).slice();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 9.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7100
     * @tc.name testFloat64ArrayChainExtension2071
     * @tc.desc Verify slice fill subarray keeps source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.slice().fill(8.0).subarray(1);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 8.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7200
     * @tc.name testFloat64ArrayChainExtension2072
     * @tc.desc Verify toReversed reduceRight computes original order digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: number = arr.toReversed().reduceRight((a: number, v: number): number => a * 10.0 + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 123.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7300
     * @tc.name testFloat64ArrayChainExtension2073
     * @tc.desc Verify toSorted indexOf differs from original indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const sorted: Float64Array = arr.toSorted();
      const actualIndex = arr.indexOf(1.0);
      const expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
      const actualIndexSecond = sorted.indexOf(1.0);
      const expectedIndexSecond: int = 0;
      expect(actualIndexSecond).assertEqual(expectedIndexSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7400
     * @tc.name testFloat64ArrayChainExtension2074
     * @tc.desc Verify filter then toReversed preserves filtered reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: Float64Array = arr.filter((v: number): boolean => v % 2.0 === 0.0).toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7500
     * @tc.name testFloat64ArrayChainExtension2075
     * @tc.desc Verify map then toSorted sorts mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.map((v: number): number => 10.0 - v).toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7600
     * @tc.name testFloat64ArrayChainExtension2076
     * @tc.desc Verify subarray copyWithin pollutes only original subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.subarray(1, 4).copyWithin(1, 0, 1);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7700
     * @tc.name testFloat64ArrayChainExtension2077
     * @tc.desc Verify slice copyWithin changes only copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.slice().copyWithin(1, 0, 1);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 2.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7800
     * @tc.name testFloat64ArrayChainExtension2078
     * @tc.desc Verify with then toSorted sorts replaced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.with(1, 5.0).toSorted();
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_7900
     * @tc.name testFloat64ArrayChainExtension2079
     * @tc.desc Verify reverse then with observes mutated source and returns copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.reverse().with(0, 9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 9.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8000
     * @tc.name testFloat64ArrayChainExtension2080
     * @tc.desc Verify toReversed then with leaves original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: Float64Array = arr.toReversed().with(0, 9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8100
     * @tc.name testFloat64ArrayChainExtension2081
     * @tc.desc Verify sort then toReversed mutates source and returns reverse copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.sort().toReversed();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8200
     * @tc.name testFloat64ArrayChainExtension2082
     * @tc.desc Verify toSorted then reverse keeps original unsorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.toSorted().reverse();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8300
     * @tc.name testFloat64ArrayChainExtension2083
     * @tc.desc Verify map filter reduce exact result after mapping first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: number = arr.map((v: number): number => v * 2.0)
        .filter((v: number): boolean => v > 3.0)
        .reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8400
     * @tc.name testFloat64ArrayChainExtension2084
     * @tc.desc Verify filter map reduce exact result after filtering first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: number = arr.filter((v: number): boolean => v > 1.0)
        .map((v: number): number => v * 2.0)
        .reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8500
     * @tc.name testFloat64ArrayChainExtension2085
     * @tc.desc Verify slice map set writes mapped copy into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const target: Float64Array = new Float64Array(2);
      target.set(src.slice(1).map((v: number): number => v + 10.0));
      const actualElement0 = target.$_get(0);
      const expectedElement0: number = 12.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8600
     * @tc.name testFloat64ArrayChainExtension2086
     * @tc.desc Verify subarray map set writes mapped shared range into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const target: Float64Array = new Float64Array(2);
      target.set(src.subarray(1).map((v: number): number => v + 20.0));
      const actualElement1 = target.$_get(1);
      const expectedElement1: number = 23.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8700
     * @tc.name testFloat64ArrayChainExtension2087
     * @tc.desc Verify subarray reduce only counts selected range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: number = arr.subarray(1, 3).reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8800
     * @tc.name testFloat64ArrayChainExtension2088
     * @tc.desc Verify slice reduceRight only counts copied range from right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const r: number = arr.slice(1, 3).reduceRight((a: number, v: number): number => a * 10.0 + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 32.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_8900
     * @tc.name testFloat64ArrayChainExtension2089
     * @tc.desc Verify fill then entries exposes filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      const filled: Float64Array = arr.fill(6.0);
      let sum: number = 0.0;
      for (const e of filled.entries()) {
        sum += e[1];
      }
      const actualResult = sum;
      const expectedResult: number = 12.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_9000
     * @tc.name testFloat64ArrayChainExtension2090
     * @tc.desc Verify copyWithin then entries exposes overlapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.copyWithin(1, 0, 2);
      const e = arr.entries();
      const first = e.next();
      const second = e.next();
      const actualResult = first.value![1];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = second.value![1];
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_9100
     * @tc.name testFloat64ArrayChainExtension2091
     * @tc.desc Verify with then entries exposes replacement only in copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: Float64Array = arr.with(1, 9.0);
      const e = r.entries();
      e.next();
      const second = e.next();
      const actualResult = second.value![1];
      const expectedResult: number = 9.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_9200
     * @tc.name testFloat64ArrayChainExtension2092
     * @tc.desc Verify toSorted join differs from original join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 1.0, 3.0);
      const actualString = arr.toSorted().join(',');
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join(',');
      const expectedStringSecond: string = '2,1,3';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_9300
     * @tc.name testFloat64ArrayChainExtension2093
     * @tc.desc Verify toReversed join differs from original join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualString = arr.toReversed().join('-');
      const expectedString: string = '3-2-1';
      expect(actualString).assertEqual(expectedString);
      const actualStringSecond = arr.join('-');
      const expectedStringSecond: string = '1-2-3';
      expect(actualStringSecond).assertEqual(expectedStringSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_2_9400
     * @tc.name testFloat64ArrayChainExtension2094
     * @tc.desc Verify chained reduce callback throw propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension2094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.filter((v: number): boolean => v > 0.0).reduce((acc: number, v: number): number => {
          throw new Error('chain reduce error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'chain reduce error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });
  })
}
