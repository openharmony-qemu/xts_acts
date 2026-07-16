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
export default function SparseArrayFlatMapTest(): void {
  describe('SparseArrayFlatMapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0100
     * @tc.name testSparseArrayFlatMap001
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (arr instanceof SparseArray is true, result.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<int>((v) => v);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0200
     * @tc.name testSparseArrayFlatMap002
     * @tc.desc flatMap double transform on [4,5,3], verify mapped values [8,10,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 5, 3);
        const result = arr.flatMap<int>((v: int): int => v * 2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(8);
        expect(result[1]).assertEqual(10);
        expect(result[2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0300
     * @tc.name testSparseArrayFlatMap003
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (result![0] equals 2, result![1] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.flatMap<int>((v) => v * 2);
        expect(result instanceof SparseArray).assertTrue();
        expect(result![0]).assertEqual(2);
        expect(result![1]).assertEqual(4);
        expect(result![2]).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0400
     * @tc.name testSparseArrayFlatMap004
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (result![0] equals 1, result![1] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.flatMap<int>((v, k, _a) => v + k);
        expect(result![0]).assertEqual(1);
        expect(result![1]).assertEqual(3);
        expect(result![2]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0500
     * @tc.name testSparseArrayFlatMap005
     * @tc.desc Test SparseArray.flatMap, verify method result (res instanceof SparseArray is true, res!.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let inner = new SparseArray<int>(44, 55, 66);
        let x = new SparseArray<int | SparseArray<int>>();
        x.push(1, 3, 5);
        x.push(inner);
        let res = x.flatMap<int | SparseArray<int>>((v) => v);
        expect(res instanceof SparseArray).assertTrue();
        expect(res!.length).assertEqual(4);
        expect(res![0]).assertEqual(1);
        expect(res![1]).assertEqual(3);
        expect(res![2]).assertEqual(5);
        const tail006 = res![3] as SparseArray<int>;
        expect(tail006 instanceof SparseArray).assertTrue();
        expect(tail006![0]).assertEqual(44);
        expect(tail006![1]).assertEqual(55);
        expect(tail006![2]).assertEqual(66);
        expect(tail006 === inner).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0600
     * @tc.name testSparseArrayFlatMap006
     * @tc.desc Test SparseArray default constructor, verify empty array (arr instanceof SparseArray is true, result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<int>((v) => v);
        expect(result instanceof SparseArray).assertTrue();
        expect(result!.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0700
     * @tc.name testSparseArrayFlatMap007
     * @tc.desc flatMap callback returns null for each element, verify all outputs are null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<int | null>((v) => null);
        expect(result!.length).assertEqual(3);
        expect(result![0]).assertNull();
        expect(result![1]).assertNull();
        expect(result![2]).assertNull();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0800
     * @tc.name testSparseArrayFlatMap008
     * @tc.desc Test SparseArray constructor with (1, 2), verify length and elements (row0 instanceof SparseArray is true, row0![0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2);
        const result = arr.flatMap<SparseArray<int>>((v) => new SparseArray<int>(v, v * 2));
        const row0 = result![0]!;
        expect(row0 instanceof SparseArray).assertTrue();
        expect(row0![0]).assertEqual(1);
        expect(row0![1]).assertEqual(2);
        const row1 = result![1]!;
        expect(row1 instanceof SparseArray).assertTrue();
        expect(row1![0]).assertEqual(2);
        expect(row1![1]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_0900
     * @tc.name testSparseArrayFlatMap009
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (result![2] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.flatMap<int>((_v, i, _a) => i);
        expect(result![2]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1000
     * @tc.name testSparseArrayFlatMap010
     * @tc.desc Test SparseArray default constructor, verify empty array (result!.length equals 1, result![0] equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 5;
        const result = arr.flatMap<int>((v) => v * 2);
        expect(result!.length).assertEqual(1);
        expect(result![0]).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1100
     * @tc.name testSparseArrayFlatMap011
     * @tc.desc flatMap identity on [2,4,4], verify elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 4, 4);
        const result = arr.flatMap<int>((v: int): int => v);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1200
     * @tc.name testSparseArrayFlatMap012
     * @tc.desc Test SparseArray constructor with (3), verify length and elements (arr instanceof SparseArray is true, result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(3);
        expect(arr instanceof SparseArray).assertTrue();
              arr[0] = 1;
              arr[1] = undefined;
              arr[2] = 3;
        const result = arr.flatMap<int | undefined>((v) => v);
        expect(result!.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1300
     * @tc.name testSparseArrayFlatMap013
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (result !== arr is true, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.flatMap<int>((v) => v * 2);
        expect(result !== arr).assertTrue();
        expect(arr[0]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1400
     * @tc.name testSparseArrayFlatMap014
     * @tc.desc Test SparseArray.flatMap, verify method result (arr instanceof SparseArray is true, result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<string>((v) => v % 2 === 0 ? ("" + v) : v.toString());
        expect(result!.length).assertEqual(3);
        expect(result[0]).assertEqual("1");
        expect(result[1]).assertEqual("2");
        expect(result[2]).assertEqual("3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1500
     * @tc.name testSparseArrayFlatMap015
     * @tc.desc Test SparseArray default constructor, verify empty array (result![0] equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 2147483647;
        const result = arr.flatMap<int>((v) => v);
        expect(result![0]).assertEqual(2147483647);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1600
     * @tc.name testSparseArrayFlatMap016
     * @tc.desc Test SparseArray default constructor, verify empty array (result![0] equals -2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = -2147483648;
        const result = arr.flatMap<int>((v) => v);
        expect(result![0]).assertEqual(-2147483648);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1700
     * @tc.name testSparseArrayFlatMap017
     * @tc.desc Test SparseArray constructor with (1000), verify length and elements (result!.length equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
          for (let i = 0; i < 1000; i++) {
          arr[i] = i;
        }
        const result = arr.flatMap<int>((v) => v * 2);
        expect(result!.length).assertEqual(1000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1800
     * @tc.name testSparseArrayFlatMap018
     * @tc.desc Test SparseArray.flat Map error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.flatMap<int>((v): int => {
            throw new Error("Mapping error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_1900
     * @tc.name testSparseArrayFlatMap019
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (arr instanceof SparseArray is true, result.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<string>((v) => "" + v);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual("1");
        expect(result[1]).assertEqual("2");
        expect(result[2]).assertEqual("3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2000
     * @tc.name testSparseArrayFlatMap020
     * @tc.desc Test SparseArray constructor with (10), verify length and elements (arr instanceof SparseArray is true, result.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr instanceof SparseArray).assertTrue();
        arr[0] = 1;
        arr[3] = 4;
        const result = arr.flatMap<int>((v) => v * 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(8);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2100
     * @tc.name testSparseArrayFlatMap021
     * @tc.desc Test SparseArray constructor with (10), verify length and elements (arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(10);
        expect(arr instanceof SparseArray).assertTrue();
        arr[0] = undefined;
        arr[2] = 2;
        const result = arr.flatMap<int | undefined>((v) => v);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertUndefined();
        expect(result![1]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2200
     * @tc.name testSparseArrayFlatMap022
     * @tc.desc flatMap maps int entries by index and preserves nested SparseArray entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let inner = new SparseArray<int>(44, 55, 66);
        let x = new SparseArray<int | SparseArray<int>>();
        x.push(1, 3, 5);
        x.push(inner);
        let res = x.flatMap<int | SparseArray<int>>((v, index) => {
          if (index < 3) {
            return (v as int) + 10;
          }
          return v;
        });
        expect(res instanceof SparseArray).assertTrue();
        expect(res!.length).assertEqual(4);
        expect(res![0]).assertEqual(11);
        expect(res![1]).assertEqual(13);
        expect(res![2]).assertEqual(15);
        const tail045 = res![3] as SparseArray<int>;
        expect(tail045 instanceof SparseArray).assertTrue();
        expect(tail045![0]).assertEqual(44);
        expect(tail045![1]).assertEqual(55);
        expect(tail045![2]).assertEqual(66);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2300
     * @tc.name testSparseArrayFlatMap023
     * @tc.desc Test SparseArray constructor with (1, 2), verify length and elements (inner2 instanceof SparseArray is true, inner1 instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner2 = new SparseArray<int>(1, 2);
        expect(inner2 instanceof SparseArray).assertTrue();
        const inner1 = new SparseArray<SparseArray<int>>(inner2);
        expect(inner1 instanceof SparseArray).assertTrue();
        const arr = new SparseArray<SparseArray<SparseArray<int>>>(inner1);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<SparseArray<SparseArray<int>>>((v) => v);
        expect(result instanceof SparseArray).assertTrue();
        expect(result.length).assertEqual(1);
        const first = result[0] as SparseArray<SparseArray<int>>;
        expect(first instanceof SparseArray).assertTrue();
        const inner = first[0] as SparseArray<int>;
        expect(inner instanceof SparseArray).assertTrue();
        expect(inner[0]).assertEqual(1);
        expect(inner[1]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2400
     * @tc.name testSparseArrayFlatMap024
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (result![0] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.flatMap<int>((v, _k, a) => v + a.length);
        expect(result![0]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2500
     * @tc.name testSparseArrayFlatMap025
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (arr instanceof SparseArray is true, result.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.flatMap<string>((v) => v % 2 === 0 ? ("" + v) : ("odd:" + v));
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual('odd:1');
        expect(result[1]).assertEqual('2');
        expect(result[2]).assertEqual('odd:3');

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2600
     * @tc.name testSparseArrayFlatMap026
     * @tc.desc Test SparseArray.flatMap, verify method result (result.length equals 2, result[0] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const mapped = arr.flatMap<int>((v) => v * 2);
        const result = mapped.filter((v: int) => v > 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(4);
        expect(result[1]).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2700
     * @tc.name testSparseArrayFlatMap027
     * @tc.desc flatMap on SparseArray<float> doubles each float element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.0f, 3.0f);
        const result = arr.flatMap<float>((v: float): float => v * 2.0f);
        expect(result[0]).assertEqual(2.0f);
        expect(result[2]).assertEqual(6.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2800
     * @tc.name testSparseArrayFlatMap028
     * @tc.desc flatMap maps to nested SparseArray containing null element slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2);
        const result = arr.flatMap<int | null>((v: int, k: int): int | null => {
          if (k === 1) {
            return null;
          }
          return v;
        });
        expect(result.length).assertEqual(2);
        expect(result[1]).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_2900
     * @tc.name testSparseArrayFlatMap029
     * @tc.desc flatMap expands index 0x1 element into nested SparseArray with 0b10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x1, 0x2);
        const result = arr.flatMap<int>((v: int, i: int): int => {
          if (i === 0x1) {
            return 0b10;
          }
          return v;
        });
        expect(result[1]).assertEqual(0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_3000
     * @tc.name testSparseArrayFlatMap030
     * @tc.desc flatMap maps SparseArray<boolean> elements to string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false);
        const result = arr.flatMap<string>((v: boolean): string => v ? "T" : "F");
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual("T");
        expect(result[1]).assertEqual("F");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_3100
     * @tc.name testSparseArrayFlatMap031
     * @tc.desc flatMap preserves char values when mapping SparseArray<char>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B');
        const result = arr.flatMap<char>((v: char): char => v);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(c'A');
        expect(result[1]).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_3200
     * @tc.name testSparseArrayFlatMap032
     * @tc.desc flatMap compacts sparse high index element into first output slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(8);
        arr[6] = "tail";
        const result = arr.flatMap<string>((v: string, k: int): string => k.toString() + ":" + v);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("6:tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_MAP_3300
     * @tc.name testSparseArrayFlatMap033
     * @tc.desc flatMap callback receives sparse array length and original assigned index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlatMap033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[2] = 10;
        const result = arr.flatMap<int>((v: int, k: int, a: SparseArray<int>): int => v + k + a.length);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(16);
    });

  });
}
