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

interface HasVal {
  val: int;
}

function getFillStart(): int {
  return 2;
}

function getFillEnd(n: int): int {
  return n + 1;
}

class LinkedNode {
  val: int = 0;
  next: LinkedNode | null = null;
}

export default function ArrayFill2_2Test(): void {
  describe('ArrayFill2_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0100
     * @tc.name testArrayFillTwo001
     * @tc.desc Verify int bitwise expression as end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 6;
      const arr = new Array<int>(1, 2, 3, 4, 5, 6);
      arr.fill(77, 0, len | 0x01);
      expect(arr[0]).assertEqual(77);
      expect(arr[5]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0200
     * @tc.name testArrayFillTwo002
     * @tc.desc Verify int logical AND as fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flag: int = 1;
      const arr = new Array<int>(1, 2, 3);
      arr.fill(flag && 99, 0, 3);
      expect(arr[0]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0300
     * @tc.name testArrayFillTwo003
     * @tc.desc Verify start = INT32_MAX does not fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 2147483647, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0400
     * @tc.name testArrayFillTwo004
     * @tc.desc Verify start = INT32_MIN normalizes to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, -2147483648, 3);
      expect(arr[0]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0500
     * @tc.name testArrayFillTwo005
     * @tc.desc Verify end = INT32_MIN normalizes to 0, no fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 0, -2147483648);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0600
     * @tc.name testArrayFillTwo006
     * @tc.desc Verify start = INT32_MIN + 2 normalizes to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: int = -2147483646;
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, s, 3);
      expect(arr[0]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0700
     * @tc.name testArrayFillTwo007
     * @tc.desc Verify start = 0 end = array.length fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(55, 0, arr.length);
      expect(arr[0]).assertEqual(55);
      expect(arr[2]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0800
     * @tc.name testArrayFillTwo008
     * @tc.desc Verify fill then push then fill chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(9, 0, 3);
      a.push(4);
      a.fill(8, 2, 4);
      expect(a[0]).assertEqual(9);
      expect(a[1]).assertEqual(9);
      expect(a[2]).assertEqual(8);
      expect(a[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0900
     * @tc.name testArrayFillTwo009
     * @tc.desc Verify fill then pop then fill another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(7, 0, 3);
      a.pop();
      const b = new Array<int>(4, 5);
      b.fill(0, 0, 2);
      expect(a.length).assertEqual(2);
      expect(a[0]).assertEqual(7);
      expect(b[0]).assertEqual(0);
      expect(b[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1000
     * @tc.name testArrayFillTwo010
     * @tc.desc Verify fill then sort then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(7, 3, 1, 5);
      a.sort((x: int, y: int): int => {
        return x - y;
      });
      a.fill(0, 1, 3);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(0);
      expect(a[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1100
     * @tc.name testArrayFillTwo011
     * @tc.desc Verify fill then reverse then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.fill(9, 0, 4);
      a.reverse();
      a.fill(7, 0, 2);
      expect(a[0]).assertEqual(7);
      expect(a[1]).assertEqual(7);
      expect(a[2]).assertEqual(9);
      expect(a[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1200
     * @tc.name testArrayFillTwo012
     * @tc.desc Verify fill then splice then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4, 5);
      a.fill(9, 0, 5);
      a.splice(1, 2);
      a.fill(7, 1, 3);
      expect(a[0]).assertEqual(9);
      expect(a[1]).assertEqual(7);
      expect(a[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1300
     * @tc.name testArrayFillTwo013
     * @tc.desc Verify literal vs new Array fill consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2, 3);
      a1.fill(5, 0, 3);
      const a2: Array<int> = [1, 2, 3];
      a2.fill(5, 0, 3);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[2]).assertEqual(a2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1400
     * @tc.name testArrayFillTwo014
     * @tc.desc Verify Array.of int then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<int>(1, 2, 3, 4);
      arr.fill(0, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1500
     * @tc.name testArrayFillTwo015
     * @tc.desc Verify Array.from int then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Array<int>(1, 2, 3);
      const arr = Array.from<int>(src);
      arr.fill(9, 0, 3);
      expect(arr[0]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1600
     * @tc.name testArrayFillTwo016
     * @tc.desc Verify spread int array then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Array<int>(1, 2, 3);
      const arr = Array.from<int>(s);
      arr.fill(7, 0, 3);
      expect(arr[0]).assertEqual(7);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1700
     * @tc.name testArrayFillTwo017
     * @tc.desc Verify array-like converted to array then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i: int = 0; i < 4; i++) {
        arr.push(0);
      }
      arr.fill(7, 1, 4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1800
     * @tc.name testArrayFillTwo018
     * @tc.desc Verify int fill then at() read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(8, 1, 3);
      expect(a.at(0)).assertEqual(1);
      expect(a.at(-1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1900
     * @tc.name testArrayFillTwo019
     * @tc.desc Verify int fill then destructuring read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(10, 20, 30);
      a.fill(99, 1, 3);
      const [x, y, z] = a;
      expect(x).assertEqual(10);
      expect(y).assertEqual(99);
      expect(z).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2000
     * @tc.name testArrayFillTwo020
     * @tc.desc Verify int fill then forEach traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.fill(5, 0, 4);
      let sum: int = 0;
      a.forEach((v: int): void => {
        sum += v;
      });
      expect(sum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2100
     * @tc.name testArrayFillTwo021
     * @tc.desc Verify int fill then for...of traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(7, 1, 3);
      let sum: int = 0;
      for (const v of a) {
        sum += v;
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2200
     * @tc.name testArrayFillTwo022
     * @tc.desc Verify int fill then entries() iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(99, 0, 2);
      const it = a.entries();
      const entry = it.next();
      expect(entry.done).assertFalse();
      const entryVal = entry.value!;
      const idx = entryVal[0];
      const val = entryVal[1];
      expect(idx).assertEqual(0);
      expect(val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2300
     * @tc.name testArrayFillTwo023
     * @tc.desc Verify large int value fill on int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(2000000000, 0, 3);
      expect(arr[0]).assertEqual(2000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2400
     * @tc.name testArrayFillTwo024
     * @tc.desc Verify negative large value fill on int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(-2000000000, 0, 3);
      expect(arr[0]).assertEqual(-2000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2500
     * @tc.name testArrayFillTwo025
     * @tc.desc Verify large value partial fill on int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.fill(1500000000, 1, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1500000000);
      expect(arr[3]).assertEqual(1500000000);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2600
     * @tc.name testArrayFillTwo026
     * @tc.desc Verify int|symbol union array fill with Symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | string>(1, 'a', 2);
      a.fill(99, 0, 3);
      expect(a[0]).assertEqual(99);
      expect(a[1]).assertEqual(99);
      expect(a[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2700
     * @tc.name testArrayFillTwo027
     * @tc.desc Verify sort descending then int fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, 1, 4, 2);
      a.sort((x: int, y: int): int => y - x);
      a.fill(0, 1, 4);
      expect(a[0]).assertEqual(4);
      expect(a[1]).assertEqual(0);
      expect(a[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2800
     * @tc.name testArrayFillTwo028
     * @tc.desc Verify reverse then int fill partial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.reverse();
      arr.fill(99, 0, 3);
      expect(arr[0]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2900
     * @tc.name testArrayFillTwo029
     * @tc.desc Verify splice delete then int fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.splice(1, 2);
      a.fill(9, 0, 2);
      expect(a[0]).assertEqual(9);
      expect(a[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3000
     * @tc.name testArrayFillTwo030
     * @tc.desc Verify splice insert then int fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 5);
      a.splice(2, 0, 3, 4);
      a.fill(0, 1, 4);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(0);
      expect(a[3]).assertEqual(0);
      expect(a[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3100
     * @tc.name testArrayFillTwo031
     * @tc.desc Verify concat then int fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2).concat(new Array<int>(3, 4));
      a.fill(7, 0, 2);
      expect(a[0]).assertEqual(7);
      expect(a[1]).assertEqual(7);
      expect(a[2]).assertEqual(3);
      expect(a[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3200
     * @tc.name testArrayFillTwo032
     * @tc.desc Verify slice copy then fill independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      const b = a.slice();
      b.fill(5, 0, 3);
      expect(a[0]).assertEqual(1);
      expect(b[0]).assertEqual(5);
      expect(b[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3300
     * @tc.name testArrayFillTwo033
     * @tc.desc Verify three overlapping int fill layers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 1, 1, 1, 1);
      arr.fill(2, 0, 5);
      arr.fill(3, 1, 4);
      arr.fill(4, 2, 3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3400
     * @tc.name testArrayFillTwo034
     * @tc.desc Verify same range filled twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(5, 0, 3);
      a.fill(5, 0, 3);
      expect(a[0]).assertEqual(5);
      expect(a[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3500
     * @tc.name testArrayFillTwo035
     * @tc.desc Verify adjacent non-overlapping int fills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.fill(8, 0, 2);
      arr.fill(9, 2, 4);
      expect(arr[0]).assertEqual(8);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3600
     * @tc.name testArrayFillTwo036
     * @tc.desc Verify large range filled then small range overwrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 10, 10, 10);
      arr.fill(1, 0, 4);
      arr.fill(2, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3700
     * @tc.name testArrayFillTwo037
     * @tc.desc Verify small range filled then large range overwrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 1, 1, 1);
      arr.fill(2, 1, 2);
      arr.fill(3, 0, 4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(3);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3800
     * @tc.name testArrayFillTwo038
     * @tc.desc Verify int|string union fill with int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | string>(1, 'hi', 2);
      a.fill(0, 0, 3);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3900
     * @tc.name testArrayFillTwo039
     * @tc.desc Verify int|boolean union partial fill with int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | boolean>(true, 10, false);
      a.fill(0, 1, 3);
      expect(a[0]).assertEqual(true);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4000
     * @tc.name testArrayFillTwo040
     * @tc.desc Verify undefined nullable int fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | undefined>(1, undefined, 2);
      a.fill(0, 0, 3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4100
     * @tc.name testArrayFillTwo041
     * @tc.desc Verify object reference fill on union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: HasVal = { val: 10 };
      const a = new Array<HasVal | int>(1, 2, 3);
      a.fill(o, 0, 3);
      expect((a[0] as HasVal).val).assertEqual(10);
      expect((a[2] as HasVal).val).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4200
     * @tc.name testArrayFillTwo042
     * @tc.desc Verify delete hole then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | undefined>(1, 2, 3);
      a[1] = undefined;
      a.fill(9, 0, 3);
      expect(a[0]).assertEqual(9);
      expect(a[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4300
     * @tc.name testArrayFillTwo043
     * @tc.desc Verify new Array(5) fill all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      arr.fill(7, 0, 5);
      expect(arr[0]).assertEqual(7);
      expect(arr[4]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4400
     * @tc.name testArrayFillTwo044
     * @tc.desc Verify new Array(5) fill partial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      arr.fill(7, 1, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(7);
      expect(arr[2]).assertEqual(7);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4500
     * @tc.name testArrayFillTwo045
     * @tc.desc Verify sparse extended then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, (): int => 0);
      a.extendTo(7, 0);
      a[6] = 1;
      a.fill(9, 0, 7);
      expect(a[0]).assertEqual(9);
      expect(a[6]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4600
     * @tc.name testArrayFillTwo046
     * @tc.desc Verify fill makes sparse hole an own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(4, (): int => 0);
      a.fill(1, 0, 4);
      expect(a.hasOwnProperty(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4700
     * @tc.name testArrayFillTwo047
     * @tc.desc Verify negative zero fill on int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(-0, 0, 3);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4800
     * @tc.name testArrayFillTwo048
     * @tc.desc Verify int fill then every equality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(9, 0, 3);
      const r = a.every((v: int): boolean => v === 9);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_4900
     * @tc.name testArrayFillTwo049
     * @tc.desc Verify int fill then some detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.fill(0, 1, 3);
      const r = a.some((v: int): boolean => v === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5000
     * @tc.name testArrayFillTwo050
     * @tc.desc Verify int fill then includes detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(99, 1, 3);
      expect(a.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5100
     * @tc.name testArrayFillTwo051
     * @tc.desc Verify int fill then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4, 5);
      a.fill(10, 0, 5);
      const sum = a.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5200
     * @tc.name testArrayFillTwo052
     * @tc.desc Verify int fill then reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(7, 1, 3);
      const r = a.reduceRight((acc: int, v: int): int => acc + v, 0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5300
     * @tc.name testArrayFillTwo053
     * @tc.desc Verify int fill then reduce product
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(2, 0, 3);
      const prod = a.reduce((acc: int, v: int): int => acc * v, 1);
      expect(prod).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5400
     * @tc.name testArrayFillTwo054
     * @tc.desc Verify 10000 element int array fill all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 0);
      arr.fill(42, 0, 10000);
      expect(arr[9999]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5500
     * @tc.name testArrayFillTwo055
     * @tc.desc Verify 10000 element int array partial fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(10000, 0);
      arr.fill(99, 100, 200);
      expect(arr[99]).assertEqual(0);
      expect(arr[100]).assertEqual(99);
      expect(arr[199]).assertEqual(99);
      expect(arr[200]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5600
     * @tc.name testArrayFillTwo056
     * @tc.desc Verify 100000 element int fill then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(100000, 0);
      arr.fill(1, 0, 100000);
      const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5700
     * @tc.name testArrayFillTwo057
     * @tc.desc Verify 50000 element fill then every check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(50000, 0);
      arr.fill(7, 0, 50000);
      const r = arr.every((v: int): boolean => v === 7);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5800
     * @tc.name testArrayFillTwo058
     * @tc.desc Verify int start from function return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.fill(88, getFillStart(), 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(88);
      expect(arr[3]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_5900
     * @tc.name testArrayFillTwo059
     * @tc.desc Verify int end from function return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.fill(77, 0, getFillEnd(2));
      expect(arr[0]).assertEqual(77);
      expect(arr[1]).assertEqual(77);
      expect(arr[2]).assertEqual(77);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_6000
     * @tc.name testArrayFillTwo060
     * @tc.desc Verify float to int conversion as fill start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const start: int = (3.7).toInt();
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.fill(66, start, 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(66);
      expect(arr[4]).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_6100
     * @tc.name testArrayFillTwo061
     * @tc.desc Verify int short-circuit expression as start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.fill(9, (false || 2), 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_6200
     * @tc.name testArrayFillTwo062
     * @tc.desc Verify fill(null, int start, int end) with int params on int|null array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, 2, 3, 4, 5);
      arr.fill(null, 1, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertNull();
      expect(arr[3]).assertNull();
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_6300
     * @tc.name testArrayFillTwo063
     * @tc.desc Verify fill(undefined, int start, int end) with int params on int|undefined array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(10, 20, 30, 40);
      arr.fill(undefined, 1, 3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertUndefined();
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_6400
     * @tc.name testArrayFillTwo064
     * @tc.desc Verify fill(LinkedNode, int start, int end) with nested nullable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node = new LinkedNode();
      node.val = 99;
      node.next = null;
      const arr = new Array<LinkedNode>(3, (i: int): LinkedNode => new LinkedNode());
      arr.fill(node, 0, 3);
      expect(arr[0].val).assertEqual(99);
      expect(arr[0].next).assertNull();
      expect(arr[2].next).assertNull();
    });


  });
}
