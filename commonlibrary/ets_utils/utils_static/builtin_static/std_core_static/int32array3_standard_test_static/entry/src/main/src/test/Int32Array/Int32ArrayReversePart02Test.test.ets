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

export default function int32ArrayReversePart02Test(): void {
  describe('Int32ArrayReversePart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayReversePart02Test001
     * @tc.desc Verify reverse() reverses the elements in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.reverse();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayReversePart02Test002
     * @tc.desc Verify reverse() returns the same array with reversed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Object = arr.reverse() as Object;
      expect((r as Int32Array).$_get(0)).assertEqual(3);
      expect((r as Int32Array).$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayReversePart02Test003
     * @tc.desc Verify reverse() preserves an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.reverse();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayReversePart02Test004
     * @tc.desc Verify reverse() preserves a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.reverse();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayReversePart02Test005
     * @tc.desc Verify reverse() reverses values in an ArrayBuffer-backed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      let r: Int32Array = view.reverse();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayReversePart02Test006
     * @tc.desc Verify reverse() preserves the length of a zero-filled array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let r: Int32Array = arr.reverse();
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayReversePart02Test007
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayReversePart02Test008
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayReversePart02Test009
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayReversePart02Test010
     * @tc.desc Verify ArrayBuffer reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      let r: Int32Array = view.reverse();
      expect(r).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayReversePart02Test011
     * @tc.desc Verify byteOffset reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      view.$_set(0, 10);
      view.$_set(1, 20);
      let r: Int32Array = view.reverse();
      expect(r).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayReversePart02Test012
     * @tc.desc Verify reverse() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayReversePart02Test013
     * @tc.desc Verify reverse() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.reverse().reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayReversePart02Test014
     * @tc.desc Verify reverse() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.reverse().reverse().reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayReversePart02Test015
     * @tc.desc Verify reverse() fill()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse().fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayReversePart02Test016
     * @tc.desc Verify reverse() $_set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.reverse().$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(30);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayReversePart02Test017
     * @tc.desc Verify reverse() subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.reverse().subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(4);
      expect(sub.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayReversePart02Test018
     * @tc.desc Verify reverse() at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let v: number = arr.reverse().at(0) as number;
      expect(v as number).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayReversePart02Test019
     * @tc.desc Verify reverse() indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let idx: number = arr.reverse().indexOf(4);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayReversePart02Test020
     * @tc.desc Verify reverse() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let chainedLen: number = arr.reverse().length;
      expect(chainedLen).assertEqual(6);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayReversePart02Test021
     * @tc.desc Verify reverse() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.reverse().reverse();
      expect(r).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayReversePart02Test022
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.reverse().reverse().reverse().reverse();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayReversePart02Test023
     * @tc.desc Verify reverse() copyWithin() copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse().copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayReversePart02Test024
     * @tc.desc Verify reverse() length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let beforeLen: number = arr.length;
      arr.reverse();
      expect(arr.length).assertEqual(beforeLen);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayReversePart02Test025
     * @tc.desc Verify reverse() byteLength 4 4 =16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let beforeBL: number = arr.byteLength;
      arr.reverse();
      expect(arr.byteLength).assertEqual(beforeBL);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayReversePart02Test026
     * @tc.desc Verify reverse() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let beforeBO: number = arr.byteOffset;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(beforeBO);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayReversePart02Test027
     * @tc.desc Verify reverse() byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      expect(arr.byteLength).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayReversePart02Test028
     * @tc.desc Verify reverse() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayReversePart02Test029
     * @tc.desc Verify byteOffset reverse() byteOffset offset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      let beforeBO: number = view.byteOffset;
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.reverse();
      expect(view.byteOffset).assertEqual(beforeBO);
      expect(view.byteOffset).assertEqual(4);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayReversePart02Test030
     * @tc.desc Verify byteOffset reverse() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 3);
      let beforeBL: number = view.byteLength;
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.reverse();
      expect(view.byteLength).assertEqual(beforeBL);
      expect(view.byteLength).assertEqual(12);
      expect(view.$_get(0)).assertEqual(3);
      expect(view.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayReversePart02Test031
     * @tc.desc Verify reverse() length/byteLength/byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(7);
      let l: number = arr.length;
      let bl: number = arr.byteLength;
      let bo: number = arr.byteOffset;
      arr.reverse();
      expect(arr.length).assertEqual(l);
      expect(arr.byteLength).assertEqual(bl);
      expect(arr.byteOffset).assertEqual(bo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayReversePart02Test032
     * @tc.desc Verify reverse() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.reverse();
      expect(arr.byteLength).assertEqual(4);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayReversePart02Test033
     * @tc.desc Verify reverse() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayReversePart02Test034
     * @tc.desc Verify reverse() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayReversePart02Test035
     * @tc.desc Verify reverse() byteLength = length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(7);
      arr.reverse();
      expect(arr.byteLength).assertEqual(arr.length * 4);
      expect(arr.byteLength).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayReversePart02Test036
     * @tc.desc Verify reverse() ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let buf: ArrayBuffer = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayReversePart02Test037
     * @tc.desc Verify ArrayBuffer reverse() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, 7);
      view.$_set(1, 8);
      view.$_set(2, 9);
      view.reverse();
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayReversePart02Test038
     * @tc.desc Verify byteOffset reverse() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      view.reverse();
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayReversePart02Test039
     * @tc.desc Verify reverse() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let buf: ArrayBuffer = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayReversePart02Test040
     * @tc.desc Verify subarray reverse() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = parent.subarray(1, 4);
      let subBuf: ArrayBuffer = sub.buffer;
      sub.reverse();
      expect(sub.buffer).assertEqual(subBuf);
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayReversePart02Test041
     * @tc.desc Verify Int32Array reverse buffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.reverse();
      expect(b.$_get(0)).assertEqual(3);
      expect(b.$_get(1)).assertEqual(2);
      expect(b.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayReversePart02Test042
     * @tc.desc Verify byteOffset reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 4, 3);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 10);
      a.$_set(1, 20);
      a.$_set(2, 30);
      a.reverse();
      expect(b.$_get(1)).assertEqual(30);
      expect(b.$_get(2)).assertEqual(20);
      expect(b.$_get(3)).assertEqual(10);
      expect(b.$_get(0)).assertEqual(0);
      expect(b.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayReversePart02Test043
     * @tc.desc Verify reverse Uint8Array length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.reverse();
      let bytes: Uint8Array = new Uint8Array(buf);
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(1)).assertEqual(1);
      expect(bytes.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayReversePart02Test044
     * @tc.desc Verify reverse ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = new Int32Array([10, 20, 30]);
      a.reverse();
      expect(b.$_get(0)).assertEqual(10);
      expect(b.$_get(1)).assertEqual(20);
      expect(b.$_get(2)).assertEqual(30);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayReversePart02Test045
     * @tc.desc Verify subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.reverse();
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(4);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(2);
      expect(parent.$_get(4)).assertEqual(5);
      expect(parent.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayReversePart02Test046
     * @tc.desc Verify subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = parent.subarray(0, 3);
      sub.reverse();
      expect(parent.$_get(0)).assertEqual(30);
      expect(parent.$_get(1)).assertEqual(20);
      expect(parent.$_get(2)).assertEqual(10);
      expect(parent.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayReversePart02Test047
     * @tc.desc Verify subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = parent.subarray(2);
      sub.reverse();
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(5);
      expect(parent.$_get(3)).assertEqual(4);
      expect(parent.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayReversePart02Test048
     * @tc.desc Verify ArrayBuffer Int32Array reverse DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 0x01020304 as number);
      a.$_set(1, 0x0A0B0C0D as number);
      a.reverse();
      expect(a.$_get(0)).assertEqual(0x0A0B0C0D);
      expect(a.$_get(1)).assertEqual(0x01020304);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayReversePart02Test049
     * @tc.desc Verify reverse buffer prefix suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      let mid: Int32Array = new Int32Array(buf, 4, 2);
      let suffix: Int32Array = new Int32Array(buf, 12, 1);
      prefix.$_set(0, 111);
      mid.$_set(0, 222);
      mid.$_set(1, 333);
      suffix.$_set(0, 444);
      mid.reverse();
      expect(prefix.$_get(0)).assertEqual(111);
      expect(mid.$_get(0)).assertEqual(333);
      expect(mid.$_get(1)).assertEqual(222);
      expect(suffix.$_get(0)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayReversePart02Test050
     * @tc.desc Verify ArrayBuffer reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(0);
      expect(a.buffer).assertEqual(buf);
      expect(b.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayReversePart02Test051
     * @tc.desc Verify of reverse buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6, 7);
      let b: Int32Array = Int32Array.of(50, 60, 70);
      let aBuf: ArrayBuffer = a.buffer;
      a.reverse();
      expect(a.buffer).assertEqual(aBuf);
      expect(b.$_get(0)).assertEqual(50);
      expect(b.$_get(2)).assertEqual(70);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayReversePart02Test052
     * @tc.desc Verify from( ) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [100, 200, 300];
      let a: Int32Array = Int32Array.from(src);
      let aBuf: ArrayBuffer = a.buffer;
      let b: Int32Array = new Int32Array(aBuf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(300);
      expect(b.$_get(1)).assertEqual(200);
      expect(b.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayReversePart02Test053
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let before0: number = arr.$_get(0);
      let before3: number = arr.$_get(3);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(before3);
      expect(arr.$_get(3)).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayReversePart02Test054
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9, 10, 11]);
      arr.reverse();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(10);
      expect(arr.$_get(4)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayReversePart02Test055
     * @tc.desc Verify reverse 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayReversePart02Test056
     * @tc.desc Verify reverse 5 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      arr.reverse();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayReversePart02Test057
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let saved: Int32Array = arr;
      arr.reverse();
      expect(arr).assertEqual(saved);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayReversePart02Test058
     * @tc.desc Verify reverse for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse();
      let collected: number[] = [0, 0, 0, 0];
      let i: int = 0;
      for (const v of arr) {
        collected.$_set(i, v);
        i = i + 1;
      }
      expect(collected[0]).assertEqual(4);
      expect(collected[1]).assertEqual(3);
      expect(collected[2]).assertEqual(2);
      expect(collected[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayReversePart02Test059
     * @tc.desc Verify reverse keys() 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.reverse();
      let it = arr.keys();
      let r0 = it.next();
      let r1 = it.next();
      let r2 = it.next();
      expect(r0.value).assertEqual(0);
      expect(r1.value).assertEqual(1);
      expect(r2.value).assertEqual(2);
      expect(r2.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayReversePart02Test060
     * @tc.desc Verify reverse values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      arr.reverse();
      let it = arr.values();
      expect(it.next().value).assertEqual(7);
      expect(it.next().value).assertEqual(6);
      expect(it.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayReversePart02Test061
     * @tc.desc Verify reverse entries() [index,value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200]);
      arr.reverse();
      let it = arr.entries();
      let first = it.next();
      let second = it.next();
      expect(first.value![1] as number).assertEqual(200);
      expect(second.value![1] as number).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayReversePart02Test062
     * @tc.desc Verify reverse forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse();
      let seen: number[] = [0, 0, 0, 0];
      let idx: number = 0;
      arr.forEach((value: number, index: int): void => {
        seen[index] = Double.toInt(value);
        idx = idx + 1;
      });
      expect(seen.$_get(0)).assertEqual(4);
      expect(seen.$_get(1)).assertEqual(3);
      expect(seen.$_get(2)).assertEqual(2);
      expect(seen.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayReversePart02Test063
     * @tc.desc Verify reverse forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      let count: number = 0;
      arr.forEach((_value: number, _index: int): void => {
        count = count + 1;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayReversePart02Test064
     * @tc.desc Verify reverse int32 MAX (2147483647) this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 1]);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayReversePart02Test065
     * @tc.desc Verify reverse int32 MIN (-2147483648) this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648 as number, 2]);
      let r: Int32Array = arr.reverse();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayReversePart02Test066
     * @tc.desc Verify buffer a [0,1] reverse b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 0);
      a.$_set(1, 1);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayReversePart02Test067
     * @tc.desc Verify MAX MIN reverse buffer MAX/MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 2147483647);
      a.$_set(1, -2147483648 as number);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(-2147483648);
      expect(b.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayReversePart02Test068
     * @tc.desc Verify -1(0xFFFFFFFF)reverse buffer -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, -1);
      a.$_set(1, 42);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(42);
      expect(b.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayReversePart02Test069
     * @tc.desc Verify reverse 0 this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let beforeBL: number = arr.byteLength;
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
      expect(arr.byteLength).assertEqual(beforeBL);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayReversePart02Test070
     * @tc.desc Verify reverse ArrayBuffer MAX/MIN DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 2147483647);
      a.$_set(1, -2147483648 as number);
      a.reverse();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(-2147483648);
      expect(dv.getInt32(4, true)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayReversePart02Test071
     * @tc.desc Verify reverse reverse() MAX/MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648 as number]);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayReversePart02Test072
     * @tc.desc Verify reverse buffer int32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, -1);
      a.$_set(1, 0);
      a.$_set(2, 1);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayReversePart02Test073
     * @tc.desc Verify [MIN,0,0,MAX]reverse [MAX,0,0,MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, -2147483648 as number);
      a.$_set(1, 0);
      a.$_set(2, 0);
      a.$_set(3, 2147483647);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(2147483647);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(0);
      expect(b.$_get(3)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayReversePart02Test074
     * @tc.desc Verify reverse 0 reverse 0 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayReversePart02Test075
     * @tc.desc Verify reverse() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.reverse();
      expect(r).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayReversePart02Test076
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArrayReversePart02Test077
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.length).assertEqual(1);
    });

  });
}
