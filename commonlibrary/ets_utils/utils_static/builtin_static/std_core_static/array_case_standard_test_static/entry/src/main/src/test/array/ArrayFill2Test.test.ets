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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function ArrayFill2Test(): void {
  describe('ArrayFill2Test', (): void => {
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
     * @tc.name testArrayFill2001
     * @tc.desc Verify fill with int start and end updates the target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('x', 1 as int, 3 as int);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('x');
      expect(arr[2]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0200
     * @tc.name testArrayFill2002
     * @tc.desc Verify int typed variables can be used as fill boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const end: int = 3;
      arr.fill(0, start, end);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0300
     * @tc.name testArrayFill2003
     * @tc.desc Verify fill returns the original array reference for int overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.fill(0, 0 as int, 2 as int);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0400
     * @tc.name testArrayFill2004
     * @tc.desc Verify fill with int overload changes the source array in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(9, 1 as int, 3 as int);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0500
     * @tc.name testArrayFill2005
     * @tc.desc Verify fill with equal int boundaries changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const original = arr.toString();
      arr.fill(0, 2 as int, 2 as int);
      expect(arr.toString()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0600
     * @tc.name testArrayFill2006
     * @tc.desc Verify fill with start greater than end changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 3 as int, 1 as int);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0700
     * @tc.name testArrayFill2007
     * @tc.desc Verify int overload matches number overload for the same boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4);
      const arr2 = new Array<number>(1, 2, 3, 4);
      arr1.fill(0, 1, 3);
      arr2.fill(0, 1 as int, 3 as int);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0800
     * @tc.name testArrayFill2008
     * @tc.desc Verify int variables can describe an exact fill range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 1;
      const end: int = 4;
      arr.fill(0, start, end);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_0900
     * @tc.name testArrayFill2009
     * @tc.desc Verify int indexes derived from length can be used safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const len: int = arr.length;
      arr.fill(0, 0 as int, len - 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1000
     * @tc.name testArrayFill2010
     * @tc.desc Verify large positive and negative int boundaries are normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0, 0 as int, 2147483647 as int);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);

      arr.fill(1, -2 as int, 3 as int);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1100
     * @tc.name testArrayFill2011
     * @tc.desc Verify chained int fill calls can update separate regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      arr.fill(0, 0 as int, 2 as int)
        .fill(1, 2 as int, 4 as int)
        .fill(2, 4 as int, 6 as int);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
      expect(arr[5]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1200
     * @tc.name testArrayFill2012
     * @tc.desc Verify int fill can be used inside a loop with calculated ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      for (let i: int = 0; i < 2; i++) {
        arr.fill(i * 10, i * 2, i * 2 + 2);
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1300
     * @tc.name testArrayFill2013
     * @tc.desc Verify documented scenario 7.1 int类型确保
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = 1;
      arr.fill(0, index, index + 2);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1400
     * @tc.name testArrayFill2014
     * @tc.desc Verify documented scenario 7.2 与length结合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const len: int = arr.length;
      arr.fill(0, 0, len - 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1500
     * @tc.name testArrayFill2015
     * @tc.desc Verify documented scenario 8.1 int最小值和最大�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 0;
      const maxEnd: int = 2147483647;
      arr.fill(0, start, maxEnd);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      const negativeStart: int = -2;
      arr.fill(1, negativeStart, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1600
     * @tc.name testArrayFill2016
     * @tc.desc Verify documented scenario 8.2 零�?
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 0, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      arr.fill(1, 0, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1700
     * @tc.name testArrayFill2017
     * @tc.desc Verify documented scenario 10.1 保持泛型类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0, 0, 2);
      const result: number = arr[0];
      const resultType = Class.of(result).getName().split('.');
      expect(resultType[resultType.length - 1]).assertEqual('Double');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1800
     * @tc.name testArrayFill2018
     * @tc.desc Verify documented scenario 12.1 使用int常量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const START: int = 1;
      const END: int = 3;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, START, END);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_1900
     * @tc.name testArrayFill2019
     * @tc.desc Verify negative int boundaries resolve to the expected middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3, 4, 5, 6];
      arr.fill(9, -4 as int, -1 as int);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
      expect(arr[4]).assertEqual(9);
      expect(arr[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2000
     * @tc.name testArrayFill2020
     * @tc.desc Verify int start equal to the array length leaves content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [7, 8, 9];
      const start: int = arr.length;
      arr.fill(0, start, start);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2100
     * @tc.name testArrayFill2021
     * @tc.desc Verify an excessively negative int end clamps to zero and becomes a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [10, 20, 30];
      arr.fill(5, 0 as int, -10 as int);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2200
     * @tc.name testArrayFill2022
     * @tc.desc Verify overlapping int fill calls keep the latest value on covered positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      arr.fill('X', 1 as int, 5 as int);
      arr.fill('Y', 2 as int, 4 as int);
      const joined = arr.join('|');
      expect(joined).assertEqual('a|X|Y|Y|X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2300
     * @tc.name testArrayFill2023
     * @tc.desc Verify the returned array reference can be reused immediately after int fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['left', 'mid', 'right'];
      const result = arr.fill('core', 1 as int, 3 as int);
      result[0] = 'start';
      expect(result === arr).assertTrue();
      expect(arr[0]).assertEqual('start');
      expect(arr[1]).assertEqual('core');
      expect(arr[2]).assertEqual('core');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2400
     * @tc.name testArrayFill2024
     * @tc.desc Verify int fill can normalize a boolean segment for later counting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<boolean> = [true, true, false, true, false];
      arr.fill(false, 1 as int, 4 as int);
      let trueCount = 0;
      for (const item of arr) {
        if (item) {
          trueCount++;
        }
      }
      expect(trueCount).assertEqual(1);
      expect(arr[0]).assertTrue();
      expect(arr[4]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2500
     * @tc.name testArrayFill2025
     * @tc.desc Verify int fill can update a larger interior slice without touching the boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      for (let i = 0; i < 32; i++) {
        arr.pushOne(i);
      }
      arr.fill(-1, 8 as int, 24 as int);
      expect(arr.length).assertEqual(32);
      expect(arr[7]).assertEqual(7);
      expect(arr[8]).assertEqual(-1);
      expect(arr[23]).assertEqual(-1);
      expect(arr[24]).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2600
     * @tc.name testArrayFill2026
     * @tc.desc Verify nested arrays filled by int boundaries share the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared: Array<number> = [];
      const arr: Array<Array<number>> = [[1], [2], [3], [4]];
      arr.fill(shared, 1 as int, 4 as int);
      shared.pushOne(42);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1] === shared).assertTrue();
      expect(arr[2][0]).assertEqual(42);
      expect(arr[3][0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2700
     * @tc.name testArrayFill2027
     * @tc.desc Verify multiple calculated int segments can be filled inside a loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0];
      for (let i: int = 0; i < 4; i++) {
        const start: int = i * 2;
        const end: int = start + 2;
        arr.fill(i + 1, start, end);
      }
      expect(arr.toString()).assertEqual('1,1,2,2,3,3,4,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2800
     * @tc.name testArrayFill2028
     * @tc.desc Verify int overload works with nullable values on a center slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | null> = [1, 2, 3, 4];
      arr.fill(null, 1 as int, 3 as int);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertNull();
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_2900
     * @tc.name testArrayFill2029
     * @tc.desc Verify int overload and every can validate the normalized result together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [5, 4, 3, 2, 1];
      arr.fill(6, 1 as int, 4 as int);
      const result = arr.every((item: number): boolean => item > 0);
      expect(result).assertTrue();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(6);
      expect(arr[3]).assertEqual(6);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_TWO_3000
     * @tc.name testArrayFill2030
     * @tc.desc Verify empty-string int fill is reflected clearly in joined output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['A', 'B', 'C', 'D'];
      arr.fill('', 1 as int, 3 as int);
      const joined = arr.join('#');
      expect(joined).assertEqual('A###D');
      expect(arr[0]).assertEqual('A');
      expect(arr[1]).assertEqual('');
      expect(arr[2]).assertEqual('');
      expect(arr[3]).assertEqual('D');
    });

  });
}
