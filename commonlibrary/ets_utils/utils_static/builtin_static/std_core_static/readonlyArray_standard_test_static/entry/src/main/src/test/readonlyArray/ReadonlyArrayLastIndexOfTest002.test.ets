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

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayLastIndexOfGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayLastIndexOfTest002(): void {
  describe('ReadonlyArrayLastIndexOfTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1440
     * @tc.name testReadonlyArrayLastIndexOf144
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      expect(arr.lastIndexOf(10)).assertEqual(0);
      expect(arr.lastIndexOf(20)).assertEqual(1);
      expect(arr.lastIndexOf(30)).assertEqual(-1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1450
     * @tc.name testReadonlyArrayLastIndexOf145
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.lastIndexOf(1023);
      expect(result).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1460
     * @tc.name testReadonlyArrayLastIndexOf146
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      expect(arr.lastIndexOf(2)).assertEqual(1);
      expect(arr.lastIndexOf(4)).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1470
     * @tc.name testReadonlyArrayLastIndexOf147
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1480
     * @tc.name testReadonlyArrayLastIndexOf148
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1490
     * @tc.name testReadonlyArrayLastIndexOf149
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1500
     * @tc.name testReadonlyArrayLastIndexOf150
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1510
     * @tc.name testReadonlyArrayLastIndexOf151
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1520
     * @tc.name testReadonlyArrayLastIndexOf152
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1530
     * @tc.name testReadonlyArrayLastIndexOf153
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1540
     * @tc.name testReadonlyArrayLastIndexOf154
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1550
     * @tc.name testReadonlyArrayLastIndexOf155
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1560
     * @tc.name testReadonlyArrayLastIndexOf156
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1570
     * @tc.name testReadonlyArrayLastIndexOf157
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC014 strict equality treats +0 and -0 as equal, returns last matching index of zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0, -0.0];
      expect(arr.lastIndexOf(0.0)).assertEqual(3);
      expect(arr.lastIndexOf(-0.0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1580
     * @tc.name testReadonlyArrayLastIndexOf158
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC016 same-structure object different reference returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(7);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(7);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1];
      expect(arr.lastIndexOf(obj2)).assertEqual(-1);
      expect(arr.lastIndexOf(obj1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1590
     * @tc.name testReadonlyArrayLastIndexOf159
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC048 two consecutive calls return identical result with no hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 6, 5, 7, 5];
      const r1: int = arr.lastIndexOf(5);
      const r2: int = arr.lastIndexOf(5);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1600
     * @tc.name testReadonlyArrayLastIndexOf160
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC042 object element references in original array remain unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(11);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(22);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      arr.lastIndexOf(obj1);
      expect(arr[0] === obj1).assertTrue();
      expect(arr[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1610
     * @tc.name testReadonlyArrayLastIndexOf161
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC047 large 1024-length array with no match returns -1 without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        src.push(i);
      }
      const arr: ReadonlyArray<int> = src as ReadonlyArray<int>;
      expect(arr.lastIndexOf(99999)).assertEqual(-1);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1620
     * @tc.name testReadonlyArrayLastIndexOf162
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC011 fromIndex=-1 maps to last index and finds last match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 8, 9, 8, 9];
      expect(arr.lastIndexOf(9, -1)).assertEqual(4);
      expect(arr.lastIndexOf(8, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1630
     * @tc.name testReadonlyArrayLastIndexOf163
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC049 returned int can be used as array index in subsequent operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y", "z", "y"];
      const idx: int = arr.lastIndexOf("y");
      expect(idx).assertEqual(3);
      expect(arr[idx]).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1640
     * @tc.name testReadonlyArrayLastIndexOf164
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC037 empty string element at middle index found correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b", "", "c"];
      expect(arr.lastIndexOf("")).assertEqual(3);
      expect(arr.lastIndexOf("", 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1650
     * @tc.name testReadonlyArrayLastIndexOf165
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC011 fromIndex=-length searches only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 3, 2];
      expect(arr.lastIndexOf(3, -4)).assertEqual(0);
      expect(arr.lastIndexOf(1, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1660
     * @tc.name testReadonlyArrayLastIndexOf166
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC032 nested array reference comparison - same inner array reference matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1, 2];
      const inner2: Array<int> = [3, 4];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2, inner1];
      expect(arr.lastIndexOf(inner1)).assertEqual(2);
      expect(arr.lastIndexOf(inner2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1670
     * @tc.name testReadonlyArrayLastIndexOf167
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC005 multiple identical elements returns the largest matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 7, 7, 7, 7];
      expect(arr.lastIndexOf(7)).assertEqual(4);
      expect(arr.lastIndexOf(7, 2)).assertEqual(2);
      expect(arr.lastIndexOf(7, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1680
     * @tc.name testReadonlyArrayLastIndexOf168
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC020 not-found returns numeric -1 not undefined, comparable to int constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const r: int = arr.lastIndexOf(99);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1690
     * @tc.name testReadonlyArrayLastIndexOf169
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC048 multiple consecutive calls with different searchElements produce independent correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2, 1];
      expect(arr.lastIndexOf(1)).assertEqual(4);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(3)).assertEqual(2);
      expect(arr.lastIndexOf(99)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1700
     * @tc.name testReadonlyArrayLastIndexOf170
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: strict-equality semantics — NaN element cannot be located via NaN search since NaN !== NaN, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 2.0, Number.NaN];
      expect(arr.lastIndexOf(Number.NaN)).assertEqual(-1);
      expect(arr.lastIndexOf(2.0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1710
     * @tc.name testReadonlyArrayLastIndexOf171
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex positive out-of-bounds clamps to last index and searches whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2, 1];
      expect(arr.lastIndexOf(1, 999)).assertEqual(4);
      expect(arr.lastIndexOf(2, 999)).assertEqual(3);
      expect(arr.lastIndexOf(3, 999)).assertEqual(2);
      expect(arr.lastIndexOf(99, 999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1720
     * @tc.name testReadonlyArrayLastIndexOf172
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex extremely negative (< -length) searches zero elements returning -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      expect(arr.lastIndexOf(1, -999)).assertEqual(-1);
      expect(arr.lastIndexOf(2, -999)).assertEqual(-1);
      expect(arr.lastIndexOf(3, -999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1730
     * @tc.name testReadonlyArrayLastIndexOf173
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: ReadonlyArray<int | undefined> locates undefined element by strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3, undefined];
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
      expect(arr.lastIndexOf(1)).assertEqual(0);
      expect(arr.lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1740
     * @tc.name testReadonlyArrayLastIndexOf174
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: string comparison is case-sensitive and distinguishes upper and lower case forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["A", "a"];
      expect(arr.lastIndexOf("a")).assertEqual(1);
      expect(arr.lastIndexOf("A")).assertEqual(0);
    });

  });
}
