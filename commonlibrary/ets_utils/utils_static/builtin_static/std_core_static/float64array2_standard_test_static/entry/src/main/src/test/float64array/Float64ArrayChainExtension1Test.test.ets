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

export default function Float64ArrayChainExtension1Test(): void {
  describe('Float64ArrayChainExtension1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0100
     * @tc.name testFloat64ArrayChainExtension1001
     * @tc.desc Verify slice().toSorted().join() chain on unordered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const result: string = arr.slice().toSorted().join();
      const actualResult = result;
      const expectedResult: string = "1,2,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0200
     * @tc.name testFloat64ArrayChainExtension1002
     * @tc.desc Verify slice().toSorted().join() with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const sep: string = "|";
      const result: string = arr.slice().toSorted().join(sep);
      const actualResult = result;
      const expectedResult: string = "1|2|3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0300
     * @tc.name testFloat64ArrayChainExtension1003
     * @tc.desc Verify slice(begin,end).toSorted().join() on subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      const result: string = arr.slice(1, 4).toSorted().join();
      const actualResult = result;
      const expectedResult: string = "1,3,4";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0400
     * @tc.name testFloat64ArrayChainExtension1004
     * @tc.desc Verify slice(0,-1).toSorted().join() excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0, 4.0]);
      const result: string = arr.slice(0, -1).toSorted().join();
      const actualResult = result;
      const expectedResult: string = "1,2,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0500
     * @tc.name testFloat64ArrayChainExtension1005
     * @tc.desc Verify slice(1).toSorted().join() drops first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([4.0, 2.0, 3.0, 1.0]);
      const result: string = arr.slice(1).toSorted().join();
      const actualResult = result;
      const expectedResult: string = "1,2,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0600
     * @tc.name testFloat64ArrayChainExtension1006
     * @tc.desc Verify slice().toSorted().join() with negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1.0, 0.0, -2.0, 3.0]);
      const result: string = arr.slice().toSorted().join();
      const actualResult = result;
      const expectedResult: string = "-2,-1,0,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0700
     * @tc.name testFloat64ArrayChainExtension1007
     * @tc.desc Verify slice().toSorted().join() with mixed positive and negative large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([100.0, -100.0, 0.0, 50.0]);
      const result: string = arr.slice().toSorted().join();
      const actualResult = result;
      const expectedResult: string = "-100,0,50,100";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0800
     * @tc.name testFloat64ArrayChainExtension1008
     * @tc.desc Verify slice(empty range).toSorted().join() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const result: string = arr.slice(2, 2).toSorted().join();
      const actualResult = result;
      const expectedResult: string = "";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_0900
     * @tc.name testFloat64ArrayChainExtension1009
     * @tc.desc Verify subarray().fill() fills subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(1, 3);
      sub.fill(9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 9.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 9.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1000
     * @tc.name testFloat64ArrayChainExtension1010
     * @tc.desc Verify subarray(start,end).fill(value) specific range fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const sub: Float64Array = arr.subarray(0, 2);
      sub.fill(-1.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1100
     * @tc.name testFloat64ArrayChainExtension1011
     * @tc.desc Verify subarray().fill() affects original array via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.subarray(0, 3).fill(7.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 7.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1200
     * @tc.name testFloat64ArrayChainExtension1012
     * @tc.desc Verify subarray(begin,end).fill(value) partial range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.subarray(1, 3).fill(0.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1300
     * @tc.name testFloat64ArrayChainExtension1013
     * @tc.desc Verify subarray().fill(0.0) clears portion of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 6.0, 7.0]);
      arr.subarray(0, 2).fill(0.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 7.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1400
     * @tc.name testFloat64ArrayChainExtension1014
     * @tc.desc Verify subarray().fill() chained twice affects overlapping regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.subarray(0, 3).fill(8.0);
      arr.subarray(1, 4).fill(9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 8.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 9.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 9.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 9.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1500
     * @tc.name testFloat64ArrayChainExtension1015
     * @tc.desc Verify sequential fill override full array with second value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0]);
      arr.fill(1.0);
      arr.fill(2.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1600
     * @tc.name testFloat64ArrayChainExtension1016
     * @tc.desc Verify fill twice with different values all elements overridden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0]);
      arr.fill(5.0);
      arr.fill(3.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 3.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1700
     * @tc.name testFloat64ArrayChainExtension1017
     * @tc.desc Verify fill non-overlapping ranges sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0]);
      arr.fill(1.0, 0, 2);
      arr.fill(2.0, 2, 4);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 2.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1800
     * @tc.name testFloat64ArrayChainExtension1018
     * @tc.desc Verify fill partial then fill full overrides all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0]);
      arr.fill(1.0, 1, 3);
      arr.fill(2.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 2.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_1900
     * @tc.name testFloat64ArrayChainExtension1019
     * @tc.desc Verify fill(X) then fill(Y,0,mid) partial override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0, 0.0]);
      arr.fill(1.0);
      arr.fill(9.0, 0, 2);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 9.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 1.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2000
     * @tc.name testFloat64ArrayChainExtension1020
     * @tc.desc Verify three sequential fill calls override correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0.0, 0.0, 0.0]);
      arr.fill(1.0, 0, 1);
      arr.fill(2.0, 1, 2);
      arr.fill(3.0, 2, 3);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2100
     * @tc.name testFloat64ArrayChainExtension1021
     * @tc.desc Verify fill then fill same value is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.fill(5.0);
      arr.fill(5.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 5.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2200
     * @tc.name testFloat64ArrayChainExtension1022
     * @tc.desc Verify fill(0.0) then fill with negative value overrides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 1.0, 1.0]);
      arr.fill(0.0);
      arr.fill(-1.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2300
     * @tc.name testFloat64ArrayChainExtension1023
     * @tc.desc Verify reduce sum equals reduceRight sum for commutative operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const left: number = arr.reduce((a: number, v: number): number => a + v, 0.0);
      const right: number = arr.reduceRight((a: number, v: number): number => a + v, 0.0);
      const actualResult = left;
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2400
     * @tc.name testFloat64ArrayChainExtension1024
     * @tc.desc Verify reduce product equals reduceRight product for commutative multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([2.0, 3.0, 4.0]);
      const left: number = arr.reduce((a: number, v: number): number => a * v, 1.0);
      const right: number = arr.reduceRight((a: number, v: number): number => a * v, 1.0);
      const actualResult = left;
      const expectedResult: number = 24.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = 24.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2500
     * @tc.name testFloat64ArrayChainExtension1025
     * @tc.desc Verify reduce with initial value works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const result: number = arr.reduce((a: number, v: number): number => a + v, 10.0);
      const actualResult = result;
      const expectedResult: number = 16.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2600
     * @tc.name testFloat64ArrayChainExtension1026
     * @tc.desc Verify reduceRight with initial value works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const result: number = arr.reduceRight((a: number, v: number): number => a + v, 10.0);
      const actualResult = result;
      const expectedResult: number = 16.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2700
     * @tc.name testFloat64ArrayChainExtension1027
     * @tc.desc Verify reduce subtraction yields different result than reduceRight subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const left: number = arr.reduce((a: number, v: number): number => a - v);
      const right: number = arr.reduceRight((a: number, v: number): number => a - v);
      const actualResult = left;
      const expectedResult: number = -4.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = 0.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2800
     * @tc.name testFloat64ArrayChainExtension1028
     * @tc.desc Verify reduce on single element returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([42.0]);
      const left: number = arr.reduce((a: number, v: number): number => a + v);
      const right: number = arr.reduceRight((a: number, v: number): number => a + v);
      const actualResult = left;
      const expectedResult: number = 42.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = 42.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_2900
     * @tc.name testFloat64ArrayChainExtension1029
     * @tc.desc Verify reduce and reduceRight with four callback parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const left: number =
        arr.reduce((a: number, v: number, i: int, ary: Float64Array): number => a + v + i + ary.length, 0.0);
      const right: number =
        arr.reduceRight((a: number, v: number, i: int, ary: Float64Array): number => a + v + i + ary.length, 0.0);
      const actualResult = left;
      const expectedResult: number = 18.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = 18.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3000
     * @tc.name testFloat64ArrayChainExtension1030
     * @tc.desc Verify reduce on array with five elements accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result: number = arr.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = result;
      const expectedResult: number = 15.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3100
     * @tc.name testFloat64ArrayChainExtension1031
     * @tc.desc Verify reduceRight on five-element array accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result: number = arr.reduceRight((a: number, v: number): number => a + v, 0.0);
      const actualResult = result;
      const expectedResult: number = 15.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3200
     * @tc.name testFloat64ArrayChainExtension1032
     * @tc.desc Verify reduce and reduceRight on negative values both sum correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-1.0, -2.0, -3.0]);
      const left: number = arr.reduce((a: number, v: number): number => a + v, 0.0);
      const right: number = arr.reduceRight((a: number, v: number): number => a + v, 0.0);
      const actualResult = left;
      const expectedResult: number = -6.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = right;
      const expectedResultSecond: number = -6.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3300
     * @tc.name testFloat64ArrayChainExtension1033
     * @tc.desc Verify find returns first occurrence of duplicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 2.0, 4.0]);
      const result = arr.find((v: number): boolean => v === 2.0)!;
      const actualResult = result;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3400
     * @tc.name testFloat64ArrayChainExtension1034
     * @tc.desc Verify findLast returns last occurrence of duplicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 2.0, 4.0]);
      const result: number = arr.findLast((v: number): boolean => v === 2.0);
      const actualResult = result;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3500
     * @tc.name testFloat64ArrayChainExtension1035
     * @tc.desc Verify indexOf returns first index of duplicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 2.0, 4.0]);
      const idx: int = arr.indexOf(2.0);
      const actualResult = idx;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3600
     * @tc.name testFloat64ArrayChainExtension1036
     * @tc.desc Verify lastIndexOf returns last index of duplicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 2.0, 4.0]);
      const idx: int = arr.lastIndexOf(2.0);
      const actualResult = idx;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3700
     * @tc.name testFloat64ArrayChainExtension1037
     * @tc.desc Verify find with predicate matching first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 3.0, 1.0, 3.0, 7.0]);
      const result = arr.find((v: number): boolean => v > 4.0)!;
      const actualResult = result;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3800
     * @tc.name testFloat64ArrayChainExtension1038
     * @tc.desc Verify indexOf returns -1 for missing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const idx: int = arr.indexOf(99.0);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_3900
     * @tc.name testFloat64ArrayChainExtension1039
     * @tc.desc Verify findLast with predicate returns last matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const result: number = arr.findLast((v: number): boolean => v < 4.0);
      const actualResult = result;
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4000
     * @tc.name testFloat64ArrayChainExtension1040
     * @tc.desc Verify lastIndexOf returns -1 for missing value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const idx: int = arr.lastIndexOf(99.0);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4100
     * @tc.name testFloat64ArrayChainExtension1041
     * @tc.desc Verify reverse().sort() chain sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.reverse().sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4200
     * @tc.name testFloat64ArrayChainExtension1042
     * @tc.desc Verify sort().reverse() chain reverses sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.sort().reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4300
     * @tc.name testFloat64ArrayChainExtension1043
     * @tc.desc Verify fill().reverse() chain reverses filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(0.0).reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 0.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4400
     * @tc.name testFloat64ArrayChainExtension1044
     * @tc.desc Verify reverse().fill() chain fills reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      arr.reverse().fill(7.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 7.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4500
     * @tc.name testFloat64ArrayChainExtension1045
     * @tc.desc Verify sort().fill() chain sorts then fills all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      arr.sort().fill(-1.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4600
     * @tc.name testFloat64ArrayChainExtension1046
     * @tc.desc Verify fill().sort() chain fills then sorts ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 3.0, 1.0]);
      arr.fill(2.0).sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4700
     * @tc.name testFloat64ArrayChainExtension1047
     * @tc.desc Verify fill().reverse().sort() 3-chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 4.0, 2.0]);
      arr.fill(0.0).reverse().sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 0.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4800
     * @tc.name testFloat64ArrayChainExtension1048
     * @tc.desc Verify sort().fill(part).reverse() 3-chain partial effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 4.0, 2.0]);
      arr.sort().fill(9.0, 0, 2).reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 9.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_4900
     * @tc.name testFloat64ArrayChainExtension1049
     * @tc.desc Verify entries iterator reflects fill mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<[int, number]> = arr.entries();
      const first = iter.next();
      const actualResult = first.value![0];
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = first.value![1];
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.fill(9.0);
      const second = iter.next();
      const actualResultThird = second.value![0];
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = second.value![1];
      const expectedResultFourth: number = 9.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5000
     * @tc.name testFloat64ArrayChainExtension1050
     * @tc.desc Verify entries iterator reflects reverse mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<[int, number]> = arr.entries();
      iter.next();
      arr.reverse();
      const second = iter.next();
      const actualResult = second.value![0];
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = second.value![1];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const third = iter.next();
      const actualResultThird = third.value![0];
      const expectedResultThird: number = 2;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = third.value![1];
      const expectedResultFourth: number = 1.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5100
     * @tc.name testFloat64ArrayChainExtension1051
     * @tc.desc Verify entries iterator reflects sort mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const iter: IterableIterator<[int, number]> = arr.entries();
      const first = iter.next();
      const actualResult = first.value![0];
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = first.value![1];
      const expectedResultSecond: number = 3.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr.sort();
      const second = iter.next();
      const actualResultThird = second.value![0];
      const expectedResultThird: number = 1;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = second.value![1];
      const expectedResultFourth: number = 2.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5200
     * @tc.name testFloat64ArrayChainExtension1052
     * @tc.desc Verify keys iterator reflects fill mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<int> = arr.keys();
      const actualIteratorValue = iter.next().value!;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.fill(0.0);
      const actualIteratorValueSecond = iter.next().value!;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value!;
      const expectedIteratorValueThird: number = 2;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5300
     * @tc.name testFloat64ArrayChainExtension1053
     * @tc.desc Verify keys iterator after reverse returns correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<int> = arr.keys();
      const actualIteratorValue = iter.next().value!;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.reverse();
      const actualIteratorValueSecond = iter.next().value!;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value!;
      const expectedIteratorValueThird: number = 2;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5400
     * @tc.name testFloat64ArrayChainExtension1054
     * @tc.desc Verify keys iterator after sort returns correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const iter: IterableIterator<int> = arr.keys();
      const actualIteratorValue = iter.next().value!;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.sort();
      const actualIteratorValueSecond = iter.next().value!;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value!;
      const expectedIteratorValueThird: number = 2;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5500
     * @tc.name testFloat64ArrayChainExtension1055
     * @tc.desc Verify values iterator reflects fill mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.fill(8.0);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 8.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 8.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5600
     * @tc.name testFloat64ArrayChainExtension1056
     * @tc.desc Verify values iterator reflects reverse mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.reverse();
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 1.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5700
     * @tc.name testFloat64ArrayChainExtension1057
     * @tc.desc Verify values iterator reflects sort mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 3.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.sort();
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 3.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5800
     * @tc.name testFloat64ArrayChainExtension1058
     * @tc.desc Verify entries iterator after fill+reverse mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const iter: IterableIterator<[int, number]> = arr.entries();
      const first = iter.next();
      const actualResult = first.value![1];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      arr.fill(5.0).reverse();
      const second = iter.next();
      const actualResultSecond = second.value![0];
      const expectedResultSecond: number = 1;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = second.value![1];
      const expectedResultThird: number = 5.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_5900
     * @tc.name testFloat64ArrayChainExtension1059
     * @tc.desc Verify keys iterator after sort+fill mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const iter: IterableIterator<int> = arr.keys();
      const actualIteratorValue = iter.next().value!;
      const expectedIteratorValue: number = 0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.sort().fill(0.0);
      const actualIteratorValueSecond = iter.next().value!;
      const expectedIteratorValueSecond: number = 1;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value!;
      const expectedIteratorValueThird: number = 2;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6000
     * @tc.name testFloat64ArrayChainExtension1060
     * @tc.desc Verify values iterator after reverse+sort mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 3.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr.reverse().sort();
      const second = iter.next();
      const actualResult = second.value;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
      const third = iter.next();
      const actualResultSecond = third.value;
      const expectedResultSecond: number = 3.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6100
     * @tc.name testFloat64ArrayChainExtension1061
     * @tc.desc Verify toSorted().toReversed().slice().join() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const result: string = arr.toSorted().toReversed().slice().join();
      const actualResult = result;
      const expectedResult: string = "3,2,1";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6200
     * @tc.name testFloat64ArrayChainExtension1062
     * @tc.desc Verify toReversed().toSorted().slice().join() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 3.0, 2.0]);
      const result: string = arr.toReversed().toSorted().slice().join();
      const actualResult = result;
      const expectedResult: string = "1,2,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6300
     * @tc.name testFloat64ArrayChainExtension1063
     * @tc.desc Verify toSorted().slice().toReversed().join() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const result: string = arr.toSorted().slice().toReversed().join();
      const actualResult = result;
      const expectedResult: string = "3,2,1";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6400
     * @tc.name testFloat64ArrayChainExtension1064
     * @tc.desc Verify toReversed().toSorted().join() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([2.0, 3.0, 1.0]);
      const result: string = arr.toReversed().toSorted().join();
      const actualResult = result;
      const expectedResult: string = "1,2,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6500
     * @tc.name testFloat64ArrayChainExtension1065
     * @tc.desc Verify slice().toSorted().toReversed().join() chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([4.0, 2.0, 3.0, 1.0]);
      const result: string = arr.slice(1, 4).toSorted().toReversed().join();
      const actualResult = result;
      const expectedResult: string = "3,2,1";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6600
     * @tc.name testFloat64ArrayChainExtension1066
     * @tc.desc Verify toSorted().join() baseline with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const sep: string = "-";
      const result: string = arr.toSorted().join(sep);
      const actualResult = result;
      const expectedResult: string = "1-2-3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6700
     * @tc.name testFloat64ArrayChainExtension1067
     * @tc.desc Verify toReversed().slice().join() with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const sep: string = ",";
      const result: string = arr.toReversed().slice().join(sep);
      const actualResult = result;
      const expectedResult: string = "3,2,1";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6800
     * @tc.name testFloat64ArrayChainExtension1068
     * @tc.desc Verify toSorted().toReversed().slice().join("-") with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, 1.0, 2.0]);
      const sep: string = "-";
      const result: string = arr.toSorted().toReversed().slice().join(sep);
      const actualResult = result;
      const expectedResult: string = "3-2-1";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_6900
     * @tc.name testFloat64ArrayChainExtension1069
     * @tc.desc Verify normal positive chain filters special critical static params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0x1, NaN, Infinity, 1e-308);
      const result: Float64Array = arr.filter((v: number): boolean => isFinite(v)).map((v: number): number => v + 1.0);
      const actualLength = result.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = result.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = result.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_CHAIN_EXTENSION_1_7000
     * @tc.name testFloat64ArrayChainExtension1070
     * @tc.desc Verify chain callback throw propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayChainExtension1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.filter((v: number): boolean => v > 0.0).map((v: number): number => {
          throw new Error('chain extension error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'chain extension error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });
  })
}
