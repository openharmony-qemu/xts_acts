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

class ReadonlyArraySomeGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArraySomeTest002(): void {
  describe('ReadonlyArraySomeTest002', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1080
     * @tc.name testReadonlyArraySome108
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - string values with empty string group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      let count: int = 0;
      const result = arr.some((_value: string): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1090
     * @tc.name testReadonlyArraySome109
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - Unicode string values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "\uD83D\uDE00", "long-text"];
      let count: int = 0;
      const result = arr.some((_value: string): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1100
     * @tc.name testReadonlyArraySome110
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - boolean true false values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      let count: int = 0;
      const result = arr.some((_value: boolean): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1110
     * @tc.name testReadonlyArraySome111
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - NaN zero and negative zero values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      let count: int = 0;
      const result = arr.some((_value: double): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1120
     * @tc.name testReadonlyArraySome112
     * @tc.desc Verify ReadonlyArray.some behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(1);
      const obj2: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArraySomeGeneratedItem> = [obj1, obj2];
      let count: int = 0;
      const result = arr.some((_value: ReadonlyArraySomeGeneratedItem): boolean => {
        count++;
        return true;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1130
     * @tc.name testReadonlyArraySome113
     * @tc.desc Verify ReadonlyArray.some behavior: only tail element matches predicate forces full traversal then returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let visits: int = 0;
      const result = arr.some((value: int): boolean => {
        visits++;
        return value === 5;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1140
     * @tc.name testReadonlyArraySome114
     * @tc.desc Verify ReadonlyArray.some behavior: only middle element matches stops at middle index without visiting tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let visits: int = 0;
      const result = arr.some((value: int): boolean => {
        visits++;
        return value === 30;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1150
     * @tc.name testReadonlyArraySome115
     * @tc.desc Verify ReadonlyArray.some behavior: string prefix predicate using startsWith returns true when prefix matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["apple", "banana", "cherry"];
      const result = arr.some((value: string): boolean => value.startsWith("ban"));
      expect(result).assertTrue();
      const noResult = arr.some((value: string): boolean => value.startsWith("zz"));
      expect(noResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1160
     * @tc.name testReadonlyArraySome116
     * @tc.desc Verify ReadonlyArray.some behavior: object property predicate returns true when any element id matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(7);
      const b: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(8);
      const c: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(9);
      const arr: ReadonlyArray<ReadonlyArraySomeGeneratedItem> = [a, b, c];
      const result = arr.some((value: ReadonlyArraySomeGeneratedItem): boolean => value.id === 8);
      expect(result).assertTrue();
      const noResult = arr.some((value: ReadonlyArraySomeGeneratedItem): boolean => value.id === 100);
      expect(noResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1170
     * @tc.name testReadonlyArraySome117
     * @tc.desc Verify ReadonlyArray.some behavior: predicate throws at middle element propagates and stops further iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let visits: int = 0;
      try {
        arr.some((value: int): boolean => {
          visits++;
          if (value === 3) {
            throw new Error("middle predicate error");
          }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(visits).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1180
     * @tc.name testReadonlyArraySome118
     * @tc.desc Verify ReadonlyArray.some behavior: duplicate element array short-circuits at first matching duplicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 9, 9, 9];
      let visits: int = 0;
      const result = arr.some((value: int): boolean => {
        visits++;
        return value === 9;
      });
      expect(result).assertTrue();
      expect(visits).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1190
     * @tc.name testReadonlyArraySome119
     * @tc.desc Verify ReadonlyArray.some behavior: nested array element reference comparison via predicate matches existing inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1];
      const inner2: Array<int> = [2, 3];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2];
      const result = arr.some((value: Array<int>): boolean => value === inner2);
      expect(result).assertTrue();
      const other: Array<int> = [2, 3];
      const noResult = arr.some((value: Array<int>): boolean => value === other);
      expect(noResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1200
     * @tc.name testReadonlyArraySome120
     * @tc.desc Verify ReadonlyArray.some behavior: two consecutive invocations on same ReadonlyArray return identical boolean result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const visits1: Array<int> = [];
      const visits2: Array<int> = [];
      const r1 = arr.some((value: int): boolean => { visits1.push(value); return value === 20; });
      const r2 = arr.some((value: int): boolean => { visits2.push(value); return value === 20; });
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(visits2.length).assertEqual(visits1.length);
      for (let i: int = 0; i < visits1.length; i++) {
        expect(visits2[i]).assertEqual(visits1[i]);
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1210
     * @tc.name testReadonlyArraySome121
     * @tc.desc Verify ReadonlyArray.some behavior: object element references in original array are preserved after some call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(1);
      const o2: ReadonlyArraySomeGeneratedItem = new ReadonlyArraySomeGeneratedItem(2);
      const source: Array<ReadonlyArraySomeGeneratedItem> = [o1, o2];
      const arr: ReadonlyArray<ReadonlyArraySomeGeneratedItem> = source as ReadonlyArray<ReadonlyArraySomeGeneratedItem>;
      arr.some((value: ReadonlyArraySomeGeneratedItem): boolean => value.id === 2);
      expect(source[0] === o1).assertTrue();
      expect(source[1] === o2).assertTrue();
      expect(source.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1220
     * @tc.name testReadonlyArraySome122
     * @tc.desc Verify ReadonlyArray.some behavior: empty array with always-true predicate still returns false because predicate never invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let visits: int = 0;
      const result = arr.some((value: int): boolean => {
        visits++;
        return true;
      });
      expect(result).assertFalse();
      expect(visits).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1230
     * @tc.name testReadonlyArraySome123
     * @tc.desc Verify ReadonlyArray.some behavior: result strictly equals boolean literal true not a truthy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const trueResult = arr.some((value: int): boolean => value === 2);
      const falseResult = arr.some((value: int): boolean => value === 99);
      expect(trueResult).assertTrue();
      expect(falseResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1240
     * @tc.name testReadonlyArraySome124
     * @tc.desc Verify ReadonlyArray.some behavior: Number.isNaN based predicate identifies NaN element in double array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.5, Number.NaN, 3.5];
      const result = arr.some((value: double): boolean => Number.isNaN(value));
      expect(result).assertTrue();
      const noNan: ReadonlyArray<double> = [1.5, 2.5, 3.5];
      const noResult = noNan.some((value: double): boolean => Number.isNaN(value));
      expect(noResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SOME_1250
     * @tc.name testReadonlyArraySome125
     * @tc.desc Verify ReadonlyArray.some behavior: predicate using array argument and index reaches correct cross-element comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySome125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [4, 8, 12, 16];
      const result = arr.some((value: int, index: int, array: ReadonlyArray<int>): boolean => {
        return index > 0 && value === array[index - 1] * 2;
      });
      expect(result).assertTrue();
      expect(arr.length).assertEqual(4);
    });

  });
}
