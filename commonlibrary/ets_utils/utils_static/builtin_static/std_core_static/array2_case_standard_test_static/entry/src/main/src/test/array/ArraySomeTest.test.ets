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

class SomeBoxA {
  value: number = 0;
}

function assertSomeResult(result: boolean, expected: boolean): void {
  if (expected) {
    expect(result).assertTrue();
  } else {
    expect(result).assertFalse();
  }
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
      const arr = new Array<number>(0, -0, Double.NaN);
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
     * @tc.desc Verify filling an explicit undefined slot before it is visited makes some observe it
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2200
     * @tc.name testArraySome022
     * @tc.desc Verify some treats numeric one as truthy through Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => Boolean(value));
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2300
     * @tc.name testArraySome023
     * @tc.desc Verify some treats numeric zero as falsy through Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(0).some((value: number): boolean => Boolean(value));
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2400
     * @tc.name testArraySome024
     * @tc.desc Verify some treats null as falsy through Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number | null>(null).some((value: number | null): boolean => Boolean(value));
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2500
     * @tc.name testArraySome025
     * @tc.desc Verify some treats undefined as falsy through Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        new Array<number | undefined>(undefined).some((value: number | undefined): boolean => Boolean(value));
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2600
     * @tc.name testArraySome026
     * @tc.desc Verify some treats an empty string as falsy through Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('').some((value: string): boolean => Boolean(value));
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2700
     * @tc.name testArraySome027
     * @tc.desc Verify some treats a non-empty string as truthy through Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('a').some((value: string): boolean => Boolean(value));
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2800
     * @tc.name testArraySome028
     * @tc.desc Verify some can observe object instances as present values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<SomeBoxA>(new SomeBoxA()).some((value: SomeBoxA): boolean => value instanceof SomeBoxA);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_2900
     * @tc.name testArraySome029
     * @tc.desc Verify some can observe nested array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        new Array<Array<number>>(new Array<number>()).some((value: Array<number>): boolean => value.length === 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3000
     * @tc.name testArraySome030
     * @tc.desc Verify some returns false for a single false boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<boolean>(false).some((value: boolean): boolean => value);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3100
     * @tc.name testArraySome031
     * @tc.desc Verify some returns true for a single true boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<boolean>(true).some((value: boolean): boolean => value);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3200
     * @tc.name testArraySome032
     * @tc.desc Verify negating a truthy number yields false in some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => !Boolean(value));
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3300
     * @tc.name testArraySome033
     * @tc.desc Verify double-Boolean keeps a truthy number true in some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => !!value);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3400
     * @tc.name testArraySome034
     * @tc.desc Verify some can match a positive comparison on a single number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value > 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3500
     * @tc.name testArraySome035
     * @tc.desc Verify some can reject a negative comparison on a single number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value < 0);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3600
     * @tc.name testArraySome036
     * @tc.desc Verify some returns false for zero and negative zero under a positive comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(0, -0).some((value: number): boolean => value > 0);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3700
     * @tc.name testArraySome037
     * @tc.desc Verify some can find a truthy value after a falsy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(0, 1).some((value: number): boolean => Boolean(value));
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3800
     * @tc.name testArraySome038
     * @tc.desc Verify some treats NaN as falsy under Boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(NaN).some((value: number): boolean => Boolean(value));
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_3900
     * @tc.name testArraySome039
     * @tc.desc Verify some can match the middle value in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2, 3).some((value: number): boolean => value === 2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4000
     * @tc.name testArraySome040
     * @tc.desc Verify some returns false when a numeric array does not contain the target value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2, 3).some((value: number): boolean => value === 4);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4100
     * @tc.name testArraySome041
     * @tc.desc Verify some stops after the first true predicate result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let count = 0;
      const result = arr.some((value: number): boolean => {
        count++;
        return value === 1;
      });
      assertSomeResult(result, true);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4200
     * @tc.name testArraySome042
     * @tc.desc Verify some stops after the second callback when the second value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, true);
      let count = 0;
      const result = arr.some((value: boolean): boolean => {
        count++;
        return value;
      });
      assertSomeResult(result, true);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4300
     * @tc.name testArraySome043
     * @tc.desc Verify some stops after the third callback when the third value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false, true);
      let count = 0;
      const result = arr.some((value: boolean): boolean => {
        count++;
        return value;
      });
      assertSomeResult(result, true);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4400
     * @tc.name testArraySome044
     * @tc.desc Verify some can match the first callback index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((_value: number, index: int): boolean => index === 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4500
     * @tc.name testArraySome045
     * @tc.desc Verify some can match the second callback index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((_value: number, index: int): boolean => index === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4600
     * @tc.name testArraySome046
     * @tc.desc Verify some returns false for an index that is never visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2, 3).some((_value: number, index: int): boolean => index === 5);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4700
     * @tc.name testArraySome047
     * @tc.desc Verify some exposes the current array length through the third callback parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        new Array<number>(1, 2).some((_value: number, _index: int, array: Array<number>): boolean => array.length ===
          2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4800
     * @tc.name testArraySome048
     * @tc.desc Verify some can find an explicit undefined element in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        new Array<number | undefined>(1, undefined, 3).some((value: number | undefined): boolean => value ===
          undefined);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_4900
     * @tc.name testArraySome049
     * @tc.desc Verify some can find an explicit null element in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number | null>(null, 2).some((value: number | null): boolean => value === null);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5000
     * @tc.name testArraySome050
     * @tc.desc Verify some can find NaN through Number.isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(NaN).some((value: number): boolean => Number.isNaN(value));
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5100
     * @tc.name testArraySome051
     * @tc.desc Verify some can match zero through strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(0).some((value: number): boolean => value === 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5200
     * @tc.name testArraySome052
     * @tc.desc Verify some can match the first value in a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number): boolean => value === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5300
     * @tc.name testArraySome053
     * @tc.desc Verify some can match the second value in a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number): boolean => value === 2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5400
     * @tc.name testArraySome054
     * @tc.desc Verify some returns false when a two-element array does not contain the target value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number): boolean => value === 3);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5500
     * @tc.name testArraySome055
     * @tc.desc Verify some returns true when every value is positive because at least one matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2, 3).some((value: number): boolean => value > 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5600
     * @tc.name testArraySome056
     * @tc.desc Verify some returns false when no value is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2, 3).some((value: number): boolean => value < 0);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5700
     * @tc.name testArraySome057
     * @tc.desc Verify some supports greater-than-or-equal numeric comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value >= 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5800
     * @tc.name testArraySome058
     * @tc.desc Verify some supports less-than-or-equal numeric comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value <= 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_5900
     * @tc.name testArraySome059
     * @tc.desc Verify some can find an even number through modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number): boolean => value % 2 === 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6000
     * @tc.name testArraySome060
     * @tc.desc Verify some can find an odd number through modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number): boolean => value % 2 !== 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6100
     * @tc.name testArraySome061
     * @tc.desc Verify some can match the first string in a string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('a', 'b').some((value: string): boolean => value === 'a');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6200
     * @tc.name testArraySome062
     * @tc.desc Verify some returns false when a string array does not contain the target text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('a', 'b').some((value: string): boolean => value === 'c');
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6300
     * @tc.name testArraySome063
     * @tc.desc Verify some can match true in a boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<boolean>(true, false).some((value: boolean): boolean => value === true);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6400
     * @tc.name testArraySome064
     * @tc.desc Verify some can match false in a boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<boolean>(true, false).some((value: boolean): boolean => value === false);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6500
     * @tc.name testArraySome065
     * @tc.desc Verify some returns false when no number is greater than five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number): boolean => value > 5);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6600
     * @tc.name testArraySome066
     * @tc.desc Verify some can combine index and value checks for the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number, index: int): boolean => index === 0 && value === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6700
     * @tc.name testArraySome067
     * @tc.desc Verify some can combine index and value checks for the second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number, index: int): boolean => index === 1 && value === 2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6800
     * @tc.name testArraySome068
     * @tc.desc Verify some returns false when a mismatched value is paired with the first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number, index: int): boolean => index === 0 && value === 2);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_6900
     * @tc.name testArraySome069
     * @tc.desc Verify some returns false when a mismatched value is paired with the second index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number, index: int): boolean => index === 1 && value === 1);
      assertSomeResult(result, false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7000
     * @tc.name testArraySome070
     * @tc.desc Verify some can validate the type of a numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => typeof value === 'number');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7100
     * @tc.name testArraySome071
     * @tc.desc Verify some can validate the type of a string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('1').some((value: string): boolean => typeof value === 'string');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7200
     * @tc.name testArraySome072
     * @tc.desc Verify some can identify array elements through Array.isArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        new Array<Array<number>>(new Array<number>(1)).some((value: Array<number>): boolean => Array.isArray(value));
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7300
     * @tc.name testArraySome073
     * @tc.desc Verify some can compare indexOf results against the current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 2).some((value: number, index: int,
        array: Array<number>): boolean => array.indexOf(value) === index);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7400
     * @tc.name testArraySome074
     * @tc.desc Verify some can detect duplicate values through indexOf mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1, 1).some((value: number, index: int,
        array: Array<number>): boolean => array.indexOf(value) !== index);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7500
     * @tc.name testArraySome075
     * @tc.desc Verify some supports multiplication-based numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value * 2 === 2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7600
     * @tc.name testArraySome076
     * @tc.desc Verify some supports addition-based numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value + 1 === 2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7700
     * @tc.name testArraySome077
     * @tc.desc Verify some supports subtraction-based numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value - 1 === 0);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7800
     * @tc.name testArraySome078
     * @tc.desc Verify some supports division-based numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value / 1 === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_7900
     * @tc.name testArraySome079
     * @tc.desc Verify some supports Math.abs in numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => Math.abs(value) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8000
     * @tc.name testArraySome080
     * @tc.desc Verify some supports Math.pow in numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => Math.pow(value, 2) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8100
     * @tc.name testArraySome081
     * @tc.desc Verify some supports Math.sqrt in numeric predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => Math.sqrt(value) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8200
     * @tc.name testArraySome082
     * @tc.desc Verify some can compare numeric text through toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value.toString() === '1');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8300
     * @tc.name testArraySome083
     * @tc.desc Verify some can compare Boolean conversion against true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => Boolean(value) === true);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8400
     * @tc.name testArraySome084
     * @tc.desc Verify some can compare Boolean conversion against false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(0).some((value: number): boolean => Boolean(value) === false);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8500
     * @tc.name testArraySome085
     * @tc.desc Verify some can compare Number conversion on a numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => Number(value) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8600
     * @tc.name testArraySome086
     * @tc.desc Verify some can compare Number conversion on a numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<string>('1').some((value: string): boolean => Number(value) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8700
     * @tc.name testArraySome087
     * @tc.desc Verify some can compare parsed integer text from a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => parseInt(value.toString()) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8800
     * @tc.name testArraySome088
     * @tc.desc Verify some can compare parsed floating-point text from a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => parseFloat(value.toString()) === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_8900
     * @tc.name testArraySome089
     * @tc.desc Verify some can compare fixed-point numeric text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value.toFixed(0) === '1');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9000
     * @tc.name testArraySome090
     * @tc.desc Verify some can compare precision-formatted numeric text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value.toPrecision(1) === '1');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9100
     * @tc.name testArraySome091
     * @tc.desc Verify some can compare exponential-formatted numeric text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value.toExponential(0) === '1e+0');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9200
     * @tc.name testArraySome092
     * @tc.desc Verify some can compare locale-formatted numeric text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value.toLocaleString() === '1');
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9300
     * @tc.name testArraySome093
     * @tc.desc Verify some can compare valueOf on a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value.valueOf() === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9400
     * @tc.name testArraySome094
     * @tc.desc Verify some supports conjunction-based predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value === 1 && value === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9500
     * @tc.name testArraySome095
     * @tc.desc Verify some supports disjunction-based predicates with the first branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value === 1 || value === 2);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9600
     * @tc.name testArraySome096
     * @tc.desc Verify some supports disjunction-based predicates with the second branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>(1).some((value: number): boolean => value === 2 || value === 1);
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9700
     * @tc.name testArraySome097
     * @tc.desc Verify appended elements are still outside the initial traversal range in a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const result = arr.some((value: number, _index: int, array: Array<number>): boolean => {
        array.pushOne(2);
        return value === 2;
      });
      assertSomeResult(result, false);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9800
     * @tc.name testArraySome098
     * @tc.desc Verify changing a future element can make some match that new future value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.some((value: number, index: int, array: Array<number>): boolean => {
        if (index === 0) {
          array[2] = 9;
        }
        return value === 9;
      });
      assertSomeResult(result, true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SOME_9900
     * @tc.name testArraySome099
     * @tc.desc Verify multiple some invocations on the same array remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySome099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const first = arr.some((value: number): boolean => value === 3);
      const second = arr.some((value: number): boolean => value === 4);
      assertSomeResult(first, true);
      assertSomeResult(second, false);
    });
  });
}
