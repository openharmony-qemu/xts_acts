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

class WithTwoItem009 {
  value: number = 0;
}

enum WithTwoColor074 {
  Red,
  Green,
  Blue
}

function compareWithTwoAscending(left: number, right: number): int {
  if (left < right) {
    return -1;
  }
  if (left > right) {
    return 1;
  }
  return 0;
}

function createLargeNumberArrayTwo(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function withAnyNumberArrayTwo(value: Any, index: int, replacement: number): string {
  const arr = value as Array<number>;
  return arr.with(index, replacement).toString();
}

export default function ArrayWith2Test(): void {
  describe('ArrayWith2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0100
     * @tc.name testArrayWithTwo001
     * @tc.desc Verify with returns a same-length copy for valid int index replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0200
     * @tc.name testArrayWithTwo002
     * @tc.desc Verify int index declarations can be used for valid replacement calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 100);
      expect(result.length).assertEqual(3);
      expect(result[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0300
     * @tc.name testArrayWithTwo003
     * @tc.desc Verify index length minus one replaces the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = arr.length - 1;
      const result = arr.with(index, 99);
      expect(result.toString()).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0400
     * @tc.name testArrayWithTwo004
     * @tc.desc Verify negative int indexes count from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const index: int = -2;
      const result = arr.with(index, 99);
      expect(result[3]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,3,99,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0500
     * @tc.name testArrayWithTwo005
     * @tc.desc Verify int indexes can be computed from array length values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const len: int = arr.length;
      const index: int = len - 2;
      const result = arr.with(index, 99);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0600
     * @tc.name testArrayWithTwo006
     * @tc.desc Verify int index zero remains valid in dedicated declarations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 0;
      const result = arr.with(index, 99);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0700
     * @tc.name testArrayWithTwo007
     * @tc.desc Verify positive int indexes replace the expected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 2;
      const result = arr.with(index, 99);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0800
     * @tc.name testArrayWithTwo008
     * @tc.desc Verify with replaces values in number arrays using int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 99);
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_0900
     * @tc.name testArrayWithTwo009
     * @tc.desc Verify with can replace the last string element through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue');
      const index: int = -1;
      const result = arr.with(index, 'cyan');
      expect(result.toString()).assertEqual('red,green,cyan');
      expect(arr.toString()).assertEqual('red,green,blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1000
     * @tc.name testArrayWithTwo010
     * @tc.desc Verify with can replace the boolean tail through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, false);
      const index: int = -1;
      const result = arr.with(index, true);
      expect(result.toString()).assertEqual('true,true,true');
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1100
     * @tc.name testArrayWithTwo011
     * @tc.desc Verify with replaces object references in object arrays using int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new WithTwoItem009();
      item1.value = 1;
      const item2 = new WithTwoItem009();
      item2.value = 2;
      const item3 = new WithTwoItem009();
      item3.value = 3;
      const newItem = new WithTwoItem009();
      newItem.value = 99;
      const arr = new Array<WithTwoItem009>(item1, item2, item3);
      const index: int = 1;
      const result = arr.with(index, newItem);
      expect(result[1].value).assertEqual(99);
      expect(result[1] === newItem).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1200
     * @tc.name testArrayWithTwo012
     * @tc.desc Verify with replaces values in int arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const index: int = 1;
      const value: int = 99;
      const result = arr.with(index, value);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1300
     * @tc.name testArrayWithTwo013
     * @tc.desc Verify with leaves original length and boundary elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      const result = arr.with(1, 99);
      expect(result.length).assertEqual(originalLength);
      expect(result[0]).assertEqual(originalFirst);
      expect(result[1]).assertEqual(99);
      expect(result[2]).assertEqual(originalLast);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1400
     * @tc.name testArrayWithTwo014
     * @tc.desc Verify index negative one replaces the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -1;
      const result = arr.with(index, 99);
      expect(result[2]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1500
     * @tc.name testArrayWithTwo015
     * @tc.desc Verify index negative two replaces the second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = -2;
      const result = arr.with(index, 99);
      expect(result[2]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1600
     * @tc.name testArrayWithTwo016
     * @tc.desc Verify index negative length replaces the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -3;
      const result = arr.with(index, 99);
      expect(result[0]).assertEqual(99);
      expect(result.toString()).assertEqual('99,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1700
     * @tc.name testArrayWithTwo017
     * @tc.desc Verify negative indexes smaller than negative length throw an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -10;
      try {
        arr.with(index, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1800
     * @tc.name testArrayWithTwo018
     * @tc.desc Verify int indexes are stricter declarations than generic number documentation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 99);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_1900
     * @tc.name testArrayWithTwo019
     * @tc.desc Verify int and number index variants produce the same observable result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<number>(1, 2, 3);
      const r1 = arr1.with(1, 99);
      const r2 = arr2.with(1, 99);
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2000
     * @tc.name testArrayWithTwo020
     * @tc.desc Verify int index overload handles negative indexes consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -1;
      const result = arr.with(index, 99);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2100
     * @tc.name testArrayWithTwo021
     * @tc.desc Verify with can safely replace a middle element without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(1, 2, 3, 4);
      const index: int = 2;
      const modified = original.with(index, 99);
      expect(modified.toString()).assertEqual('1,2,99,4');
      expect(original.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2200
     * @tc.name testArrayWithTwo022
     * @tc.desc Verify with can create a modified configuration copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config = new Array<string>('debug', 'info', 'warn');
      const index: int = 0;
      const newConfig = config.with(index, 'trace');
      expect(newConfig.toString()).assertEqual('trace,info,warn');
      expect(config.toString()).assertEqual('debug,info,warn');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2300
     * @tc.name testArrayWithTwo023
     * @tc.desc Verify with supports immutable state-style updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state = new Array<number>(1, 2, 3);
      const index: int = 1;
      const newValue: number = 99;
      const newState = state.with(index, newValue);
      expect(newState.toString()).assertEqual('1,99,3');
      expect(state.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2400
     * @tc.name testArrayWithTwo024
     * @tc.desc Verify with can replace an element in a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArrayTwo(10000);
      const index: int = 5000;
      const result = arr.with(index, 99999);
      expect(result[5000]).assertEqual(99999);
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2500
     * @tc.name testArrayWithTwo025
     * @tc.desc Verify with allocates a new array object for int index calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const original = arr;
      const index: int = 1;
      const result = arr.with(index, 99);
      expect(result !== original).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2600
     * @tc.name testArrayWithTwo026
     * @tc.desc Verify with preserves generic element typing in the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 99);
      expect(typeof result[1]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2700
     * @tc.name testArrayWithTwo027
     * @tc.desc Verify a typed value variable can be passed to with safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const value: number = 99;
      const index: int = 1;
      const result = arr.with(index, value);
      expect(typeof result[1]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2800
     * @tc.name testArrayWithTwo028
     * @tc.desc Verify with works with union element type arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'a', 3);
      const index: int = 1;
      const result1 = arr.with(index, 'x');
      const result2 = arr.with(0, 99);
      expect(result1.toString()).assertEqual('1,x,3');
      expect(result2.toString()).assertEqual('99,a,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_2900
     * @tc.name testArrayWithTwo029
     * @tc.desc Verify int index zero can replace the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 0;
      const result = arr.with(index, 99);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('99,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3000
     * @tc.name testArrayWithTwo030
     * @tc.desc Verify with can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 99).map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,198,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3100
     * @tc.name testArrayWithTwo031
     * @tc.desc Verify filtered arrays can be updated with int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const filtered = arr.filter((v: number): boolean => v > 1);
      const index: int = 1;
      const result = filtered.with(index, 99);
      expect(result.toString()).assertEqual('2,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3200
     * @tc.name testArrayWithTwo032
     * @tc.desc Verify sliced arrays can be updated with int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const sliced = arr.slice(0, 3);
      const index: int = 1;
      const result = sliced.with(index, 99);
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3300
     * @tc.name testArrayWithTwo033
     * @tc.desc Verify with participates in chained array method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const index: int = 0;
      const result = arr.filter((v: number): boolean => v > 1)
        .with(index, 99)
        .slice(0, 3);
      expect(result.toString()).assertEqual('99,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3400
     * @tc.name testArrayWithTwo034
     * @tc.desc Verify different replacement values are preserved with int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 0;
      const result1 = arr.with(index, 0);
      const result2 = arr.with(index, -1);
      const result3 = arr.with(index, Number.MAX_VALUE);
      expect(result1[0]).assertEqual(0);
      expect(result2[0]).assertEqual(-1);
      expect(result3[0]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3500
     * @tc.name testArrayWithTwo035
     * @tc.desc Verify with can update numeric configuration arrays using int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config = new Array<number>(100, 200, 300);
      const index: int = 1;
      const newConfig = config.with(index, 250);
      expect(newConfig.toString()).assertEqual('100,250,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3600
     * @tc.name testArrayWithTwo036
     * @tc.desc Verify with can correct one bad value in a data array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data = new Array<number>(1, 999, 3);
      const index: int = 1;
      const corrected = data.with(index, 2);
      expect(corrected.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3700
     * @tc.name testArrayWithTwo037
     * @tc.desc Verify int index length minus one can replace the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 2;
      const result = arr.with(index, 99);
      expect(result[2]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3800
     * @tc.name testArrayWithTwo038
     * @tc.desc Verify with replaces the element at an int index while preserving the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 99);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,99,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_3900
     * @tc.name testArrayWithTwo039
     * @tc.desc Verify with preserves multiple explicit undefined values when replacing a trailing slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[1] = 2;
      const result = arr.with(3, 9);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(9);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4000
     * @tc.name testArrayWithTwo040
     * @tc.desc Verify with can replace an explicit undefined value directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.with(1, 9);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,9,3');
      expect(result.lastIndexOf(undefined)).assertEqual(-1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4100
     * @tc.name testArrayWithTwo041
     * @tc.desc Verify with keeps untouched undefined values while replacing another index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const result = arr.with(0, 9);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4200
     * @tc.name testArrayWithTwo042
     * @tc.desc Verify with copies generated undefined arrays before writing the replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.with(2, 9);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(9);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4300
     * @tc.name testArrayWithTwo043
     * @tc.desc Verify explicit undefined values are preserved while another index is replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined);
      const result = arr.with(0, 9);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4400
     * @tc.name testArrayWithTwo044
     * @tc.desc Verify failed zero index replacement keeps an empty array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const index: int = 0;
      try {
        arr.with(index, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4500
     * @tc.name testArrayWithTwo045
     * @tc.desc Verify empty arrays reject negative index replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      try {
        arr.with(-1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4600
     * @tc.name testArrayWithTwo046
     * @tc.desc Verify index equal to length is out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.with(3, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4700
     * @tc.name testArrayWithTwo047
     * @tc.desc Verify very large positive indexes are out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.with(100, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4800
     * @tc.name testArrayWithTwo048
     * @tc.desc Verify negative index exactly equal to negative length reaches the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(-3, 9);
      expect(result.toString()).assertEqual('9,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_4900
     * @tc.name testArrayWithTwo049
     * @tc.desc Verify negative indexes smaller than negative length are out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.with(-4, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5000
     * @tc.name testArrayWithTwo050
     * @tc.desc Verify with can replace NaN with Infinity while preserving signed zero slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, 0, -0);
      const result = arr.with(0, Infinity);
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(-0);
      expect(Number.isNaN(arr[0])).assertTrue();
      expect(1.0 / arr[2]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5100
     * @tc.name testArrayWithTwo051
     * @tc.desc Verify with can place NaN into a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.with(1, NaN);
      expect(result[0]).assertEqual(1);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5200
     * @tc.name testArrayWithTwo052
     * @tc.desc Verify with can replace a value with explicit undefined in a union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2);
      const result = arr.with(0, undefined);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(2);
      expect(result.lastIndexOf(undefined)).assertEqual(0);
      expect(arr.lastIndexOf(undefined)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5300
     * @tc.name testArrayWithTwo053
     * @tc.desc Verify with can replace a value with explicit null in a union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, 2);
      const result = arr.with(0, null);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5400
     * @tc.name testArrayWithTwo054
     * @tc.desc Verify same string replacement returns a separate mutable copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('same');
      const result = arr.with(0, 'same');
      result[0] = 'changed';
      expect(arr[0]).assertEqual('same');
      expect(result[0]).assertEqual('changed');
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5500
     * @tc.name testArrayWithTwo055
     * @tc.desc Verify with preserves shallow object references outside the replaced slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new WithTwoItem009();
      item.value = 1;
      const arr = new Array<WithTwoItem009 | number>(item, 2);
      const result = arr.with(1, 9);
      expect(result[0] === item).assertTrue();
      expect(result[1]).assertEqual(9);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5600
     * @tc.name testArrayWithTwo056
     * @tc.desc Verify with can write a new object reference into the target slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new WithTwoItem009();
      item.value = 2;
      const arr = new Array<number | WithTwoItem009>(1, 2);
      const result = arr.with(0, item);
      expect(result[0] === item).assertTrue();
      expect(result[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5700
     * @tc.name testArrayWithTwo057
     * @tc.desc Verify mutating the returned array does not change the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 9);
      result[0] = 100;
      expect(result.toString()).assertEqual('100,9,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5800
     * @tc.name testArrayWithTwo058
     * @tc.desc Verify two with calls using the same input produce separate arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const first = arr.with(1, 9);
      const second = arr.with(1, 9);
      expect(first.toString()).assertEqual(second.toString());
      expect(first !== second).assertTrue();
      expect(first !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_5900
     * @tc.name testArrayWithTwo059
     * @tc.desc Verify with handles a larger generated undefined array and preserves source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(100, (_index) => undefined);
      arr[99] = 99;
      const result = arr.with(50, 50);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertUndefined();
      expect(result[50]).assertEqual(50);
      expect(result[99]).assertEqual(99);
      expect(result.lastIndexOf(undefined)).assertEqual(98);
      expect(arr.lastIndexOf(undefined)).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6000
     * @tc.name testArrayWithTwo060
     * @tc.desc Verify with can replace the middle value through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const index: int = -2;
      const result = arr.with(index, 21);
      expect(result.toString()).assertEqual('2,21,4');
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6100
     * @tc.name testArrayWithTwo061
     * @tc.desc Verify with can replace the head with a computed numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const index: int = 0;
      const result = arr.with(index, arr[0] + arr[2]);
      expect(result.toString()).assertEqual('40,20,30');
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6200
     * @tc.name testArrayWithTwo062
     * @tc.desc Verify with can replace the middle element with a value derived from neighbors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 0, 6);
      const index: int = 1;
      const result = arr.with(index, arr[index - 1] + arr[index + 1]);
      expect(result.toString()).assertEqual('4,10,6');
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6300
     * @tc.name testArrayWithTwo063
     * @tc.desc Verify with can replace the last element with the source length value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8);
      const index: int = arr.length - 1;
      const result = arr.with(index, arr.length);
      expect(result.toString()).assertEqual('5,6,7,4');
      expect(arr.toString()).assertEqual('5,6,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6400
     * @tc.name testArrayWithTwo064
     * @tc.desc Verify with can use negative length to replace the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6, 7);
      const index: int = -arr.length;
      const result = arr.with(index, 1);
      expect(result.toString()).assertEqual('1,5,6,7');
      expect(arr.toString()).assertEqual('4,5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6500
     * @tc.name testArrayWithTwo065
     * @tc.desc Verify with can replace a string middle element through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('start', 'middle', 'end');
      const index: int = -2;
      const result = arr.with(index, 'center');
      expect(result.join('|')).assertEqual('start|center|end');
      expect(arr[1]).assertEqual('middle');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6600
     * @tc.name testArrayWithTwo066
     * @tc.desc Verify with can replace the first boolean element and leave the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false);
      const index: int = 0;
      const result = arr.with(index, true);
      expect(result.toString()).assertEqual('true,true,false');
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6700
     * @tc.name testArrayWithTwo067
     * @tc.desc Verify with can replace the bigint tail through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n, 30n);
      const index: int = -1;
      const result = arr.with(index, 99n);
      expect(result.toString()).assertEqual('10,20,99');
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6800
     * @tc.name testArrayWithTwo068
     * @tc.desc Verify with preserves object references outside the replaced int position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new WithTwoItem009();
      const second = new WithTwoItem009();
      const arr = new Array<WithTwoItem009>(first, second);
      const index: int = 1;
      const result = arr.with(index, first);
      expect(result[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_6900
     * @tc.name testArrayWithTwo069
     * @tc.desc Verify with only changes one duplicate value at the requested int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2, 2);
      const index: int = 2;
      const result = arr.with(index, 5);
      expect(result.indexOf(5)).assertEqual(2);
      expect(result.toString()).assertEqual('2,2,5,2');
      expect(arr.toString()).assertEqual('2,2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7000
     * @tc.name testArrayWithTwo070
     * @tc.desc Verify with can write negative zero without changing other numeric signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, 0, 1);
      const index: int = 0;
      const result = arr.with(index, -0);
      expect(1.0 / result[0]).assertEqual(-Infinity);
      expect(result[1]).assertEqual(0);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7100
     * @tc.name testArrayWithTwo071
     * @tc.desc Verify with leaves the source unchanged after a positive int index range error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = arr.length;
      const before = arr.toString();
      try {
        arr.with(index, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7200
     * @tc.name testArrayWithTwo072
     * @tc.desc Verify with leaves the source unchanged after a negative int index range error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left', 'right');
      const index: int = -arr.length - 1;
      const before = arr.join('|');
      try {
        arr.with(index, 'miss');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.join('|')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7300
     * @tc.name testArrayWithTwo073
     * @tc.desc Verify with shallow-copies nested arrays outside the int replacement index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const head = new Array<number>(1);
      const tail = new Array<number>(2);
      const replacement = new Array<number>(9);
      const arr = new Array<Array<number>>(head, tail);
      const index: int = 1;
      const result = arr.with(index, replacement);
      head.pushOne(3);
      expect(result[0] === head).assertTrue();
      expect(result[1] === replacement).assertTrue();
      expect(arr[1] === tail).assertTrue();
      expect(result[0].toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7400
     * @tc.name testArrayWithTwo074
     * @tc.desc Verify with can update enum values through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<WithTwoColor074>(WithTwoColor074.Red, WithTwoColor074.Green);
      const index: int = -1;
      const result = arr.with(index, WithTwoColor074.Blue);
      expect(result[0]).assertEqual(WithTwoColor074.Red);
      expect(result[1]).assertEqual(WithTwoColor074.Blue);
      expect(arr[1]).assertEqual(WithTwoColor074.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7500
     * @tc.name testArrayWithTwo075
     * @tc.desc Verify with can replace null in a union array without dropping nullish slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const index: int = 1;
      const result = arr.with(index, 2);
      const nullResult = arr.with(0, null);
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr[1]).assertNull();
      expect(nullResult[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7600
     * @tc.name testArrayWithTwo076
     * @tc.desc Verify with can write undefined in a union array and materialize that slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined>('a', 'b', 'c');
      const index: int = 1;
      const result = arr.with(index, undefined);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual('c');
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7700
     * @tc.name testArrayWithTwo077
     * @tc.desc Verify negative int indexes are resolved against the length after splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 0, 8, 9);
      const index: int = -3;
      const result = arr.with(index, 7);
      expect(result.toString()).assertEqual('1,8,7,2,3');
      expect(arr.toString()).assertEqual('1,8,9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7800
     * @tc.name testArrayWithTwo078
     * @tc.desc Verify with on a slice copy keeps the original source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      const arr = source.slice(0, 3);
      const index: int = -1;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('1,2,8');
      expect(arr.toString()).assertEqual('1,2,3');
      expect(source.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_7900
     * @tc.name testArrayWithTwo079
     * @tc.desc Verify with on a filtered result keeps the filtered array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6).filter((value: number): boolean => value % 2 === 0);
      const index: int = -arr.length;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('8,4,6');
      expect(arr.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8000
     * @tc.name testArrayWithTwo080
     * @tc.desc Verify with on a concat result does not mutate either source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Array<number>(1, 2);
      const right = new Array<number>(3, 4);
      const arr = left.concat(right);
      const index: int = arr.length - 1;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('1,2,3,8');
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(left.toString()).assertEqual('1,2');
      expect(right.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8100
     * @tc.name testArrayWithTwo081
     * @tc.desc Verify with on a toReversed copy preserves the original source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.toReversed();
      const index: int = -arr.length;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('8,2,1');
      expect(arr.toString()).assertEqual('3,2,1');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8200
     * @tc.name testArrayWithTwo082
     * @tc.desc Verify with on a toSpliced copy can replace only the inserted value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      const arr = source.toSpliced(2, 0, 7);
      const index: int = 2;
      const result = arr.with(index, 9);
      expect(result.toString()).assertEqual('1,2,9,3,4');
      expect(arr.toString()).assertEqual('1,2,7,3,4');
      expect(source.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8300
     * @tc.name testArrayWithTwo083
     * @tc.desc Verify with on Array.from consumes Set insertion order before replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>(new Array<number>(2, 1, 2, 3));
      const arr = Array.from<number>(source);
      const index: int = 1;
      const result = arr.with(index, 8);
      expect(arr.toString()).assertEqual('2,1,3');
      expect(result.toString()).assertEqual('2,8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8400
     * @tc.name testArrayWithTwo084
     * @tc.desc Verify with after length reset rejects indexes from the old length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(4);
      const index: int = 2;
      try {
        arr.with(index, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const result = arr.with(0, 6);
      expect(result.toString()).assertEqual('6');
      expect(arr.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8500
     * @tc.name testArrayWithTwo085
     * @tc.desc Verify with preserves source and result lengths for negative int indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = -2;
      const result = arr.with(index, 8);
      expect(result.length).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(result[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8600
     * @tc.name testArrayWithTwo086
     * @tc.desc Verify with returns a new instance even when negative index writes the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -1;
      const result = arr.with(index, 3);
      expect(result !== arr).assertTrue();
      expect(result.toString()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8700
     * @tc.name testArrayWithTwo087
     * @tc.desc Verify mutating the with result after replacement still leaves the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.join('|');
      const index: int = 1;
      const result = arr.with(index, 8);
      result[2] = 9;
      expect(arr.join('|')).assertEqual(before);
      expect(result.join('|')).assertEqual('1|8|9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8800
     * @tc.name testArrayWithTwo088
     * @tc.desc Verify with can replace the only string element through negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('only');
      const index: int = -1;
      const result = arr.with(index, 'next');
      expect(result.toString()).assertEqual('next');
      expect(arr.toString()).assertEqual('only');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_8900
     * @tc.name testArrayWithTwo089
     * @tc.desc Verify with can replace the last element through negative one with a computed sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 9);
      const index: int = -1;
      const result = arr.with(index, arr[0] + arr[1]);
      expect(result.toString()).assertEqual('2,4,6');
      expect(arr.toString()).assertEqual('2,4,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9000
     * @tc.name testArrayWithTwo090
     * @tc.desc Verify with can be chained with join after a string replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const index: int = -2;
      const result = arr.with(index, 'x');
      expect(result.join('/')).assertEqual('a/x/c');
      expect(arr.join('/')).assertEqual('a/b/c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9100
     * @tc.name testArrayWithTwo091
     * @tc.desc Verify with can be chained with slice after replacing the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = 0;
      const result = arr.with(index, 8);
      expect(result.slice(0, 2).toString()).assertEqual('8,2');
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9200
     * @tc.name testArrayWithTwo092
     * @tc.desc Verify indexOf on the with result reflects the removed tail value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -1;
      const result = arr.with(index, 8);
      expect(result.indexOf(3)).assertEqual(-1);
      expect(arr.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9300
     * @tc.name testArrayWithTwo093
     * @tc.desc Verify with handles generated arrays through a negative int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 12; i++) {
        arr.pushOne(i);
      }
      const index: int = -2;
      const result = arr.with(index, 80);
      expect(result[10]).assertEqual(80);
      expect(arr[10]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9400
     * @tc.name testArrayWithTwo094
     * @tc.desc Verify with can replace a string tail with a multi-character value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C', 'D');
      const index: int = arr.length - 1;
      const result = arr.with(index, 'END');
      expect(result.join('-')).assertEqual('A-B-C-END');
      expect(arr.join('-')).assertEqual('A-B-C-D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9500
     * @tc.name testArrayWithTwo095
     * @tc.desc Verify with can replace the tail after concat and toReversed are combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4)).toReversed();
      const index: int = -1;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('4,3,2,8');
      expect(arr.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9600
     * @tc.name testArrayWithTwo096
     * @tc.desc Verify with can replace a computed middle index with a computed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const index: int = (arr.length - 1) / 2;
      const result = arr.with(index, arr[index] + arr[index + 1]);
      expect(result.toString()).assertEqual('10,20,70,40,50');
      expect(arr.toString()).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9700
     * @tc.name testArrayWithTwo097
     * @tc.desc Verify with supports consecutive chained calls with int index inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const firstIndex: int = 1;
      const secondIndex: int = 3;
      const result = arr.with(firstIndex, 20).with(secondIndex, 40);
      expect(result.toString()).assertEqual('1,20,3,40');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9800
     * @tc.name testArrayWithTwo098
     * @tc.desc Verify with works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(withAnyNumberArrayTwo(anyValue, -1, 9)).assertEqual('1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_TWO_9900
     * @tc.name testArrayWithTwo099
     * @tc.desc Verify with supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = anyArr.with(-2, 'tail');
      expect(result.toString()).assertEqual('1,tail,true');
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}
