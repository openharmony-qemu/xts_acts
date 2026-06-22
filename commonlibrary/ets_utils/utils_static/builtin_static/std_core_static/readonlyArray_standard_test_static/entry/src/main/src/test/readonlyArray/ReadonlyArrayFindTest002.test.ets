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

class ReadonlyArrayFindGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayFindTest002(): void {
  describe('ReadonlyArrayFindTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1160
     * @tc.name testReadonlyArrayFind116
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const found = arr.find((_value: int): boolean => true);
      expect(found).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1170
     * @tc.name testReadonlyArrayFind117
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - int sequence 1, 2, 3 group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const found = arr.find((_value: int): boolean => true);
      expect(found).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1180
     * @tc.name testReadonlyArrayFind118
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(1);
      const obj2: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindGeneratedItem> = [obj1, obj2];
      const found = arr.find((_value: ReadonlyArrayFindGeneratedItem): boolean => true);
      expect(found !== undefined).assertTrue();
      expect(found === obj1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1190
     * @tc.name testReadonlyArrayFind119
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - string values with empty string group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const found = arr.find((_value: string): boolean => true);
      expect(found).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1200
     * @tc.name testReadonlyArrayFind120
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - Unicode string values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const found = arr.find((_value: string): boolean => true);
      expect(found).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1210
     * @tc.name testReadonlyArrayFind121
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - boolean true false values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const found = arr.find((_value: boolean): boolean => true);
      expect(found).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1220
     * @tc.name testReadonlyArrayFind122
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - NaN zero and negative zero values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const found = arr.find((_value: double): boolean => true);
      expect(found !== found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1230
     * @tc.name testReadonlyArrayFind123
     * @tc.desc Verify ReadonlyArray.find behavior: call consistency - calling find twice consecutively yields identical result with no hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      const r1 = arr.find((value: int): boolean => value > 25);
      const r2 = arr.find((value: int): boolean => value > 25);
      expect(r1).assertEqual(30);
      expect(r2).assertEqual(30);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1240
     * @tc.name testReadonlyArrayFind124
     * @tc.desc Verify ReadonlyArray.find behavior: error path - predicate throws at middle element stops iteration immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: int = 0;
      try {
        arr.find((value: int): boolean => {
          callCount++;
          if (value === 3) { throw new Error("stop"); }
          return false;
        });
        expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1250
     * @tc.name testReadonlyArrayFind125
     * @tc.desc Verify ReadonlyArray.find behavior: empty array - predicate is never invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let callCount: int = 0;
      const result = arr.find((_value: int): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1260
     * @tc.name testReadonlyArrayFind126
     * @tc.desc Verify ReadonlyArray.find behavior: readonly constraint - returned object is the same reference as the element, not a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(1);
      const b: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindGeneratedItem> = [a, b];
      const found = arr.find((v: ReadonlyArrayFindGeneratedItem): boolean => v.id === 2);
      expect(found === b).assertTrue();
      expect(found !== a).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1270
     * @tc.name testReadonlyArrayFind127
     * @tc.desc Verify ReadonlyArray.find behavior: predicate uses closure variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 15, 20];
      const threshold: int = 12;
      const result = arr.find((value: int): boolean => value > threshold);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1280
     * @tc.name testReadonlyArrayFind128
     * @tc.desc Verify ReadonlyArray.find behavior: predicate's third obj parameter supports indexing - obj[index] equals value during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      let allMatch: boolean = true;
      arr.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        if (obj[index] !== value) { allMatch = false; }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1290
     * @tc.name testReadonlyArrayFind129
     * @tc.desc Verify ReadonlyArray.find behavior: nested array element - returned inner Array reference is the same object as the array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1];
      const inner2: Array<int> = [2, 3];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2];
      const result = arr.find((v: Array<int>): boolean => v.length === 2);
      expect(result === inner2).assertTrue();
      expect(result !== inner1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1300
     * @tc.name testReadonlyArrayFind130
     * @tc.desc Verify ReadonlyArray.find behavior: short-circuit - only last element matches, predicate runs exactly length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: int = 0;
      const result = arr.find((value: int): boolean => {
        callCount++;
        return value === 5;
      });
      expect(result).assertEqual(5);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1310
     * @tc.name testReadonlyArrayFind131
     * @tc.desc Verify ReadonlyArray.find behavior: special elements - ReadonlyArray of int union undefined, find undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const result = arr.find((v: int | undefined): boolean => v === undefined);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_1320
     * @tc.name testReadonlyArrayFind132
     * @tc.desc Verify ReadonlyArray.find behavior: not found result strictly equals undefined via === comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.find((value: int): boolean => value > 1000);
      expect(result === undefined).assertTrue();
      expect(result === null).assertFalse();
    });

  });
}
