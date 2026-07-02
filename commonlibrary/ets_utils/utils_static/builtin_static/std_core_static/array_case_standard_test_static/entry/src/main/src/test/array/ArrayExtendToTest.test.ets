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

class ExtendItem014 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

interface ExtendPoint015 {
  x: int;
  y: int;
}

export default function ArrayExtendToTest(): void {
  describe('ArrayExtendToTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0100
     * @tc.name testArrayExtendTo001
     * @tc.desc Verify extendTo requires both length and initial value to extend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      expect(arr.length).assertEqual(5);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0200
     * @tc.name testArrayExtendTo002
     * @tc.desc Verify extendTo can grow an array to a larger target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(10, 100);
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0300
     * @tc.name testArrayExtendTo003
     * @tc.desc Verify extendTo keeps the array unchanged at the current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const original = arr.toString();
      arr.extendTo(arr.length, 100);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0400
     * @tc.name testArrayExtendTo004
     * @tc.desc Verify extendTo can append exactly one new element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(3, 99);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0500
     * @tc.name testArrayExtendTo005
     * @tc.desc Verify extendTo supports large but practical expansions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(1000, 0);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0600
     * @tc.name testArrayExtendTo006
     * @tc.desc Verify extendTo does not shrink arrays when the target is smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.extendTo(2, 0);
      expect(arr.length).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0700
     * @tc.name testArrayExtendTo007
     * @tc.desc Verify extendTo grows the array when target length is ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const targetLength: int = 10;
      arr.extendTo(targetLength, 100);
      expect(arr.length).assertEqual(10);
      expect(arr[8]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0800
     * @tc.name testArrayExtendTo008
     * @tc.desc Verify hexadecimal length values are accepted as numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(0x0A, 100);
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_0900
     * @tc.name testArrayExtendTo009
     * @tc.desc Verify number arrays use the provided fill value for new positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 42);
      expect(arr[2]).assertEqual(42);
      expect(arr[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1000
     * @tc.name testArrayExtendTo010
     * @tc.desc Verify string arrays use the provided fill value for new positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      arr.extendTo(4, 'default');
      expect(arr[2]).assertEqual('default');
      expect(arr[3]).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1100
     * @tc.name testArrayExtendTo011
     * @tc.desc Verify boolean arrays use false as an explicit fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(1, true);
      arr.extendTo(3, false);
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1200
     * @tc.name testArrayExtendTo012
     * @tc.desc Verify special numeric values such as NaN and Infinity are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanArr = new Array<number>(1, 2);
      nanArr.extendTo(5, NaN);
      expect(Number.isNaN(nanArr[2])).assertTrue();
      expect(Number.isNaN(nanArr[4])).assertTrue();

      const infArr = new Array<number>(1, 2);
      infArr.extendTo(5, Infinity);
      expect(infArr[2]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1300
     * @tc.name testArrayExtendTo013
     * @tc.desc Verify null and undefined can fill union-typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullArr = new Array<int | null>(1, 2);
      nullArr.extendTo(5, null);
      expect(nullArr[2]).assertNull();
      expect(nullArr[4]).assertNull();

      const undefArr = new Array<int | undefined>(1, 2);
      undefArr.extendTo(5, undefined);
      expect(undefArr[2]).assertUndefined();
      expect(undefArr[4]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1400
     * @tc.name testArrayExtendTo014
     * @tc.desc Verify interface-typed arrays can be extended with default points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<ExtendPoint015>(1, { x: 1, y: 2 });
      arr.extendTo(3, { x: 0, y: 0 });
      expect(arr[1].x).assertEqual(0);
      expect(arr[2].y).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1500
     * @tc.name testArrayExtendTo015
     * @tc.desc Verify extendTo returns void and mutates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const result = arr.extendTo(5, 0);
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1600
     * @tc.name testArrayExtendTo016
     * @tc.desc Verify original elements remain unchanged after extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.extendTo(6, 99);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1700
     * @tc.name testArrayExtendTo017
     * @tc.desc Verify all newly added positions are filled with the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 100);
      expect(arr[2]).assertEqual(100);
      expect(arr[3]).assertEqual(100);
      expect(arr[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1800
     * @tc.name testArrayExtendTo018
     * @tc.desc Verify multiple extendTo calls can use different fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [1];
      arr.extendTo(3, 10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(10);

      arr.extendTo(5, 20);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(20);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_1900
     * @tc.name testArrayExtendTo019
     * @tc.desc Verify extended elements can be modified after allocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 100);
      arr[2] = 200;
      arr[3] = 300;
      arr[4] = 400;
      expect(arr[2]).assertEqual(200);
      expect(arr[3]).assertEqual(300);
      expect(arr[4]).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2000
     * @tc.name testArrayExtendTo020
     * @tc.desc Verify extendTo works with push and pop after resizing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      arr.pushOne(99);
      expect(arr.length).assertEqual(6);
      expect(arr[5]).assertEqual(99);
      const val = arr.pop();
      expect(val).assertEqual(99);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2100
     * @tc.name testArrayExtendTo021
     * @tc.desc Verify union-typed arrays can be extended with string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two');
      arr.extendTo(5, 'default');
      expect(arr[2]).assertEqual('default');
      expect(arr[4]).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2200
     * @tc.name testArrayExtendTo022
     * @tc.desc Verify arrays of arrays can be extended with a shared inner array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerArr = new Array<int>();
      const arr = new Array<Array<int>>(
        new Array<int>(1, 2),
        new Array<int>(3, 4)
      );
      arr.extendTo(4, innerArr);
      expect(arr.length).assertEqual(4);
      expect(arr[2].length).assertEqual(0);
      expect(arr[3].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2300
     * @tc.name testArrayExtendTo023
     * @tc.desc Verify empty arrays can be extended from length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.extendTo(5, 100);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(100);
      expect(arr[4]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2400
     * @tc.name testArrayExtendTo024
     * @tc.desc Verify extendTo can reserve additional capacity conditionally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      if (arr.length < 10) {
        arr.extendTo(10, -1);
      }
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2500
     * @tc.name testArrayExtendTo025
     * @tc.desc Verify extendTo can reserve space for later assignments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.extendTo(10, 0);
      arr[3] = 100;
      arr[4] = 200;
      arr[5] = 300;
      expect(arr.length).assertEqual(10);
      expect(arr[3]).assertEqual(100);
      expect(arr[6]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2600
     * @tc.name testArrayExtendTo026
     * @tc.desc Verify extendTo can be combined with shrinkTo safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(10, 0);
      expect(arr.length).assertEqual(10);
      arr.shrinkTo(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2700
     * @tc.name testArrayExtendTo027
     * @tc.desc Verify repeated small extensions accumulate the target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      for (let i = 0; i < 100; i++) {
        arr.extendTo(arr.length + 1, i);
      }
      expect(arr.length).assertEqual(101);
      expect(arr[100]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2800
     * @tc.name testArrayExtendTo028
     * @tc.desc Verify reference initial values are shared across extended positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ExtendItem014(100);
      const arr = Array.create<ExtendItem014>(1, new ExtendItem014(1));
      arr.extendTo(4, item);
      expect(arr[1] == arr[2]).assertTrue();
      expect(arr[2] == arr[3]).assertTrue();
      item.value = 200;
      expect(arr[1].value).assertEqual(200);
      expect(arr[2].value).assertEqual(200);
      expect(arr[3].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_2900
     * @tc.name testArrayExtendTo029
     * @tc.desc Verify extended elements are immediately readable after resizing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 100);
      const sum = arr[2] + arr[3] + arr[4];
      expect(sum).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3000
     * @tc.name testArrayExtendTo030
     * @tc.desc Verify extendTo must be used before later chained operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 100);
      arr.pushOne(200);
      expect(arr.length).assertEqual(6);
      expect(arr[5]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3100
     * @tc.name testArrayExtendTo031
     * @tc.desc Verify the documented negative length case is treated as an invalid extendTo scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      try {
        arr.extendTo(-1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3200
     * @tc.name testArrayExtendTo032
     * @tc.desc Verify zero can fill each newly extended numeric position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, 0);
      expect(arr[2]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3300
     * @tc.name testArrayExtendTo033
     * @tc.desc Verify empty strings can fill each newly extended string position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'x');
      arr.extendTo(3, '');
      expect(arr[1]).assertEqual('');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3400
     * @tc.name testArrayExtendTo034
     * @tc.desc Verify negative numeric fill values are copied into all new positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(5, -100);
      expect(arr[2]).assertEqual(-100);
      expect(arr[4]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3500
     * @tc.name testArrayExtendTo035
     * @tc.desc Verify null can fill each newly extended nullable position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, 2);
      arr.extendTo(5, null);
      expect(arr[2]).assertNull();
      expect(arr[4]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3600
     * @tc.name testArrayExtendTo036
     * @tc.desc Verify undefined can fill each newly extended optional position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2);
      arr.extendTo(5, undefined);
      expect(arr[2]).assertUndefined();
      expect(arr[4]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3700
     * @tc.name testArrayExtendTo037
     * @tc.desc Verify NaN can fill each newly extended numeric position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.extendTo(5, NaN);
      expect(Number.isNaN(arr[2])).assertTrue();
      expect(Number.isNaN(arr[4])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3800
     * @tc.name testArrayExtendTo038
     * @tc.desc Verify Infinity can fill each newly extended numeric position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.extendTo(5, Infinity);
      expect(arr[2]).assertEqual(Infinity);
      expect(arr[4]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_3900
     * @tc.name testArrayExtendTo039
     * @tc.desc Verify script-like strings can be copied into newly extended string positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const payload = '<script>alert(1)</script>';
      const arr = Array.create<string>(1, 'safe');
      arr.extendTo(3, payload);
      expect(arr[1]).assertEqual(payload);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4000
     * @tc.name testArrayExtendTo040
     * @tc.desc Verify Unicode strings can fill newly extended string positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'a');
      arr.extendTo(3, '\u4F60\u597D\u4E16\u754C');
      expect(arr[1]).assertEqual('\u4F60\u597D\u4E16\u754C');
      expect(arr[2]).assertEqual('\u4F60\u597D\u4E16\u754C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4100
     * @tc.name testArrayExtendTo041
     * @tc.desc Verify zero-width-space strings can fill newly extended string positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'visible');
      arr.extendTo(3, '\u200B');
      expect(arr[1]).assertEqual('\u200B');
      expect(arr[2]).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4200
     * @tc.name testArrayExtendTo042
     * @tc.desc Verify repeated extendTo calls preserve earlier fill values between growth steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      arr.extendTo(3, 10);
      arr.extendTo(5, 20);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4300
     * @tc.name testArrayExtendTo043
     * @tc.desc Verify string arrays can be extended with string default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      arr.extendTo(4, 'default');
      expect(arr[3]).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4400
     * @tc.name testArrayExtendTo044
     * @tc.desc Verify custom class arrays can be extended with object default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<ExtendItem014>(1, new ExtendItem014(1));
      arr.extendTo(3, new ExtendItem014(99));
      expect(arr[1].value).assertEqual(99);
      expect(arr[2].value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4500
     * @tc.name testArrayExtendTo045
     * @tc.desc Verify interface arrays can be extended with object default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<ExtendPoint015>(1, { x: 1, y: 1 });
      arr.extendTo(3, { x: 0, y: 0 });
      expect(arr[1].x).assertEqual(0);
      expect(arr[2].y).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4600
     * @tc.name testArrayExtendTo046
     * @tc.desc Verify extendTo can reserve minus-one markers for uninitialized positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(10, -1);
      arr[3] = 100;
      expect(arr[2]).assertEqual(-1);
      expect(arr[4]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4700
     * @tc.name testArrayExtendTo047
     * @tc.desc Verify extendTo grows arrays while shrinkTo shortens arrays in the documented comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      arr1.extendTo(5, 100);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<int>(1, 2, 3, 4, 5);
      arr2.shrinkTo(3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4800
     * @tc.name testArrayExtendTo048
     * @tc.desc Verify extendTo can handle the documented one-hundred-thousand element expansion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(100000, 0);
      expect(arr.length).assertEqual(100000);
      expect(arr[99999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_4900
     * @tc.name testArrayExtendTo049
     * @tc.desc Verify multiple extendTo calls preserve the original prefix values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(7, 8, 9);
      arr.extendTo(5, 10);
      arr.extendTo(8, 20);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(10);
      expect(arr[6]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5000
     * @tc.name testArrayExtendTo050
     * @tc.desc Verify the provided fill object does not replace existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const head = new ExtendItem014(1);
      const fill = new ExtendItem014(88);
      const arr = Array.create<ExtendItem014>(1, head);
      arr.extendTo(4, fill);
      fill.value = 99;
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(99);
      expect(arr[2].value).assertEqual(99);
      expect(arr[3].value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5100
     * @tc.name testArrayExtendTo051
     * @tc.desc Verify newly extended numeric positions participate in arithmetic immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [5, 10];
      arr.extendTo(6, 3);
      let sum = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
      }
      expect(sum).assertEqual(27);
      expect(arr[5]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5200
     * @tc.name testArrayExtendTo052
     * @tc.desc Verify newly extended string positions participate in join output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B');
      arr.extendTo(5, 'X');
      const joined = arr.join('|');
      expect(joined).assertEqual('A|B|X|X|X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5300
     * @tc.name testArrayExtendTo053
     * @tc.desc Verify extended boolean positions can be counted predictably
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      arr.extendTo(6, false);
      let falseCount = 0;
      for (const value of arr) {
        if (!value) {
          falseCount++;
        }
      }
      expect(falseCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5400
     * @tc.name testArrayExtendTo054
     * @tc.desc Verify extended arrays can be validated with every after selective overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      arr.extendTo(6, 0);
      arr[2] = 3;
      arr[3] = 4;
      const result = arr.every((v: int): boolean => v >= 0);
      expect(result).assertTrue();
      expect(arr[4]).assertEqual(0);
      expect(arr[5]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5500
     * @tc.name testArrayExtendTo055
     * @tc.desc Verify staged fills keep earlier values after a later extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | string>(1, 1);
      arr.extendTo(3, 'A');
      arr.extendTo(5, 'B');
      expect(arr[1]).assertEqual('A');
      expect(arr[2]).assertEqual('A');
      expect(arr[3]).assertEqual('B');
      expect(arr[4]).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5600
     * @tc.name testArrayExtendTo056
     * @tc.desc Verify a larger extension keeps the same fill value at middle and tail positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.extendTo(256, -7);
      expect(arr.length).assertEqual(256);
      expect(arr[128]).assertEqual(-7);
      expect(arr[255]).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5700
     * @tc.name testArrayExtendTo057
     * @tc.desc Verify empty object arrays can be extended from zero with interface values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ExtendPoint015>();
      arr.extendTo(2, { x: 7, y: 8 });
      expect(arr.length).assertEqual(2);
      expect(arr[0].x).assertEqual(7);
      expect(arr[1].y).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5800
     * @tc.name testArrayExtendTo058
     * @tc.desc Verify arrays can be extended again after a shrink cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.extendTo(7, 5);
      arr.shrinkTo(4);
      arr.extendTo(6, 9);
      expect(arr.length).assertEqual(6);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(9);
      expect(arr[5]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_5900
     * @tc.name testArrayExtendTo059
     * @tc.desc Verify extending to the current length is a no-op even with object fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ExtendItem014>(new ExtendItem014(3), new ExtendItem014(4));
      const fill = new ExtendItem014(100);
      arr.extendTo(2, fill);
      expect(arr.length).assertEqual(2);
      expect(arr[0].value).assertEqual(3);
      expect(arr[1].value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6000
     * @tc.name testArrayExtendTo060
     * @tc.desc Verify smaller target lengths do not alter object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ExtendItem014(11);
      const second = new ExtendItem014(22);
      const arr = new Array<ExtendItem014>(first, second);
      arr.extendTo(1, new ExtendItem014(99));
      expect(arr.length).assertEqual(2);
      expect(arr[0] == first).assertTrue();
      expect(arr[1] == second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EXTENDTO_6100
     * @tc.name testArrayExtendTo061
     * @tc.desc Verify shared inner-array fill values reflect later mutations consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayExtendTo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Array<int>();
      const arr = Array.create<Array<int>>(1, Array.create<int>(1, 1));
      arr.extendTo(3, shared);
      shared.pushOne(42);
      expect(arr[1].length).assertEqual(1);
      expect(arr[2].length).assertEqual(1);
      expect(arr[1][0]).assertEqual(42);
      expect(arr[2][0]).assertEqual(42);
    });
  });
}
