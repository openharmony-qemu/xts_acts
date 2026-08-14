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

export default function int8ArrayAtPart02Test(): void {
  describe('Int8ArrayAtPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0100
     * @tc.name int8ArrayAtPart02Test001
     * @tc.desc Verify at(0) legal positive index returns typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(typeof arr.at(0)).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0200
     * @tc.name int8ArrayAtPart02Test002
     * @tc.desc Verify at(length) just out-of-bounds positive index returns typeof 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(typeof arr.at(3)).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0300
     * @tc.name int8ArrayAtPart02Test003
     * @tc.desc Verify at(0) on empty array returns typeof 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      expect(typeof arr.at(0)).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0400
     * @tc.name int8ArrayAtPart02Test004
     * @tc.desc Verify at(0) on single-element array returns typeof 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      expect(typeof arr.at(0)).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0500
     * @tc.name int8ArrayAtPart02Test005
     * @tc.desc Verify at(0) reads int8 max value 127 precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      expect(arr.at(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0600
     * @tc.name int8ArrayAtPart02Test006
     * @tc.desc Verify at(middle index) reads middle element value precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0700
     * @tc.name int8ArrayAtPart02Test007
     * @tc.desc Verify $_set(0, 200) then at(0) reads truncated wraparound value -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      arr.$_set(0, 200);
      expect(arr.at(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0800
     * @tc.name int8ArrayAtPart02Test008
     * @tc.desc Verify $_set(0, Float.NaN) then at(0) reads converted value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      arr.$_set(0, Float.NaN);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_0900
     * @tc.name int8ArrayAtPart02Test009
     * @tc.desc Verify $_set(0, Float.POSITIVE_INFINITY) then at(0) reads converted value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      arr.$_set(0, Float.POSITIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1000
     * @tc.name int8ArrayAtPart02Test010
     * @tc.desc Verify $_set(0, Float.NEGATIVE_INFINITY) then at(0) reads converted value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      arr.$_set(0, Float.NEGATIVE_INFINITY);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1100
     * @tc.name int8ArrayAtPart02Test011
     * @tc.desc Verify arr.length remains 3 after at(0) call (at() does not mutate array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.length).assertEqual(3);
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1200
     * @tc.name int8ArrayAtPart02Test012
     * @tc.desc Verify view byteOffset unchanged after at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 2, 4);
      expect(view.at(0)).assertEqual(0);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1300
     * @tc.name int8ArrayAtPart02Test013
     * @tc.desc Verify arr.length unchanged after multiple at() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(-1)).assertEqual(30);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1400
     * @tc.name int8ArrayAtPart02Test014
     * @tc.desc Verify multiple elements content unchanged after multiple at() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.at(0);
      arr.at(1);
      arr.at(2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1500
     * @tc.name int8ArrayAtPart02Test015
     * @tc.desc Verify parent array content at corresponding position unchanged after view at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      let view = arr.subarray(1, 4);
      view.at(0);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1600
     * @tc.name int8ArrayAtPart02Test016
     * @tc.desc Verify at(0) on subarray view returns view start element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      let view = arr.subarray(1, 4);
      expect(view.at(0)).assertEqual(20);
      expect(view.at(0)).assertEqual(view.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1700
     * @tc.name int8ArrayAtPart02Test017
     * @tc.desc Verify at(0) on view with byteOffset returns element at offset position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let full = new Int8Array(buf);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      let view = new Int8Array(buf, 1, 3);
      expect(view.at(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1800
     * @tc.name int8ArrayAtPart02Test018
     * @tc.desc Verify view at() reflects new value after writing parent array (shared buffer read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      let view = arr.subarray(1, 4);
      arr.$_set(1, 99);
      expect(view.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_1900
     * @tc.name int8ArrayAtPart02Test019
     * @tc.desc Verify at() on slice copy does not reflect parent modification (independent buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let copy = arr.slice(0, 3);
      arr.$_set(0, 99);
      expect(copy.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2000
     * @tc.name int8ArrayAtPart02Test020
     * @tc.desc Verify at(0) on view with byteOffset reads element at specified offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let full = new Int8Array(buf);
      full.$_set(3, 77);
      let view = new Int8Array(buf, 3, 2);
      expect(view.at(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2100
     * @tc.name int8ArrayAtPart02Test021
     * @tc.desc Verify subarray view at(0) returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let view = arr.subarray(0, 2);
      expect(typeof view.at(0)).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2200
     * @tc.name int8ArrayAtPart02Test022
     * @tc.desc Verify view byteOffset then at reads element at offset position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int8Array(buf, 4, 2);
      expect(view.byteOffset).assertEqual(4);
      let full = new Int8Array(buf);
      full.$_set(4, 55);
      expect(view.at(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2300
     * @tc.name int8ArrayAtPart02Test023
     * @tc.desc Verify at(0) on zero-length view returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let view = arr.subarray(1, 1);
      expect(view.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2400
     * @tc.name int8ArrayAtPart02Test024
     * @tc.desc Verify at() on full-buffer view equals parent at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let view = new Int8Array(arr.buffer);
      expect(view.at(2)).assertEqual(arr.at(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2500
     * @tc.name int8ArrayAtPart02Test025
     * @tc.desc Verify view and parent return same value at overlapping position via at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30, 40, 50]);
      let view = arr.subarray(2, 5);
      expect(view.at(0)).assertEqual(arr.at(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2600
     * @tc.name int8ArrayAtPart02Test026
     * @tc.desc Verify multiple views sharing same buffer return consistent value via at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let viewA = new Int8Array(buf);
      let viewB = new Int8Array(buf);
      viewA.$_set(0, 33);
      expect(viewB.at(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2700
     * @tc.name int8ArrayAtPart02Test027
     * @tc.desc Verify at(0) equals $_get(0) (at equivalent to subscript read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.at(0)).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2800
     * @tc.name int8ArrayAtPart02Test028
     * @tc.desc Verify two consecutive at() calls return equal value (deterministic read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let first = arr.at(1);
      let second = arr.at(1);
      expect(first).assertEqual(20);
      expect(second).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_2900
     * @tc.name int8ArrayAtPart02Test029
     * @tc.desc Verify at(0) equals at(-length) return same first element (positive negative index consistency)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(-3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_3000
     * @tc.name int8ArrayAtPart02Test030
     * @tc.desc Verify at(out-of-bounds) returns undefined to distinguish from zero value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      expect(arr.at(5)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_3100
     * @tc.name int8ArrayAtPart02Test031
     * @tc.desc Verify at(0) returns 0 not undefined when element is 0 (zero value not out-of-bounds)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0, 0, 0]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_3200
     * @tc.name int8ArrayAtPart02Test032
     * @tc.desc Verify at(-length-1) on single-element zero array returns undefined (negative out-of-bounds vs zero distinction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      expect(arr.at(-2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_3300
     * @tc.name int8ArrayAtPart02Test033
     * @tc.desc Verify at(0) on Int8Array.of constructed array returns first argument value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33);
      expect(arr.at(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_3400
     * @tc.name int8ArrayAtPart02Test034
     * @tc.desc Verify at(0) on Int8Array.from array source returns source first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [5, 10, 15];
      let arr = Int8Array.from(src);
      expect(arr.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_AT_PART02_3500
     * @tc.name int8ArrayAtPart02Test035
     * @tc.desc Verify at(0) on Int8Array.from empty source returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayAtPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let arr = Int8Array.from(src);
      expect(arr.at(0)).assertUndefined();
    });
  });
}
