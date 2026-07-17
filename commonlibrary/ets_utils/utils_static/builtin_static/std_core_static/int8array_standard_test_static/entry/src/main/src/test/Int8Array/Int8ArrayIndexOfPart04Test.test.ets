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

export default function int8ArrayIndexOfPart04TestTest(): void {
  describe('Int8ArrayIndexOfPart04TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0100
     * @tc.name int8ArrayIndexOfPart04Test001
     * @tc.desc Verify indexOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let before = arr.length;
      arr.indexOf(20);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0200
     * @tc.name int8ArrayIndexOfPart04Test002
     * @tc.desc Verify indexOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let before = arr.byteLength;
      arr.indexOf(99);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0300
     * @tc.name int8ArrayIndexOfPart04Test003
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      arr.indexOf(20);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0400
     * @tc.name int8ArrayIndexOfPart04Test004
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      arr.indexOf(20);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0500
     * @tc.name int8ArrayIndexOfPart04Test005
     * @tc.desc Verify indexOf buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let buf: ArrayBuffer = arr.buffer;
      arr.indexOf(20);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0600
     * @tc.name int8ArrayIndexOfPart04Test006
     * @tc.desc Verify indexOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(new ArrayBuffer(8), 2, 4);
      let before = arr.byteOffset;
      arr.indexOf(0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0700
     * @tc.name int8ArrayIndexOfPart04Test007
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      arr.$_set(0, 50);
      expect(arr.indexOf(50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0800
     * @tc.name int8ArrayIndexOfPart04Test008
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      arr.$_set(2, -50);
      expect(arr.indexOf(-50)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_0900
     * @tc.name int8ArrayIndexOfPart04Test009
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5);
      arr.$_set(0, 9);
      expect(arr.indexOf(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1000
     * @tc.name int8ArrayIndexOfPart04Test010
     * @tc.desc Verify $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      arr.$_set(1, 200);
      expect(arr.indexOf(-56)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1100
     * @tc.name int8ArrayIndexOfPart04Test011
     * @tc.desc Verify fill indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      arr.fill(7);
      expect(arr.indexOf(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1200
     * @tc.name int8ArrayIndexOfPart04Test012
     * @tc.desc Verify fill indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      arr.fill(7, 1, 3);
      expect(arr.indexOf(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1300
     * @tc.name int8ArrayIndexOfPart04Test013
     * @tc.desc Verify fill indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      arr.fill(7);
      expect(arr.indexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1400
     * @tc.name int8ArrayIndexOfPart04Test014
     * @tc.desc Verify fill indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      arr.fill(200);
      expect(arr.indexOf(-56)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1500
     * @tc.name int8ArrayIndexOfPart04Test015
     * @tc.desc Verify reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      arr.reverse();
      expect(arr.indexOf(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1600
     * @tc.name int8ArrayIndexOfPart04Test016
     * @tc.desc Verify reverse indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7, 8);
      arr.reverse();
      expect(arr.indexOf(8)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1700
     * @tc.name int8ArrayIndexOfPart04Test017
     * @tc.desc Verify reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(3, 3, 3);
      arr.reverse();
      expect(arr.indexOf(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1800
     * @tc.name int8ArrayIndexOfPart04Test018
     * @tc.desc Verify sort 0 indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_1900
     * @tc.name int8ArrayIndexOfPart04Test019
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(30, 10, 20);
      arr.sort();
      expect(arr.indexOf(30)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2000
     * @tc.name int8ArrayIndexOfPart04Test020
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(20, 10, 20, 10);
      arr.sort();
      expect(arr.indexOf(20)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2100
     * @tc.name int8ArrayIndexOfPart04Test021
     * @tc.desc Verify copyWithin indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3);
      expect(arr.indexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2200
     * @tc.name int8ArrayIndexOfPart04Test022
     * @tc.desc Verify copyWithin fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(9, 2, 3, 4);
      arr.copyWithin(1, 0, 1);
      expect(arr.indexOf(9, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2300
     * @tc.name int8ArrayIndexOfPart04Test023
     * @tc.desc Verify copyWithin indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7, 8);
      arr.copyWithin(0, 2, 4);
      expect(arr.indexOf(5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2400
     * @tc.name int8ArrayIndexOfPart04Test024
     * @tc.desc Verify set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      let src: Int8Array = Int8Array.of(7, 8, 9);
      arr.set(src, 0);
      expect(arr.indexOf(8)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2500
     * @tc.name int8ArrayIndexOfPart04Test025
     * @tc.desc Verify set offset indexOf offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 1, 1, 1);
      let src: Int8Array = Int8Array.of(9, 9);
      arr.set(src, 2);
      expect(arr.indexOf(9)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2600
     * @tc.name int8ArrayIndexOfPart04Test026
     * @tc.desc Verify set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 5, 5, 5);
      let src: Int8Array = Int8Array.of(5, 9);
      arr.set(src, 1);
      expect(arr.indexOf(9)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2700
     * @tc.name int8ArrayIndexOfPart04Test027
     * @tc.desc Verify indexOf +1 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 3, 5, 3, 5);
      let first: int = arr.indexOf(5);
      let second: int = arr.indexOf(5, first + 1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2800
     * @tc.name int8ArrayIndexOfPart04Test028
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 3, 5, 3, 5);
      let first: int = arr.indexOf(5);
      let second: int = arr.indexOf(5, first + 1);
      let third: int = arr.indexOf(5, second + 1);
      expect(third).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_2900
     * @tc.name int8ArrayIndexOfPart04Test029
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 3, 5);
      let first: int = arr.indexOf(5);
      let next: int = arr.indexOf(5, first + 1);
      let end: int = arr.indexOf(5, next + 1);
      expect(end).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3000
     * @tc.name int8ArrayIndexOfPart04Test030
     * @tc.desc Verify indexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2, 2, 2, 2);
      let first: int = arr.indexOf(2);
      let res: int = arr.indexOf(2, first - 3);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3100
     * @tc.name int8ArrayIndexOfPart04Test031
     * @tc.desc Verify indexOf lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 2, 4);
      let first: int = arr.indexOf(2);
      let last: int = arr.lastIndexOf(2);
      expect(last - first).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3200
     * @tc.name int8ArrayIndexOfPart04Test032
     * @tc.desc Verify 128 -128 indexOf(128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      arr.$_set(1, 128);
      expect(arr.indexOf(128)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3300
     * @tc.name int8ArrayIndexOfPart04Test033
     * @tc.desc Verify -129 127 indexOf(-129)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      arr.$_set(0, -129);
      expect(arr.indexOf(-129)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3400
     * @tc.name int8ArrayIndexOfPart04Test034
     * @tc.desc Verify 255 -1 indexOf(255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0);
      arr.$_set(2, 255);
      expect(arr.indexOf(255)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3500
     * @tc.name int8ArrayIndexOfPart04Test035
     * @tc.desc Verify 256 0 indexOf(256)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(9, 9, 9);
      arr.$_set(1, 256);
      expect(arr.indexOf(256)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3600
     * @tc.name int8ArrayIndexOfPart04Test036
     * @tc.desc Verify base.$_set view.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      base.$_set(2, 99);
      expect(view.indexOf(99)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3700
     * @tc.name int8ArrayIndexOfPart04Test037
     * @tc.desc Verify view.$_set base.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      view.$_set(0, 99);
      expect(base.indexOf(99)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3800
     * @tc.name int8ArrayIndexOfPart04Test038
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let leftView: Int8Array = base.subarray(0, 3);
      let rightView: Int8Array = base.subarray(2, 5);
      leftView.$_set(2, 77);
      expect(rightView.indexOf(77)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_3900
     * @tc.name int8ArrayIndexOfPart04Test039
     * @tc.desc Verify subarray base view.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let view: Int8Array = base.subarray(-2);
      base.$_set(4, 88);
      expect(view.indexOf(88)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4000
     * @tc.name int8ArrayIndexOfPart04Test040
     * @tc.desc Verify slice base copy.indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4);
      let copy: Int8Array = base.slice(1, 3);
      base.$_set(1, 99);
      expect(copy.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4100
     * @tc.name int8ArrayIndexOfPart04Test041
     * @tc.desc Verify subarray base.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5, 6);
      let mid: Int8Array = base.subarray(1, 5);
      let leaf: Int8Array = mid.subarray(1, 3);
      leaf.$_set(0, 42);
      expect(base.indexOf(42)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4200
     * @tc.name int8ArrayIndexOfPart04Test042
     * @tc.desc Verify subarray indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3);
      let view: Int8Array = base.subarray(1, 1);
      expect(view.indexOf(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4300
     * @tc.name int8ArrayIndexOfPart04Test043
     * @tc.desc Verify fill base base.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      view.fill(0);
      expect(base.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4400
     * @tc.name int8ArrayIndexOfPart04Test044
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let a: Int8Array = new Int8Array(buf, 0, 3);
      let b: Int8Array = new Int8Array(buf, 2, 3);
      a.$_set(2, 55);
      expect(b.indexOf(55)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4500
     * @tc.name int8ArrayIndexOfPart04Test045
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let first: Int8Array = new Int8Array(buf, 0, 3);
      let second: Int8Array = new Int8Array(buf, 3, 3);
      first.$_set(2, 77);
      expect(second.indexOf(77)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4600
     * @tc.name int8ArrayIndexOfPart04Test046
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let whole: Int8Array = new Int8Array(buf);
      let part: Int8Array = new Int8Array(buf, 1, 2);
      part.$_set(1, 33);
      expect(whole.indexOf(33)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4700
     * @tc.name int8ArrayIndexOfPart04Test047
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let fullView: Int8Array = new Int8Array(buf);
      let offsetView: Int8Array = new Int8Array(buf, 1, 4);
      fullView.$_set(0, 11);
      fullView.$_set(1, 11);
      expect(offsetView.indexOf(11)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4800
     * @tc.name int8ArrayIndexOfPart04Test048
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let a: Int8Array = new Int8Array(buf, 0, 3);
      let b: Int8Array = new Int8Array(buf, 0, 3);
      a.$_set(1, 200);
      expect(b.indexOf(-56)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_4900
     * @tc.name int8ArrayIndexOfPart04Test049
     * @tc.desc Verify $_set reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      arr.$_set(0, 9);
      arr.reverse();
      expect(arr.indexOf(9)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5000
     * @tc.name int8ArrayIndexOfPart04Test050
     * @tc.desc Verify sort $_set indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(30, 10, 20);
      arr.sort();
      arr.$_set(2, 10);
      expect(arr.indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5100
     * @tc.name int8ArrayIndexOfPart04Test051
     * @tc.desc Verify set copyWithin indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0, 0, 0);
      let src: Int8Array = Int8Array.of(1, 2, 3);
      arr.set(src, 0);
      arr.copyWithin(3, 0, 2);
      expect(arr.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5200
     * @tc.name int8ArrayIndexOfPart04Test052
     * @tc.desc Verify indexOf copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 9, 5, 5);
      let pos: int = arr.indexOf(9);
      arr.copyWithin(pos, 0, 1);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5300
     * @tc.name int8ArrayIndexOfPart04Test053
     * @tc.desc Verify $_set base.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4);
      let view: Int8Array = base.subarray(1, 3);
      view.$_set(0, 8);
      view.$_set(1, 8);
      expect(base.indexOf(8)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5400
     * @tc.name int8ArrayIndexOfPart04Test054
     * @tc.desc Verify indexOf at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let pos: int = arr.indexOf(30);
      expect(arr.at(pos)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5500
     * @tc.name int8ArrayIndexOfPart04Test055
     * @tc.desc Verify indexOf slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let pos: int = arr.indexOf(20);
      let sub: Int8Array = arr.slice(pos);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5600
     * @tc.name int8ArrayIndexOfPart04Test056
     * @tc.desc Verify indexOf with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30, 40);
      let pos: int = arr.indexOf(20);
      let modified: Int8Array = arr.with(pos, 99);
      expect(modified.indexOf(99)).assertEqual(pos);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5700
     * @tc.name int8ArrayIndexOfPart04Test057
     * @tc.desc Verify indexOf fill indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 9, 5, 9, 5);
      let pos: int = arr.indexOf(9);
      arr.fill(0, pos, pos + 1);
      expect(arr.indexOf(9)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5800
     * @tc.name int8ArrayIndexOfPart04Test058
     * @tc.desc Verify toReversed indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let rev: Int8Array = arr.toReversed();
      expect(rev.indexOf(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_5900
     * @tc.name int8ArrayIndexOfPart04Test059
     * @tc.desc Verify toSorted indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(30, 10, 20);
      let sorted: Int8Array = arr.toSorted();
      expect(sorted.indexOf(10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_6000
     * @tc.name int8ArrayIndexOfPart04Test060
     * @tc.desc Verify toSorted indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(30, 10, 20);
      arr.toSorted();
      expect(arr.indexOf(10)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_6100
     * @tc.name int8ArrayIndexOfPart04Test061
     * @tc.desc Verify with indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.with(1, 9);
      expect(arr.indexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_6200
     * @tc.name int8ArrayIndexOfPart04Test062
     * @tc.desc Verify reverse base base.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      view.reverse();
      expect(base.indexOf(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_6300
     * @tc.name int8ArrayIndexOfPart04Test063
     * @tc.desc Verify sort base base.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(5, 3, 1, 4, 2);
      let view: Int8Array = base.subarray(0, 3);
      view.sort();
      expect(base.indexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_6400
     * @tc.name int8ArrayIndexOfPart04Test064
     * @tc.desc Verify fill base view.indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexOfPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(2, 5);
      base.fill(0, 1, 4);
      expect(view.indexOf(0)).assertEqual(0);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_OF_PART04_TEST_6500
       * @tc.name int8ArrayIndexOfPart04Test065
       * @tc.desc Verify $_set no-op indexOf -1, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexOfPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = Int8Array.of(10, 20, 30);
        let threwSet: boolean = false;
        try {
          arr.$_set(5, 99);
        } catch (e) {
          threwSet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwSet).assertTrue();
        expect(arr.indexOf(99)).assertEqual(-1);
      });

});
}
