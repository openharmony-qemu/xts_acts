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
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayIncludesGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayIncludesTest002(): void {
  describe('ReadonlyArrayIncludesTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1180
     * @tc.name testReadonlyArrayIncludes118
     * @tc.desc Verify ReadonlyArray.includes behavior: special elements - NaN number - NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 1.0];
      expect(arr.includes(nan)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1190
     * @tc.name testReadonlyArrayIncludes119
     * @tc.desc Verify ReadonlyArray.includes behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.includes(1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1200
     * @tc.name testReadonlyArrayIncludes120
     * @tc.desc Verify ReadonlyArray.includes behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      expect(arr.includes(20)).assertTrue();
      expect(arr.includes(30)).assertFalse();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1210
     * @tc.name testReadonlyArrayIncludes121
     * @tc.desc Verify ReadonlyArray.includes behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.includes(1023);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1220
     * @tc.name testReadonlyArrayIncludes122
     * @tc.desc Verify ReadonlyArray.includes behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(4)).assertFalse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1230
     * @tc.name testReadonlyArrayIncludes123
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1240
     * @tc.name testReadonlyArrayIncludes124
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1250
     * @tc.name testReadonlyArrayIncludes125
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1260
     * @tc.name testReadonlyArrayIncludes126
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1270
     * @tc.name testReadonlyArrayIncludes127
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1280
     * @tc.name testReadonlyArrayIncludes128
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1290
     * @tc.name testReadonlyArrayIncludes129
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1300
     * @tc.name testReadonlyArrayIncludes130
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1310
     * @tc.name testReadonlyArrayIncludes131
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      expect(arr.includes(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1320
     * @tc.name testReadonlyArrayIncludes132
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayIncludesGeneratedItem = new ReadonlyArrayIncludesGeneratedItem(1);
      const obj2: ReadonlyArrayIncludesGeneratedItem = new ReadonlyArrayIncludesGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayIncludesGeneratedItem> = [obj1, obj2];
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1330
     * @tc.name testReadonlyArrayIncludes133
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex equals length boundary returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(3, arr.length);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1340
     * @tc.name testReadonlyArrayIncludes134
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex equals negative length starts from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(1, -arr.length);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1350
     * @tc.name testReadonlyArrayIncludes135
     * @tc.desc Verify ReadonlyArray.includes behavior: string case sensitive comparison returns false for different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["abc", "DEF"];
      expect(arr.includes("ABC")).assertFalse();
      expect(arr.includes("abc")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1360
     * @tc.name testReadonlyArrayIncludes136
     * @tc.desc Verify ReadonlyArray.includes behavior: object same structure different reference returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr> = [obj1];
      expect(arr.includes(obj2)).assertFalse();
      expect(arr.includes(obj1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1370
     * @tc.name testReadonlyArrayIncludes137
     * @tc.desc Verify ReadonlyArray.includes behavior: nested array same content different reference returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Array<int> = [1, 2];
      const arr: ReadonlyArray<Array<int>> = [inner];
      const probe: Array<int> = [1, 2];
      expect(arr.includes(probe)).assertFalse();
      expect(arr.includes(inner)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1380
     * @tc.name testReadonlyArrayIncludes138
     * @tc.desc Verify ReadonlyArray.includes behavior: large 1000 element array element not present returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.includes(-1)).assertFalse();
      expect(arr.includes(1000)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1390
     * @tc.name testReadonlyArrayIncludes139
     * @tc.desc Verify ReadonlyArray.includes behavior: consecutive identical calls return same result no hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const r1 = arr.includes(2);
      const r2 = arr.includes(2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1400
     * @tc.name testReadonlyArrayIncludes140
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex skips earlier match returns false when remaining range lacks element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 1, 2, 3];
      expect(arr.includes(5, 1)).assertFalse();
      expect(arr.includes(5, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1410
     * @tc.name testReadonlyArrayIncludes141
     * @tc.desc Verify ReadonlyArray.includes behavior: object element reference unchanged after includes call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      arr.includes(obj1);
      expect(arr[0] === obj1).assertTrue();
      expect(arr[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1420
     * @tc.name testReadonlyArrayIncludes142
     * @tc.desc Verify ReadonlyArray.includes behavior: search +0.0 finds element -0.0 in double array (reverse direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [-0.0, 1.0];
      expect(arr.includes(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1430
     * @tc.name testReadonlyArrayIncludes143
     * @tc.desc Verify ReadonlyArray.includes behavior: search -0.0 finds element +0.0 in double array (forward direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, 1.0];
      expect(arr.includes(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1440
     * @tc.name testReadonlyArrayIncludes144
     * @tc.desc Verify ReadonlyArray.includes behavior: original array order unchanged after includes call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 4, 1, 5];
      arr.includes(4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1450
     * @tc.name testReadonlyArrayIncludes145
     * @tc.desc Verify ReadonlyArray.includes behavior: float NaN search exhausted with fromIndex past last NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      expect(arr.includes(nan, 2)).assertFalse();
      expect(arr.includes(nan, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1460
     * @tc.name testReadonlyArrayIncludes146
     * @tc.desc Verify ReadonlyArray.includes behavior: return type is boolean assertable as true and false primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const hit: boolean = arr.includes(2);
      const miss: boolean = arr.includes(99);
      expect(hit).assertEqual(true);
      expect(miss).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1470
     * @tc.name testReadonlyArrayIncludes147
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex larger than length still returns false even with valid earlier match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      expect(arr.includes(7, 100)).assertFalse();
      expect(arr.includes(8, 100)).assertFalse();
      expect(arr.includes(9, 100)).assertFalse();
    });

  });
}
