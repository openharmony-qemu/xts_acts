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

class UnshiftPerson009 {
  name: string = '';
}

class UnshiftItem034 {
  value: number = 0;
}

enum UnshiftColor048 {
  Red,
  Green,
  Blue
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.push(i);
  }
  return arr;
}

function unshiftAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  arr.unshift(0);
  return arr.toString() + '|' + arr.length.toString();
}

export default function ArrayUnshiftTest(): void {
  describe('ArrayUnshiftTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0010
     * @tc.name testArrayUnshift001
     * @tc.desc Verify unshift without arguments returns the current array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.unshift();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0020
     * @tc.name testArrayUnshift002
     * @tc.desc Verify unshift accepts a single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const result = arr.unshift(1);
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0030
     * @tc.name testArrayUnshift003
     * @tc.desc Verify unshift accepts multiple arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      const result = arr.unshift(1, 2);
      expect(result).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0040
     * @tc.name testArrayUnshift004
     * @tc.desc Verify unshift prepends number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(20, 30);
      arr.unshift(10);
      expect(arr[0]).assertEqual(10);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0050
     * @tc.name testArrayUnshift005
     * @tc.desc Verify unshift prepends string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('b', 'c');
      arr.unshift('a');
      expect(arr[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0060
     * @tc.name testArrayUnshift006
     * @tc.desc Verify unshift prepends boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(1, false);
      arr.unshift(true);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0070
     * @tc.name testArrayUnshift007
     * @tc.desc Verify unshift prepends char elements using char literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'B', c'C');
      arr.unshift(c'A');
      expect(arr[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0080
     * @tc.name testArrayUnshift008
     * @tc.desc Verify unshift prepends bigint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(2n, 3n);
      arr.unshift(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0090
     * @tc.name testArrayUnshift009
     * @tc.desc Verify unshift prepends object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<UnshiftPerson009>();
      const p2 = new UnshiftPerson009();
      p2.name = 'Bob';
      arr.push(p2);
      const p1 = new UnshiftPerson009();
      p1.name = 'Alice';
      arr.unshift(p1);
      expect(arr[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0100
     * @tc.name testArrayUnshift010
     * @tc.desc Verify unshift works with union-typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>(2, 'c');
      arr.unshift(1, 'b');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0110
     * @tc.name testArrayUnshift011
     * @tc.desc Verify unshift supports spread arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 10);
      const toAdd = new Array<number>(1, 2, 3);
      arr.unshift(...toAdd);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0120
     * @tc.name testArrayUnshift012
     * @tc.desc Verify unshift supports mixed spread and direct arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 20);
      const part1 = new Array<number>(1, 2);
      arr.unshift(...part1, 3, 4);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0130
     * @tc.name testArrayUnshift013
     * @tc.desc Verify unshift can prepend null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, 2);
      arr.unshift(null);
      expect(arr[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0140
     * @tc.name testArrayUnshift014
     * @tc.desc Verify unshift can prepend undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2);
      arr.unshift(undefined);
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0150
     * @tc.name testArrayUnshift015
     * @tc.desc Verify unshift can prepend NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.unshift(NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0160
     * @tc.name testArrayUnshift016
     * @tc.desc Verify unshift can prepend Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.unshift(Infinity, -Infinity);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0170
     * @tc.name testArrayUnshift017
     * @tc.desc Verify unshift preserves zero values at the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.unshift(0, -0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0180
     * @tc.name testArrayUnshift018
     * @tc.desc Verify unshift preserves empty-string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('b', 'c');
      arr.unshift('', 'a');
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0190
     * @tc.name testArrayUnshift019
     * @tc.desc Verify unshift returns the new length after one insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const result = arr.unshift(1);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0200
     * @tc.name testArrayUnshift020
     * @tc.desc Verify unshift returns the accumulated length after many insertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.unshift(1, 2, 3, 4, 5);
      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0210
     * @tc.name testArrayUnshift021
     * @tc.desc Verify unshift on an empty array returns the inserted count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.unshift(1, 2, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0220
     * @tc.name testArrayUnshift022
     * @tc.desc Verify unshift returns a number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.unshift(1);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0230
     * @tc.name testArrayUnshift023
     * @tc.desc Verify unshift increases the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const originalLength = arr.length;
      arr.unshift(1);
      expect(arr.length).assertEqual(originalLength + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0240
     * @tc.name testArrayUnshift024
     * @tc.desc Verify unshift inserts elements at the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(0, 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0250
     * @tc.name testArrayUnshift025
     * @tc.desc Verify original elements shift to higher indexes after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalFirst = arr[0];
      arr.unshift(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0260
     * @tc.name testArrayUnshift026
     * @tc.desc Verify unshift mutates the original array rather than creating a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalRef = arr;
      arr.unshift(0);
      expect(arr === originalRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0270
     * @tc.name testArrayUnshift027
     * @tc.desc Verify existing element values are preserved after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.unshift(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0280
     * @tc.name testArrayUnshift028
     * @tc.desc Verify unshift works on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0290
     * @tc.name testArrayUnshift029
     * @tc.desc Verify unshift works on single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 100);
      arr.unshift(50);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0300
     * @tc.name testArrayUnshift030
     * @tc.desc Verify repeated unshift calls continue prepending elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(3);
      arr.unshift(2);
      arr.unshift(1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0310
     * @tc.name testArrayUnshift031
     * @tc.desc Verify unshift supports many inserted elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const many = createRangeArray(100);
      const result = arr.unshift(...many);
      expect(result).assertEqual(100);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0320
     * @tc.name testArrayUnshift032
     * @tc.desc Verify unshift adds to the front while push adds to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<number>(1, 2);
      arr1.unshift(1);
      expect(arr1[0]).assertEqual(1);
      expect(arr1[1]).assertEqual(2);

      const arr2 = Array.create<number>(1, 1);
      arr2.push(2);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0330
     * @tc.name testArrayUnshift033
     * @tc.desc Verify unshift and shift can model queue-like front operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue = new Array<number>();
      queue.unshift(3);
      queue.unshift(2);
      queue.unshift(1);
      expect(queue.shift()).assertEqual(1);
      expect(queue.shift()).assertEqual(2);
      expect(queue.shift()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0340
     * @tc.name testArrayUnshift034
     * @tc.desc Verify unshift stores object references rather than cloning objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<UnshiftItem034>();
      const item = new UnshiftItem034();
      item.value = 100;
      arr.unshift(item);
      item.value = 200;
      expect(arr[0].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0350
     * @tc.name testArrayUnshift035
     * @tc.desc Verify unshift returns the expanded length after inserting multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      const result = arr.unshift(1, 2);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0360
     * @tc.name testArrayUnshift036
     * @tc.desc Verify unshift updates large arrays correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(1000);
      arr.unshift(-1);
      expect(arr.length).assertEqual(1001);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0370
     * @tc.name testArrayUnshift037
     * @tc.desc Verify generic element typing is preserved for numeric arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0380
     * @tc.name testArrayUnshift038
     * @tc.desc Verify union-typed arrays can prepend several value kinds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean | null>();
      arr.unshift(1, 'string', true, null);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0390
     * @tc.name testArrayUnshift039
     * @tc.desc Verify unshift returns the same new length exposed by the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const result = arr.unshift(1);
      expect(result).assertEqual(arr.length);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0400
     * @tc.name testArrayUnshift040
     * @tc.desc Verify index access reflects shifted original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const originalSecond = arr[1];
      arr.unshift(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(originalSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0410
     * @tc.name testArrayUnshift041
     * @tc.desc Verify slice can read prepended values after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(20, 30, 40);
      arr.unshift(10);
      const sliced = arr.slice(0, 2);
      expect(sliced[0]).assertEqual(10);
      expect(sliced[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0420
     * @tc.name testArrayUnshift042
     * @tc.desc Verify unshift handles number boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(Number.MAX_VALUE, Number.MIN_VALUE, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0430
     * @tc.name testArrayUnshift043
     * @tc.desc Verify unshift handles string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      arr.unshift('', '\u0000', 'very-long-string-value');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0440
     * @tc.name testArrayUnshift044
     * @tc.desc Verify a mutable copy created from a readonly array can be unshifted without changing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const readonlyArr: ReadonlyArray<number> = source;
      const arr = Array.from(readonlyArr);
      const result = arr.unshift(0);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('0,1,2,3');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0450
     * @tc.name testArrayUnshift045
     * @tc.desc Verify unshift inserts a numeric value at the beginning of a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(1);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0460
     * @tc.name testArrayUnshift046
     * @tc.desc Verify unshift and shift can implement front-loaded history behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const queue = new Array<number>();
      queue.unshift(1);
      queue.unshift(2);
      expect(queue.shift()).assertEqual(2);
      expect(queue.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0470
     * @tc.name testArrayUnshift047
     * @tc.desc Verify unshift can prepend latest history records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const history = new Array<string>('action1', 'action2');
      history.unshift('action0');
      expect(history[0]).assertEqual('action0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0480
     * @tc.name testArrayUnshift048
     * @tc.desc Verify enum arrays support unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<UnshiftColor048>();
      arr.unshift(UnshiftColor048.Green, UnshiftColor048.Blue);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(UnshiftColor048.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0490
     * @tc.name testArrayUnshift049
     * @tc.desc Verify arrays extended with extendTo can still unshift values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.extendTo(10, 0);
      expect(arr.length).assertEqual(10);
      arr.unshift(5);
      expect(arr.length).assertEqual(11);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0500
     * @tc.name testArrayUnshift050
     * @tc.desc Verify arrays reduced with shrinkTo can still unshift values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      arr.unshift(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0510
     * @tc.name testArrayUnshift051
     * @tc.desc Verify unshift mutates the source while concat returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(2, 3);
      arr1.unshift(1);
      expect(arr1.length).assertEqual(3);

      const prefix = Array.create<number>(1, 1);
      const arr2 = new Array<number>(2, 3);
      const arr3 = prefix.concat(arr2);
      expect(arr2.length).assertEqual(2);
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0520
     * @tc.name testArrayUnshift052
     * @tc.desc Verify manual reconstruction can prepend values without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(2, 3);
      arr1.unshift(1);
      const arr2 = new Array<number>(2, 3);
      const arr3 = new Array<number>();
      arr3.push(1);
      arr3.push(...arr2);
      expect(arr2.length).assertEqual(2);
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0530
     * @tc.name testArrayUnshift053
     * @tc.desc Verify repeated unshift operations can build a long ordered prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 10; i > 0; i--) {
        arr.unshift(i);
      }
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(1);
      expect(arr[9]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0540
     * @tc.name testArrayUnshift054
     * @tc.desc Verify unshift and push can be mixed on both ends of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      arr.unshift(1);
      arr.push(10);
      arr.unshift(0);
      arr.push(11);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[arr.length - 2]).assertEqual(10);
      expect(arr[arr.length - 1]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0550
     * @tc.name testArrayUnshift055
     * @tc.desc Verify unshift mutates the source while toSpliced returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(2, 3);
      arr1.unshift(1);
      expect(arr1[0]).assertEqual(1);

      const arr2 = new Array<number>(2, 3);
      const arr3 = arr2.toSpliced(0, 0, 1);
      expect(arr2[0]).assertEqual(2);
      expect(arr3[0]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0560
     * @tc.name testArrayUnshift056
     * @tc.desc Verify unshift without arguments returns zero for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.unshift();
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0570
     * @tc.name testArrayUnshift057
     * @tc.desc Verify an array argument is inserted as one reference and is not spread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(1, 2);
      const arr = new Array<Array<number>>();
      const result = arr.unshift(nested);
      expect(result).assertEqual(1);
      expect(arr[0] === nested).assertTrue();
      expect(arr[0].toString()).assertEqual('1,2');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0580
     * @tc.name testArrayUnshift058
     * @tc.desc Verify spreading an empty array inserts nothing and keeps the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const empty = new Array<number>();
      const result = arr.unshift(...empty);
      expect(result).assertEqual(1);
      expect(arr.toString()).assertEqual('1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0590
     * @tc.name testArrayUnshift059
     * @tc.desc Verify unshift can store the array itself as a circular reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Object>(1, 1);
      const result = arr.unshift(arr);
      expect(result).assertEqual(2);
      expect(arr[0] === arr).assertTrue();
      expect(arr[1]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0600
     * @tc.name testArrayUnshift060
     * @tc.desc Verify an existing object reference remains identical after it shifts right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new UnshiftItem034();
      item.value = 6;
      const arr = Array.create<UnshiftItem034>(1, item);
      const head = new UnshiftItem034();
      head.value = 1;
      const result = arr.unshift(head);
      expect(result).assertEqual(2);
      expect(arr[0] === head).assertTrue();
      expect(arr[1] === item).assertTrue();
      item.value = 7;
      expect(arr[1].value).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0610
     * @tc.name testArrayUnshift061
     * @tc.desc Verify unshift can prepend values spread from a materialized values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 4);
      const prefix = new Array<number>(1, 2, 3);
      const values = Array.from<number>(prefix.values());
      const length = arr.unshift(...values);
      expect(length).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(prefix.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0620
     * @tc.name testArrayUnshift062
     * @tc.desc Verify unshift after length is reset to zero starts a fresh prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('old', 'values');
      arr.length = 0;
      const length = arr.unshift('new', 'head');
      expect(length).assertEqual(2);
      expect(arr.toString()).assertEqual('new,head');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0630
     * @tc.name testArrayUnshift063
     * @tc.desc Verify unshift after shrinkTo shifts only the retained values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const length = arr.unshift(0);
      expect(length).assertEqual(3);
      expect(arr.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0640
     * @tc.name testArrayUnshift064
     * @tc.desc Verify unshift on a slice copy leaves the original source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      const copy = source.slice(1, 3);
      const length = copy.unshift(0);
      expect(length).assertEqual(3);
      expect(copy.toString()).assertEqual('0,2,3');
      expect(source.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0650
     * @tc.name testArrayUnshift065
     * @tc.desc Verify unshift supports object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new UnshiftPerson009();
      first.name = 'a';
      const second = new UnshiftPerson009();
      second.name = 'b';
      const third = new UnshiftPerson009();
      third.name = 'c';
      const arr = Array.create<UnshiftPerson009>(1, third);
      const result = arr.unshift(first, second);
      expect(result).assertEqual(3);
      expect(arr[0].name).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0660
     * @tc.name testArrayUnshift066
     * @tc.desc Verify unshift can spread the remaining portion of a values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const prefix = new Array<number>(1, 2, 3);
      const iterator = prefix.values();
      expect(iterator.next().value).assertEqual(1);
      const arr = Array.create<number>(1, 4);
      const remaining = Array.from<number>(iterator);
      const result = arr.unshift(...remaining);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0670
     * @tc.name testArrayUnshift067
     * @tc.desc Verify unshift after shrinkTo preserves object references that remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const kept = new UnshiftItem034();
      kept.value = 2;
      const dropped = new UnshiftItem034();
      dropped.value = 3;
      const arr = new Array<UnshiftItem034>(kept, dropped);
      arr.shrinkTo(1);
      const head = new UnshiftItem034();
      head.value = 1;
      const result = arr.unshift(head);
      expect(result).assertEqual(2);
      expect(arr[0] === head).assertTrue();
      expect(arr[1] === kept).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0680
     * @tc.name testArrayUnshift068
     * @tc.desc Verify unshift on a slice copy can be mutated independently after insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<string>('a', 'b', 'c', 'd');
      const copy = source.slice(1, 3);
      const result = copy.unshift('z');
      copy[1] = 'changed';
      expect(result).assertEqual(3);
      expect(copy.toString()).assertEqual('z,changed,c');
      expect(source.toString()).assertEqual('a,b,c,d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0690
     * @tc.name testArrayUnshift069
     * @tc.desc Verify unshift preserves insertion order for repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(5, 5);
      expect(arr.toString()).assertEqual('5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0700
     * @tc.name testArrayUnshift070
     * @tc.desc Verify unshift can be followed by pop to remove the newest tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.unshift(0);
      const value = arr.pop();
      expect(value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0710
     * @tc.name testArrayUnshift071
     * @tc.desc Verify unshift can be followed by shift to remove the newest head when appropriate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1);
      const value = arr.shift();
      expect(value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0720
     * @tc.name testArrayUnshift072
     * @tc.desc Verify unshift preserves explicit undefined and null order at the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined | null>();
      const result = arr.unshift(undefined, null);
      expect(result).assertEqual(2);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0730
     * @tc.name testArrayUnshift073
     * @tc.desc Verify direct and spread arguments preserve one-pass insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 4);
      const middle = new Array<number>(2, 3);
      const result = arr.unshift(1, ...middle);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0740
     * @tc.name testArrayUnshift074
     * @tc.desc Verify spreading the same array snapshots values before unshift mutates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.unshift(...arr);
      expect(result).assertEqual(2);
      expect(arr.toString()).assertEqual('1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0750
     * @tc.name testArrayUnshift075
     * @tc.desc Verify nested unshift uses the inner return length as the outer inserted value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.unshift(arr.unshift(2));
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('2,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0760
     * @tc.name testArrayUnshift076
     * @tc.desc Verify a value captured before spread remains first in the composed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const first = arr.unshift(2);
      const composed = new Array<number>(first, ...arr);
      expect(composed.toString()).assertEqual('2,2,1');
      expect(arr.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0770
     * @tc.name testArrayUnshift077
     * @tc.desc Verify unshift preserves embedded null-byte string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = 'A\u0000B';
      const arr = Array.create<string>(1, 'tail');
      const result = arr.unshift(text);
      expect(result).assertEqual(2);
      expect(arr[0]).assertEqual(text);
      expect(arr[1]).assertEqual('tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0780
     * @tc.name testArrayUnshift078
     * @tc.desc Verify unshift preserves a supplementary-plane string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = '\uD842\uDFB7';
      const arr = Array.create<string>(1, 'tail');
      const result = arr.unshift(text);
      expect(result).assertEqual(2);
      expect(arr[0]).assertEqual(text);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0790
     * @tc.name testArrayUnshift079
     * @tc.desc Verify nested array references are inserted and shifted without cloning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oldHead = Array.create<number>(1, 1);
      const newHead = Array.create<number>(1, 2);
      const arr = Array.create<Array<number>>(1, oldHead);
      const result = arr.unshift(newHead);
      expect(result).assertEqual(2);
      expect(arr[0] === newHead).assertTrue();
      expect(arr[1] === oldHead).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0800
     * @tc.name testArrayUnshift080
     * @tc.desc Verify object references remain stable after two right shifts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new UnshiftItem034();
      item.value = 1;
      const arr = Array.create<UnshiftItem034>(1, item);
      arr.unshift(new UnshiftItem034());
      const result = arr.unshift(new UnshiftItem034());
      expect(result).assertEqual(3);
      expect(arr[2] === item).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0810
     * @tc.name testArrayUnshift081
     * @tc.desc Verify explicit undefined middle values remain searchable after shifting right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.unshift(0);
      expect(result).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[3]).assertEqual(3);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0820
     * @tc.name testArrayUnshift082
     * @tc.desc Verify alternating explicit undefined values keep their positions after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = 2;
      const result = arr.unshift(0);
      expect(result).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0830
     * @tc.name testArrayUnshift083
     * @tc.desc Verify all-undefined arrays keep undefined tail values after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.unshift(1);
      expect(result).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0840
     * @tc.name testArrayUnshift084
     * @tc.desc Verify generated undefined arrays expand with inserted dense prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      const result = arr.unshift(1, 2);
      expect(result).assertEqual(7);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0850
     * @tc.name testArrayUnshift085
     * @tc.desc Verify explicit undefined remains searchable after it shifts right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.unshift(0);
      expect(result).assertEqual(4);
      expect(arr[2]).assertUndefined();
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0860
     * @tc.name testArrayUnshift086
     * @tc.desc Verify an explicit undefined suffix remains searchable after an inserted prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = 2;
      const result = arr.unshift(0);
      expect(result).assertEqual(4);
      expect(arr[3]).assertUndefined();
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0870
     * @tc.name testArrayUnshift087
     * @tc.desc Verify Set-derived values can be spread into unshift in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Array.from<number>(new Set<number>(new Array<number>(1, 1, 2)));
      const arr = Array.create<number>(1, 3);
      const result = arr.unshift(...values);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0880
     * @tc.name testArrayUnshift088
     * @tc.desc Verify float arrays can accept an integer prefix without losing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.1, 2.2);
      const result = arr.unshift(0);
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1.1);
      expect(arr[2]).assertEqual(2.2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0890
     * @tc.name testArrayUnshift089
     * @tc.desc Verify mixed primitive arrays keep direct argument ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number | string | boolean>(1, 1);
      const result = arr.unshift('', 'a', true);
      expect(result).assertEqual(4);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0900
     * @tc.name testArrayUnshift090
     * @tc.desc Verify unshift prepends into arrays produced by Array.from Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Set<number>(new Array<number>(2, 1, 2)));
      const result = arr.unshift(0);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('0,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0910
     * @tc.name testArrayUnshift091
     * @tc.desc Verify BigInt arrays preserve all prepended values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, 3n);
      const result = arr.unshift(1n, 2n);
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0920
     * @tc.name testArrayUnshift092
     * @tc.desc Verify char arrays preserve prepended code unit order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'C');
      const result = arr.unshift(c'A', c'B');
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(c'A');
      expect(arr[1]).assertEqual(c'B');
      expect(arr[2]).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0930
     * @tc.name testArrayUnshift093
     * @tc.desc Verify long dense arrays move populated indexes to the right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(101, (_index) => undefined);
      arr[100] = 1;
      const result = arr.unshift(0);
      expect(result).assertEqual(102);
      expect(arr[0]).assertEqual(0);
      expect(arr[101]).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0940
     * @tc.name testArrayUnshift094
     * @tc.desc Verify many unshift operations preserve ascending order at the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 200; i >= 1; i--) {
        arr.unshift(i);
      }
      expect(arr.length).assertEqual(200);
      expect(arr[0]).assertEqual(1);
      expect(arr[199]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0950
     * @tc.name testArrayUnshift095
     * @tc.desc Verify large dense arrays shift boundaries after a head insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(5000);
      const result = arr.unshift(-1);
      expect(result).assertEqual(5001);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(0);
      expect(arr[5000]).assertEqual(4999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0960
     * @tc.name testArrayUnshift096
     * @tc.desc Verify mixed object and number arrays keep the object reference at the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new UnshiftItem034();
      item.value = 1;
      const arr = Array.create<number | UnshiftItem034>(1, 2);
      const result = arr.unshift(item);
      expect(result).assertEqual(2);
      expect(arr[0] === item).assertTrue();
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0970
     * @tc.name testArrayUnshift097
     * @tc.desc Verify an enum prefix shifts existing enum values to the right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<UnshiftColor048>(UnshiftColor048.Green, UnshiftColor048.Blue);
      const result = arr.unshift(UnshiftColor048.Red);
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(UnshiftColor048.Red);
      expect(arr[1]).assertEqual(UnshiftColor048.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0980
     * @tc.name testArrayUnshift098
     * @tc.desc Verify toString observes generated and explicit undefined consistently after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sparse = new Array<number | undefined>(2, (_index) => undefined);
      sparse[1] = 2;
      sparse.unshift(0);
      const explicit = new Array<number | undefined>(undefined, 2);
      explicit.unshift(0);
      expect(sparse.toString()).assertEqual('0,,2');
      expect(explicit.toString()).assertEqual(sparse.toString());
      expect(sparse.lastIndexOf(undefined)).assertEqual(1);
      expect(explicit.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_0990
     * @tc.name testArrayUnshift099
     * @tc.desc Verify unshift remains mutating while copied arrays keep their previous order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const copy = arr.slice();
      const result = arr.unshift(1);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,3');
      expect(copy.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_1000
     * @tc.name testArrayUnshift100
     * @tc.desc Verify unshift works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(unshiftAnyNumberArray(anyValue)).assertEqual('0,1,2,3|4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_UNSHIFT_1010
     * @tc.name testArrayUnshift101
     * @tc.desc Verify unshift supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>('two', true);
      const length = anyArr.unshift(1);
      expect(length).assertEqual(3);
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}
