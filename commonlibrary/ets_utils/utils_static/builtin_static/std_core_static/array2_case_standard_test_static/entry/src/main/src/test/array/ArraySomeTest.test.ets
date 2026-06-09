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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

function createZeroArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(0);
  }
  return arr;
}

export default function ArraySomeTest(): void {
  describe('ArraySomeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0100
     * @tc.name testArraySome001
     * @tc.desc Verify some returns true when one element satisfies the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.some((value: number): boolean => value === 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0200
     * @tc.name testArraySome002
     * @tc.desc Verify some returns false when no element satisfies the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.some((value: number): boolean => value === 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0300
     * @tc.name testArraySome003
     * @tc.desc Verify some can match falsy numeric values through an explicit boolean predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -0, NaN);
      const hasNaN = arr.some((value: number): boolean => Number.isNaN(value));
      const hasPositive = arr.some((value: number): boolean => value > 0);
      expect(hasNaN).assertTrue();
      expect(hasPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0400
     * @tc.name testArraySome004
     * @tc.desc Verify some short-circuits after the first element satisfies the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count: int = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value === 1;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0500
     * @tc.name testArraySome005
     * @tc.desc Verify some visits elements until the middle matching element is reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count: int = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value === 2;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0600
     * @tc.name testArraySome006
     * @tc.desc Verify some visits every element when no element satisfies the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count: int = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value === 4;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0700
     * @tc.name testArraySome007
     * @tc.desc Verify some returns false for an empty array and does not run the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let count: int = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value > 0;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0800
     * @tc.name testArraySome008
     * @tc.desc Verify some observes explicit undefined elements in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let count: int = 0;
      const result = arr.some((value: number | undefined): boolean => {
        count++;
        return value === undefined;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_0900
     * @tc.name testArraySome009
     * @tc.desc Verify some can find an explicit undefined value in a dense slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      let count: int = 0;
      const result = arr.some((value: number | undefined): boolean => {
        count++;
        return value === undefined;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1000
     * @tc.name testArraySome010
     * @tc.desc Verify some stops after the first explicit undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      let count: int = 0;
      const result = arr.some((value: number | undefined): boolean => {
        count++;
        return value === undefined;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1100
     * @tc.name testArraySome011
     * @tc.desc Verify elements appended during iteration are outside the initial traversal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let count: int = 0;
      const result = arr.some((value: number, index: int, array: Array<number>): boolean => {
        count++;
        if (index === 0) {
          array.pushOne(3);
        }
        return value === 3;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1200
     * @tc.name testArraySome012
     * @tc.desc Verify removing an unvisited tail element prevents it from being visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      let count: int = 0;
      const result = arr.some((value: number, index: int, array: Array<number>): boolean => {
        count++;
        if (index === 0) {
          array.pop();
        }
        return value === 2;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1300
     * @tc.name testArraySome013
     * @tc.desc Verify mutating an unvisited element is observed when that index is reached
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count: int = 0;
      const result = arr.some((value: number, index: int, array: Array<number>): boolean => {
        count++;
        if (index === 0) {
          array[2] = 9;
        }
        return value === 9;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1400
     * @tc.name testArraySome014
     * @tc.desc Verify filling a sparse slot before it is visited makes some observe it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      let count: int = 0;
      const result = arr.some((value: number | undefined, index: int, array: Array<number | undefined>): boolean => {
        count++;
        if (index === 0) {
          array[1] = 2;
        }
        return value === 2;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1500
     * @tc.name testArraySome015
     * @tc.desc Verify truncating length during iteration removes later elements from traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count: int = 0;
      const result = arr.some((value: number, index: int, array: Array<number>): boolean => {
        count++;
        if (index === 0) {
          array.length = 1;
        }
        return value === 2;
      });
      expect(result).assertFalse();
      expect(count).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1600
     * @tc.name testArraySome016
     * @tc.desc Verify the predicate receives value, index, and original array arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5);
      let receivedIndex: int = -1;
      let sameArray = false;
      const result = arr.some((value: number, index: int, array: Array<number>): boolean => {
        receivedIndex = index;
        sameArray = array === arr;
        return value === 4;
      });
      expect(result).assertTrue();
      expect(receivedIndex).assertEqual(0);
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1700
     * @tc.name testArraySome017
     * @tc.desc Verify some works on readonly arrays without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<number> = [1, 2, 3];
      const result = arr.some((value: number): boolean => value > 2);
      expect(result).assertTrue();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1800
     * @tc.name testArraySome018
     * @tc.desc Verify some supports union-typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>('a', 1);
      const result = arr.some((value: string | number): boolean => value === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_1900
     * @tc.name testArraySome019
     * @tc.desc Verify some short-circuits early on a large array when the first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createZeroArray(1000);
      arr[0] = 1;
      let count: int = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value === 1;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2000
     * @tc.name testArraySome020
     * @tc.desc Verify some scans every element on a large array when the last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createZeroArray(1000);
      arr[999] = 1;
      let count: int = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value === 1;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2100
     * @tc.name testArraySome021
     * @tc.desc Verify errors thrown by the predicate propagate to the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      try {
        arr.some((value: number): boolean => {
          if (value === 1) {
            throw new Error('stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });
  });
}
