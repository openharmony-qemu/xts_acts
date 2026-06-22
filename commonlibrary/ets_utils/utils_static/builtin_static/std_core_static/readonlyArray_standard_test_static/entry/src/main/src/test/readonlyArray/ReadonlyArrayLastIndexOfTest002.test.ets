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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1430
     * @tc.name testReadonlyArrayLastIndexOf143
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      expect(arr.lastIndexOf(10)).assertEqual(0);
      expect(arr.lastIndexOf(20)).assertEqual(1);
      expect(arr.lastIndexOf(30)).assertEqual(-1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1440
     * @tc.name testReadonlyArrayLastIndexOf144
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      const result = arr.lastIndexOf(1023);
      expect(result).assertEqual(1023);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1450
     * @tc.name testReadonlyArrayLastIndexOf145
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      expect(arr.lastIndexOf(2)).assertEqual(1);
      expect(arr.lastIndexOf(4)).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1460
     * @tc.name testReadonlyArrayLastIndexOf146
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1470
     * @tc.name testReadonlyArrayLastIndexOf147
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1480
     * @tc.name testReadonlyArrayLastIndexOf148
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1490
     * @tc.name testReadonlyArrayLastIndexOf149
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1500
     * @tc.name testReadonlyArrayLastIndexOf150
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1510
     * @tc.name testReadonlyArrayLastIndexOf151
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const result = arr.lastIndexOf(arr[0]);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1520
     * @tc.name testReadonlyArrayLastIndexOf152
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
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
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1550
     * @tc.name testReadonlyArrayLastIndexOf155
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1560
     * @tc.name testReadonlyArrayLastIndexOf156
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1570
     * @tc.name testReadonlyArrayLastIndexOf157
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1580
     * @tc.name testReadonlyArrayLastIndexOf158
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1590
     * @tc.name testReadonlyArrayLastIndexOf159
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1600
     * @tc.name testReadonlyArrayLastIndexOf160
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1610
     * @tc.name testReadonlyArrayLastIndexOf161
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1620
     * @tc.name testReadonlyArrayLastIndexOf162
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1630
     * @tc.name testReadonlyArrayLastIndexOf163
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.lastIndexOf(0.0);
      expect(result).assertEqual(2);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1640
     * @tc.name testReadonlyArrayLastIndexOf164
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(1);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1650
     * @tc.name testReadonlyArrayLastIndexOf165
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const secondLength: int = arr.length;
      expect(secondLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1660
     * @tc.name testReadonlyArrayLastIndexOf166
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - int sequence 1, 2, 3 group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1670
     * @tc.name testReadonlyArrayLastIndexOf167
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1680
     * @tc.name testReadonlyArrayLastIndexOf168
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1690
     * @tc.name testReadonlyArrayLastIndexOf169
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1700
     * @tc.name testReadonlyArrayLastIndexOf170
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - string values with empty string group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1710
     * @tc.name testReadonlyArrayLastIndexOf171
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - Unicode string values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1720
     * @tc.name testReadonlyArrayLastIndexOf172
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - boolean true false values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1730
     * @tc.name testReadonlyArrayLastIndexOf173
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - NaN zero and negative zero values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const before: int = arr.length;
      const result = arr.lastIndexOf(0.0);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1740
     * @tc.name testReadonlyArrayLastIndexOf174
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - object reference values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(1);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1750
     * @tc.name testReadonlyArrayLastIndexOf175
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const before: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1760
     * @tc.name testReadonlyArrayLastIndexOf176
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - int sequence 1, 2, 3 group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<int> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1770
     * @tc.name testReadonlyArrayLastIndexOf177
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<Array<int>> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1780
     * @tc.name testReadonlyArrayLastIndexOf178
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<Array<int>> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1790
     * @tc.name testReadonlyArrayLastIndexOf179
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<int> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1800
     * @tc.name testReadonlyArrayLastIndexOf180
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - string values with empty string group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<string> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1810
     * @tc.name testReadonlyArrayLastIndexOf181
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - Unicode string values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<string> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1820
     * @tc.name testReadonlyArrayLastIndexOf182
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - boolean true false values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<boolean> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1830
     * @tc.name testReadonlyArrayLastIndexOf183
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - NaN zero and negative zero values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const result = arr.lastIndexOf(0.0);
      expect(result).assertEqual(2);
      const alias: ReadonlyArray<double> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1840
     * @tc.name testReadonlyArrayLastIndexOf184
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - object reference values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(1);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1850
     * @tc.name testReadonlyArrayLastIndexOf185
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 4 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      const alias: ReadonlyArray<Array<int>> = arr;
      expect(alias.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1860
     * @tc.name testReadonlyArrayLastIndexOf186
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - int sequence 1, 2, 3 group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1870
     * @tc.name testReadonlyArrayLastIndexOf187
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1880
     * @tc.name testReadonlyArrayLastIndexOf188
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1890
     * @tc.name testReadonlyArrayLastIndexOf189
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1900
     * @tc.name testReadonlyArrayLastIndexOf190
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - string values with empty string group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1910
     * @tc.name testReadonlyArrayLastIndexOf191
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - Unicode string values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1920
     * @tc.name testReadonlyArrayLastIndexOf192
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - boolean true false values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1930
     * @tc.name testReadonlyArrayLastIndexOf193
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - NaN zero and negative zero values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(0.0);
        expect(result).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1940
     * @tc.name testReadonlyArrayLastIndexOf194
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - object reference values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(1);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1950
     * @tc.name testReadonlyArrayLastIndexOf195
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 5 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      for (let i: int = 0; i < 2; i++) {
        const result = arr.lastIndexOf(arr[arr.length - 1]);
        expect(result).assertEqual(arr.length - 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1960
     * @tc.name testReadonlyArrayLastIndexOf196
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - int sequence 1, 2, 3 group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1970
     * @tc.name testReadonlyArrayLastIndexOf197
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1980
     * @tc.name testReadonlyArrayLastIndexOf198
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - nested int array values group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1990
     * @tc.name testReadonlyArrayLastIndexOf199
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - repeated int elements group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2000
     * @tc.name testReadonlyArrayLastIndexOf200
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - string values with empty string group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2010
     * @tc.name testReadonlyArrayLastIndexOf201
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - Unicode string values group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2020
     * @tc.name testReadonlyArrayLastIndexOf202
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - boolean true false values group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2030
     * @tc.name testReadonlyArrayLastIndexOf203
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - NaN zero and negative zero values group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(0.0);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2040
     * @tc.name testReadonlyArrayLastIndexOf204
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: combination coverage - object reference values group 6 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(1);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      const sourceLength: int = arr.length;
      const result = arr.lastIndexOf(arr[arr.length - 1]);
      expect(result).assertEqual(arr.length - 1);
      expect(arr.length).assertEqual(sourceLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2050
     * @tc.name testReadonlyArrayLastIndexOf205
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC014 strict equality treats +0 and -0 as equal, returns last matching index of zero
     */
    it('testReadonlyArrayLastIndexOf205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0, -0.0];
      expect(arr.lastIndexOf(0.0)).assertEqual(3);
      expect(arr.lastIndexOf(-0.0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2060
     * @tc.name testReadonlyArrayLastIndexOf206
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC016 same-structure object different reference returns -1
     */
    it('testReadonlyArrayLastIndexOf206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(7);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(7);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1];
      expect(arr.lastIndexOf(obj2)).assertEqual(-1);
      expect(arr.lastIndexOf(obj1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2070
     * @tc.name testReadonlyArrayLastIndexOf207
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC048 two consecutive calls return identical result with no hidden state
     */
    it('testReadonlyArrayLastIndexOf207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 6, 5, 7, 5];
      const r1: int = arr.lastIndexOf(5);
      const r2: int = arr.lastIndexOf(5);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2080
     * @tc.name testReadonlyArrayLastIndexOf208
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC042 object element references in original array remain unchanged after call
     */
    it('testReadonlyArrayLastIndexOf208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(11);
      const obj2: ReadonlyArrayLastIndexOfGeneratedItem = new ReadonlyArrayLastIndexOfGeneratedItem(22);
      const arr: ReadonlyArray<ReadonlyArrayLastIndexOfGeneratedItem> = [obj1, obj2];
      arr.lastIndexOf(obj1);
      expect(arr[0] === obj1).assertTrue();
      expect(arr[1] === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2090
     * @tc.name testReadonlyArrayLastIndexOf209
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC047 large 1024-length array with no match returns -1 without exception
     */
    it('testReadonlyArrayLastIndexOf209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        src.push(i);
      }
      const arr: ReadonlyArray<int> = src as ReadonlyArray<int>;
      expect(arr.lastIndexOf(99999)).assertEqual(-1);
      expect(arr.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2100
     * @tc.name testReadonlyArrayLastIndexOf210
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC011 fromIndex=-1 maps to last index and finds last match
     */
    it('testReadonlyArrayLastIndexOf210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 8, 9, 8, 9];
      expect(arr.lastIndexOf(9, -1)).assertEqual(4);
      expect(arr.lastIndexOf(8, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2110
     * @tc.name testReadonlyArrayLastIndexOf211
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC049 returned int can be used as array index in subsequent operations
     */
    it('testReadonlyArrayLastIndexOf211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y", "z", "y"];
      const idx: int = arr.lastIndexOf("y");
      expect(idx).assertEqual(3);
      expect(arr[idx]).assertEqual("y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2120
     * @tc.name testReadonlyArrayLastIndexOf212
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC037 empty string element at middle index found correctly
     */
    it('testReadonlyArrayLastIndexOf212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "", "b", "", "c"];
      expect(arr.lastIndexOf("")).assertEqual(3);
      expect(arr.lastIndexOf("", 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2130
     * @tc.name testReadonlyArrayLastIndexOf213
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC011 fromIndex=-length searches only first element
     */
    it('testReadonlyArrayLastIndexOf213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 3, 2];
      expect(arr.lastIndexOf(3, -4)).assertEqual(0);
      expect(arr.lastIndexOf(1, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2140
     * @tc.name testReadonlyArrayLastIndexOf214
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC032 nested array reference comparison - same inner array reference matches
     */
    it('testReadonlyArrayLastIndexOf214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1, 2];
      const inner2: Array<int> = [3, 4];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2, inner1];
      expect(arr.lastIndexOf(inner1)).assertEqual(2);
      expect(arr.lastIndexOf(inner2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2150
     * @tc.name testReadonlyArrayLastIndexOf215
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC005 multiple identical elements returns the largest matching index
     */
    it('testReadonlyArrayLastIndexOf215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 7, 7, 7, 7];
      expect(arr.lastIndexOf(7)).assertEqual(4);
      expect(arr.lastIndexOf(7, 2)).assertEqual(2);
      expect(arr.lastIndexOf(7, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2160
     * @tc.name testReadonlyArrayLastIndexOf216
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC020 not-found returns numeric -1 not undefined, comparable to int constant
     */
    it('testReadonlyArrayLastIndexOf216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const r: int = arr.lastIndexOf(99);
      expect(r).assertEqual(-1);
      expect(r < 0).assertTrue();
      expect(r + 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2170
     * @tc.name testReadonlyArrayLastIndexOf217
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: TC048 multiple consecutive calls with different searchElements produce independent correct results
     */
    it('testReadonlyArrayLastIndexOf217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2, 1];
      expect(arr.lastIndexOf(1)).assertEqual(4);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(3)).assertEqual(2);
      expect(arr.lastIndexOf(99)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_2180
     * @tc.name testReadonlyArrayLastIndexOf218
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: strict-equality semantics — NaN element cannot be located via NaN search since NaN !== NaN, returns -1
     * @knownIssue NaN search semantics for double element arrays not explicitly specified in arkts-sta-readonly-array.md; documented canary
     */
    it('testReadonlyArrayLastIndexOf218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 2.0, Number.NaN];
      expect(arr.lastIndexOf(Number.NaN)).assertEqual(-1);
      expect(arr.lastIndexOf(2.0)).assertEqual(1);
    });

  });
}
