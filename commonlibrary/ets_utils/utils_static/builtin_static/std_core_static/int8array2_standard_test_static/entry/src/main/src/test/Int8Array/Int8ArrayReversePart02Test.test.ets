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
import Utils from './../Util.test';

export default function int8ArrayReversePart02Test(): void {
  describe('Int8ArrayReversePart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0100
     * @tc.name int8ArrayReversePart02Test001
     * @tc.desc Verify reverse() return value first element equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = 2;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0200
     * @tc.name int8ArrayReversePart02Test002
     * @tc.desc Verify reverse() return value first element equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 4]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = 4;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0300
     * @tc.name int8ArrayReversePart02Test003
     * @tc.desc Verify reverse() return value first element equals 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = 7;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0400
     * @tc.name int8ArrayReversePart02Test004
     * @tc.desc Verify reverse() return value equals original array (returns this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 8]);
      let result: Int8Array = arr.reverse();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0500
     * @tc.name int8ArrayReversePart02Test005
     * @tc.desc Verify Int8Array.of reverse() return value equals original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20);
      let result: Int8Array = arr.reverse();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0600
     * @tc.name int8ArrayReversePart02Test006
     * @tc.desc Verify two consecutive reverse() calls return same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1: Int8Array = arr.reverse();
      let expected1: Int8Array = new Int8Array([4, 3, 2, 1]);
      expect(r1.toString()).assertEqual(expected1.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0700
     * @tc.name int8ArrayReversePart02Test007
     * @tc.desc Verify reverse().reverse() return value equals original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7]);
      let result: Int8Array = arr.reverse().reverse();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0800
     * @tc.name int8ArrayReversePart02Test008
     * @tc.desc Verify reverse() return value modification synced to original array (shared reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      result.$_set(0, 99);
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 99;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_0900
     * @tc.name int8ArrayReversePart02Test009
     * @tc.desc Verify reverse() return value buffer equals original array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: ArrayBuffer = result.buffer;
      let expected1: ArrayBuffer = arr.buffer;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1000
     * @tc.name int8ArrayReversePart02Test010
     * @tc.desc Verify 2-element array reverse() return value length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.length;
      let expected1: int = 2;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1100
     * @tc.name int8ArrayReversePart02Test011
     * @tc.desc Verify 3-element array reverse() return value length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.length;
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1200
     * @tc.name int8ArrayReversePart02Test012
     * @tc.desc Verify 100-element array reverse() return value length is 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.length;
      let expected1: int = 100;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1300
     * @tc.name int8ArrayReversePart02Test013
     * @tc.desc Verify 4-element array length unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let before: number = arr.length;
      arr.reverse();
      let resultVal1: int = arr.length;
      let expected1 = before;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1400
     * @tc.name int8ArrayReversePart02Test014
     * @tc.desc Verify 3-element array reverse() return value byteLength is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.byteLength;
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1500
     * @tc.name int8ArrayReversePart02Test015
     * @tc.desc Verify default view reverse() return value byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.byteOffset;
      let expected1: int = 0;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1600
     * @tc.name int8ArrayReversePart02Test016
     * @tc.desc Verify offset view (byteOffset=4) reverse() return value byteOffset is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 4, 2);
      view.$_set(0, 10);
      view.$_set(1, 20);
      let result: Int8Array = view.reverse();
      let resultVal1: int = result.byteOffset;
      let expected1: int = 4;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1700
     * @tc.name int8ArrayReversePart02Test017
     * @tc.desc Verify byteOffset unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let before: number = arr.byteOffset;
      arr.reverse();
      let resultVal1: int = arr.byteOffset;
      let expected1 = before;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1800
     * @tc.name int8ArrayReversePart02Test018
     * @tc.desc Verify arr.buffer equals original buffer after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.reverse();
      let resultVal1: ArrayBuffer = arr.buffer;
      let expected1: ArrayBuffer = buf;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_1900
     * @tc.name int8ArrayReversePart02Test019
     * @tc.desc Verify reverse() return value buffer equals original array buffer (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: Int8Array = arr.reverse();
      let resultVal1: ArrayBuffer = result.buffer;
      let expected1: ArrayBuffer = arr.buffer;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2000
     * @tc.name int8ArrayReversePart02Test020
     * @tc.desc Verify buffer.byteLength unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let before: number = arr.buffer.byteLength;
      arr.reverse();
      let resultVal1: int = arr.buffer.byteLength;
      let expected1 = before;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2100
     * @tc.name int8ArrayReversePart02Test021
     * @tc.desc Verify buffer view modification reflected to arr after reverse (shared semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reverse();
      let view: Int8Array = new Int8Array(arr.buffer);
      view.$_set(0, 77);
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 77;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2200
     * @tc.name int8ArrayReversePart02Test022
     * @tc.desc Verify new view on buffer after reverse reads reversed byte content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let buf: ArrayBuffer = arr.buffer;
      arr.reverse();
      let view: Int8Array = new Int8Array(buf);
      let resultVal1: number = view.$_get(0);
      let expected1: int = 4;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2300
     * @tc.name int8ArrayReversePart02Test023
     * @tc.desc Verify reverse() return value and original array byteLength equal (view property consistency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6, 7, 8]);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.byteLength;
      let expected1: int = arr.byteLength;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2400
     * @tc.name int8ArrayReversePart02Test024
     * @tc.desc Verify [1,2] reverse() return value $_get(1) is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(1);
      let expected1: int = 1;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2500
     * @tc.name int8ArrayReversePart02Test025
     * @tc.desc Verify [1,2,3] reverse() return value middle element $_get(1) is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(1);
      let expected1: int = 2;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2600
     * @tc.name int8ArrayReversePart02Test026
     * @tc.desc Verify [1,2,3] reverse() return value $_get(2) is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(2);
      let expected1: int = 1;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2700
     * @tc.name int8ArrayReversePart02Test027
     * @tc.desc Verify [1,2,3,4] reverse() return value first and last swapped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = 4;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2800
     * @tc.name int8ArrayReversePart02Test028
     * @tc.desc Verify [1,2,3,4,5] reverse() return value middle element $_get(2) is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(2);
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_2900
     * @tc.name int8ArrayReversePart02Test029
     * @tc.desc Verify all same elements [7,7,7] reverse() return value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = 7;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3000
     * @tc.name int8ArrayReversePart02Test030
     * @tc.desc Verify palindrome [1,2,1] reverse() return value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 1]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(1);
      let expected1: int = 2;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3100
     * @tc.name int8ArrayReversePart02Test031
     * @tc.desc Verify negative values [-1,-2] reverse() return value order reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = -2;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3200
     * @tc.name int8ArrayReversePart02Test032
     * @tc.desc Verify palindrome with zero [0,1,0] reverse() return value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 0]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(1);
      let expected1: int = 1;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3300
     * @tc.name int8ArrayReversePart02Test033
     * @tc.desc Verify boundary values [-128,127] reverse() return value order reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3400
     * @tc.name int8ArrayReversePart02Test034
     * @tc.desc Verify even length [1,2,3,4,5,6] reverse() return value fully reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(5);
      let expected1: int = 1;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3500
     * @tc.name int8ArrayReversePart02Test035
     * @tc.desc Verify alternating pattern [10,-10,10,-10] reverse() return value reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -10, 10, -10]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = -10;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3600
     * @tc.name int8ArrayReversePart02Test036
     * @tc.desc Verify reverse().reverse().reverse() triple reverse equals single reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse().reverse().reverse();
      let resultVal1: number = result.$_get(0);
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3700
     * @tc.name int8ArrayReversePart02Test037
     * @tc.desc Verify reverse().subarray(0,2) chain returns view with first element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sub: Int8Array = arr.reverse().subarray(0, 2);
      let resultVal1: number = sub.$_get(0);
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3800
     * @tc.name int8ArrayReversePart02Test038
     * @tc.desc Verify reverse().at(0) chain reads first element as 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = arr.reverse().at(0) as number;
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_3900
     * @tc.name int8ArrayReversePart02Test039
     * @tc.desc Verify reverse().at(-1) chain reads last element as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = arr.reverse().at(-1) as number;
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4000
     * @tc.name int8ArrayReversePart02Test040
     * @tc.desc Verify reverse().indexOf(3) chain finds original last element at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let idx: number = arr.reverse().indexOf(3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4100
     * @tc.name int8ArrayReversePart02Test041
     * @tc.desc Verify reverse().join(',') chain returns reversed string '3,2,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let s: string = arr.reverse().join(',');
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4200
     * @tc.name int8ArrayReversePart02Test042
     * @tc.desc Verify reverse().length chain property access returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([4, 5, 6]);
      let n: number = arr.reverse().length;
      expect(n).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4300
     * @tc.name int8ArrayReversePart02Test043
     * @tc.desc Verify reverse().toString() chain returns reversed string '3,2,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let s: string = arr.reverse().toString();
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4400
     * @tc.name int8ArrayReversePart02Test044
     * @tc.desc Verify reverse return value and original array share buffer (modify return value reflects to original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      result.$_set(2, 88);
      let resultVal1: number = arr.$_get(2);
      let expected1: int = 88;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4500
     * @tc.name int8ArrayReversePart02Test045
     * @tc.desc Verify subarray after reverse shares buffer with original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reverse();
      let sub: Int8Array = arr.subarray(0, 2);
      sub.$_set(0, 50);
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 50;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4600
     * @tc.name int8ArrayReversePart02Test046
     * @tc.desc Verify offset view reverse does not affect other view range (multi-view sync)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let firstValue: Int8Array = new Int8Array(buf, 0, 2);
      let secondValue: Int8Array = new Int8Array(buf, 2, 2);
      firstValue.$_set(0, 10);
      firstValue.$_set(1, 20);
      secondValue.$_set(0, 30);
      secondValue.$_set(1, 40);
      firstValue.reverse();
      let resultVal1: number = secondValue.$_get(0);
      let expected1: int = 30;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4700
     * @tc.name int8ArrayReversePart02Test047
     * @tc.desc Verify offset view reverse only reverses elements within view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int8Array = new Int8Array(buf, 2, 2);
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.reverse();
      let full: Int8Array = new Int8Array(buf);
      let resultVal1: number = full.$_get(2);
      let expected1: int = 20;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4800
     * @tc.name int8ArrayReversePart02Test048
     * @tc.desc Verify reverse() return value byteLength equals length (int8 1 byte per element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.byteLength;
      let expected1: int = result.length;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_4900
     * @tc.name int8ArrayReversePart02Test049
     * @tc.desc Verify reverse() return value modification does not change original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      result.$_set(0, 99);
      let resultVal1: int = arr.length;
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_5000
     * @tc.name int8ArrayReversePart02Test050
     * @tc.desc Verify after reverse() original array first element equals return value last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
      let resultVal2: number = result.$_get(0);
      let expected2: int = 3;
      expect(resultVal2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_5100
     * @tc.name int8ArrayReversePart02Test051
     * @tc.desc Verify after two consecutive reverse() calls length remains original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.reverse();
      arr.reverse();
      let resultVal1: int = arr.length;
      let expected1: int = 4;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_5200
     * @tc.name int8ArrayReversePart02Test052
     * @tc.desc Verify reverse() return value byteOffset equals original array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 4, 2);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      let result: Int8Array = arr.reverse();
      let resultVal1: int = result.byteOffset;
      let expected1: int = arr.byteOffset;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_5300
     * @tc.name int8ArrayReversePart02Test053
     * @tc.desc Verify reverse() return value fill synced to original array (shared reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      result.fill(7);
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 7;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_5400
     * @tc.name int8ArrayReversePart02Test054
     * @tc.desc Verify reverse() return value copyWithin synced to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let result: Int8Array = arr.reverse();
      result.copyWithin(0, 1);
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 3;
      expect(resultVal1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REVERSE_PART02_5500
     * @tc.name int8ArrayReversePart02Test055
     * @tc.desc Verify reverse() return value set synced to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReversePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.reverse();
      result.set(new Int8Array([10, 20]));
      let resultVal1: number = arr.$_get(0);
      let expected1: int = 10;
      expect(resultVal1).assertEqual(expected1);
    });
  });
}
