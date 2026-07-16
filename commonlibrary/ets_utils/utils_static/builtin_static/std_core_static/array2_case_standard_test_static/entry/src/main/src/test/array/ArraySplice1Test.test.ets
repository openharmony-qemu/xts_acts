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

class SpliceItem033 {
  value: number = 0;
}

class SplicePerson037 {
  name: string = '';
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

export default function ArraySplice1Test(): void {
  describe('ArraySplice1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0100
     * @tc.name testArraySpliceOne001
     * @tc.desc Verify splice accepts start delete and inserted item parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1, 1, 50);
      expect(arr[1]).assertEqual(50);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0200
     * @tc.name testArraySpliceOne002
     * @tc.desc Verify splice with start and delete removes elements without adding new ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(1, 2);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0300
     * @tc.name testArraySpliceOne003
     * @tc.desc Verify splice with only start removes elements from start to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0400
     * @tc.name testArraySpliceOne004
     * @tc.desc Verify splice can insert multiple items at once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1, 1, 50, 60, 70);
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(50);
      expect(arr[3]).assertEqual(70);
      expect(result[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0500
     * @tc.name testArraySpliceOne005
     * @tc.desc Verify a positive start index counts from the front of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(2, 1);
      expect(arr[2]).assertEqual(40);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0600
     * @tc.name testArraySpliceOne006
     * @tc.desc Verify start zero performs the operation from the beginning of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(0, 1, 100);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0700
     * @tc.name testArraySpliceOne007
     * @tc.desc Verify a start index beyond the length appends inserted items to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(10, 0, 100);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0800
     * @tc.name testArraySpliceOne008
     * @tc.desc Verify delete zero inserts items without removing existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, 0, 100);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_0900
     * @tc.name testArraySpliceOne009
     * @tc.desc Verify delete count removes the requested number of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.splice(1, 3);
      expect(result.length).assertEqual(3);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1000
     * @tc.name testArraySpliceOne010
     * @tc.desc Verify an oversized delete count removes elements through the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1, 100);
      expect(result.length).assertEqual(2);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1100
     * @tc.name testArraySpliceOne011
     * @tc.desc Verify a negative delete count is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, -1, 100);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1200
     * @tc.name testArraySpliceOne012
     * @tc.desc Verify an empty items array adds no new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const emptyItems = new Array<number>();
      const result = arr.splice(1, 1, ...emptyItems);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1300
     * @tc.name testArraySpliceOne013
     * @tc.desc Verify splice can insert a null element into a nullable array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(10, 20, 30);
      arr.splice(1, 1, null);
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1400
     * @tc.name testArraySpliceOne014
     * @tc.desc Verify splice can insert an undefined element into an optional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(10, 20, 30);
      arr.splice(1, 1, undefined);
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1500
     * @tc.name testArraySpliceOne015
     * @tc.desc Verify splice can insert NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, 1, Double.NaN);
      expect(Number.isNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1600
     * @tc.name testArraySpliceOne016
     * @tc.desc Verify splice returns an array containing removed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(1, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1700
     * @tc.name testArraySpliceOne017
     * @tc.desc Verify delete zero returns an empty removed-elements array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1, 0, 100);
      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1800
     * @tc.name testArraySpliceOne018
     * @tc.desc Verify a start index beyond length returns an empty removed-elements array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(10, 1);
      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_1900
     * @tc.name testArraySpliceOne019
     * @tc.desc Verify splice returns an array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1, 1);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2000
     * @tc.name testArraySpliceOne020
     * @tc.desc Verify the returned array is a newly created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1, 1);
      result.pushOne(100);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2100
     * @tc.name testArraySpliceOne021
     * @tc.desc Verify splice changes the length of the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      arr.splice(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2200
     * @tc.name testArraySpliceOne022
     * @tc.desc Verify removing and inserting one element performs replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, 1, 100);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2300
     * @tc.name testArraySpliceOne023
     * @tc.desc Verify delete zero can insert multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, 0, 100, 200);
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(200);
      expect(arr[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2400
     * @tc.name testArraySpliceOne024
     * @tc.desc Verify splice zero removes all elements from the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2500
     * @tc.name testArraySpliceOne025
     * @tc.desc Verify splice mutates the original array instead of creating a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const originalRef = arr;
      arr.splice(1, 1);
      expect(arr === originalRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2600
     * @tc.name testArraySpliceOne026
     * @tc.desc Verify an empty array can receive inserted elements through splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.splice(0, 0, 10, 20);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2700
     * @tc.name testArraySpliceOne027
     * @tc.desc Verify splice works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 100);
      const result = arr.splice(0, 1, 200);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(200);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2800
     * @tc.name testArraySpliceOne028
     * @tc.desc Verify negative start indexes count from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(-2, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_2900
     * @tc.name testArraySpliceOne029
     * @tc.desc Verify splice can be called repeatedly on the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(1, 1);
      arr.splice(2, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(30);
      expect(arr[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3000
     * @tc.name testArraySpliceOne030
     * @tc.desc Verify removing and adding equal counts performs range replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      arr.splice(1, 2, 100, 200);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3100
     * @tc.name testArraySpliceOne031
     * @tc.desc Verify adding more items than removed expands the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, 1, 100, 200, 300);
      expect(arr.length).assertEqual(5);
      expect(arr[1]).assertEqual(100);
      expect(arr[3]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3200
     * @tc.name testArraySpliceOne032
     * @tc.desc Verify removing more items than inserted shrinks the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(1, 3, 100);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3300
     * @tc.name testArraySpliceOne033
     * @tc.desc Verify splice preserves object references in the removed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SpliceItem033>();
      const item = new SpliceItem033();
      item.value = 100;
      arr.pushOne(item);
      const result = arr.splice(0, 1);
      expect(result[0] === item).assertTrue();
      expect(result[0].value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3400
     * @tc.name testArraySpliceOne034
     * @tc.desc Verify splice moves tail elements into the removed result and closes the source gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const result = arr.splice(5000, 1);
      expect(result[0]).assertEqual(5000);
      expect(arr.length).assertEqual(9999);
      expect(arr[4999]).assertEqual(4999);
      expect(arr[5000]).assertEqual(5001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3500
     * @tc.name testArraySpliceOne035
     * @tc.desc Verify splice can remove a large number of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      arr.splice(1000, 8000);
      expect(arr.length).assertEqual(2000);
      expect(arr[999]).assertEqual(999);
      expect(arr[1000]).assertEqual(9000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3600
     * @tc.name testArraySpliceOne036
     * @tc.desc Verify splice works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const result = arr.splice(1, 2, 'X', 'Y');
      expect(arr[1]).assertEqual('X');
      expect(arr[2]).assertEqual('Y');
      expect(result[0]).assertEqual('b');
      expect(result[1]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3700
     * @tc.name testArraySpliceOne037
     * @tc.desc Verify splice works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SplicePerson037>();
      const p1 = new SplicePerson037();
      p1.name = 'Alice';
      const p2 = new SplicePerson037();
      p2.name = 'Bob';
      arr.push(p1, p2);
      const result = arr.splice(0, 1);
      expect(result[0].name).assertEqual('Alice');
      expect(arr[0].name).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3800
     * @tc.name testArraySpliceOne038
     * @tc.desc Verify splice works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.splice(1, 1);
      expect(arr.length).assertEqual(2);
      expect(result[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_3900
     * @tc.name testArraySpliceOne039
     * @tc.desc Verify splice can be combined with push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1, 1);
      arr.push(100);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4000
     * @tc.name testArraySpliceOne040
     * @tc.desc Verify splice can be combined with pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      arr.splice(1, 1);
      const popped = arr.pop();
      expect(popped).assertEqual(40);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4100
     * @tc.name testArraySpliceOne041
     * @tc.desc Verify splice updates the length property consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const beforeLength = arr.length;
      arr.splice(1, 2);
      const afterLength = arr.length;
      expect(afterLength).assertEqual(beforeLength - 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4200
     * @tc.name testArraySpliceOne042
     * @tc.desc Verify splicing a mutable copy does not change the readonly source data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyArray<number> = [1, 2, 3];
      const arr = Array.from<number>(source);
      const removed = arr.splice(0, 1);
      expect(removed.toString()).assertEqual('1');
      expect(source.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4300
     * @tc.name testArraySpliceOne043
     * @tc.desc Verify zero-delete splice with no insertions is a no-op that returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const removed = arr.splice(1, 0);
      removed.pushOne(99);
      expect(arr.toString()).assertEqual('10,20,30');
      expect(arr.length).assertEqual(3);
      expect(removed.toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4400
     * @tc.name testArraySpliceOne044
     * @tc.desc Verify splice snapshots numeric start and delete count variables before later changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let start: int = 1;
      let deleteCount: int = 2;
      const removed = arr.splice(start, deleteCount, 9);
      start = 0;
      deleteCount = 0;
      expect(removed.toString()).assertEqual('2,3');
      expect(arr.toString()).assertEqual('1,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4500
     * @tc.name testArraySpliceOne045
     * @tc.desc Verify inserted repeated object references remain the same shared object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new SpliceItem033();
      shared.value = 7;
      const arr = new Array<SpliceItem033>();
      const removed = arr.splice(0, 0, shared, shared);
      arr[0].value = 42;
      expect(removed.length).assertEqual(0);
      expect(arr.length).assertEqual(2);
      expect(arr[0] === arr[1]).assertTrue();
      expect(shared.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4600
     * @tc.name testArraySpliceOne046
     * @tc.desc Verify delete count captured before source growth still removes only the requested tail range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const start: int = 1;
      const deleteCount: int = arr.length - start;
      arr.pushOne(40);
      const removed = arr.splice(start, deleteCount);
      expect(removed.toString()).assertEqual('20,30');
      expect(arr.toString()).assertEqual('10,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4700
     * @tc.name testArraySpliceOne047
     * @tc.desc Verify lastIndexOf can find the last duplicate before splicing a single occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'a', 'c', 'a');
      const index = arr.lastIndexOf('a');
      const removed = arr.splice(index, 1);
      expect(index).assertEqual(4);
      expect(removed.toString()).assertEqual('a');
      expect(arr.toString()).assertEqual('a,b,a,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4800
     * @tc.name testArraySpliceOne048
     * @tc.desc Verify splice can truncate the tail after the last matching marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('start', 'keep', 'cut', 'drop', 'cut', 'tail');
      const start = arr.lastIndexOf('cut');
      const removed = arr.splice(start);
      expect(start).assertEqual(4);
      expect(arr.toString()).assertEqual('start,keep,cut,drop');
      expect(removed.toString()).assertEqual('cut,tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_4900
     * @tc.name testArraySpliceOne049
     * @tc.desc Verify replacing with fewer elements compacts the following suffix without changing its order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const removed = arr.splice(1, 3, 99);
      expect(removed.toString()).assertEqual('2,3,4');
      expect(arr.toString()).assertEqual('1,99,5');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5000
     * @tc.name testArraySpliceOne050
     * @tc.desc Verify replacement insertion uses the argument values captured at call time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let inserted: number = 8;
      const removed = arr.splice(1, 1, inserted);
      inserted = 99;
      expect(removed.toString()).assertEqual('2');
      expect(arr.toString()).assertEqual('1,8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5100
     * @tc.name testArraySpliceOne051
     * @tc.desc Verify deleting zero elements at the end returns an independently mutable empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(arr.length, 0);
      removed.pushOne(4);
      expect(arr.toString()).assertEqual('1,2,3');
      expect(removed.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5200
     * @tc.name testArraySpliceOne052
     * @tc.desc Verify splice can insert spread values at the front of an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const inserted = new Array<number>(3, 4);
      const removed = arr.splice(0, 0, ...inserted);
      expect(arr.toString()).assertEqual('3,4,1,2');
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5300
     * @tc.name testArraySpliceOne053
     * @tc.desc Verify start equal to length removes no elements when delete count is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(3, 1);
      expect(arr.toString()).assertEqual('1,2,3');
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5400
     * @tc.name testArraySpliceOne054
     * @tc.desc Verify start equal to length with zero delete count appends inserted elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(3, 0, 4);
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5500
     * @tc.name testArraySpliceOne055
     * @tc.desc Verify out-of-range insertion appends without creating sparse holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(100, 0, 4);
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5600
     * @tc.name testArraySpliceOne056
     * @tc.desc Verify a negative start equal to -length begins at the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(-3, 1);
      expect(arr.toString()).assertEqual('2,3');
      expect(removed.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5700
     * @tc.name testArraySpliceOne057
     * @tc.desc Verify a negative start beyond length clamps to the front for insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(-100, 0, 0);
      expect(arr.toString()).assertEqual('0,1,2,3');
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5800
     * @tc.name testArraySpliceOne058
     * @tc.desc Verify negative start insertion adds the new value before the counted-from-end element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const removed = arr.splice(-1, 0, 4);
      expect(arr.toString()).assertEqual('1,2,4,3');
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_5900
     * @tc.name testArraySpliceOne059
     * @tc.desc Verify deleting an explicit undefined element returns it in the removed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const removed = arr.splice(1, 1);
      expect(arr.toString()).assertEqual('1,3');
      expect(removed.length).assertEqual(1);
      expect(removed.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6000
     * @tc.name testArraySpliceOne060
     * @tc.desc Verify deleting a value plus explicit undefined preserves undefined in the removed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const removed = arr.splice(0, 2);
      expect(arr.toString()).assertEqual('3');
      expect(removed.length).assertEqual(2);
      expect(removed[0]).assertEqual(1);
      expect(removed.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6100
     * @tc.name testArraySpliceOne061
     * @tc.desc Verify insertion before explicit undefined shifts that value to the right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const removed = arr.splice(1, 0, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
      expect(removed.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6200
     * @tc.name testArraySpliceOne062
     * @tc.desc Verify left-shifting over explicit undefined preserves that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 1;
      arr[1] = 2;
      arr[3] = 4;
      const removed = arr.splice(0, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(4);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
      expect(removed.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6300
     * @tc.name testArraySpliceOne063
     * @tc.desc Verify a leading explicit undefined is preserved in the removed array during replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = 2;
      arr[2] = 3;
      const removed = arr.splice(0, 2, 4);
      expect(arr.toString()).assertEqual('4,3');
      expect(removed.length).assertEqual(2);
      expect(removed[1]).assertEqual(2);
      expect(removed.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6400
     * @tc.name testArraySpliceOne064
     * @tc.desc Verify splicing an all-undefined dense array preserves undefined in both arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const removed = arr.splice(1, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(0);
      expect(removed.length).assertEqual(1);
      expect(removed.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6500
     * @tc.name testArraySpliceOne065
     * @tc.desc Verify replacing one undefined element keeps the other undefined elements searchable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      const removed = arr.splice(2, 1, 1);
      expect(arr.length).assertEqual(5);
      expect(arr[2]).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(4);
      expect(removed.length).assertEqual(1);
      expect(removed.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6600
     * @tc.name testArraySpliceOne066
     * @tc.desc Verify deleting an explicit undefined element returns undefined in the removed array across dense constructions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const explicit = new Array<number | undefined>(1, undefined);
      const explicitRemoved = explicit.splice(1, 1);
      const filled = new Array<number | undefined>(2, (_index) => undefined);
      filled[0] = 1;
      const filledRemoved = filled.splice(1, 1);
      expect(explicit.toString()).assertEqual('1');
      expect(filled.toString()).assertEqual('1');
      expect(explicitRemoved.length).assertEqual(1);
      expect(filledRemoved.length).assertEqual(1);
      expect(explicitRemoved[0]).assertUndefined();
      expect(filledRemoved[0]).assertUndefined();
      expect(explicitRemoved.indexOf(undefined)).assertEqual(0);
      expect(filledRemoved.indexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_ONE_6700
     * @tc.name testArraySpliceOne067
     * @tc.desc Verify splice supports consecutive chained calls on arrays returned from prior removals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.splice(1, 3).splice(1, 1);
      expect(result.toString()).assertEqual('3');
      expect(arr.toString()).assertEqual('1,5');
    });

  });
}
