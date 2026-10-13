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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayLastIndexOfPart04Test(): void {
  describe('Int8ArrayLastIndexOfPart04Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_0700
     * @tc.name int8ArrayLastIndexOfPart04Test007
     * @tc.desc Verify lastIndexOf returns consistent index across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let first = arr.lastIndexOf(20);
      let second = arr.lastIndexOf(20);
      let third = arr.lastIndexOf(20);
      let expectedIndex: number = 3;
      expect(first).assertEqual(expectedIndex);
      expect(second).assertEqual(expectedIndex);
      expect(third).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_0800
     * @tc.name int8ArrayLastIndexOfPart04Test008
     * @tc.desc Verify lastIndexOf after indexOf calls leaves elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let resultVal1: number = arr.indexOf(20);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal2: number = arr.lastIndexOf(20);
      let expectedVal2: number = 3;
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: number = arr.indexOf(30);
      let expectedVal3: number = 2;
      expect(resultVal3).assertEqual(expectedVal3);
      let resultVal4: number = arr.lastIndexOf(10);
      let expectedVal4: number = 0;
      expect(resultVal4).assertEqual(expectedVal4);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 10;
      expect(valueAt0).assertEqual(expected1);
      let valueAt1: number = arr.$_get(1);
      let expected2: int = 20;
      expect(valueAt1).assertEqual(expected2);
      let valueAt2: number = arr.$_get(2);
      let expected3: int = 30;
      expect(valueAt2).assertEqual(expected3);
      let valueAt3: number = arr.$_get(3);
      let expected4: int = 20;
      expect(valueAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_0900
     * @tc.name int8ArrayLastIndexOfPart04Test009
     * @tc.desc Verify lastIndexOf on one view leaves sibling view unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let a = new Int8Array(buf, 0, 3);
      let b = new Int8Array(buf, 3, 3);
      a.$_set(0, 10);
      a.$_set(1, 20);
      a.$_set(2, 30);
      b.$_set(0, 40);
      b.$_set(1, 50);
      b.$_set(2, 60);
      let resultVal1: number = a.lastIndexOf(20);
      let expectedVal1: number = 1;
      expect(resultVal1).assertEqual(expectedVal1);
      let valueAt0: number = b.$_get(0);
      let expected1: int = 40;
      expect(valueAt0).assertEqual(expected1);
      let valueAt1: number = b.$_get(1);
      let expected2: int = 50;
      expect(valueAt1).assertEqual(expected2);
      let valueAt2: number = b.$_get(2);
      let expected3: int = 60;
      expect(valueAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1000
     * @tc.name int8ArrayLastIndexOfPart04Test010
     * @tc.desc Verify lastIndexOf chained fromIndex finds 4 then 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 20, 10, 20]);
      let first = arr.lastIndexOf(20);
      let next = arr.lastIndexOf(20, first - 1);
      expect(first).assertEqual(4);
      expect(next).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1100
     * @tc.name int8ArrayLastIndexOfPart04Test011
     * @tc.desc Verify lastIndexOf -1 -1 fromIndex -1+length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let miss = arr.lastIndexOf(99);
      let retry = arr.lastIndexOf(30, miss);
      expect(miss).assertEqual(-1);
      expect(retry).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1200
     * @tc.name int8ArrayLastIndexOfPart04Test012
     * @tc.desc Verify lastIndexOf searchElement -1 when search element is an index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let pos = arr.lastIndexOf(20);
      let result = arr.lastIndexOf(pos);
      expect(pos).assertEqual(3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1300
     * @tc.name int8ArrayLastIndexOfPart04Test013
     * @tc.desc Verify lastIndexOf with indexOf result as fromIndex returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 20, 10, 20]);
      let firstFwd = arr.indexOf(20);
      let lastBwd = arr.lastIndexOf(20, firstFwd);
      expect(firstFwd).assertEqual(0);
      expect(lastBwd).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1400
     * @tc.name int8ArrayLastIndexOfPart04Test014
     * @tc.desc Verify chained lastIndexOf with fromIndex walks 4, 2, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 20, 10, 20]);
      let p1 = arr.lastIndexOf(20);
      let p2 = arr.lastIndexOf(20, p1 - 1);
      let p3 = arr.lastIndexOf(20, p2 - 1);
      expect(p1).assertEqual(4);
      expect(p2).assertEqual(2);
      expect(p3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1600
     * @tc.name int8ArrayLastIndexOfPart04Test016
     * @tc.desc Verify $_set then lastIndexOf finds new value at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.$_set(1, 50);
      let lastIndex50: int = arr.lastIndexOf(50);
      let expected1: int = 1;
      expect(lastIndex50).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1700
     * @tc.name int8ArrayLastIndexOfPart04Test017
     * @tc.desc Verify $_set lastIndexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.$_set(1, 50);
      let lastIndex20: int = arr.lastIndexOf(20);
      let expected1: int = -1;
      expect(lastIndex20).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1800
     * @tc.name int8ArrayLastIndexOfPart04Test018
     * @tc.desc Verify $_set then lastIndexOf finds new value at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 30]);
      arr.$_set(2, 20);
      let lastIndex20: int = arr.lastIndexOf(20);
      let expected1: int = 2;
      expect(lastIndex20).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_1900
     * @tc.name int8ArrayLastIndexOfPart04Test019
     * @tc.desc Verify $_set then lastIndexOf finds new value at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      arr.$_set(0, 20);
      let lastIndex20: int = arr.lastIndexOf(20);
      let expected1: int = 3;
      expect(lastIndex20).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2000
     * @tc.name int8ArrayLastIndexOfPart04Test020
     * @tc.desc Verify fill lastIndexOf length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(5);
      arr.fill(40);
      let lastIndex40: int = arr.lastIndexOf(40);
      let expected1: int = 4;
      expect(lastIndex40).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2100
     * @tc.name int8ArrayLastIndexOfPart04Test021
     * @tc.desc Verify fill then lastIndexOf finds filled value at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 10, 10, 10, 10]);
      arr.fill(40, 1, 4);
      let lastIndex40: int = arr.lastIndexOf(40);
      let expected1: int = 3;
      expect(lastIndex40).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2200
     * @tc.name int8ArrayLastIndexOfPart04Test022
     * @tc.desc Verify reverse changes lastIndexOf from 0 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 30]);
      let before = arr.lastIndexOf(20);
      arr.reverse();
      let after = arr.lastIndexOf(20);
      expect(before).assertEqual(0);
      expect(after).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2300
     * @tc.name int8ArrayLastIndexOfPart04Test023
     * @tc.desc Verify copyWithin visible in lastIndexOf result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 30, 40]);
      arr.copyWithin(0, 2, 4);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 30;
      expect(valueAt0).assertEqual(expected1);
      let lastIndex30: int = arr.lastIndexOf(30);
      let expected2: int = 2;
      expect(lastIndex30).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2400
     * @tc.name int8ArrayLastIndexOfPart04Test024
     * @tc.desc Verify sort then lastIndexOf finds sorted value at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([30, 10, 20, 10]);
      arr.sort();
      let lastIndex10: int = arr.lastIndexOf(10);
      let expected1: int = 1;
      expect(lastIndex10).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2500
     * @tc.name int8ArrayLastIndexOfPart04Test025
     * @tc.desc Verify set(source) visible in lastIndexOf result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40]);
      let src = new Int8Array([50, 60]);
      arr.set(src, 1);
      let lastIndex60: int = arr.lastIndexOf(60);
      let expected1: int = 2;
      expect(lastIndex60).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2600
     * @tc.name int8ArrayLastIndexOfPart04Test026
     * @tc.desc Verify lastIndexOf result captured before $_set stays valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let pos = arr.lastIndexOf(20);
      arr.$_set(1, 99);
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2700
     * @tc.name int8ArrayLastIndexOfPart04Test027
     * @tc.desc Verify lastIndexOf returns -1 after value removed by $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let before = arr.lastIndexOf(20);
      arr.$_set(1, 99);
      let after = arr.lastIndexOf(20);
      expect(before).assertEqual(1);
      expect(after).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2800
     * @tc.name int8ArrayLastIndexOfPart04Test028
     * @tc.desc Verify lastIndexOf result used with at() returns value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let pos = arr.lastIndexOf(20);
      let val = arr.at(pos);
      expect(pos).assertEqual(3);
      expect(val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_2900
     * @tc.name int8ArrayLastIndexOfPart04Test029
     * @tc.desc Verify lastIndexOf searchElement=0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      let lastIndexZero: number = arr.lastIndexOf(0.0);
      let expected1: int = 1;
      expect(lastIndexZero).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3000
     * @tc.name int8ArrayLastIndexOfPart04Test030
     * @tc.desc Verify lastIndexOf searchElement=-0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      let lastIndexNegZero: number = arr.lastIndexOf(-0.0);
      let expected1: int = 1;
      expect(lastIndexNegZero).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3100
     * @tc.name int8ArrayLastIndexOfPart04Test031
     * @tc.desc Verify lastIndexOf(128) returns -1 because 128 ToInt8 clamps to -128 not found in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let lastIndex128: int = arr.lastIndexOf(128);
      let expected1: int = -1;
      expect(lastIndex128).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3300
     * @tc.name int8ArrayLastIndexOfPart04Test033
     * @tc.desc Verify $_set subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(1, 4);
      parent.$_set(2, 99);
      let lastIndex99: int = child.lastIndexOf(99);
      let expected1: int = 1;
      expect(lastIndex99).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3400
     * @tc.name int8ArrayLastIndexOfPart04Test034
     * @tc.desc Verify fill subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(1, 4);
      parent.fill(77);
      let lastIndex77: int = child.lastIndexOf(77);
      let expected1: int = 2;
      expect(lastIndex77).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3500
     * @tc.name int8ArrayLastIndexOfPart04Test035
     * @tc.desc Verify reverse subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(0, 3);
      parent.reverse();
      let lastIndex50: int = child.lastIndexOf(50);
      let expected1: int = 0;
      expect(lastIndex50).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3600
     * @tc.name int8ArrayLastIndexOfPart04Test036
     * @tc.desc Verify $_set on subarray visible in parent lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(1, 4);
      child.$_set(0, 99);
      let lastIndex99: int = parent.lastIndexOf(99);
      let expected1: int = 1;
      expect(lastIndex99).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3700
     * @tc.name int8ArrayLastIndexOfPart04Test037
     * @tc.desc Verify fill on subarray visible in parent lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(1, 4);
      child.fill(88);
      let lastIndex88: int = parent.lastIndexOf(88);
      let expected1: int = 3;
      expect(lastIndex88).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3800
     * @tc.name int8ArrayLastIndexOfPart04Test038
     * @tc.desc Verify sort on subarray visible in parent lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([50, 40, 30, 20, 10]);
      let child = parent.subarray(0, 3);
      child.sort();
      let lastIndex30: int = parent.lastIndexOf(30);
      let expected1: int = 0;
      expect(lastIndex30).assertEqual(expected1);
      let lastIndex40: int = parent.lastIndexOf(40);
      let expected2: int = 1;
      expect(lastIndex40).assertEqual(expected2);
      let lastIndex50: int = parent.lastIndexOf(50);
      let expected3: int = 2;
      expect(lastIndex50).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_3900
     * @tc.name int8ArrayLastIndexOfPart04Test039
     * @tc.desc Verify subarray lastIndexOf finds values in two views independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let viewA = new Int8Array(buf, 0, 3);
      let viewB = new Int8Array(buf, 3, 3);
      viewA.$_set(2, 65);
      viewB.$_set(0, 65);
      let viewALastIndex: int = viewA.lastIndexOf(65);
      let expected1: int = 2;
      expect(viewALastIndex).assertEqual(expected1);
      let viewBLastIndex: int = viewB.lastIndexOf(65);
      let expected2: int = 0;
      expect(viewBLastIndex).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4000
     * @tc.name int8ArrayLastIndexOfPart04Test040
     * @tc.desc Verify subarray lastIndexOf returns view-relative index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([20, 20, 20, 20, 20]);
      let child = parent.subarray(1, 4);
      let lastIndex20: int = child.lastIndexOf(20);
      let expected1: int = 2;
      expect(lastIndex20).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4100
     * @tc.name int8ArrayLastIndexOfPart04Test041
     * @tc.desc Verify lastIndexOf on two views of one buffer searches independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let viewA = new Int8Array(buf, 0, 3);
      let viewB = new Int8Array(buf, 3, 3);
      viewA.$_set(0, 10);
      viewA.$_set(1, 20);
      viewA.$_set(2, 30);
      viewB.$_set(0, 40);
      viewB.$_set(1, 50);
      viewB.$_set(2, 60);
      let viewALastIndex: int = viewA.lastIndexOf(30);
      let expected1: int = 2;
      expect(viewALastIndex).assertEqual(expected1);
      let viewBLastIndex: int = viewB.lastIndexOf(60);
      let expected2: int = 2;
      expect(viewBLastIndex).assertEqual(expected2);
      let viewAMissIndex: int = viewA.lastIndexOf(60);
      let expected3: int = -1;
      expect(viewAMissIndex).assertEqual(expected3);
      let viewBMissIndex: int = viewB.lastIndexOf(10);
      let expected4: int = -1;
      expect(viewBMissIndex).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4200
     * @tc.name int8ArrayLastIndexOfPart04Test042
     * @tc.desc Verify subarray subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(1, 4);
      let grandchild = child.subarray(1, 3);
      grandchild.$_set(0, 99);
      let parentLastIndex: int = parent.lastIndexOf(99);
      let expected1: int = 2;
      expect(parentLastIndex).assertEqual(expected1);
      let childLastIndex: int = child.lastIndexOf(99);
      let expected2: int = 1;
      expect(childLastIndex).assertEqual(expected2);
      let grandchildLastIndex: int = grandchild.lastIndexOf(99);
      let expected3: int = 0;
      expect(grandchildLastIndex).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4300
     * @tc.name int8ArrayLastIndexOfPart04Test043
     * @tc.desc Verify lastIndexOf finds value written via sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([10, 20, 30, 40, 50]);
      let viewA = parent.subarray(0, 3);
      let viewB = parent.subarray(2, 5);
      viewA.$_set(2, 99);
      let viewBLastIndex: int = viewB.lastIndexOf(99);
      let expected1: int = 0;
      expect(viewBLastIndex).assertEqual(expected1);
      let parentLastIndex: int = parent.lastIndexOf(99);
      let expected2: int = 2;
      expect(parentLastIndex).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4400
     * @tc.name int8ArrayLastIndexOfPart04Test044
     * @tc.desc Verify lastIndexOf on subarray returns indices within view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int8Array([20, 10, 20, 30, 20]);
      let child = parent.subarray(0, 4);
      let p1 = child.lastIndexOf(20);
      let p2 = child.lastIndexOf(20, p1 - 1);
      expect(p1).assertEqual(2);
      expect(p2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4500
     * @tc.name int8ArrayLastIndexOfPart04Test045
     * @tc.desc Verify $_set twice then lastIndexOf chain finds 2, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([20, 10, 30]);
      arr.$_set(0, 20);
      arr.$_set(2, 20);
      let p1 = arr.lastIndexOf(20);
      let p2 = arr.lastIndexOf(20, p1 - 1);
      expect(p1).assertEqual(2);
      expect(p2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4600
     * @tc.name int8ArrayLastIndexOfPart04Test046
     * @tc.desc Verify lastIndexOf on all-equal array walks 4 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([50, 50, 50, 50, 50]);
      let p1 = arr.lastIndexOf(50);
      let p2 = arr.lastIndexOf(50, p1 - 1);
      let p3 = arr.lastIndexOf(50, p2 - 1);
      let p4 = arr.lastIndexOf(50, p3 - 1);
      let p5 = arr.lastIndexOf(50, p4 - 1);
      expect(p1).assertEqual(4);
      expect(p2).assertEqual(3);
      expect(p3).assertEqual(2);
      expect(p4).assertEqual(1);
      expect(p5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4700
     * @tc.name int8ArrayLastIndexOfPart04Test047
     * @tc.desc Verify lastIndexOf then subarray keeps elements 20, 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let resultVal1: number = arr.lastIndexOf(20);
      let expectedVal1: number = 3;
      expect(resultVal1).assertEqual(expectedVal1);
      let child = arr.subarray(1, 3);
      let childLength: int = child.length;
      let expected1: int = 2;
      expect(childLength).assertEqual(expected1);
      let valueAt0: number = child.$_get(0);
      let expected2: int = 20;
      expect(valueAt0).assertEqual(expected2);
      let valueAt1: number = child.$_get(1);
      let expected3: int = 30;
      expect(valueAt1).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_LAST_INDEX_OF_PART04_TEST_4800
     * @tc.name int8ArrayLastIndexOfPart04Test048
     * @tc.desc Verify lastIndexOf chain 1, -1, 2 across two $_set calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayLastIndexOfPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let r1 = arr.lastIndexOf(20);
      arr.$_set(1, 99);
      let r2 = arr.lastIndexOf(20);
      arr.$_set(2, 20);
      let r3 = arr.lastIndexOf(20);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(-1);
      expect(r3).assertEqual(2);
    });
  });
}
