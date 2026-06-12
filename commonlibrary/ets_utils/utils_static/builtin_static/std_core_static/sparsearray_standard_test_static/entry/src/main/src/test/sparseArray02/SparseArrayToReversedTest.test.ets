'use static'
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


class Point012 {
    x: int;
    y: int;
    constructor(x: int, y: int) {
      this.x = x;
      this.y = y;
    }
  }

export default function SparseArrayToReversedTest(): void {
  describe('SparseArrayToReversedTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0100
     * @tc.name testSparseArrayToReversed001
     * @tc.desc Test SparseArray.toReversed on [1,2,3]: full reversed order, original unchanged, reversed[0] is defined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        const reversed = arr.toReversed()
        expect(reversed[0]).assertEqual(3);
        expect(reversed[1]).assertEqual(2);
        expect(reversed[2]).assertEqual(1);
        expect(arr[0]).assertEqual(1)
        const value = reversed[0]
        expect(value !== undefined).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0200
     * @tc.name testSparseArrayToReversed002
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed.length equals 5, reversed[0] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2)
        arr.push(1, 3, 4)
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(5);
        expect(reversed[0]).assertEqual(4);
        expect(reversed[2]).assertEqual(1);
        expect(reversed[4]).assertUndefined();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0300
     * @tc.name testSparseArrayToReversed003
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0400
     * @tc.name testSparseArrayToReversed004
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed.length equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42)
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(42);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0500
     * @tc.name testSparseArrayToReversed005
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed[0] equals 5, reversed[3] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 5, 5, 5)
        const reversed = arr.toReversed()
        expect(reversed[0]).assertEqual(5);
        expect(reversed[3]).assertEqual(5);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0600
     * @tc.name testSparseArrayToReversed006
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed[0] equals 3, reversed[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3)
        const reversed = arr.toReversed()
        expect(reversed[0]).assertEqual(3);
        expect(reversed[2]).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0700
     * @tc.name testSparseArrayToReversed007
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed[0] equals 3, reversed[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 3)
        const reversed = arr.toReversed()
        expect(reversed[0]).assertEqual(3);
        expect(reversed[2]).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0800
     * @tc.name testSparseArrayToReversed008
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed[0] equals -1, reversed[4] equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2147483647, -2147483648, 0, 1, -1)
        const reversed = arr.toReversed()
        expect(reversed[0]).assertEqual(-1);
        expect(reversed[4]).assertEqual(2147483647);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_0900
     * @tc.name testSparseArrayToReversed009
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed.length equals 1000, reversed[0] equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        for (let i = 0; i < 1000; i++) {
          arr.push(i)
        }
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(1000);
        expect(reversed[0]).assertEqual(999);
        expect(reversed[999]).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1000
     * @tc.name testSparseArrayToReversed010
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed[0] equals "cherry", reversed[2] equals "apple")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana", "cherry")
        const reversed = arr.toReversed()
        expect(reversed[0]).assertEqual("cherry");
        expect(reversed[2]).assertEqual("apple");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1100
     * @tc.name testSparseArrayToReversed011
     * @tc.desc Test SparseArray.toReversed, verify method result (reversed[0] equals 3, reversed[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        const originalString = arr.toString()
        const reversed = arr.toReversed()
        expect(arr.toString()).assertEqual(originalString);
        expect(reversed[0]).assertEqual(3);
        expect(reversed[2]).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1200
     * @tc.name testSparseArrayToReversed012
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, r0 !== null && r0 !== undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Point012>(new Point012(1, 2), new Point012(3, 4))
      expect(arr instanceof SparseArray).assertTrue();
        const reversed = arr.toReversed()
        const r0 = reversed[0];
        expect(r0 !== null && r0 !== undefined).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1300
     * @tc.name testSparseArrayToReversed013
     * @tc.desc toReversed on [6,6,4], verify reversed order [4,6,6] without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 6, 4);
        const reversed = arr.toReversed();
        expect(reversed[0]).assertEqual(4);
        expect(reversed[1]).assertEqual(6);
        expect(reversed[2]).assertEqual(6);
        expect(arr[0]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1400
     * @tc.name testSparseArrayToReversed014
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(99)
        expect(arr instanceof SparseArray).assertTrue();
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(1);
        expect(reversed[0]).assertEqual(99);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1500
     * @tc.name testSparseArrayToReversed015
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        expect(arr instanceof SparseArray).assertTrue();
        arr[5] = 100
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(10);
        expect(reversed[4]).assertEqual(100);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1600
     * @tc.name testSparseArrayToReversed016
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2)
        expect(arr instanceof SparseArray).assertTrue();
        arr.push(3)
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(3);
        expect(reversed[0]).assertEqual(3);
        expect(reversed[1]).assertEqual(2);
        expect(reversed[2]).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1700
     * @tc.name testSparseArrayToReversed017
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000)
        expect(arr instanceof SparseArray).assertTrue();
        arr[5000] = 999
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(10000);
        expect(reversed[4999]).assertEqual(999);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1800
     * @tc.name testSparseArrayToReversed018
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, -2, -3)
        expect(arr instanceof SparseArray).assertTrue();
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(3);
        expect(reversed[0]).assertEqual(-3);
        expect(reversed[1]).assertEqual(-2);
        expect(reversed[2]).assertEqual(-1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_1900
     * @tc.name testSparseArrayToReversed019
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 0, 0)
        expect(arr instanceof SparseArray).assertTrue();
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(3);
        expect(reversed[0]).assertEqual(0);
        expect(reversed[1]).assertEqual(0);
        expect(reversed[2]).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2000
     * @tc.name testSparseArrayToReversed020
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2147483647, 100, 0)
        expect(arr instanceof SparseArray).assertTrue();
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(3);
        expect(reversed[0]).assertEqual(0);
        expect(reversed[1]).assertEqual(100);
        expect(reversed[2]).assertEqual(2147483647);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2100
     * @tc.name testSparseArrayToReversed021
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        expect(arr instanceof SparseArray).assertTrue();
        arr[1] = 10
        arr[3] = 30
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(5);
        expect(reversed[3]).assertEqual(10);
        expect(reversed[1]).assertEqual(30);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2200
     * @tc.name testSparseArrayToReversed022
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        expect(arr instanceof SparseArray).assertTrue();
        arr[0] = 1
        arr[2] = 3
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(10);
        expect(reversed[7]).assertEqual(arr[2]);
        expect(reversed[9]).assertEqual(arr[0]);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2300
     * @tc.name testSparseArrayToReversed023
     * @tc.desc Test SparseArray.toReversed, verify reversed[2] equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(1, 2, 5);
      expect(arr.length).assertEqual(3);
      const reversed = arr.toReversed();
      expect(reversed[0]).assertEqual(5);
      expect(reversed[1]).assertEqual(2);
      expect(reversed[2]).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2400
     * @tc.name testSparseArrayToReversed024
     * @tc.desc Test SparseArray.toReversed, verify method result (arr instanceof SparseArray is true, reversed.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        expect(arr instanceof SparseArray).assertTrue();
        arr[0] = 1
        arr[2] = 3
        arr[4] = 5
        const reversed = arr.toReversed()
        expect(reversed.length).assertEqual(5);
        expect(reversed[4]).assertEqual(arr[0]);
        expect(reversed[2]).assertEqual(arr[2]);
        expect(reversed[0]).assertEqual(arr[4]);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2500
     * @tc.name testSparseArrayToReversed025
     * @tc.desc toReversed on SparseArray<long> returns new array with reversed long order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long);
        const reversed = arr.toReversed();
        expect(reversed[0]).assertEqual(10000000000 as long);
        expect(reversed[1]).assertEqual(1 as long);
        expect(arr[0]).assertEqual(1 as long);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_2600
     * @tc.name testSparseArrayToReversed026
     * @tc.desc toReversed returns new array with 0x1 and 0b10 literals reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToReversed026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x1, 0b10);
        const reversed = arr.toReversed();
        expect(reversed[0]).assertEqual(0b10);
        expect(reversed[1]).assertEqual(0x1);
    });

  });
}
