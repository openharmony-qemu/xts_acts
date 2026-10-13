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

export default function int8ArraySetPart07Test(): void {
  describe('Int8ArraySetPart07Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0100
     * @tc.name int8ArraySetPart07Test001
     * @tc.desc Verify arity 1 set(source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      const src: Int8Array = new Int8Array([7, 8, 9]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 7;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0300
     * @tc.name int8ArraySetPart07Test003
     * @tc.desc Verify set(empty src) leaves destination unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([11, 22, 33]);
      const src: Int8Array = new Int8Array([]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: int = 22;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0400
     * @tc.name int8ArraySetPart07Test004
     * @tc.desc Verify set on empty arrays keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([]);
      const src: Int8Array = new Int8Array([]);
      dst.set(src);
      let result: int = dst.length;
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0500
     * @tc.name int8ArraySetPart07Test005
     * @tc.desc Verify set() copies FixedArray source elements to Int8Array target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([99]);
      const src: Int8Array = new Int8Array([42]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0600
     * @tc.name int8ArraySetPart07Test006
     * @tc.desc Verify set index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([11, 22, 33]);
      const src: Int8Array = new Int8Array([42]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 33;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0700
     * @tc.name int8ArraySetPart07Test007
     * @tc.desc Verify set(src) copies elements into destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      const src: Int8Array = new Int8Array([1, 2, 3]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0800
     * @tc.name int8ArraySetPart07Test008
     * @tc.desc Verify set == - 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([11, 22, 33]);
      const src: Int8Array = new Int8Array([1, 2]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 33;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_0900
     * @tc.name int8ArraySetPart07Test009
     * @tc.desc Verify set(Int8Array[2,4,2]) copies three-element Int8Array source to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([10, 20, 30, 40]);
      const src: Int8Array = new Int8Array([1, 2]);
      dst.set(src);
      let result: number = dst.$_get(3);
      let expected: int = 40;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1000
     * @tc.name int8ArraySetPart07Test010
     * @tc.desc Verify set 127 int8 max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0]);
      const src: Int8Array = new Int8Array([INT8_MAX]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: number = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1100
     * @tc.name int8ArraySetPart07Test011
     * @tc.desc Verify set -128 int8 min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0]);
      const src: Int8Array = new Int8Array([INT8_MIN]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: number = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1200
     * @tc.name int8ArraySetPart07Test012
     * @tc.desc Verify set(Int8Array[0]) copies zero from source Int8Array to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([9]);
      const src: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1300
     * @tc.name int8ArraySetPart07Test013
     * @tc.desc Verify set(Int8Array[-1]) copies -1 from source Int8Array to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0]);
      const src: Int8Array = new Int8Array([-1]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1400
     * @tc.name int8ArraySetPart07Test014
     * @tc.desc Verify set [127, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0]);
      const src: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: number = INT8_MIN;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1500
     * @tc.name int8ArraySetPart07Test015
     * @tc.desc Verify set [-128, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0]);
      const src: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: number = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1600
     * @tc.name int8ArraySetPart07Test016
     * @tc.desc Verify set copies Int8Array.of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = Int8Array.of(15, 25);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 15;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1700
     * @tc.name int8ArraySetPart07Test017
     * @tc.desc Verify set copies Int8Array.from elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromArr: Array<number> = [35, 45];
      const src: Int8Array = Int8Array.from(fromArr);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: int = 45;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1800
     * @tc.name int8ArraySetPart07Test018
     * @tc.desc Verify new Int8Array(ArrayBuffer, byteOffset, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const src: Int8Array = new Int8Array(buf, 0, 3);
      src.$_set(0, 8);
      src.$_set(1, 9);
      src.$_set(2, 10);
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_1900
     * @tc.name int8ArraySetPart07Test019
     * @tc.desc Verify set Int8Array source writes zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(3);
      const dst: Int8Array = new Int8Array([7, 8, 9]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2000
     * @tc.name int8ArraySetPart07Test020
     * @tc.desc Verify set(Int8Array[0,0,0]) overwrites target elements to zero from Int8Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0, 0, 0]);
      const dst: Int8Array = new Int8Array([5, 5, 5]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2100
     * @tc.name int8ArraySetPart07Test021
     * @tc.desc Verify set(Int8Array[-1,-1,-1]) overwrites target elements to -1 from Int8Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-1, -1, -1]);
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: int = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2200
     * @tc.name int8ArraySetPart07Test022
     * @tc.desc Verify set(Int8Array[INT8_MAX,INT8_MAX]) copies INT8_MAX values from Int8Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([INT8_MAX, INT8_MAX]);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: number = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2300
     * @tc.name int8ArraySetPart07Test023
     * @tc.desc Verify set [1, -1, 2, -2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, -1, 2, -2]);
      const dst: Int8Array = new Int8Array([0, 0, 0, 0]);
      dst.set(src);
      let result: number = dst.$_get(3);
      let expected: int = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2400
     * @tc.name int8ArraySetPart07Test024
     * @tc.desc Verify set 0/-1 [0, -1, 0, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0, -1, 0, -1]);
      const dst: Int8Array = new Int8Array([9, 9, 9, 9]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2700
     * @tc.name int8ArraySetPart07Test027
     * @tc.desc Verify set keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const before: number = dst.byteLength;
      dst.set(src);
      let result: int = dst.byteLength;
      let expected = before;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2800
     * @tc.name int8ArraySetPart07Test028
     * @tc.desc Verify set() preserves source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0]);
      const src: Int8Array = new Int8Array([6, 7]);
      const before: number = src.length;
      dst.set(src);
      let result: int = src.length;
      let expected = before;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_2900
     * @tc.name int8ArraySetPart07Test029
     * @tc.desc Verify set() does not modify source Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0]);
      const src: Int8Array = new Int8Array([6, 7]);
      dst.set(src);
      let result: number = src.$_get(1);
      let expected: int = 7;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_3100
     * @tc.name int8ArraySetPart07Test031
     * @tc.desc Verify set() copies first source element into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([88, 88]);
      const src: Int8Array = new Int8Array([12, 13]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 12;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_3200
     * @tc.name int8ArraySetPart07Test032
     * @tc.desc Verify set overwrites target elements on second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      const src1: Int8Array = new Int8Array([1, 2]);
      dst.set(src1);
      const src2: Int8Array = new Int8Array([10]);
      dst.set(src2);
      let result: number = dst.$_get(0);
      let expected: int = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_3600
     * @tc.name int8ArraySetPart07Test036
     * @tc.desc Verify set RangeError leaves target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([11, 22]);
      const src: Int8Array = new Int8Array([1, 2, 3]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultAfterCatch: number = dst.$_get(0);
      let expectedAfterCatch: int = 11;
      expect(resultAfterCatch).assertEqual(expectedAfterCatch);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_3700
     * @tc.name int8ArraySetPart07Test037
     * @tc.desc Verify set RangeError leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0]);
      const src: Int8Array = new Int8Array([5, 6, 7]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultAfterCatch: number = src.$_get(2);
      let expectedAfterCatch: int = 7;
      expect(resultAfterCatch).assertEqual(expectedAfterCatch);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_3800
     * @tc.name int8ArraySetPart07Test038
     * @tc.desc Verify set RangeError keeps destination length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([11, 22]);
      const src: Int8Array = new Int8Array([1, 2, 3]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultAfterCatch: int = dst.length;
      let expectedAfterCatch: int = 2;
      expect(resultAfterCatch).assertEqual(expectedAfterCatch);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_3900
     * @tc.name int8ArraySetPart07Test039
     * @tc.desc Verify [-129] 127 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-129]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: number = INT8_MAX;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4000
     * @tc.name int8ArraySetPart07Test040
     * @tc.desc Verify [256] 0 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([256]);
      const dst: Int8Array = new Int8Array([9]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4100
     * @tc.name int8ArraySetPart07Test041
     * @tc.desc Verify [0x81] -127 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0x81]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = -127;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4200
     * @tc.name int8ArraySetPart07Test042
     * @tc.desc Verify [0xFF] -1 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0xff]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4300
     * @tc.name int8ArraySetPart07Test043
     * @tc.desc Verify [0x100] 0 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0x100]);
      const dst: Int8Array = new Int8Array([8]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4400
     * @tc.name int8ArraySetPart07Test044
     * @tc.desc Verify [1.9] 1 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1.9]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4500
     * @tc.name int8ArraySetPart07Test045
     * @tc.desc Verify [-1.9] -1 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-1.9]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4600
     * @tc.name int8ArraySetPart07Test046
     * @tc.desc Verify [-0.0] 0 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-0.0]);
      const dst: Int8Array = new Int8Array([5]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4700
     * @tc.name int8ArraySetPart07Test047
     * @tc.desc Verify [3.7] 3 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([3.7]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4800
     * @tc.name int8ArraySetPart07Test048
     * @tc.desc Verify [-3.7] -3 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-3.7]);
      const dst: Int8Array = new Int8Array([0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = -3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_4900
     * @tc.name int8ArraySetPart07Test049
     * @tc.desc Verify set copies subarray(0, 2) elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30, 40]);
      const src: Int8Array = base.subarray(0, 2);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5000
     * @tc.name int8ArraySetPart07Test050
     * @tc.desc Verify set copies subarray(1, 3) elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30, 40]);
      const src: Int8Array = base.subarray(1, 3);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: int = 30;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5100
     * @tc.name int8ArraySetPart07Test051
     * @tc.desc Verify set copies slice elements into destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([1, 2, 3, 4]);
      const src: Int8Array = base.slice(1, 3);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5200
     * @tc.name int8ArraySetPart07Test052
     * @tc.desc Verify set() copies values between views sharing one buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dst: Int8Array = new Int8Array(buf, 0, 4);
      const src: Int8Array = new Int8Array(buf, 4, 4);
      src.$_set(0, 10);
      src.$_set(1, 20);
      src.$_set(2, 30);
      src.$_set(3, 40);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5300
     * @tc.name int8ArraySetPart07Test053
     * @tc.desc Verify set handles overlapping buffer views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const dst: Int8Array = new Int8Array(buf, 0, 4);
      const src: Int8Array = new Int8Array(buf, 2, 4);
      src.$_set(0, 11);
      src.$_set(1, 22);
      src.$_set(2, 33);
      src.$_set(3, 44);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 11;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5400
     * @tc.name int8ArraySetPart07Test054
     * @tc.desc Verify set with itself as source keeps values intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([1, 2, 3]);
      dst.set(dst);
      let result: number = dst.$_get(0);
      let expected: int = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5500
     * @tc.name int8ArraySetPart07Test055
     * @tc.desc Verify set copies values so later source change has no effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 6]);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      src.$_set(0, 99);
      let result: number = dst.$_get(0);
      let expected: int = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5600
     * @tc.name int8ArraySetPart07Test056
     * @tc.desc Verify repeated set reflects source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2]);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      src.$_set(0, 77);
      dst.set(src);
      let result: number = dst.$_get(0);
      let expected: int = 77;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5700
     * @tc.name int8ArraySetPart07Test057
     * @tc.desc Verify Int8Array slice set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([1, 2, 3, 4]);
      const src: Int8Array = base.slice(0, 2);
      src.$_set(0, 50);
      src.$_set(1, 60);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      let result: number = dst.$_get(1);
      let expected: int = 60;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5800
     * @tc.name int8ArraySetPart07Test058
     * @tc.desc Verify set then $_set writes value 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7, 8]);
      const dst: Int8Array = new Int8Array([0, 0]);
      dst.set(src);
      dst.$_set(1, 99);
      let result: number = dst.$_get(1);
      let expected: int = 99;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_5900
     * @tc.name int8ArraySetPart07Test059
     * @tc.desc Verify set leaves untouched elements after written region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      const src1: Int8Array = new Int8Array([1, 2]);
      dst.set(src1);
      const src2: Int8Array = new Int8Array([10]);
      dst.set(src2);
      let result: number = dst.$_get(1);
      let expected: int = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_6000
     * @tc.name int8ArraySetPart07Test060
     * @tc.desc Verify set copies 100 element array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(100);
      src.$_set(0, 42);
      src.$_set(99, -42);
      const dst: Int8Array = new Int8Array(100);
      dst.set(src);
      let result: number = dst.$_get(99);
      let expected: int = -42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_6100
     * @tc.name int8ArraySetPart07Test061
     * @tc.desc Verify set writes visible via at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      dst.set(src);
      let result = dst.at(-1);
      let expected: int = 3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART07_TEST_6200
     * @tc.name int8ArraySetPart07Test062
     * @tc.desc Verify set copies Int8Array.from(base) elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart07Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([3, 4, 5]);
      const src: Int8Array = Int8Array.from(base);
      const dst: Int8Array = new Int8Array([0, 0, 0]);
      dst.set(src);
      let result: number = dst.$_get(2);
      let expected: int = 5;
      expect(result).assertEqual(expected);
    });
  });
}
