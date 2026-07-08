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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0010
     * @tc.name testReadonlyArrayFind001
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      const found = arr.find((_value: int): boolean => true);
      expect(found).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0020
     * @tc.name testReadonlyArrayFind002
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(1);
      const obj2: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindGeneratedItem> = [obj1, obj2];
      const found = arr.find((_value: ReadonlyArrayFindGeneratedItem): boolean => true);
      expect(found !== undefined).assertTrue();
      expect(found === obj1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0030
     * @tc.name testReadonlyArrayFind003
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - string values with empty string group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const found = arr.find((_value: string): boolean => true);
      expect(found).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0040
     * @tc.name testReadonlyArrayFind004
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - Unicode string values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const found = arr.find((_value: string): boolean => true);
      expect(found).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0050
     * @tc.name testReadonlyArrayFind005
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - boolean true false values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const found = arr.find((_value: boolean): boolean => true);
      expect(found).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0060
     * @tc.name testReadonlyArrayFind006
     * @tc.desc Verify ReadonlyArray.find behavior: combination coverage - NaN zero and negative zero values group 3 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [Number.NaN, 0.0, -0.0];
      const found = arr.find((_value: double): boolean => true);
      expect(found !== undefined).assertTrue();
      expect(Number.isNaN(found!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0070
     * @tc.name testReadonlyArrayFind007
     * @tc.desc Verify ReadonlyArray.find behavior: call consistency - calling find twice consecutively yields identical result with no hidden state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40];
      const r1 = arr.find((value: int): boolean => value > 25);
      const r2 = arr.find((value: int): boolean => value > 25);
      expect(r1).assertEqual(30);
      expect(r2).assertEqual(30);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0080
     * @tc.name testReadonlyArrayFind008
     * @tc.desc Verify ReadonlyArray.find behavior: error path - predicate throws at middle element stops iteration immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      let callCount: int = 0;
      try {
        arr.find((value: int): boolean => {
          callCount++;
          if (value === 3) { throw new Error("stop"); }
          return false;
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0090
     * @tc.name testReadonlyArrayFind009
     * @tc.desc Verify ReadonlyArray.find behavior: empty array - predicate is never invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0100
     * @tc.name testReadonlyArrayFind010
     * @tc.desc Verify ReadonlyArray.find behavior: readonly constraint - returned object is the same reference as the element, not a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(1);
      const b: ReadonlyArrayFindGeneratedItem = new ReadonlyArrayFindGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayFindGeneratedItem> = [a, b];
      const found = arr.find((v: ReadonlyArrayFindGeneratedItem): boolean => v.id === 2);
      expect(found === b).assertTrue();
      expect(found !== a).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0110
     * @tc.name testReadonlyArrayFind011
     * @tc.desc Verify ReadonlyArray.find behavior: predicate uses closure variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 10, 15, 20];
      const threshold: int = 12;
      const result = arr.find((value: int): boolean => value > threshold);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0120
     * @tc.name testReadonlyArrayFind012
     * @tc.desc Verify ReadonlyArray.find behavior: predicate's third obj parameter supports indexing - obj[index] equals value during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8, 9];
      let allMatch: boolean = true;
      arr.find((value: int, index: int, obj: ReadonlyArray<int>): boolean => {
        if (obj[index] !== value) { allMatch = false; }
        return false;
      });
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0130
     * @tc.name testReadonlyArrayFind013
     * @tc.desc Verify ReadonlyArray.find behavior: nested array element - returned inner Array reference is the same object as the array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1: Array<int> = [1];
      const inner2: Array<int> = [2, 3];
      const arr: ReadonlyArray<Array<int>> = [inner1, inner2];
      const result = arr.find((v: Array<int>): boolean => v.length === 2);
      expect(result === inner2).assertTrue();
      expect(result !== inner1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0140
     * @tc.name testReadonlyArrayFind014
     * @tc.desc Verify ReadonlyArray.find behavior: short-circuit - only last element matches, predicate runs exactly length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0150
     * @tc.name testReadonlyArrayFind015
     * @tc.desc Verify ReadonlyArray.find behavior: special elements - ReadonlyArray of int union undefined, find undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int | undefined> = [1, undefined, 3];
      const result = arr.find((v: int | undefined): boolean => v === undefined);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_FIND_0160
     * @tc.name testReadonlyArrayFind016
     * @tc.desc Verify ReadonlyArray.find behavior: not found result strictly equals undefined via === comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.find((value: int): boolean => value > 1000);
      expect(result === undefined).assertTrue();
    });

  });
}
