'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArraySlicePart02Test(): void {
  describe('Int32ArraySlicePart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0100
     * @tc.name int32ArraySlicePart02Test001
     * @tc.desc Verify slice returns an independent length-5 copy with matching endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
      let independent: boolean = r.buffer !== arr.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0200
     * @tc.name int32ArraySlicePart02Test002
     * @tc.desc Verify slice from index 1 returns an independent copy containing 20 and 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.slice(1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(30);
      let independent: boolean = r.buffer !== arr.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0300
     * @tc.name int32ArraySlicePart02Test003
     * @tc.desc Verify slice from index 1 to 3 returns an independent copy containing 20 and 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(30);
      let independent: boolean = r.buffer !== arr.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0400
     * @tc.name int32ArraySlicePart02Test004
     * @tc.desc Verify slice() returns an independent Int32Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
      r.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0500
     * @tc.name int32ArraySlicePart02Test005
     * @tc.desc Verify slice() returns an independent Int32Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(arr.length);
      expect(r.$_get(1)).assertEqual(2);
      r.$_set(1, 88);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0600
     * @tc.name int32ArraySlicePart02Test006
     * @tc.desc Verify slice of an empty Int32Array returns an independent empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(0);
      let independent: boolean = r.buffer !== arr.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0700
     * @tc.name int32ArraySlicePart02Test007
     * @tc.desc Verify slice returns an empty Int32Array when begin is greater than end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice(2, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0800
     * @tc.name int32ArraySlicePart02Test008
     * @tc.desc Verify slice with negative bounds returns 30 and 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.slice(-3, -1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_0900
     * @tc.name int32ArraySlicePart02Test009
     * @tc.desc Verify slice returns an independent single-element copy containing 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(99);
      let independent: boolean = r.buffer !== arr.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1000
     * @tc.name int32ArraySlicePart02Test010
     * @tc.desc Verify slice returns an independent copy with the same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(arr.length);
      expect(r.$_get(0)).assertEqual(arr.$_get(0));
      r.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1100
     * @tc.name int32ArraySlicePart02Test011
     * @tc.desc Verify slice copies all values from an offset view into an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      view.$_set(3, 44);
      let r: Int32Array = view.slice();
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(3)).assertEqual(44);
      let independent: boolean = r.buffer !== view.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1200
     * @tc.name int32ArraySlicePart02Test012
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      expect(ArrayBuffer.isView(r)).assertTrue();
      expect(r.byteOffset).assertEqual(0);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1300
     * @tc.name int32ArraySlicePart02Test013
     * @tc.desc Verify slice() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(0);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1400
     * @tc.name int32ArraySlicePart02Test014
     * @tc.desc Verify begin==end BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: Int32Array = arr.slice(2, 2);
      expect(r.length).assertEqual(0);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1500
     * @tc.name int32ArraySlicePart02Test015
     * @tc.desc Verify slice(begin,e) BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: Int32Array = arr.slice(1, 2);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1600
     * @tc.name int32ArraySlicePart02Test016
     * @tc.desc Verify slice() copies two elements with a byteLength of 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(2);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1700
     * @tc.name int32ArraySlicePart02Test017
     * @tc.desc Verify begin>=end ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice(3, 2);
      expect(ArrayBuffer.isView(r)).assertTrue();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1800
     * @tc.name int32ArraySlicePart02Test018
     * @tc.desc Verify offset slice ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 12, 3);
      let r: Int32Array = view.slice();
      expect(ArrayBuffer.isView(r)).assertTrue();
      expect(r.length).assertEqual(3);
      expect(r.byteOffset).assertEqual(0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_1900
     * @tc.name int32ArraySlicePart02Test019
     * @tc.desc Verify slice() !==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      let _d: boolean = r !== arr;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2000
     * @tc.name int32ArraySlicePart02Test020
     * @tc.desc Verify slice() buffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.slice();
      let _d: boolean = r.buffer !== arr.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2100
     * @tc.name int32ArraySlicePart02Test021
     * @tc.desc Verify slice() creates an independent backing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      r.$_set(0, 66);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2200
     * @tc.name int32ArraySlicePart02Test022
     * @tc.desc Verify slice(begin,e) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.slice(2, 4);
      expect(r.byteOffset).assertEqual(0);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(r.length - 1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2300
     * @tc.name int32ArraySlicePart02Test023
     * @tc.desc Verify begin>=end byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice(2, 2);
      expect(r.byteOffset).assertEqual(0);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2400
     * @tc.name int32ArraySlicePart02Test024
     * @tc.desc Verify 5 slice() byteLength = 5*4 = 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.slice();
      expect(r.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2500
     * @tc.name int32ArraySlicePart02Test025
     * @tc.desc Verify slice(1,3) 2 byteLength = 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.slice(1, 3);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2600
     * @tc.name int32ArraySlicePart02Test026
     * @tc.desc Verify begin>=end byteLength = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice(3, 1);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2700
     * @tc.name int32ArraySlicePart02Test027
     * @tc.desc Verify byteLength = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let r: Int32Array = arr.slice(0, 1);
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2800
     * @tc.name int32ArraySlicePart02Test028
     * @tc.desc Verify slice byteLength length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let r: Int32Array = arr.slice(2, 5);
      expect(r.byteLength).assertEqual(r.length * r.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_2900
     * @tc.name int32ArraySlicePart02Test029
     * @tc.desc Verify 6 slice() length = 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3000
     * @tc.name int32ArraySlicePart02Test030
     * @tc.desc Verify slice(0,0) length = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3100
     * @tc.name int32ArraySlicePart02Test031
     * @tc.desc Verify slice(length, length) length = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.slice(4, 4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3200
     * @tc.name int32ArraySlicePart02Test032
     * @tc.desc Verify slice() length = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.slice();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3300
     * @tc.name int32ArraySlicePart02Test033
     * @tc.desc Verify slice(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.slice(0);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
      expect(r.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3400
     * @tc.name int32ArraySlicePart02Test034
     * @tc.desc Verify slice() INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -1);
      let r: Int32Array = arr.slice();
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3500
     * @tc.name int32ArraySlicePart02Test035
     * @tc.desc Verify slice() INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0);
      let r: Int32Array = arr.slice();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3600
     * @tc.name int32ArraySlicePart02Test036
     * @tc.desc Verify slice() 0/-1/1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 1);
      let r: Int32Array = arr.slice();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3700
     * @tc.name int32ArraySlicePart02Test037
     * @tc.desc Verify slice() -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: Int32Array = arr.slice();
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3800
     * @tc.name int32ArraySlicePart02Test038
     * @tc.desc Verify slice(0) Int32Array.from(arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r1: Int32Array = arr.slice(0);
      let r2: Int32Array = Int32Array.from(arr);
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_3900
     * @tc.name int32ArraySlicePart02Test039
     * @tc.desc Verify slice(0) Int32Array.from(arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r1: Int32Array = arr.slice(0);
      let r2: Int32Array = Int32Array.from(arr);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
      expect(r1.$_get(2)).assertEqual(r2.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4000
     * @tc.name int32ArraySlicePart02Test040
     * @tc.desc Verify slice(0) Int32Array.from(arr) Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r1: Int32Array = arr.slice(0);
      let r2: Int32Array = Int32Array.from(arr);
      let _d: boolean = r1.buffer !== r2.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4100
     * @tc.name int32ArraySlicePart02Test041
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let before: int = arr.length;
      arr.slice();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4200
     * @tc.name int32ArraySlicePart02Test042
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      arr.slice(1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4300
     * @tc.name int32ArraySlicePart02Test043
     * @tc.desc Verify slice() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.slice();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4400
     * @tc.name int32ArraySlicePart02Test044
     * @tc.desc Verify begin byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let before: int = arr.byteLength;
      arr.slice(-2);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4500
     * @tc.name int32ArraySlicePart02Test045
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.slice();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4600
     * @tc.name int32ArraySlicePart02Test046
     * @tc.desc Verify a full slice is independent when the result is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      let before: int = view.byteOffset;
      view.slice();
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4700
     * @tc.name int32ArraySlicePart02Test047
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      r.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4800
     * @tc.name int32ArraySlicePart02Test048
     * @tc.desc Verify a full slice preserves the source value after source mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.slice(1, 3);
      r.$_set(0, 777);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_4900
     * @tc.name int32ArraySlicePart02Test049
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      arr.$_set(1, 888);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5000
     * @tc.name int32ArraySlicePart02Test050
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      let r: Int32Array = arr.slice();
      let src: Int32Array = new Int32Array(r.buffer);
      src.$_set(0, 111);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5100
     * @tc.name int32ArraySlicePart02Test051
     * @tc.desc Verify byteOffset slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let r: Int32Array = view.slice();
      r.$_set(0, 9999);
      expect(view.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5200
     * @tc.name int32ArraySlicePart02Test052
     * @tc.desc Verify ArrayBuffer slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: ArrayBuffer = new ArrayBuffer(40);
      let firstVal: Int32Array = new Int32Array(big, 0, 5);
      let secondVal: Int32Array = new Int32Array(big, 20, 5);
      firstVal.$_set(0, 1);
      firstVal.$_set(1, 2);
      firstVal.$_set(2, 3);
      firstVal.$_set(3, 4);
      firstVal.$_set(4, 5);
      secondVal.$_set(0, 10);
      secondVal.$_set(1, 20);
      let r: Int32Array = firstVal.slice();
      r.$_set(0, 9999);
      expect(secondVal.$_get(0)).assertEqual(10);
      expect(firstVal.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5300
     * @tc.name int32ArraySlicePart02Test053
     * @tc.desc Verify two successive slice calls preserve values in an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: Int32Array = arr.slice().slice();
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
      let independent: boolean = r.buffer !== arr.buffer;
      expect(independent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5400
     * @tc.name int32ArraySlicePart02Test054
     * @tc.desc Verify arr.slice().slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: Int32Array = arr.slice().slice();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5500
     * @tc.name int32ArraySlicePart02Test055
     * @tc.desc Verify slice(1) slice(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.slice(1).slice(1);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5600
     * @tc.name int32ArraySlicePart02Test056
     * @tc.desc Verify nested slices keep independent contents from the parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r1: Int32Array = arr.slice();
      let r2: Int32Array = r1.slice();
      let _d: boolean = r2.buffer !== r1.buffer;
      expect(_d).assertTrue();
      let _d2: boolean = r2.buffer !== arr.buffer;
      expect(_d2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5700
     * @tc.name int32ArraySlicePart02Test057
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r1: Int32Array = arr.slice();
      let r2: Int32Array = r1.slice();
      r2.$_set(0, 777);
      expect(r1.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5800
     * @tc.name int32ArraySlicePart02Test058
     * @tc.desc Verify slice BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = arr.slice().slice();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_5900
     * @tc.name int32ArraySlicePart02Test059
     * @tc.desc Verify slice buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: Int32Array = arr.slice();
      let v: Int32Array = new Int32Array(r.buffer);
      expect(v.length).assertEqual(r.length);
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6000
     * @tc.name int32ArraySlicePart02Test060
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice();
      let v: Int32Array = new Int32Array(r.buffer);
      v.$_set(1, 555);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6100
     * @tc.name int32ArraySlicePart02Test061
     * @tc.desc Verify slice(0, 1) returns one element containing 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let r: Int32Array = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6200
     * @tc.name int32ArraySlicePart02Test062
     * @tc.desc Verify slice(2, 3) returns one element containing 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let r: Int32Array = arr.slice(2, 3);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6300
     * @tc.name int32ArraySlicePart02Test063
     * @tc.desc Verify slice(i,i+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = arr.slice(2, 3);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6400
     * @tc.name int32ArraySlicePart02Test064
     * @tc.desc Verify slice(0,1) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.slice(0, 1);
      r.$_set(0, 0);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6500
     * @tc.name int32ArraySlicePart02Test065
     * @tc.desc Verify slice buffer subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let rs: Int32Array = arr.slice();
      let rb: Int32Array = arr.subarray();
      let _d: boolean = rs.buffer !== arr.buffer;
      expect(_d).assertTrue();
      expect(rb.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6600
     * @tc.name int32ArraySlicePart02Test066
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let rs: Int32Array = arr.slice();
      rs.$_set(1, 111);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6700
     * @tc.name int32ArraySlicePart02Test067
     * @tc.desc Verify slice for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7, 8);
      let r: Int32Array = arr.slice(1, 3);
      let sum: number = 0;
      for (let i = 0; i < r.length; i++) {
        let v = r.$_get(i);
        sum = sum + v;
      }
      expect(sum).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6800
     * @tc.name int32ArraySlicePart02Test068
     * @tc.desc Verify for-of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.slice(2, 2);
      let count: int = 0;
      for (let i = 0; i < r.length; i++) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_6900
     * @tc.name int32ArraySlicePart02Test069
     * @tc.desc Verify a full slice preserves negative Int32Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r: Int32Array = arr.slice(1, 3);
      let c: int = 0;
      r.forEach((_v: number, _i: int, _a: Int32Array): void => {
        c = c + 1;
      });
      expect(c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_7000
     * @tc.name int32ArraySlicePart02Test070
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -100, -2147483647);
      let r: Int32Array = arr.slice();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(-100);
      expect(r.$_get(2)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_7100
     * @tc.name int32ArraySlicePart02Test071
     * @tc.desc Verify slice(0,length) slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r1: Int32Array = arr.slice();
      let r2: Int32Array = arr.slice(0, arr.length);
      expect(r1.length).assertEqual(4);
      expect(r1.$_get(0)).assertEqual(1);
      expect(r1.$_get(1)).assertEqual(2);
      expect(r1.$_get(2)).assertEqual(3);
      expect(r1.$_get(3)).assertEqual(4);
      expect(r2.$_get(0)).assertEqual(1);
      expect(r2.$_get(1)).assertEqual(2);
      expect(r2.$_get(2)).assertEqual(3);
      expect(r2.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_7200
     * @tc.name int32ArraySlicePart02Test072
     * @tc.desc Verify slice(0,length) slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let r1: Int32Array = arr.slice();
      let r2: Int32Array = arr.slice(0, arr.length);
      expect(r1.$_get(0)).assertEqual(10);
      expect(r1.$_get(1)).assertEqual(20);
      expect(r1.$_get(2)).assertEqual(30);
      expect(r1.$_get(3)).assertEqual(40);
      expect(r2.$_get(0)).assertEqual(10);
      expect(r2.$_get(1)).assertEqual(20);
      expect(r2.$_get(2)).assertEqual(30);
      expect(r2.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_7300
     * @tc.name int32ArraySlicePart02Test073
     * @tc.desc Verify ArrayBuffer slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let v: Int32Array = new Int32Array(buf);
      v.$_set(0, 1);
      v.$_set(1, 2);
      v.$_set(2, 3);
      v.$_set(3, 4);
      let r: Int32Array = v.slice();
      expect(r.length).assertEqual(4);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(4);
      let _d: boolean = r.buffer !== buf;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART02_7400
     * @tc.name int32ArraySlicePart02Test074
     * @tc.desc Verify ArrayBuffer offset+length slice(1,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let v: Int32Array = new Int32Array(buf, 4, 5);
      v.$_set(0, 11);
      v.$_set(1, 22);
      v.$_set(2, 33);
      v.$_set(3, 44);
      v.$_set(4, 55);
      let r: Int32Array = v.slice(1, 4);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(44);
    });
  });
}
