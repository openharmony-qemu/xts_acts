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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class Item010 {
  value: int = 0;
  constructor(v: int) { this.value = v; }
}

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArraySliceGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArraySliceTest002(): void {
  describe('ReadonlyArraySliceTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1210
     * @tc.name testReadonlyArraySlice121
     * @tc.desc Verify ReadonlyArray.slice behavior: slice result deep equals expected segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = arr.slice(1, 3);
      expect(result).assertDeepEquals([2, 3] as Array<int>);
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1220
     * @tc.name testReadonlyArraySlice122
     * @tc.desc Verify ReadonlyArray.slice behavior: multiple slice on same source independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const r1 = arr.slice(0, 2);
      const r2 = arr.slice(2, 4);
      expect(r1.length).assertEqual(2);
      expect(r2.length).assertEqual(2);
      expect(r1[1]).assertEqual(2);
      expect(r2[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1230
     * @tc.name testReadonlyArraySlice123
     * @tc.desc Verify ReadonlyArray.slice behavior: string path - like slice segment preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["path\\to", "file"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("path\\to");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1240
     * @tc.name testReadonlyArraySlice124
     * @tc.desc Verify ReadonlyArray.slice behavior: float slice preserves NaN at end segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, 2.0f, nan];
      const result = arr.slice(2, 3);
      expect(result.length).assertEqual(1);
      expect(Number.isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1250
     * @tc.name testReadonlyArraySlice125
     * @tc.desc Verify ReadonlyArray.slice behavior: double slice empty when start greater than end on multi element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 2.0, 3.0];
      const result = arr.slice(2, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1260
     * @tc.name testReadonlyArraySlice126
     * @tc.desc Verify ReadonlyArray.slice behavior: boundary scale - array length equals 1024 slice last four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.slice(1020, 1024);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1020);
      expect(result[3]).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1270
     * @tc.name testReadonlyArraySlice127
     * @tc.desc Verify ReadonlyArray.slice behavior: call consistency - two consecutive calls produce equal value sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const r1 = arr.slice(0, 2);
      const r2 = arr.slice(0, 2);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.length).assertEqual(2);
      expect(r1[0]).assertEqual(r2[0]);
      expect(r1[1]).assertEqual(r2[1]);
      expect(r1[0]).assertEqual(1);
      expect(r1[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1280
     * @tc.name testReadonlyArraySlice128
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - int sequence full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1290
     * @tc.name testReadonlyArraySlice129
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - string values with empty string full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual("a");
      expect(result[2]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1300
     * @tc.name testReadonlyArraySlice130
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - Unicode string values full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual("\u4e2d\u6587");
      expect(result[2]).assertEqual("long-text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1310
     * @tc.name testReadonlyArraySlice131
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - boolean true false values full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1320
     * @tc.name testReadonlyArraySlice132
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - NaN zero and negative zero values full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(arr.length);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1330
     * @tc.name testReadonlyArraySlice133
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - object reference values full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(arr.length);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1340
     * @tc.name testReadonlyArraySlice134
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - nested int array values full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.slice(0);
      expect(result.length).assertEqual(arr.length);
      expect(result[0] === arr[0]).assertTrue();
      expect(result[1] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1350
     * @tc.name testReadonlyArraySlice135
     * @tc.desc Verify ReadonlyArray.slice behavior: combination coverage - repeated int elements full slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.slice(0);
      expect(result.length).assertEqual(arr.length);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1360
     * @tc.name testReadonlyArraySlice136
     * @tc.desc Verify ReadonlyArray.slice behavior: shallow copy - mutating object property via slice result is visible through source ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Item010 = new Item010(5);
      const arr: ReadonlyArray<Item010> = [obj, new Item010(6)];
      const result = arr.slice(0, 1);
      result[0].value = 99;
      expect(arr[0].value).assertEqual(99);
      expect(obj.value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1370
     * @tc.name testReadonlyArraySlice137
     * @tc.desc Verify ReadonlyArray.slice behavior: source ReadonlyArray length and element order unchanged after slice call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      const lenBefore: int = arr.length as int;
      arr.slice(1, 3);
      expect(arr.length).assertEqual(lenBefore);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1380
     * @tc.name testReadonlyArraySlice138
     * @tc.desc Verify ReadonlyArray.slice behavior: result is Array<T> usable with map deriving new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const sliced: Array<int> = arr.slice(1, 4);
      const mapped: Array<int> = sliced.map((v: int): int => v * 10);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(20);
      expect(mapped[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1390
     * @tc.name testReadonlyArraySlice139
     * @tc.desc Verify ReadonlyArray.slice behavior: result is Array<T> usable with filter deriving new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const sliced: Array<int> = arr.slice(0, 5);
      const filtered: Array<int> = sliced.filter((v: int): boolean => v % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1400
     * @tc.name testReadonlyArraySlice140
     * @tc.desc Verify ReadonlyArray.slice behavior: two independent slice results - mutating one does not affect the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const r1: Array<int> = arr.slice(0, 3);
      const r2: Array<int> = arr.slice(0, 3);
      r1[0] = 999;
      expect(r2[0]).assertEqual(1);
      expect(r1[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1410
     * @tc.name testReadonlyArraySlice141
     * @tc.desc Verify ReadonlyArray.slice behavior: empty array with explicit start and end params returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const r1 = arr.slice(0, 5);
      const r2 = arr.slice(2, 4);
      const r3 = arr.slice(-1);
      expect(r1.length).assertEqual(0);
      expect(r2.length).assertEqual(0);
      expect(r3.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1420
     * @tc.name testReadonlyArraySlice142
     * @tc.desc Verify ReadonlyArray.slice behavior: single element ReadonlyArray with negative start -1 returns the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [77];
      const result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1430
     * @tc.name testReadonlyArraySlice143
     * @tc.desc Verify ReadonlyArray.slice behavior: chained slice on Array<T> result works as ordinary array API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50, 60];
      const first: Array<int> = arr.slice(1, 5);
      const second: Array<int> = first.slice(1, 3);
      expect(second.length).assertEqual(2);
      expect(second[0]).assertEqual(30);
      expect(second[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1440
     * @tc.name testReadonlyArraySlice144
     * @tc.desc Verify ReadonlyArray.slice behavior: result iterable via for-of yielding elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result: Array<int> = arr.slice(1, 4);
      let sum: int = 0;
      let count: int = 0;
      for (const v of result) {
        sum = sum + v;
        count = count + 1;
      }
      expect(count).assertEqual(3);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1450
     * @tc.name testReadonlyArraySlice145
     * @tc.desc Verify ReadonlyArray.slice behavior: nested array element reference identity preserved across slice and source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1, 2];
      const inner2: Array<int> = [3, 4];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0] === inner2).assertTrue();
      result[0][0] = 999;
      expect(inner2[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1460
     * @tc.name testReadonlyArraySlice146
     * @tc.desc Verify ReadonlyArray.slice behavior: source object element reference unchanged after slice (no replacement)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Item010 = new Item010(1);
      const b: Item010 = new Item010(2);
      const arr: ReadonlyArray<Item010> = [a, b];
      arr.slice(0, 2);
      arr.slice(1);
      expect(arr[0] === a).assertTrue();
      expect(arr[1] === b).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1470
     * @tc.name testReadonlyArraySlice147
     * @tc.desc Verify ReadonlyArray.slice behavior: pushing into Array<T> result does not extend source ReadonlyArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = arr.slice();
      result.push(99);
      result.push(100);
      expect(result.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1480
     * @tc.name testReadonlyArraySlice148
     * @tc.desc Verify ReadonlyArray.slice behavior: int.MIN_VALUE as start clamps to 0 returning full copy; int.MAX_VALUE as end clamps to length returning suffix from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const fromMinStart: Array<int> = arr.slice(Int.MIN_VALUE);
      expect(fromMinStart.length).assertEqual(arr.length);
      for (let i: int = 0; i < arr.length; i++) {
        expect(fromMinStart[i]).assertEqual(arr[i]);
      }
      const toMaxEnd: Array<int> = arr.slice(2, Int.MAX_VALUE);
      expect(toMaxEnd.length).assertEqual(arr.length - 2);
      expect(toMaxEnd[0]).assertEqual(30);
      expect(toMaxEnd[2]).assertEqual(50);
      expect(fromMinStart === arr).assertFalse();
      expect(toMaxEnd === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1490
     * @tc.name testReadonlyArraySlice149
     * @tc.desc Verify ReadonlyArray.slice behavior: int.MIN_VALUE..int.MAX_VALUE full extreme range returns full shallow copy; int.MAX_VALUE..int.MAX_VALUE returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const full: Array<int> = arr.slice(Int.MIN_VALUE, Int.MAX_VALUE);
      expect(full.length).assertEqual(3);
      expect(full[0]).assertEqual(1);
      expect(full[2]).assertEqual(3);
      expect(full === arr).assertFalse();
      const empty: Array<int> = arr.slice(Int.MAX_VALUE, Int.MAX_VALUE);
      expect(empty.length).assertEqual(0);
    });

  });
}
