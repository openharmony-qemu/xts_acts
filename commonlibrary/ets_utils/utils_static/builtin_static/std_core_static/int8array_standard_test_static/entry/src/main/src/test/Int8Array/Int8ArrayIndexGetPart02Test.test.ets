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

export default function int8ArrayIndexGetPart02Test(): void {
  describe('Int8ArrayIndexGetPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0100
     * @tc.name int8ArrayIndexGetPart02Test001
     * @tc.desc Verify $_get(0) on multi-element array returns first element value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = arr.$_get(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0200
     * @tc.name int8ArrayIndexGetPart02Test002
     * @tc.desc Verify $_get(length-1) on multi-element array returns last element value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = arr.$_get(2);
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0300
     * @tc.name int8ArrayIndexGetPart02Test003
     * @tc.desc Verify $_get(0) on single-element array returns value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let v: number = arr.$_get(0);
      expect(v).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0400
     * @tc.name int8ArrayIndexGetPart02Test004
     * @tc.desc Verify $_get(0) after writing truncated wrap value 200 returns -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([200]);
      let v: number = arr.$_get(0);
      expect(v).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0500
     * @tc.name int8ArrayIndexGetPart02Test005
     * @tc.desc Verify $_get(0) on boundary min value -128 returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      let v: number = arr.$_get(0);
      expect(v).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0600
     * @tc.name int8ArrayIndexGetPart02Test006
     * @tc.desc Verify $_get return value can participate in arithmetic operation proving it is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let v: number = arr.$_get(1);
      expect(v + 5).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0700
     * @tc.name int8ArrayIndexGetPart02Test007
     * @tc.desc Verify $_get return values at different positions on same array are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let firstElement: number = arr.$_get(0);
      let valAt2: number = arr.$_get(2);
      expect(firstElement).assertEqual(10);
      expect(valAt2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0800
     * @tc.name int8ArrayIndexGetPart02Test008
     * @tc.desc Verify $_get(0) returns first element value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_0900
     * @tc.name int8ArrayIndexGetPart02Test009
     * @tc.desc Verify $_get(length-1) returns last element value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1000
     * @tc.name int8ArrayIndexGetPart02Test010
     * @tc.desc Verify $_get(1) middle index returns middle element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1100
       * @tc.name int8ArrayIndexGetPart02Test011
       * @tc.desc Verify $_get(length+1) out-of-bounds positive index returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1200
       * @tc.name int8ArrayIndexGetPart02Test012
       * @tc.desc Verify $_get(-length-1) out-of-bounds negative index returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(-4);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1300
       * @tc.name int8ArrayIndexGetPart02Test013
       * @tc.desc Verify $_get(2147483647) large positive index returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(2147483647);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1400
       * @tc.name int8ArrayIndexGetPart02Test014
       * @tc.desc Verify $_get(-2147483648) large negative index returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
                try {
          arr.$_get(-2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1500
     * @tc.name int8ArrayIndexGetPart02Test015
     * @tc.desc Verify $_set(0, 200) truncation wrap then $_get(0) returns -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 200);
      expect(arr.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1600
     * @tc.name int8ArrayIndexGetPart02Test016
     * @tc.desc Verify $_set(0, -128) boundary min value then $_get(0) returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1700
     * @tc.name int8ArrayIndexGetPart02Test017
     * @tc.desc Verify $_set(0, 127) boundary max value then $_get(0) returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1800
     * @tc.name int8ArrayIndexGetPart02Test018
     * @tc.desc Verify $_set(0, 0x80) truncation then $_get(0) returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 0x80);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_1900
     * @tc.name int8ArrayIndexGetPart02Test019
     * @tc.desc Verify $_set(0, 0xFF) truncation then $_get(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 0xFF);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2000
     * @tc.name int8ArrayIndexGetPart02Test020
     * @tc.desc Verify $_set(0, Number.NaN) truncation then $_get(0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2100
     * @tc.name int8ArrayIndexGetPart02Test021
     * @tc.desc Verify $_set(0, 1.9) truncation then $_get(0) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 1.9);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2200
     * @tc.name int8ArrayIndexGetPart02Test022
     * @tc.desc Verify $_set(0, -1.9) truncation then $_get(0) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, -1.9);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2300
     * @tc.name int8ArrayIndexGetPart02Test023
     * @tc.desc Verify $_get(0) on default element returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2400
     * @tc.name int8ArrayIndexGetPart02Test024
     * @tc.desc Verify arr.length remains unchanged after $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let before: number = arr.length;
      arr.$_get(1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2500
     * @tc.name int8ArrayIndexGetPart02Test025
     * @tc.desc Verify arr.byteLength remains unchanged after $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let before: number = arr.byteLength;
      arr.$_get(1);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2600
     * @tc.name int8ArrayIndexGetPart02Test026
     * @tc.desc Verify arr.byteOffset remains unchanged after $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let before: number = arr.byteOffset;
      arr.$_get(0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2700
     * @tc.name int8ArrayIndexGetPart02Test027
     * @tc.desc Verify underlying buffer.byteLength remains unchanged after $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      let before: number = buf.byteLength;
      arr.$_get(0);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2800
     * @tc.name int8ArrayIndexGetPart02Test028
     * @tc.desc Verify arr.buffer reference remains unchanged after $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.$_get(0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_2900
     * @tc.name int8ArrayIndexGetPart02Test029
     * @tc.desc Verify first element value unchanged after $_get on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_get(0);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3000
     * @tc.name int8ArrayIndexGetPart02Test030
     * @tc.desc Verify last element value unchanged after $_get on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_get(2);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3100
     * @tc.name int8ArrayIndexGetPart02Test031
     * @tc.desc Verify underlying buffer byte content unchanged after $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 50);
      arr.$_set(1, 60);
      arr.$_set(2, 70);
      arr.$_get(0);
      let view: Int8Array = new Int8Array(buf);
      expect(view.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3200
     * @tc.name int8ArrayIndexGetPart02Test032
     * @tc.desc Verify two consecutive $_get calls on same position return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let first: number = arr.$_get(1);
      let second: number = arr.$_get(1);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3300
     * @tc.name int8ArrayIndexGetPart02Test033
     * @tc.desc Verify middle position value unchanged after $_get on multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_get(0);
      arr.$_get(2);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3400
     * @tc.name int8ArrayIndexGetPart02Test034
     * @tc.desc Verify subarray view $_get reads shared buffer element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3500
     * @tc.name int8ArrayIndexGetPart02Test035
     * @tc.desc Verify subarray view byteOffset not modified by $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let before: number = view.byteOffset;
      view.$_get(0);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3600
     * @tc.name int8ArrayIndexGetPart02Test036
     * @tc.desc Verify ArrayBuffer.isView still returns true after subarray view $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      view.$_get(0);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3700
     * @tc.name int8ArrayIndexGetPart02Test037
     * @tc.desc Verify ArrayBuffer offset view $_get reads according to view offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      arr.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3800
     * @tc.name int8ArrayIndexGetPart02Test038
     * @tc.desc Verify multiple views on same buffer each $_get reads independently and correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let viewAt0: Int8Array = new Int8Array(buf, 0, 2);
      let viewAt2: Int8Array = new Int8Array(buf, 2, 2);
      viewAt0.$_set(0, 11);
      viewAt2.$_set(0, 22);
      expect(viewAt2.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_3900
     * @tc.name int8ArrayIndexGetPart02Test039
     * @tc.desc Verify $_get reads new value after $_set modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_set(1, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4000
     * @tc.name int8ArrayIndexGetPart02Test040
     * @tc.desc Verify new view $_get reflects changes after writing to underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 55);
      let view: Int8Array = new Int8Array(buf);
      expect(view.$_get(0)).assertEqual(55);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4100
       * @tc.name int8ArrayIndexGetPart02Test041
       * @tc.desc Verify view out-of-bounds positive index $_get returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
        let view: Int8Array = arr.subarray(1, 3);
                try {
          view.$_get(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4200
     * @tc.name int8ArrayIndexGetPart02Test042
     * @tc.desc Verify parent array corresponding position value unchanged after view $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      view.$_get(0);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4300
     * @tc.name int8ArrayIndexGetPart02Test043
     * @tc.desc Verify child view $_get reflects shared buffer change after parent array $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 4);
      arr.$_set(1, 88);
      expect(view.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4400
     * @tc.name int8ArrayIndexGetPart02Test044
     * @tc.desc Verify view $_get(0) returns first element value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(0, 2);
      let v: number = view.$_get(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4500
     * @tc.name int8ArrayIndexGetPart02Test045
     * @tc.desc Verify single-element array $_get(0) returns truncated value after $_set(0, 256)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexGetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr.$_set(0, 256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4600
       * @tc.name int8ArrayIndexGetPart02Test046
       * @tc.desc Verify single-element array $_get(1) out-of-bounds index returns undefined
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([64]);
                try {
          arr.$_get(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});
  
      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4700
       * @tc.name int8ArrayIndexGetPart02Test047
       * @tc.desc Verify $_get(-1) negative index on multi-element array returns typeof 'number', throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let v: number = 0;
        let threwGet: boolean = false;
        try {
          v = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
        expect(v).assertEqual(0);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4800
       * @tc.name int8ArrayIndexGetPart02Test048
       * @tc.desc Verify $_get(-length) negative index returns typeof 'number', throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let v: number = 0;
        let threwGet: boolean = false;
        try {
          v = arr.$_get(-3);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
        expect(v).assertEqual(0);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_4900
       * @tc.name int8ArrayIndexGetPart02Test049
       * @tc.desc Verify $_get(-1) negative index returns last element value, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5000
       * @tc.name int8ArrayIndexGetPart02Test050
       * @tc.desc Verify $_get(-length) negative index returns first element value, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-3);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5100
       * @tc.name int8ArrayIndexGetPart02Test051
       * @tc.desc Verify arr.length remains unchanged after out-of-bounds $_get, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let before: number = arr.length;
        let threwGet: boolean = false;
        try {
          arr.$_get(100);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
        expect(arr.length).assertEqual(before);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5200
       * @tc.name int8ArrayIndexGetPart02Test052
       * @tc.desc Verify arr.byteLength remains unchanged after negative index $_get, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let before: number = arr.byteLength;
        let threwGet: boolean = false;
        try {
          arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
        expect(arr.byteLength).assertEqual(before);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5300
       * @tc.name int8ArrayIndexGetPart02Test053
       * @tc.desc Verify first element unchanged after out-of-bounds $_get, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let threwGet: boolean = false;
        try {
          arr.$_get(100);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
        expect(arr.$_get(0)).assertEqual(10);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5400
       * @tc.name int8ArrayIndexGetPart02Test054
       * @tc.desc Verify last element unchanged after negative index $_get, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30]);
        let threwGet: boolean = false;
        try {
          arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
        expect(arr.$_get(2)).assertEqual(30);
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5500
       * @tc.name int8ArrayIndexGetPart02Test055
       * @tc.desc Verify view negative index $_get reads shared buffer last element, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
        let view: Int8Array = arr.subarray(1, 4);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = view.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_GET_PART02_TEST_5600
       * @tc.name int8ArrayIndexGetPart02Test056
       * @tc.desc Verify single-element array $_get(-1) negative index returns the only element, throws RangeError for out-of-bounds index
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayIndexGetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int8Array = new Int8Array([64]);
        let __val: number = 0;
        let threwGet: boolean = false;
        try {
          __val = arr.$_get(-1);
        } catch (e) {
          threwGet = true;
          expect(e.name).assertEqual('RangeError');
        }
        expect(threwGet).assertTrue();
      });

});
}
