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

class ReadonlyArrayFindLastGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFindLastTest002(): void {
  describe('ReadonlyArrayFindLastTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1150
     * @tc.name testReadonlyArrayFindLast115
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const found = arr.findLast((_value: int): boolean => true);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1160
     * @tc.name testReadonlyArrayFindLast116
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const found = arr.findLast((_value: string): boolean => true);
      expect(found).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1170
     * @tc.name testReadonlyArrayFindLast117
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      const found = arr.findLast((_value: string): boolean => true);
      expect(found).assertEqual("long-text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1180
     * @tc.name testReadonlyArrayFindLast118
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const found = arr.findLast((_value: boolean): boolean => true);
      expect(found).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1190
     * @tc.name testReadonlyArrayFindLast119
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const found = arr.findLast((_value: double): boolean => true);
      expect(found).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1200
     * @tc.name testReadonlyArrayFindLast120
     * @tc.desc Verify ReadonlyArray.findLast behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFindLastGeneratedItem = new ReadonlyArrayFindLastGeneratedItem(1);
      const obj2: ReadonlyArrayFindLastGeneratedItem = new ReadonlyArrayFindLastGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindLastGeneratedItem> = [obj1, obj2];
      const found = arr.findLast((_value: ReadonlyArrayFindLastGeneratedItem): boolean => true);
      expect(found === obj2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1210
     * @tc.name testReadonlyArrayFindLast121
     * @tc.desc Verify ReadonlyArray.findLast behavior: typeof returns "undefined" when no element matches predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.findLast((value: int): boolean => value > 100);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1220
     * @tc.name testReadonlyArrayFindLast122
     * @tc.desc Verify ReadonlyArray.findLast behavior: short-circuits at last matching element so earlier elements are not visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const visited: Array<int> = [];
      const result = arr.findLast((value: int): boolean => {
        visited.push(value);
        return value === 3;
      });
      expect(result).assertEqual(3);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(5);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1230
     * @tc.name testReadonlyArrayFindLast123
     * @tc.desc Verify ReadonlyArray.findLast behavior: when last element matches predicate is invoked exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let count: int = 0;
      const result = arr.findLast((value: int): boolean => {
        count++;
        return value === 5;
      });
      expect(result).assertEqual(5);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1240
     * @tc.name testReadonlyArrayFindLast124
     * @tc.desc Verify ReadonlyArray.findLast behavior: consecutive calls produce identical result and do not share hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const r1 = arr.findLast((value: int): boolean => value % 2 === 0);
      const r2 = arr.findLast((value: int): boolean => value % 2 === 0);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(4);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1250
     * @tc.name testReadonlyArrayFindLast125
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate accesses obj parameter to compare with later elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 5, 3, 9, 2];
      const result = arr.findLast((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        return index < obj.length - 1 && value > obj[index + 1];
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1260
     * @tc.name testReadonlyArrayFindLast126
     * @tc.desc Verify ReadonlyArray.findLast behavior: with duplicate matching elements returns the rightmost occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 3, 7, 1, 7, 2];
      let count: int = 0;
      const result = arr.findLast((value: int): boolean => {
        count++;
        return value === 7;
      });
      expect(result).assertEqual(7);
      expect(count).assertEqual(2);
      expect(arr.lastIndexOf(7)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1270
     * @tc.name testReadonlyArrayFindLast127
     * @tc.desc Verify ReadonlyArray.findLast behavior: single element array invokes predicate exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [99];
      let count: int = 0;
      const result = arr.findLast((value: int, index: int): boolean => {
        count++;
        return index === 0;
      });
      expect(result).assertEqual(99);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1280
     * @tc.name testReadonlyArrayFindLast128
     * @tc.desc Verify ReadonlyArray.findLast behavior: empty array does not invoke predicate at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let count: int = 0;
      const result = arr.findLast((_value: int): boolean => {
        count++;
        return true;
      });
      expect(count).assertEqual(0);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1290
     * @tc.name testReadonlyArrayFindLast129
     * @tc.desc Verify ReadonlyArray.findLast behavior: union type number or undefined returns undefined element when matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<number | undefined> = [1, undefined, 3, undefined];
      const result = arr.findLast((value: number | undefined): boolean => value === undefined);
      expect(result === undefined).assertTrue();
      const numResult = arr.findLast((value: number | undefined): boolean => typeof value === "number");
      expect(numResult).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1300
     * @tc.name testReadonlyArrayFindLast130
     * @tc.desc Verify ReadonlyArray.findLast behavior: object element matched by id field returns the rightmost matching reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayFindLastGeneratedItem = new ReadonlyArrayFindLastGeneratedItem(1);
      const b: ReadonlyArrayFindLastGeneratedItem = new ReadonlyArrayFindLastGeneratedItem(2);
      const c: ReadonlyArrayFindLastGeneratedItem = new ReadonlyArrayFindLastGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindLastGeneratedItem> = [a, b, c];
      const result = arr.findLast((value: ReadonlyArrayFindLastGeneratedItem): boolean => value.id === 2);
      expect(result === c).assertTrue();
      expect(result === b).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1310
     * @tc.name testReadonlyArrayFindLast131
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate throwing error propagates and the original array is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      try {
        arr.findLast((value: int): boolean => {
          if (value === 30) { throw new Error("boom"); }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).message).assertEqual("boom");
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1320
     * @tc.name testReadonlyArrayFindLast132
     * @tc.desc Verify ReadonlyArray.findLast behavior: result of slice chained into findLast still operates on the new array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const sliced = arr.slice(1, 4);
      const result = sliced.findLast((value: int): boolean => value > 1);
      expect(result).assertEqual(4);
      expect(sliced.length).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1330
     * @tc.name testReadonlyArrayFindLast133
     * @tc.desc Verify ReadonlyArray.findLast behavior: returned double element typeof equals "number" matching declared element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.5, 2.5, 3.5];
      const result = arr.findLast((value: double): boolean => value > 2.0);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_LAST_1340
     * @tc.name testReadonlyArrayFindLast134
     * @tc.desc Verify ReadonlyArray.findLast behavior: predicate visits all elements when none match and final result is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFindLast134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let count: int = 0;
      const result = arr.findLast((value: int): boolean => {
        count++;
        return value > 100;
      });
      expect(count).assertEqual(4);
      expect(result === undefined).assertTrue();
    });

  });
}
