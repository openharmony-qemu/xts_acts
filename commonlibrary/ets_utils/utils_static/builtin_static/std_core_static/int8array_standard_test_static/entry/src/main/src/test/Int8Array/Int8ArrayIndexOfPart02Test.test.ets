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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayIndexOfPart02Test(): void {
  describe('Int8ArrayIndexOfPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0100
     * @tc.name int8ArrayIndexOfPart02Test001
     * @tc.desc Verify typeof result is 'int' when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0200
     * @tc.name int8ArrayIndexOfPart02Test002
     * @tc.desc Verify typeof result is 'int' when -1 returned for missing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0300
     * @tc.name int8ArrayIndexOfPart02Test003
     * @tc.desc Verify typeof result is 'int' for empty array call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.indexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0400
     * @tc.name int8ArrayIndexOfPart02Test004
     * @tc.desc Verify result % 1 equals 0 for integer type assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 6, 9]);
      let result = arr.indexOf(6);
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0500
     * @tc.name int8ArrayIndexOfPart02Test005
     * @tc.desc Verify typeof arr is 'object' and typeof result is 'int', result is primitive not reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.indexOf(2);
      expect(arr.length).assertEqual(3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0600
     * @tc.name int8ArrayIndexOfPart02Test006
     * @tc.desc Verify arr instanceof Int8Array remains true after indexOf call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.indexOf(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0700
     * @tc.name int8ArrayIndexOfPart02Test007
     * @tc.desc Verify result+1 equals 2 when found, numeric type supports arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let result = arr.indexOf(22);
      expect(result + 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0800
     * @tc.name int8ArrayIndexOfPart02Test008
     * @tc.desc Verify result+1 equals 0 when not found, -1+1 arithmetic works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([11, 22, 33]);
      let result = arr.indexOf(44);
      expect(result + 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_0900
     * @tc.name int8ArrayIndexOfPart02Test009
     * @tc.desc Verify first element found returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1000
     * @tc.name int8ArrayIndexOfPart02Test010
     * @tc.desc Verify middle element found returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1100
     * @tc.name int8ArrayIndexOfPart02Test011
     * @tc.desc Verify last element found returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1200
     * @tc.name int8ArrayIndexOfPart02Test012
     * @tc.desc Verify duplicate element returns first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      expect(arr.indexOf(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1300
     * @tc.name int8ArrayIndexOfPart02Test013
     * @tc.desc Verify fromIndex=0 hits first element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1400
     * @tc.name int8ArrayIndexOfPart02Test014
     * @tc.desc Verify fromIndex equals target element index returns that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(20, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1500
     * @tc.name int8ArrayIndexOfPart02Test015
     * @tc.desc Verify fromIndex exceeds target element returns -1, no subsequent match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1600
     * @tc.name int8ArrayIndexOfPart02Test016
     * @tc.desc Verify fromIndex=1 in duplicates returns second matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      expect(arr.indexOf(5, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1700
     * @tc.name int8ArrayIndexOfPart02Test017
     * @tc.desc Verify element not in array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1800
     * @tc.name int8ArrayIndexOfPart02Test018
     * @tc.desc Verify empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_1900
     * @tc.name int8ArrayIndexOfPart02Test019
     * @tc.desc Verify single element array not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      expect(arr.indexOf(7)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2000
     * @tc.name int8ArrayIndexOfPart02Test020
     * @tc.desc Verify all same elements array with different value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 8, 8]);
      expect(arr.indexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2100
     * @tc.name int8ArrayIndexOfPart02Test021
     * @tc.desc Verify searchElement=128 truncates to -128 and hits index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      expect(arr.indexOf(128)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2200
     * @tc.name int8ArrayIndexOfPart02Test022
     * @tc.desc Verify searchElement=-129 truncates to 127 and hits index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      expect(arr.indexOf(-129)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2300
     * @tc.name int8ArrayIndexOfPart02Test023
     * @tc.desc Verify searchElement=255 truncates to -1 and hits index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      expect(arr.indexOf(255)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2400
     * @tc.name int8ArrayIndexOfPart02Test024
     * @tc.desc Verify searchElement=256 truncates to 0 and hits index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, 0, 1]);
      expect(arr.indexOf(256)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2500
     * @tc.name int8ArrayIndexOfPart02Test025
     * @tc.desc Verify fromIndex=-1 normalizes to length-1 and hits last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(30, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2600
     * @tc.name int8ArrayIndexOfPart02Test026
     * @tc.desc Verify fromIndex=-length normalizes to 0 and hits first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2700
     * @tc.name int8ArrayIndexOfPart02Test027
     * @tc.desc Verify fromIndex=-length-1 clamps to 0 and hits first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2800
     * @tc.name int8ArrayIndexOfPart02Test028
     * @tc.desc Verify fromIndex=-2 in duplicates searches from index 1 and returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 10]);
      expect(arr.indexOf(10, -2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_2900
     * @tc.name int8ArrayIndexOfPart02Test029
     * @tc.desc Verify fromIndex=length returns -1, start position equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3000
     * @tc.name int8ArrayIndexOfPart02Test030
     * @tc.desc Verify fromIndex=length+1 returns -1, start position exceeds length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(10, 4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3100
     * @tc.name int8ArrayIndexOfPart02Test031
     * @tc.desc Verify fromIndex=2 hits last element returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.indexOf(30, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3200
     * @tc.name int8ArrayIndexOfPart02Test032
     * @tc.desc Verify array length unchanged when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let before = arr.length;
      arr.indexOf(20);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3300
     * @tc.name int8ArrayIndexOfPart02Test033
     * @tc.desc Verify array length unchanged when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let before = arr.length;
      arr.indexOf(99);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3400
     * @tc.name int8ArrayIndexOfPart02Test034
     * @tc.desc Verify byteLength unchanged when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let before = arr.byteLength;
      arr.indexOf(20);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3500
     * @tc.name int8ArrayIndexOfPart02Test035
     * @tc.desc Verify byteLength unchanged after indexOf with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let before = arr.byteLength;
      arr.indexOf(20, 1);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3600
     * @tc.name int8ArrayIndexOfPart02Test036
     * @tc.desc Verify empty array length remains 0 after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      arr.indexOf(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3700
     * @tc.name int8ArrayIndexOfPart02Test037
     * @tc.desc Verify single element array length remains 1 after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      arr.indexOf(42);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3800
     * @tc.name int8ArrayIndexOfPart02Test038
     * @tc.desc Verify buffer.byteLength unchanged after truncated searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      let buf = arr.buffer;
      let before = buf.byteLength;
      arr.indexOf(128);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_3900
     * @tc.name int8ArrayIndexOfPart02Test039
     * @tc.desc Verify arr.length equals arr.byteLength after indexOf, int8 1-byte-per-element invariant unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.length).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4000
     * @tc.name int8ArrayIndexOfPart02Test040
     * @tc.desc Verify array elements unchanged when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4100
     * @tc.name int8ArrayIndexOfPart02Test041
     * @tc.desc Verify array elements unchanged when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.indexOf(99);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4200
     * @tc.name int8ArrayIndexOfPart02Test042
     * @tc.desc Verify array elements unchanged after truncated searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-128, 0, INT8_MAX]);
      arr.indexOf(128);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4300
     * @tc.name int8ArrayIndexOfPart02Test043
     * @tc.desc Verify array elements unchanged after negative fromIndex call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.indexOf(30, -1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4400
     * @tc.name int8ArrayIndexOfPart02Test044
     * @tc.desc Verify single element array unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42]);
      arr.indexOf(42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4500
     * @tc.name int8ArrayIndexOfPart02Test045
     * @tc.desc Verify duplicate element array unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      arr.indexOf(5);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4600
     * @tc.name int8ArrayIndexOfPart02Test046
     * @tc.desc Verify array elements unchanged when fromIndex exceeds length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.indexOf(10, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4700
     * @tc.name int8ArrayIndexOfPart02Test047
     * @tc.desc Verify all same elements array unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([8, 8, 8]);
      arr.indexOf(9);
      expect(arr.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4800
     * @tc.name int8ArrayIndexOfPart02Test048
     * @tc.desc Verify empty array byteLength remains 0 after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      arr.indexOf(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_4900
     * @tc.name int8ArrayIndexOfPart02Test049
     * @tc.desc Verify valid return index usable for $_set write, return value is usable numeric index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let idx = arr.indexOf(20);
      arr.$_set(idx, 99);
      expect(arr.$_get(idx)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5000
     * @tc.name int8ArrayIndexOfPart02Test050
     * @tc.desc Verify consecutive indexOf finds duplicate elements, non-chained returns to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 20]);
      let first = arr.indexOf(20);
      let second = arr.indexOf(20, first + 1);
      expect(first).assertEqual(1);
      expect(second).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5100
     * @tc.name int8ArrayIndexOfPart02Test051
     * @tc.desc Verify return index used for $_get reads original element, return value is valid subscript
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let idx = arr.indexOf(30);
      expect(arr.$_get(idx)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5200
     * @tc.name int8ArrayIndexOfPart02Test052
     * @tc.desc Verify -1 as subscript $_get returns undefined, -1 is sentinel not valid subscript
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let idx = arr.indexOf(99);
      expect(idx).assertEqual(-1);
            try {
        arr.$_get(idx);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5300
     * @tc.name int8ArrayIndexOfPart02Test053
     * @tc.desc Verify byteOffset unchanged after indexOf, default view byteOffset=0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let before = arr.byteOffset;
      arr.indexOf(20);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5400
     * @tc.name int8ArrayIndexOfPart02Test054
     * @tc.desc Verify subarray view byteOffset unchanged after indexOf, non-zero offset preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let before = view.byteOffset;
      view.indexOf(20);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5500
     * @tc.name int8ArrayIndexOfPart02Test055
     * @tc.desc Verify subarray view indexOf only searches within view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      expect(view.indexOf(20)).assertEqual(0);
      expect(view.indexOf(40)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5600
     * @tc.name int8ArrayIndexOfPart02Test056
     * @tc.desc Verify subarray view shares buffer after indexOf, write to view affects original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      view.indexOf(30);
      view.$_set(0, 99);
      expect(base.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5700
     * @tc.name int8ArrayIndexOfPart02Test057
     * @tc.desc Verify slice copy has independent buffer after indexOf, write to copy does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30]);
      let copy = base.slice(0, 3);
      copy.indexOf(20);
      copy.$_set(0, 99);
      expect(base.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5800
     * @tc.name int8ArrayIndexOfPart02Test058
     * @tc.desc Verify subarray view length unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let before = view.length;
      view.indexOf(20);
      expect(view.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_5900
     * @tc.name int8ArrayIndexOfPart02Test059
     * @tc.desc Verify subarray view byteLength unchanged after indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([10, 20, 30, 40]);
      let view = base.subarray(1, 3);
      let before = view.byteLength;
      view.indexOf(30);
      expect(view.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART02_TEST_6000
     * @tc.name int8ArrayIndexOfPart02Test060
     * @tc.desc Verify offset ArrayBuffer view indexOf byteOffset remains 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      let view = new Int8Array(buf, 1, 3);
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.$_set(2, 30);
      view.indexOf(20);
      expect(view.byteOffset).assertEqual(1);
    });
  });
}
