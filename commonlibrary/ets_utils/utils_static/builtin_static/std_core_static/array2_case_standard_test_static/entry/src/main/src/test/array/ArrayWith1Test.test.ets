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

class WithItem022 {
  value: number = 0;
}

class WithBox058 {
  value: number = 0;
}

enum WithColor077 {
  Red,
  Green,
  Blue
}

function compareNumberAscending(left: number, right: number): int {
  if (left < right) {
    return -1;
  }
  if (left > right) {
    return 1;
  }
  return 0;
}

function createLargeNumberArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

export default function ArrayWith1Test(): void {
  describe('ArrayWith1Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0010
     * @tc.name testArrayWithOne001
     * @tc.desc Verify with uses two required parameters to replace the target element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = 1;
      const value: number = 99;
      const result = arr.with(index, value);
      expect(result.toString()).assertEqual('1,99,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0020
     * @tc.name testArrayWithOne002
     * @tc.desc Verify the index parameter accepts number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 100);
      expect(result[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0030
     * @tc.name testArrayWithOne003
     * @tc.desc Verify the value parameter matches the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const value: number = 50;
      const result = arr.with(0, value);
      expect(result[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0040
     * @tc.name testArrayWithOne004
     * @tc.desc Verify with returns a same-length copy when replacing a middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,99,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0050
     * @tc.name testArrayWithOne005
     * @tc.desc Verify replacing an element with the same value still returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.with(0, 1);
      expect(result.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2');
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0060
     * @tc.name testArrayWithOne006
     * @tc.desc Verify replacing a number element preserves the number runtime type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const value: number = 99;
      const result = arr.with(1, value);
      expect(typeof result[1]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0070
     * @tc.name testArrayWithOne007
     * @tc.desc Verify with supports different generic array element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const result1 = arr1.with(1, 99);
      expect(result1.toString()).assertEqual('1,99,3');

      const arr2 = new Array<string>('a', 'b', 'c');
      const result2 = arr2.with(1, 'x');
      expect(result2.toString()).assertEqual('a,x,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0080
     * @tc.name testArrayWithOne008
     * @tc.desc Verify with returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99);
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0090
     * @tc.name testArrayWithOne009
     * @tc.desc Verify with does not modify the original array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalStr = arr.toString();
      arr.with(1, 99);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0100
     * @tc.name testArrayWithOne010
     * @tc.desc Verify with returns a copy whose target index is replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.with(2, 99);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(99);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0110
     * @tc.name testArrayWithOne011
     * @tc.desc Verify the return value can be used as Array number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: Array<number> = arr.with(1, 99);
      expect(typeof result[1]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0120
     * @tc.name testArrayWithOne012
     * @tc.desc Verify index zero replaces the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(0, 99);
      expect(result.toString()).assertEqual('99,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0130
     * @tc.name testArrayWithOne013
     * @tc.desc Verify index length minus one replaces the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(2, 99);
      expect(result.toString()).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0140
     * @tc.name testArrayWithOne014
     * @tc.desc Verify negative indexes count from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.with(-2, 99);
      expect(result[3]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,3,99,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0150
     * @tc.name testArrayWithOne015
     * @tc.desc Verify too-small negative indexes throw an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.with(-10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0160
     * @tc.name testArrayWithOne016
     * @tc.desc Verify too-large positive indexes throw an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.with(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0170
     * @tc.name testArrayWithOne017
     * @tc.desc Verify with works with a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(42);
      const result = arr.with(0, 99);
      expect(result[0]).assertEqual(99);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0180
     * @tc.name testArrayWithOne018
     * @tc.desc Verify with works for both positions of a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result1 = arr.with(0, 99);
      const result2 = arr.with(1, 99);
      expect(result1.toString()).assertEqual('99,2');
      expect(result2.toString()).assertEqual('1,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0190
     * @tc.name testArrayWithOne019
     * @tc.desc Verify with replaces values in number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99);
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0200
     * @tc.name testArrayWithOne020
     * @tc.desc Verify with replaces values in string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.with(1, 'x');
      expect(result.toString()).assertEqual('a,x,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0210
     * @tc.name testArrayWithOne021
     * @tc.desc Verify with replaces values in boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.with(1, true);
      expect(result.toString()).assertEqual('true,true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0220
     * @tc.name testArrayWithOne022
     * @tc.desc Verify with replaces object references in object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new WithItem022();
      item1.value = 1;
      const item2 = new WithItem022();
      item2.value = 2;
      const item3 = new WithItem022();
      item3.value = 3;
      const newItem = new WithItem022();
      newItem.value = 99;
      const arr = new Array<WithItem022>(item1, item2, item3);
      const result = arr.with(1, newItem);
      expect(result[1].value).assertEqual(99);
      expect(result[1] === newItem).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0230
     * @tc.name testArrayWithOne023
     * @tc.desc Verify with replaces values in bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const result = arr.with(1, 99n);
      expect(result[1]).assertEqual(99n);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0240
     * @tc.name testArrayWithOne024
     * @tc.desc Verify the returned array is independent from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99);
      result[0] = 888;
      expect(arr[0]).assertEqual(1);
      expect(result[0]).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0250
     * @tc.name testArrayWithOne025
     * @tc.desc Verify repeated calls return distinct arrays with the same contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.with(1, 99);
      const result2 = arr.with(1, 99);
      expect(result1 !== result2).assertTrue();
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0260
     * @tc.name testArrayWithOne026
     * @tc.desc Verify the source array remains usable after with returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const modified = arr.with(1, 99);
      arr.push(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(modified.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0270
     * @tc.name testArrayWithOne027
     * @tc.desc Verify with can create a modified configuration copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config = new Array<string>('debug', 'info', 'warn');
      const newConfig = config.with(0, 'trace');
      expect(newConfig.toString()).assertEqual('trace,info,warn');
      expect(config.toString()).assertEqual('debug,info,warn');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0280
     * @tc.name testArrayWithOne028
     * @tc.desc Verify chained with calls support multiple immutable updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.with(0, 99).with(2, 88).with(4, 77);
      expect(result.toString()).assertEqual('99,2,88,4,77');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0290
     * @tc.name testArrayWithOne029
     * @tc.desc Verify with supports immutable state-style updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state = new Array<number>(1, 2, 3);
      const newState = state.with(1, state[1] * 2);
      expect(newState.toString()).assertEqual('1,4,3');
      expect(state.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0300
     * @tc.name testArrayWithOne030
     * @tc.desc Verify index negative one replaces the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(-1, 99);
      expect(result[2]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0310
     * @tc.name testArrayWithOne031
     * @tc.desc Verify index negative two replaces the second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.with(-2, 99);
      expect(result[2]).assertEqual(99);
      expect(result.toString()).assertEqual('1,2,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0320
     * @tc.name testArrayWithOne032
     * @tc.desc Verify index negative length replaces the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(-3, 99);
      expect(result[0]).assertEqual(99);
      expect(result.toString()).assertEqual('99,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0330
     * @tc.name testArrayWithOne033
     * @tc.desc Verify negative indexes smaller than negative length throw an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0340
     * @tc.name testArrayWithOne034
     * @tc.desc Verify with and direct assignment differ in mutation behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<number>(1, 2, 3);
      const result1 = arr1.with(1, 99);
      arr2[1] = 99;
      expect(arr1.toString()).assertEqual('1,2,3');
      expect(result1.toString()).assertEqual('1,99,3');
      expect(arr2.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0350
     * @tc.name testArrayWithOne035
     * @tc.desc Verify usage style can be chosen based on whether mutation is desired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const modified1 = arr1.with(1, 99);
      const arr2 = new Array<number>(1, 2, 3);
      arr2[1] = 99;
      expect(arr1.toString()).assertEqual('1,2,3');
      expect(modified1.toString()).assertEqual('1,99,3');
      expect(arr2.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0360
     * @tc.name testArrayWithOne036
     * @tc.desc Verify with can replace an element in a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const result = arr.with(5000, 99999);
      expect(result[5000]).assertEqual(99999);
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0370
     * @tc.name testArrayWithOne037
     * @tc.desc Verify with allocates a new array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const original = arr;
      const result = arr.with(1, 99);
      expect(result !== original).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0380
     * @tc.name testArrayWithOne038
     * @tc.desc Verify with preserves generic element typing in the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99);
      expect(typeof result[1]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0390
     * @tc.name testArrayWithOne039
     * @tc.desc Verify with can replace the head with a new object in a union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new WithItem022();
      item.value = 2;
      const arr = new Array<number | WithItem022>(1, 2);
      const result = arr.with(0, item);
      expect(result[0] === item).assertTrue();
      expect(result[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0400
     * @tc.name testArrayWithOne040
     * @tc.desc Verify with works with union element type arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'a', 3);
      const result1 = arr.with(1, 'x');
      const result2 = arr.with(0, 99);
      expect(result1.toString()).assertEqual('1,x,3');
      expect(result2.toString()).assertEqual('99,a,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0410
     * @tc.name testArrayWithOne041
     * @tc.desc Verify with can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 99).map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,198,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0420
     * @tc.name testArrayWithOne042
     * @tc.desc Verify filtered arrays can be updated with with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const filtered = arr.filter((v: number): boolean => v > 1);
      const result = filtered.with(1, 99);
      expect(result.toString()).assertEqual('2,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0430
     * @tc.name testArrayWithOne043
     * @tc.desc Verify sliced arrays can be updated with with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const sliced = arr.slice(0, 3);
      const result = sliced.with(1, 99);
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0440
     * @tc.name testArrayWithOne044
     * @tc.desc Verify with participates in chained array method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v > 1)
        .with(0, 99)
        .slice(0, 3);
      expect(result.toString()).assertEqual('99,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0450
     * @tc.name testArrayWithOne045
     * @tc.desc Verify multiple valid index positions produce the expected replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.with(0, 99).toString()).assertEqual('99,2,3,4,5');
      expect(arr.with(1, 99).toString()).assertEqual('1,99,3,4,5');
      expect(arr.with(2, 99).toString()).assertEqual('1,2,99,4,5');
      expect(arr.with(3, 99).toString()).assertEqual('1,2,3,99,5');
      expect(arr.with(4, 99).toString()).assertEqual('1,2,3,4,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0460
     * @tc.name testArrayWithOne046
     * @tc.desc Verify different numeric replacement values are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr.with(0, 0)[0]).assertEqual(0);
      expect(arr.with(0, -1)[0]).assertEqual(-1);
      expect(arr.with(0, Number.MAX_VALUE)[0]).assertEqual(Number.MAX_VALUE);
      expect(arr.with(0, Number.MIN_VALUE)[0]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0470
     * @tc.name testArrayWithOne047
     * @tc.desc Verify with can replace a value with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.with(1, 0);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0480
     * @tc.name testArrayWithOne048
     * @tc.desc Verify with can replace values with null in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, 2, 3);
      const result = arr.with(1, null);
      expect(result[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0490
     * @tc.name testArrayWithOne049
     * @tc.desc Verify with can replace values with undefined in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2, 3);
      const result = arr.with(1, undefined);
      expect(result[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0500
     * @tc.name testArrayWithOne050
     * @tc.desc Verify with can replace string values with an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.with(1, '');
      expect(result[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0510
     * @tc.name testArrayWithOne051
     * @tc.desc Verify with can update numeric configuration arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config = new Array<number>(100, 200, 300);
      const newConfig = config.with(1, 250);
      expect(newConfig.toString()).assertEqual('100,250,300');
      expect(config.toString()).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0520
     * @tc.name testArrayWithOne052
     * @tc.desc Verify with can correct one bad value in a data array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data = new Array<number>(1, 999, 3);
      const corrected = data.with(1, 2);
      expect(corrected.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0530
     * @tc.name testArrayWithOne053
     * @tc.desc Verify with can update state using external index and value variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const state = new Array<number>(1, 2, 3);
      const indexToUpdate: int = 1;
      const newValue: number = 99;
      const newState = state.with(indexToUpdate, newValue);
      expect(newState.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0540
     * @tc.name testArrayWithOne054
     * @tc.desc Verify chained with calls support batch-style immutable updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.with(0, 10).with(2, 30).with(4, 50);
      expect(result.toString()).assertEqual('10,2,30,4,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0550
     * @tc.name testArrayWithOne055
     * @tc.desc Verify empty arrays reject zero index replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      try {
        arr.with(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0560
     * @tc.name testArrayWithOne056
     * @tc.desc Verify with leaves the source unchanged when a positive index is out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const before = arr.toString();
      try {
        arr.with(arr.length, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual(before);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0570
     * @tc.name testArrayWithOne057
     * @tc.desc Verify with leaves the source unchanged when a negative index is out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('head', 'tail');
      const before = arr.join('|');
      try {
        arr.with(-arr.length - 1, 'miss');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.join('|')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0580
     * @tc.name testArrayWithOne058
     * @tc.desc Verify with shallow-copies nested array references outside the replaced slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Array<number>(1);
      const second = new Array<number>(2);
      const replacement = new Array<number>(9);
      const arr = new Array<Array<number>>(first, second);
      const result = arr.with(1, replacement);
      first.pushOne(3);
      expect(result !== arr).assertTrue();
      expect(result[0] === first).assertTrue();
      expect(result[1] === replacement).assertTrue();
      expect(arr[1] === second).assertTrue();
      expect(result[0].toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0590
     * @tc.name testArrayWithOne059
     * @tc.desc Verify with supports union arrays containing null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const result = arr.with(1, 2);
      const nullResult = arr.with(0, null);
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr[1]).assertNull();
      expect(nullResult[0]).assertNull();
      expect(nullResult[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0600
     * @tc.name testArrayWithOne060
     * @tc.desc Verify with supports union arrays containing undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | undefined>('a', undefined, 'c');
      const result = arr.with(2, undefined);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0610
     * @tc.name testArrayWithOne061
     * @tc.desc Verify with copies explicit undefined values when replacing another index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.with(0, 9);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0620
     * @tc.name testArrayWithOne062
     * @tc.desc Verify negative indexes are resolved against the current length after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      const result = arr.with(-1, 99);
      expect(result.toString()).assertEqual('1,99');
      expect(arr.toString()).assertEqual('1,2');
      try {
        arr.with(-3, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0630
     * @tc.name testArrayWithOne063
     * @tc.desc Verify with can replace the first element using a number index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 0;
      const result = arr.with(index, 99);
      expect(result.toString()).assertEqual('99,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0640
     * @tc.name testArrayWithOne064
     * @tc.desc Verify with can replace the middle element using a number index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 88);
      expect(result.toString()).assertEqual('1,88,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0650
     * @tc.name testArrayWithOne065
     * @tc.desc Verify with can replace the last element using a number index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 2;
      const result = arr.with(index, 77);
      expect(result.toString()).assertEqual('1,2,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0660
     * @tc.name testArrayWithOne066
     * @tc.desc Verify with can use a negative number index from the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = -1;
      const result = arr.with(index, 99);
      expect(result.toString()).assertEqual('1,2,3,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0670
     * @tc.name testArrayWithOne067
     * @tc.desc Verify with supports string arrays with a number index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const index: int = 1;
      const result = arr.with(index, 'x');
      expect(result.toString()).assertEqual('a,x,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0680
     * @tc.name testArrayWithOne068
     * @tc.desc Verify with supports boolean arrays with a number index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const index: int = 1;
      const result = arr.with(index, true);
      expect(result.toString()).assertEqual('true,true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0690
     * @tc.name testArrayWithOne069
     * @tc.desc Verify with supports bigint arrays with an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const index: int = 1;
      const result = arr.with(index, 9n);
      expect(result.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0700
     * @tc.name testArrayWithOne070
     * @tc.desc Verify with preserves object references outside the replaced int position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new WithItem022();
      const second = new WithItem022();
      const arr = new Array<WithItem022>(first, second);
      const index: int = 1;
      const result = arr.with(index, first);
      expect(result[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0710
     * @tc.name testArrayWithOne071
     * @tc.desc Verify with preserves duplicate prefix values with an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const index: int = 1;
      const result = arr.with(index, 5);
      expect(result.toString()).assertEqual('2,5,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0720
     * @tc.name testArrayWithOne072
     * @tc.desc Verify with supports negative and zero values with an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3);
      const index: int = 1;
      const result = arr.with(index, -9);
      expect(result.toString()).assertEqual('-3,-9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0730
     * @tc.name testArrayWithOne073
     * @tc.desc Verify with replaces NaN while preserving Infinity and negative zero in the copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, NaN, -0);
      const result = arr.with(1, -Infinity);
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(1.0 / result[2]).assertEqual(-Infinity);
      expect(Number.isNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0740
     * @tc.name testArrayWithOne074
     * @tc.desc Verify with can update one char element without changing neighboring chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'B', c'C');
      const result = arr.with(1, c'Z');
      expect(result[0]).assertEqual(c'A');
      expect(result[1]).assertEqual(c'Z');
      expect(result[2]).assertEqual(c'C');
      expect(arr[1]).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0750
     * @tc.name testArrayWithOne075
     * @tc.desc Verify with can update an enum element while preserving enum ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<WithColor077>(WithColor077.Red, WithColor077.Green, WithColor077.Blue);
      const result = arr.with(1, WithColor077.Blue);
      expect(result[0]).assertEqual(WithColor077.Red);
      expect(result[1]).assertEqual(WithColor077.Blue);
      expect(result[2]).assertEqual(WithColor077.Blue);
      expect(arr[1]).assertEqual(WithColor077.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0760
     * @tc.name testArrayWithOne076
     * @tc.desc Verify with computes a negative index from the length visible at call time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pushOne(4);
      const index: int = -arr.length;
      const result = arr.with(index, 9);
      expect(result.toString()).assertEqual('9,2,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0770
     * @tc.name testArrayWithOne077
     * @tc.desc Verify with uses the shortened length after pop for negative index replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const removed = arr.pop();
      const result = arr.with(-1, 8);
      expect(removed).assertEqual(4);
      expect(result.toString()).assertEqual('1,2,8');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0780
     * @tc.name testArrayWithOne078
     * @tc.desc Verify with uses the shifted current length after unshift for negative indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.with(-2, 8);
      expect(result.toString()).assertEqual('1,2,8,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0790
     * @tc.name testArrayWithOne079
     * @tc.desc Verify with shallow-copies object references that are not replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const kept = new WithBox058();
      kept.value = 1;
      const replaced = new WithBox058();
      replaced.value = 2;
      const next = new WithBox058();
      next.value = 9;
      const arr = new Array<WithBox058>(kept, replaced);
      const result = arr.with(1, next);
      kept.value = 7;
      expect(result[0] === kept).assertTrue();
      expect(result[0].value).assertEqual(7);
      expect(result[1] === next).assertTrue();
      expect(arr[1] === replaced).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0800
     * @tc.name testArrayWithOne080
     * @tc.desc Verify with handles a negative index after shrinkTo truncates the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      const index: int = -1;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('1,2,8');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0810
     * @tc.name testArrayWithOne081
     * @tc.desc Verify with on a slice copy does not mutate the original source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      const sliced = source.slice(1, 4);
      const result = sliced.with(0, 9);
      expect(result.toString()).assertEqual('9,3,4');
      expect(sliced.toString()).assertEqual('2,3,4');
      expect(source.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0820
     * @tc.name testArrayWithOne082
     * @tc.desc Verify with on a filtered copy keeps the filtered source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const filtered = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value % 2 === 1);
      const result = filtered.with(1, 9);
      expect(result.toString()).assertEqual('1,9,5');
      expect(filtered.toString()).assertEqual('1,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0830
     * @tc.name testArrayWithOne083
     * @tc.desc Verify with on a concat result does not mutate either concatenated source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new Array<number>(1, 2);
      const right = new Array<number>(3, 4);
      const arr = left.concat(right);
      const result = arr.with(-2, 8);
      expect(result.toString()).assertEqual('1,2,8,4');
      expect(left.toString()).assertEqual('1,2');
      expect(right.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0840
     * @tc.name testArrayWithOne084
     * @tc.desc Verify with on a toReversed copy preserves the original order in the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.toReversed();
      const index: int = -2;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('3,8,1');
      expect(source.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0850
     * @tc.name testArrayWithOne085
     * @tc.desc Verify with on a toSpliced copy can replace an inserted element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const arr = source.toSpliced(1, 1, 7, 8);
      const index: int = -2;
      const result = arr.with(index, 9);
      expect(result.toString()).assertEqual('1,7,9,3');
      expect(arr.toString()).assertEqual('1,7,8,3');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0860
     * @tc.name testArrayWithOne086
     * @tc.desc Verify with on Array.of can replace through a negative computed head index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      const index: int = -arr.length;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('8,5,6');
      expect(arr.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0870
     * @tc.name testArrayWithOne087
     * @tc.desc Verify with on Array.from consumes a Set order copy before replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>(new Array<number>(2, 1, 2, 3));
      const arr = Array.from<number>(source);
      const result = arr.with(1, 8);
      expect(arr.toString()).assertEqual('2,1,3');
      expect(result.toString()).assertEqual('2,8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0880
     * @tc.name testArrayWithOne088
     * @tc.desc Verify with after length reset rejects indexes from the old length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      try {
        arr.with(2, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const result = arr.with(0, 8);
      expect(result.toString()).assertEqual('8');
      expect(arr.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0890
     * @tc.name testArrayWithOne089
     * @tc.desc Verify with preserves source length after replacement with an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 8);
      expect(result.length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0900
     * @tc.name testArrayWithOne090
     * @tc.desc Verify with returns a new array instance for an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 8);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0910
     * @tc.name testArrayWithOne091
     * @tc.desc Verify with keeps the original array unchanged for an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.toString();
      const index: int = 1;
      arr.with(index, 8);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0920
     * @tc.name testArrayWithOne092
     * @tc.desc Verify with can replace the only element in a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1);
      const index: int = 0;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0930
     * @tc.name testArrayWithOne093
     * @tc.desc Verify with supports replacing the last element through negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = -1;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('1,2,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0940
     * @tc.name testArrayWithOne094
     * @tc.desc Verify with can be chained with join after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 8);
      expect(result.join('-')).assertEqual('1-8-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0950
     * @tc.name testArrayWithOne095
     * @tc.desc Verify with can be chained with slice after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const index: int = 2;
      const result = arr.with(index, 8);
      expect(result.slice(1, 4).toString()).assertEqual('2,8,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0960
     * @tc.name testArrayWithOne096
     * @tc.desc Verify with can be chained with indexOf after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const index: int = 1;
      const result = arr.with(index, 8);
      expect(result.indexOf(8)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0970
     * @tc.name testArrayWithOne097
     * @tc.desc Verify with handles large generated arrays with an int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 10; i++) {
        arr.pushOne(i);
      }
      const index: int = 5;
      const result = arr.with(index, 80);
      expect(result[5]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0980
     * @tc.name testArrayWithOne098
     * @tc.desc Verify with can replace a character-like string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      const index: int = 1;
      const result = arr.with(index, 'Z');
      expect(result.toString()).assertEqual('A,Z,C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_0990
     * @tc.name testArrayWithOne099
     * @tc.desc Verify with can replace the head after concat and toReversed are combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4)).toReversed();
      const index: int = 0;
      const result = arr.with(index, 8);
      expect(result.toString()).assertEqual('8,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_WITH_ONE_1000
     * @tc.name testArrayWithOne100
     * @tc.desc Verify with can replace a computed middle index from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayWithOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const index: int = arr.length / 2;
      const result = arr.with(index, 99);
      expect(result.toString()).assertEqual('10,20,99,40,50');
    });

  });
}
