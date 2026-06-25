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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0740
     * @tc.name testReadonlyArrayIncludes074
     * @tc.desc Verify ReadonlyArray.includes behavior: special elements - NaN number - NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 1.0];
      expect(arr.includes(nan)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0750
     * @tc.name testReadonlyArrayIncludes075
     * @tc.desc Verify ReadonlyArray.includes behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.includes(1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0760
     * @tc.name testReadonlyArrayIncludes076
     * @tc.desc Verify ReadonlyArray.includes behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      expect(arr.includes(20)).assertTrue();
      expect(arr.includes(30)).assertFalse();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0770
     * @tc.name testReadonlyArrayIncludes077
     * @tc.desc Verify ReadonlyArray.includes behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.includes(1023);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0780
     * @tc.name testReadonlyArrayIncludes078
     * @tc.desc Verify ReadonlyArray.includes behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(4)).assertFalse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0790
     * @tc.name testReadonlyArrayIncludes079
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0800
     * @tc.name testReadonlyArrayIncludes080
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0810
     * @tc.name testReadonlyArrayIncludes081
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0820
     * @tc.name testReadonlyArrayIncludes082
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0830
     * @tc.name testReadonlyArrayIncludes083
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0840
     * @tc.name testReadonlyArrayIncludes084
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0850
     * @tc.name testReadonlyArrayIncludes085
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0860
     * @tc.name testReadonlyArrayIncludes086
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0870
     * @tc.name testReadonlyArrayIncludes087
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      expect(arr.includes(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0880
     * @tc.name testReadonlyArrayIncludes088
     * @tc.desc Verify ReadonlyArray.includes behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayIncludesGeneratedItem = new ReadonlyArrayIncludesGeneratedItem(1);
      const obj2: ReadonlyArrayIncludesGeneratedItem = new ReadonlyArrayIncludesGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayIncludesGeneratedItem> = [obj1, obj2];
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0890
     * @tc.name testReadonlyArrayIncludes089
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex equals length boundary returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(3, arr.length);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0900
     * @tc.name testReadonlyArrayIncludes090
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex equals negative length starts from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(1, -arr.length);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0910
     * @tc.name testReadonlyArrayIncludes091
     * @tc.desc Verify ReadonlyArray.includes behavior: string case sensitive comparison returns false for different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["abc", "DEF"];
      expect(arr.includes("ABC")).assertFalse();
      expect(arr.includes("abc")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0920
     * @tc.name testReadonlyArrayIncludes092
     * @tc.desc Verify ReadonlyArray.includes behavior: object same structure different reference returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr> = [obj1];
      expect(arr.includes(obj2)).assertFalse();
      expect(arr.includes(obj1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0930
     * @tc.name testReadonlyArrayIncludes093
     * @tc.desc Verify ReadonlyArray.includes behavior: nested array same content different reference returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Array<int> = [1, 2];
      const arr: ReadonlyArray<Array<int>> = [inner];
      const probe: Array<int> = [1, 2];
      expect(arr.includes(probe)).assertFalse();
      expect(arr.includes(inner)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0940
     * @tc.name testReadonlyArrayIncludes094
     * @tc.desc Verify ReadonlyArray.includes behavior: large 1000 element array element not present returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.includes(-1)).assertFalse();
      expect(arr.includes(1000)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0950
     * @tc.name testReadonlyArrayIncludes095
     * @tc.desc Verify ReadonlyArray.includes behavior: consecutive identical calls return same result no hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const r1 = arr.includes(2);
      const r2 = arr.includes(2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0960
     * @tc.name testReadonlyArrayIncludes096
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex skips earlier match returns false when remaining range lacks element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 1, 2, 3];
      expect(arr.includes(5, 1)).assertFalse();
      expect(arr.includes(5, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0970
     * @tc.name testReadonlyArrayIncludes097
     * @tc.desc Verify ReadonlyArray.includes behavior: object element reference unchanged after includes call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      arr.includes(obj1);
      expect(arr[0] === obj1).assertTrue();
      expect(arr[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0980
     * @tc.name testReadonlyArrayIncludes098
     * @tc.desc Verify ReadonlyArray.includes behavior: search +0.0 finds element -0.0 in double array (reverse direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [-0.0, 1.0];
      expect(arr.includes(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0990
     * @tc.name testReadonlyArrayIncludes099
     * @tc.desc Verify ReadonlyArray.includes behavior: search -0.0 finds element +0.0 in double array (forward direction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, 1.0];
      expect(arr.includes(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1000
     * @tc.name testReadonlyArrayIncludes100
     * @tc.desc Verify ReadonlyArray.includes behavior: original array order unchanged after includes call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 4, 1, 5];
      arr.includes(4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1010
     * @tc.name testReadonlyArrayIncludes101
     * @tc.desc Verify ReadonlyArray.includes behavior: float NaN search exhausted with fromIndex past last NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      expect(arr.includes(nan, 2)).assertFalse();
      expect(arr.includes(nan, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1020
     * @tc.name testReadonlyArrayIncludes102
     * @tc.desc Verify ReadonlyArray.includes behavior: return type is boolean assertable as true and false primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const hit: boolean = arr.includes(2);
      const miss: boolean = arr.includes(99);
      expect(hit).assertEqual(true);
      expect(miss).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_1030
     * @tc.name testReadonlyArrayIncludes103
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex larger than length still returns false even with valid earlier match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      expect(arr.includes(7, 100)).assertFalse();
      expect(arr.includes(8, 100)).assertFalse();
      expect(arr.includes(9, 100)).assertFalse();
    });

  });
}
