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

type SparseArrayFromIntKeyToStringFn = (v: int, k: int) => string;
type SparseArrayFromIntKeyToIntFn = (v: int, k: int) => int;

class CustomMapError025 extends Error {
    constructor(message: string) {
      super(message)
      this.name = "CustomMapError025"
    }
  }

export default function SparseArrayFromTest(): void {
  describe('SparseArrayFromTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0100
     * @tc.name testSparseArrayFrom001
     * @tc.desc SparseArray.from with null mapFn throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int, string>([1, 2, 3], null as SparseArrayFromIntKeyToStringFn)
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0200
     * @tc.name testSparseArrayFrom002
     * @tc.desc SparseArray.from with undefined mapFn throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int, int>([1, 2, 3], (undefined as SparseArrayFromIntKeyToIntFn))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0300
     * @tc.name testSparseArrayFrom003
     * @tc.desc SparseArray.from [1,2,3] with toString mapFn, verify non-null, elements, typeof, isArray and instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => v.toString())
        expect(arr !== null && arr !== undefined).assertTrue()
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual("1")
        expect(arr[1]).assertEqual("2")
        expect(arr[2]).assertEqual("3")
        expect(typeof arr[0]).assertEqual("string")
        expect(SparseArray.isArray(arr)).assertEqual(true)
        expect(arr instanceof SparseArray).assertEqual(true)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0400
     * @tc.name testSparseArrayFrom004
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr.length equals 1, arr[0] equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int>([42], (v: int, k: int): int => v)
        expect(arr.length).assertEqual(1)
        expect(arr[0]).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0500
     * @tc.name testSparseArrayFrom005
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const set = new Set<int>([1, 2, 3])
        const arr = SparseArray.from<int, string>(set, (v: int, k: int): string => v.toString())
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0600
     * @tc.name testSparseArrayFrom006
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const set = new Set<int>()
        const arr = SparseArray.from<int, int>(set, (v: int, k: int): int => v)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0700
     * @tc.name testSparseArrayFrom007
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const map = new Map<int, string>([[1, "a"], [2, "b"]])
        const arr = SparseArray.from<[int, string], string>(map, (v: [int, string], k: int): string => v[1])
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0800
     * @tc.name testSparseArrayFrom008
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr.length equals 3, arr[0] equals "A")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const srcStrs: Array<string> = ["a", "b", "c"]
        const arr = SparseArray.from<string, string>(srcStrs, (v: string, k: int): string => v.toUpperCase())
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual("A")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_0900
     * @tc.name testSparseArrayFrom009
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr[0] equals 10, arr[1] equals 21)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int>([10, 20, 30], (v: int, k: int): int => v + k)
        expect(arr[0]).assertEqual(10)
        expect(arr[1]).assertEqual(21)
        expect(arr[2]).assertEqual(32)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1000
     * @tc.name testSparseArrayFrom010
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr[0] equals "num:1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => `num:${v}`)
        expect(arr[0]).assertEqual("num:1")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1100
     * @tc.name testSparseArrayFrom011
     * @tc.desc Test SparseArray.from with mapFn transform, verify mapped SparseArray elements (arr[0] equals null, arr[2] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int | null>([1, 2, 3], (v: int, k: int): int | null => v > 2 ? v : null)
        expect(arr[0]).assertEqual(null)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1200
     * @tc.name testSparseArrayFrom012
     * @tc.desc mapFn throws Error, verify error.name equals "Error"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => { throw new Error("map error"); })
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error")
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1300
     * @tc.name testSparseArrayFrom013
     * @tc.desc string Array with parseInt mapFn, verify mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<string, string>(["1", "2", "3"], (v: string, k: int): string =>
          Double.toInt(Number.parseInt(v)).toString())
        expect(arr[0]).assertEqual("1")
        expect(arr[1]).assertEqual("2")
        expect(arr[2]).assertEqual("3")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1400
     * @tc.name testSparseArrayFrom014
     * @tc.desc boolean Array with toString mapFn, verify mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<boolean, string>([true, false, true], (v: boolean, k: int): string => v.toString())
        expect(arr[0]).assertEqual("true")
        expect(arr[1]).assertEqual("false")
        expect(arr[2]).assertEqual("true")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1500
     * @tc.name testSparseArrayFrom015
     * @tc.desc int Array with boolean mapFn (v > 1), verify mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, boolean>([0, 1, 2], (v: int, k: int): boolean => v > 1)
        expect(arr[0]).assertEqual(false)
        expect(arr[1]).assertEqual(false)
        expect(arr[2]).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1600
     * @tc.name testSparseArrayFrom016
     * @tc.desc string Array with conditional parse mapFn, verify mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<string, string>(["1", "a", "3"], (v: string, k: int): string => {
          const n = Number.parseInt(v);
          return isNaN(n) ? v : Double.toInt(n).toString();
        })
        expect(arr[0]).assertEqual("1")
        expect(arr[1]).assertEqual("a")
        expect(arr[2]).assertEqual("3")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1700
     * @tc.name testSparseArrayFrom017
     * @tc.desc mapFn returns null for specific index, verify mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int | null>([1, 2, 3], (v: int, k: int): int | null => v === 2 ? null : v)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(null)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1800
     * @tc.name testSparseArrayFrom018
     * @tc.desc mapFn always returns undefined, verify length and undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int | undefined>([1, 2, 3], (v: int, k: int): int | undefined => undefined)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertUndefined()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_1900
     * @tc.name testSparseArrayFrom019
     * @tc.desc mapFn returns constant 0, verify all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => 0)
        expect(arr[0]).assertEqual(0)
        expect(arr[1]).assertEqual(0)
        expect(arr[2]).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2000
     * @tc.name testSparseArrayFrom020
     * @tc.desc mapFn returns constant false, verify all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, boolean>([1, 2, 3], (v: int, k: int): boolean => false)
        expect(arr[0]).assertEqual(false)
        expect(arr[1]).assertEqual(false)
        expect(arr[2]).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2100
     * @tc.name testSparseArrayFrom021
     * @tc.desc identity mapFn with for-of iteration, verify element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v)
        let count = 0
        for (const item of arr) {
          expect(item).assertEqual(count + 1)
          count++
        }
        expect(count).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2200
     * @tc.name testSparseArrayFrom022
     * @tc.desc identity mapFn, verify arr.length equals input.length and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const input: Array<int> = [1, 2, 3]
        const arr = SparseArray.from<int, int>(input, (v: int, k: int): int => v)
        expect(arr.length).assertEqual(input.length)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2300
     * @tc.name testSparseArrayFrom023
     * @tc.desc double Array with Number.MAX_VALUE toString mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<double, string>([Number.MAX_VALUE], (v: double, k: int): string => v.toString())
        expect(arr[0]).assertEqual(Number.MAX_VALUE.toString())
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2400
     * @tc.name testSparseArrayFrom024
     * @tc.desc double Array with Number.MIN_VALUE toString mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<double, string>([Number.MIN_VALUE], (v: double, k: int): string => v.toString())
        expect(arr[0]).assertEqual(Number.MIN_VALUE.toString())
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2500
     * @tc.name testSparseArrayFrom025
     * @tc.desc empty Array source with mapFn, verify length and isArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, string>(new Array<int>(), (v: int, k: int): string => v.toString())
        expect(arr.length).assertEqual(0)
        expect(SparseArray.isArray(arr)).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2600
     * @tc.name testSparseArrayFrom026
     * @tc.desc mapFn throws CustomMapError025, verify instanceof and error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
          SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => { throw new CustomMapError025("map failed"); })
          expect().assertFail();
        } catch (error) {
          expect(error instanceof CustomMapError025).assertEqual(true)
          expect((error as Error).name).assertEqual("CustomMapError025")
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2700
     * @tc.name testSparseArrayFrom027
     * @tc.desc from result chained with map and filter, verify elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = SparseArray.from<int, int>([1, 2, 3], (v: int, k: int): int => v * 2)
          .map((v: int): int => v + 1)
          .filter((v: int): boolean => v > 2)
        expect(result!.length).assertEqual(3)
        expect(result![0]).assertEqual(3)
        expect(result[1]).assertEqual(5)
        expect(result[2]).assertEqual(7)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2800
     * @tc.name testSparseArrayFrom028
     * @tc.desc from result concat with plain Array, verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => v.toString())
        const arr2 = ["4", "5"] as Array<string>
        const arr3 = arr1.concat(arr2)
        expect(arr3.length).assertEqual(5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_2900
     * @tc.name testSparseArrayFrom029
     * @tc.desc SparseArray.from 10000 elements with mapFn, verify length, last element and performance under 1000ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        let startTime = Date.now()
        let largeArr: Array<int> = []
        for (let i = 0; i < 10000; i++) {
          largeArr.push(i)
        }
        const arr = SparseArray.from<int, int>(largeArr, (v: int, k: int): int => v * 2)
        let endTime = Date.now()
        expect(arr.length).assertEqual(10000)
        expect(arr[9999]).assertEqual(19998)
        expect(endTime - startTime).assertLess(1000)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3000
     * @tc.name testSparseArrayFrom030
     * @tc.desc mapFn computes power of 2 per element, verify mapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, int>([1, 2, 3, 4, 5], (v: int, k: int): int => {
          let result = 1
          for (let i = 0; i < v; i++) {
            result *= 2
          }
          return result
        })
        expect(arr[0]).assertEqual(2)
        expect(arr[1]).assertEqual(4)
        expect(arr[2]).assertEqual(8)
        expect(arr[3]).assertEqual(16)
        expect(arr[4]).assertEqual(32)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3100
     * @tc.name testSparseArrayFrom031
     * @tc.desc mapFn uses index k in template string, verify mapped elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int, string>([1, 2, 3], (v: int, k: int): string => {
          return `${k}:${v}`
        })
        expect(arr[0]).assertEqual("0:1")
        expect(arr[1]).assertEqual("1:2")
        expect(arr[2]).assertEqual("2:3")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3200
     * @tc.name testSparseArrayFrom032
     * @tc.desc from byte Array source, verify byte elements in SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<byte> = [10 as byte, 20 as byte, 30 as byte];
        const arr = SparseArray.from<byte>(src);
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(20 as byte);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3300
     * @tc.name testSparseArrayFrom033
     * @tc.desc from short Array source, verify short elements in SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<short> = [100 as short, 32767 as short];
        const arr = SparseArray.from<short>(src);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(100 as short);
        expect(arr[1]).assertEqual(32767 as short);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3400
     * @tc.name testSparseArrayFrom034
     * @tc.desc from long Array source, verify long elements in SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a: long = 10000000000 as long;
        const b: long = 20000000000 as long;
        const src: Array<long> = [a, b];
        const arr = SparseArray.from<long>(src);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(a);
        expect(arr[1]).assertEqual(b);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3500
     * @tc.name testSparseArrayFrom035
     * @tc.desc from float Array source, verify float elements in SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<float> = [1.0f, 2.5f, 3.0f];
        const arr = SparseArray.from<float>(src);
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(2.5f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FROM_3600
     * @tc.name testSparseArrayFrom036
     * @tc.desc from int Array with 0x7F and 0b10 elements via identity mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFrom036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const src: Array<int> = [0x7F, 0b10, 100];
        const arr = SparseArray.from<int, int>(src, (v: int, _k: int): int => v);
        expect(arr[0]).assertEqual(127);
        expect(arr[1]).assertEqual(2);
    });


  });
}
