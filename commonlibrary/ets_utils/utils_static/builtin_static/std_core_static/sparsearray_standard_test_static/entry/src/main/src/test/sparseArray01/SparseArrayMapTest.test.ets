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
    TestType,
} from "../../../../hypium/index";
import Utils from "../Util.test";

class MapValueBox {
    value: int = 0;
}

class MapOriginalDoubled {
    original: int = 0;
    doubled: int = 0;
}

class MapValueIndexBox {
    value: int = 0;
    index: int = 0;
}


class NestedNullHolder041 {
    label: string = "";
    items: Array<int> | null = null;
}

export default function SparseArrayMapTest(): void {
  describe('SparseArrayMapTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
        await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0100
     * @tc.name testSparseArrayMap001
     * @tc.desc Test SparseArray.map, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(result.toString()).assertEqual("2,4,6");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0200
     * @tc.name testSparseArrayMap002
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(result![0]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0300
     * @tc.name testSparseArrayMap003
     * @tc.desc Test SparseArray.map, verify method result (result![1] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v: int): int => v * 2);
        expect(result![1]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0400
     * @tc.name testSparseArrayMap004
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 1, result![1] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v, i, a) => v + i);
        expect(result![0]).assertEqual(1);
        expect(result![1]).assertEqual(3);
        expect(result![2]).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0500
     * @tc.name testSparseArrayMap005
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals "0:1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v, i) => `${i}:${v}`);
        expect(result![0]).assertEqual("0:1");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0600
     * @tc.name testSparseArrayMap006
     * @tc.desc Test SparseArray.map, verify method result (arr instanceof SparseArray is true, ok!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const ok = arr.map((v: int): int => v);
        expect(ok!.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0700
     * @tc.name testSparseArrayMap007
     * @tc.desc map with index on [2,5,5], verify v+k mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 5, 5);
        const result = arr.map((v: int, k: int): int => v + k);
        expect(result![0]).assertEqual(2);
        expect(result![1]).assertEqual(6);
        expect(result![2]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0800
     * @tc.name testSparseArrayMap008
     * @tc.desc map double transform on [3,6,3], verify mapped values [6,12,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 6, 3);
        const result = arr.map((v: int): int => v * 2);
        expect(result![0]).assertEqual(6);
        expect(result![1]).assertEqual(12);
        expect(result![2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_0900
     * @tc.name testSparseArrayMap009
     * @tc.desc map identity on [4,2,4], verify elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 2, 4);
        const result = arr.map((v: int): int => v);
        expect(result![0]).assertEqual(4);
        expect(result![1]).assertEqual(2);
        expect(result![2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1000
     * @tc.name testSparseArrayMap010
     * @tc.desc map with index on [5,3,5], verify v+k mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 3, 5);
        const result = arr.map((v: int, k: int): int => v + k);
        expect(result![0]).assertEqual(5);
        expect(result![1]).assertEqual(4);
        expect(result![2]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1100
     * @tc.name testSparseArrayMap011
     * @tc.desc Test SparseArray.map error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
            const arr = new SparseArray<int>(1, 2, 3);
            arr.map((v) => {
                throw new Error("test error");
            });
            expect().assertFail();
        } catch (error) {
            expect(error.name).assertEqual("Error");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1200
     * @tc.name testSparseArrayMap012
     * @tc.desc map identity on [7,5,4], verify elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(7, 5, 4);
        const result = arr.map((v: int): int => v);
        expect(result![0]).assertEqual(7);
        expect(result![1]).assertEqual(5);
        expect(result![2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1300
     * @tc.name testSparseArrayMap013
     * @tc.desc map with index on [1,6,5], verify v+k mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 6, 5);
        const result = arr.map((v: int, k: int): int => v + k);
        expect(result![0]).assertEqual(1);
        expect(result![1]).assertEqual(7);
        expect(result![2]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1400
     * @tc.name testSparseArrayMap014
     * @tc.desc Test SparseArray.map, verify method result (first.value equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<MapValueBox>((v: int): MapValueBox => {
            const o = new MapValueBox();
            o.value = v;
            return o;
        });
        const first = result![0] as MapValueBox;
        expect(first.value).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1500
     * @tc.name testSparseArrayMap015
     * @tc.desc Test SparseArray.map, verify method result (result!.length equals 1, result![0] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 1;
        const result = arr.map((v: int): int => v * 2);
        expect(result!.length).assertEqual(1);
        expect(result![0]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1600
     * @tc.name testSparseArrayMap016
     * @tc.desc Test SparseArray.map, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(result!.length).assertEqual(3);
        expect(result.toString()).assertEqual("2,4,6");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1700
     * @tc.name testSparseArrayMap017
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals "1", typeof result![0] equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v.toString());
        expect(result![0]).assertEqual("1");
        expect(typeof result![0]).assertEqual("string");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1800
     * @tc.name testSparseArrayMap018
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 1, typeof result![0] equals "number")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("1", "2", "3");
        const result = arr.map((v) => parseInt(v));
        expect(result![0]).assertEqual(1);
        expect(typeof result![0]).assertEqual("number");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_1900
     * @tc.name testSparseArrayMap019
     * @tc.desc Test SparseArray.map, verify method result (first.original equals 1, first.doubled equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<MapOriginalDoubled>((v: int): MapOriginalDoubled => {
            const o = new MapOriginalDoubled();
            o.original = v;
            o.doubled = v * 2;
            return o;
        });
        const first = result![0] as MapOriginalDoubled;
        expect(first.original).assertEqual(1);
        expect(first.doubled).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2000
     * @tc.name testSparseArrayMap020
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 2, result![1] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        const result = arr.map((v) => (v === null ? 0 : v * 2));
        expect(result![0]).assertEqual(2);
        expect(result![1]).assertEqual(0);
        expect(result![2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2100
     * @tc.name testSparseArrayMap021
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 2, result![1] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(3);
        arr[0] = 1;
        arr[1] = undefined;
        arr[2] = 3;
        const result = arr.map((v) => (v === undefined ? 0 : v * 2));
        expect(result![0]).assertEqual(2);
        expect(result![1]).assertEqual(0);
        expect(result![2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2200
     * @tc.name testSparseArrayMap022
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals -2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 2147483647;
        const result = arr.map((v) => v + 1);
        expect(result![0]).assertEqual(-2147483648);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2300
     * @tc.name testSparseArrayMap023
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = -2147483648;
        const result = arr.map((v) => v - 1);
        expect(result![0]).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2400
     * @tc.name testSparseArrayMap024
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2);
        const result = arr.map((v) => v + 1);
        expect(result![0]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2500
     * @tc.name testSparseArrayMap025
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 1, result![1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, -2, -3);
        const result = arr.map((v) => v * -1);
        expect(result![0]).assertEqual(1);
        expect(result![1]).assertEqual(2);
        expect(result![2]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2600
     * @tc.name testSparseArrayMap026
     * @tc.desc Test SparseArray.map, verify method result (result instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(result instanceof SparseArray).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2700
     * @tc.name testSparseArrayMap027
     * @tc.desc Test SparseArray.map, verify method result (typeof result![0] equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result: SparseArray<string> = arr.map((v) => v.toString());
        expect(typeof result![0]).assertEqual("string");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2800
     * @tc.name testSparseArrayMap028
     * @tc.desc Test SparseArray.map, verify method result (result !== arr is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(result !== arr).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_2900
     * @tc.name testSparseArrayMap029
     * @tc.desc Test SparseArray.map, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3000
     * @tc.name testSparseArrayMap030
     * @tc.desc Test SparseArray.map, verify method result (result!.length equals arr.length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => v * 2);
        expect(result!.length).assertEqual(arr.length);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3100
     * @tc.name testSparseArrayMap031
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 0, result![1] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v, i) => i);
        expect(result![0]).assertEqual(0);
        expect(result![1]).assertEqual(1);
        expect(result![2]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3200
     * @tc.name testSparseArrayMap032
     * @tc.desc Test SparseArray.map, verify method result (result!.length equals 0, result instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.map((v) => v * 2);
        expect(result!.length).assertEqual(0);
        expect(result instanceof SparseArray).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3300
     * @tc.name testSparseArrayMap033
     * @tc.desc Test SparseArray.map, verify method result (result!.length equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        const result = arr.map((v) => v * 2);
        expect(result!.length).assertEqual(1000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3400
     * @tc.name testSparseArrayMap034
     * @tc.desc Test SparseArray.map, verify method result (result2![0] equals 3, result2![1] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result1 = arr.map((v: int): int => v * 2);
        const result2 = result1.map((v: int): int => v + 1);
        expect(result2![0]).assertEqual(3);
        expect(result2![1]).assertEqual(5);
        expect(result2![2]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3500
     * @tc.name testSparseArrayMap035
     * @tc.desc map with index on [4,5,5], verify v+k mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 5, 5);
        const result = arr.map((v: int, k: int): int => v + k);
        expect(result![0]).assertEqual(4);
        expect(result![1]).assertEqual(6);
        expect(result![2]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3600
     * @tc.name testSparseArrayMap036
     * @tc.desc map double transform on [5,6,3], verify mapped values [10,12,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 6, 3);
        const result = arr.map((v: int): int => v * 2);
        expect(result![0]).assertEqual(10);
        expect(result![1]).assertEqual(12);
        expect(result![2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3700
     * @tc.name testSparseArrayMap037
     * @tc.desc map identity on [6,2,4], verify elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 2, 4);
        const result = arr.map((v: int): int => v);
        expect(result![0]).assertEqual(6);
        expect(result![1]).assertEqual(2);
        expect(result![2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3800
     * @tc.name testSparseArrayMap038
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v: int): null => null);
        expect(result![0]).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_3900
     * @tc.name testSparseArrayMap039
     * @tc.desc Test SparseArray.map, verify method result (typeof result![0] equals "number")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<number>((v: int): number => v * 2);
        expect(typeof result![0]).assertEqual("number");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4000
     * @tc.name testSparseArrayMap040
     * @tc.desc Test SparseArray.map, verify method result (typeof result![0] equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<string>((v: int): string => v.toString());
        expect(typeof result![0]).assertEqual("string");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4100
     * @tc.name testSparseArrayMap041
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals false, result![1] equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0, 3);
        const result = arr.map<boolean>((v: int): boolean => v > 1);
        expect(result![0]).assertEqual(false);
        expect(result![1]).assertEqual(false);
        expect(result![2]).assertEqual(true);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4200
     * @tc.name testSparseArrayMap042
     * @tc.desc Test SparseArray.map, verify method result (first.value equals 1, first.index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<MapValueIndexBox>((v: int, i: int, _a: SparseArray<int>): MapValueIndexBox => {
            const o = new MapValueIndexBox();
            o.value = v;
            o.index = i;
            return o;
        });
        const first = result![0] as MapValueIndexBox;
        expect(first.value).assertEqual(1);
        expect(first.index).assertEqual(0);
        return;
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4300
     * @tc.name testSparseArrayMap043
     * @tc.desc Test SparseArray.map, verify method result (result![0]![0] equals 1, result![0]![1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<Array<int>>((v: int): Array<int> => {
            const row: Array<int> = [];
            row.push(v);
            row.push(v * 2);
            return row;
        });
        expect(result![0]![0]).assertEqual(1);
        expect(result![0]![1]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4400
     * @tc.name testSparseArrayMap044
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 1, result![1] equals "even")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<int | string>((v: int): int | string => (v % 2 === 0 ? "even" : v));
        expect(result![0]).assertEqual(1);
        expect(result![1]).assertEqual("even");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4500
     * @tc.name testSparseArrayMap045
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals arr[0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<int>((v) => v);
        expect(result![0]).assertEqual(arr[0]);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4600
     * @tc.name testSparseArrayMap046
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals "value:1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map<string>((v) => `value:${v}`);
        expect(result![0]).assertEqual("value:1");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4700
     * @tc.name testSparseArrayMap047
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 2, result![2] equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        const result = arr.map((v) => v * 2);
        expect(result![0]).assertEqual(2);
        expect(result![2]).assertEqual(6);
        expect(result![4]).assertEqual(10);
        expect(result![1]).assertEqual(undefined);
        expect(result![3]).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4800
     * @tc.name testSparseArrayMap048
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 11, result![5] equals 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 1;
        arr[5] = 2;
        arr[9] = 3;
        const result = arr.map((v) => v + 10);
        expect(result![0]).assertEqual(11);
        expect(result![5]).assertEqual(12);
        expect(result![9]).assertEqual(13);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_4900
     * @tc.name testSparseArrayMap049
     * @tc.desc map with index on [5,5,5], verify v+k mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 5, 5);
        const result = arr.map((v: int, k: int): int => v + k);
        expect(result![0]).assertEqual(5);
        expect(result![1]).assertEqual(6);
        expect(result![2]).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5000
     * @tc.name testSparseArrayMap050
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals "1", result![1] equals "2")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "2", 3);
        const result = arr.map<string>((v) => v.toString());
        expect(result![0]).assertEqual("1");
        expect(result![1]).assertEqual("2");
        expect(result![2]).assertEqual("3");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5100
     * @tc.name testSparseArrayMap051
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 10, result![1] equals 120)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const result = arr.map((v, i) => v + i * 100);
        expect(result![0]).assertEqual(10);
        expect(result![1]).assertEqual(120);
        expect(result![2]).assertEqual(230);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5200
     * @tc.name testSparseArrayMap052
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals 4, result![1] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v, i, a) => v + a.length);
        expect(result![0]).assertEqual(4);
        expect(result![1]).assertEqual(5);
        expect(result![2]).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5300
     * @tc.name testSparseArrayMap053
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals undefined, result![1] equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v) => undefined);
        expect(result![0]).assertEqual(undefined);
        expect(result![1]).assertEqual(undefined);
        expect(result![2]).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5400
     * @tc.name testSparseArrayMap054
     * @tc.desc Test SparseArray.map, verify method result (result![0] equals null, result![1] equals null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap054', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.map((v: int): null => null);
        expect(result![0]).assertEqual(null);
        expect(result![1]).assertEqual(null);
        expect(result![2]).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5500
     * @tc.name testSparseArrayMap055
     * @tc.desc map float elements doubling values, verify float result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap055', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
        const result = arr.map((v: float): float => v * 2.0f);
        expect(result![0]).assertEqual(2.0f);
        expect(result![1]).assertEqual(5.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5600
     * @tc.name testSparseArrayMap056
     * @tc.desc map byte elements increment by one, verify byte result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap056', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 20 as byte);
        const result = arr.map<byte>((v: byte, _k: int, _a: SparseArray<byte>): byte => (Byte.toInt(v) + 1).toByte());
        expect(result![0]).assertEqual(11 as byte);
        expect(result![1]).assertEqual(21 as byte);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5700
     * @tc.name testSparseArrayMap057
     * @tc.desc map returns label from POJO with null nested list field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap057', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const holder = new NestedNullHolder041();
        holder.label = "item";
        holder.items = null;
        const arr = new SparseArray<NestedNullHolder041>(holder);
        const result = arr.map((v: NestedNullHolder041): string => {
          if (v.items === null) {
            return v.label + ":null-list";
          }
          return v.label;
        });
        expect(result![0]).assertEqual("item:null-list");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5800
     * @tc.name testSparseArrayMap058
     * @tc.desc map labels null element as NULL string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap058', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        const result = arr.map((v: int | null): string => {
          if (v === null) {
            return "NULL";
          }
          return `${v}`;
        });
        expect(result![1]).assertEqual("NULL");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_5900
     * @tc.name testSparseArrayMap059
     * @tc.desc map doubles element at index 0x1 with binary literal 0b11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap059', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0b11, 3);
        const result = arr.map((v: int, i: int): int => {
          if (i === 0x1) {
            return v * 2;
          }
          return v;
        });
        expect(result![0x1]).assertEqual(0b11 * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_6000
     * @tc.name testSparseArrayMap060
     * @tc.desc map char elements to next char marker string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap060', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B');
        const result = arr.map<string>((v: char): string => {
          if (v === c'A') {
            return "A";
          }
          return "B";
        });
        expect(result[0]).assertEqual("A");
        expect(result[1]).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_6100
     * @tc.name testSparseArrayMap061
     * @tc.desc map boolean elements to inverted boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap061', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false);
        const result = arr.map<boolean>((v: boolean): boolean => !v);
        expect(result[0]).assertEqual(false);
        expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_MAP_6200
     * @tc.name testSparseArrayMap062
     * @tc.desc map skips sparse holes while preserving sparse array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayMap062', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(6);
        arr[5] = "tail";
        const result = arr.map<string>((v: string, i: int): string => i.toString() + ":" + v);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertUndefined();
        expect(result[5]).assertEqual("5:tail");
    });


  });
}
