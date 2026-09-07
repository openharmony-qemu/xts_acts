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

export default function int32ArraySetPart07Test(): void {
  describe('Int32ArraySetPart07Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0100
     * @tc.name int32ArraySetPart07Test001
     * @tc.desc Verify 1 Int32Array arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0200
     * @tc.name int32ArraySetPart07Test002
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([5, 6, 7, 8]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0300
     * @tc.name int32ArraySetPart07Test003
     * @tc.desc Verify 1 Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([100, 200, 300]);
      let src: Int32Array = new Int32Array([42]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(42);
      expect(dst.$_get(1)).assertEqual(200);
      expect(dst.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0400
     * @tc.name int32ArraySetPart07Test004
     * @tc.desc Verify target.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([7, 7, 7, 7]);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      dst.set(src);
      expect(dst.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0500
     * @tc.name int32ArraySetPart07Test005
     * @tc.desc Verify Int32Array length=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([9, 8, 7]);
      let src: Int32Array = new Int32Array(0);
      dst.set(src);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0600
     * @tc.name int32ArraySetPart07Test006
     * @tc.desc Verify Int32Array no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let src: Int32Array = new Int32Array(0);
      dst.set(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0700
     * @tc.name int32ArraySetPart07Test007
     * @tc.desc Verify set copies selected positive elements from an Int32Array source into the destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([10, 20, 30, 40]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0800
     * @tc.name int32ArraySetPart07Test008
     * @tc.desc Verify set copies negative elements from an Int32Array source into the destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([-1, -2, -3]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_0900
     * @tc.name int32ArraySetPart07Test009
     * @tc.desc Verify set copies mixed negative, zero, and positive elements in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([-5, 0, 5, -100]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-5);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1000
     * @tc.name int32ArraySetPart07Test010
     * @tc.desc Verify set overwrites only the destination prefix when the source is shorter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let src: Int32Array = new Int32Array([7, 7]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1100
     * @tc.name int32ArraySetPart07Test011
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let src: Int32Array = new Int32Array([0, 0, 0]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1200
     * @tc.name int32ArraySetPart07Test012
     * @tc.desc Verify Int32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.of(11, 22, 33);
      dst.set(src);
      expect(dst.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1300
     * @tc.name int32ArraySetPart07Test013
     * @tc.desc Verify Int32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = Int32Array.from([100, 200, 300]);
      dst.set(src);
      expect(dst.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1400
     * @tc.name int32ArraySetPart07Test014
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0]);
      let src: Int32Array = new Int32Array([-1]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1500
     * @tc.name int32ArraySetPart07Test015
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([99]);
      let src: Int32Array = new Int32Array([1]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1600
     * @tc.name int32ArraySetPart07Test016
     * @tc.desc Verify set copies two source elements and leaves the remaining destination elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([1, 1]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(1);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1700
     * @tc.name int32ArraySetPart07Test017
     * @tc.desc Verify $_set set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      src.$_set(1, 999);
      let dst: Int32Array = new Int32Array(3);
      dst.set(src);
      expect(dst.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1800
     * @tc.name int32ArraySetPart07Test018
     * @tc.desc Verify ArrayBuffer Int32Array byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let src: Int32Array = new Int32Array(buf, 0, 4);
      src.$_set(0, 11);
      src.$_set(3, 44);
      let dst: Int32Array = new Int32Array(4);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(11);
      expect(dst.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_1900
     * @tc.name int32ArraySetPart07Test019
     * @tc.desc Verify ArrayBuffer Int32Array byteOffset=4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int32Array = new Int32Array(buf, 4, 3);
      src.$_set(0, 7);
      src.$_set(1, 8);
      src.$_set(2, 9);
      let dst: Int32Array = new Int32Array(3);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2000
     * @tc.name int32ArraySetPart07Test020
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let dst: Int32Array = new Int32Array(buf, 4, 4);
      let src: Int32Array = new Int32Array([1, 2, 3, 4]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2100
     * @tc.name int32ArraySetPart07Test021
     * @tc.desc Verify set undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([5, 6]);
      let ret: Object = dst.set(src) as Object;
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2200
     * @tc.name int32ArraySetPart07Test022
     * @tc.desc Verify set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([1, 2]);
      dst.set(src);
      expect(dst.length).assertEqual(4);
      {
        let dst: Int32Array = new Int32Array(4);
        let src: Int32Array = new Int32Array([1, 2]);
        let before: number = dst.byteLength;
        dst.set(src);
        expect(dst.byteLength).assertEqual(before);
      }
      {
        let dst: Int32Array = new Int32Array(4);
        let src: Int32Array = new Int32Array([1, 2]);
        let bufRef: ArrayBuffer = dst.buffer;
        dst.set(src);
        expect(dst.buffer).assertEqual(bufRef);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2300
     * @tc.name int32ArraySetPart07Test023
     * @tc.desc Verify set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let dst: Int32Array = new Int32Array(buf, 8, 3);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let off: number = dst.byteOffset;
      dst.set(src);
      expect(dst.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2400
     * @tc.name int32ArraySetPart07Test024
     * @tc.desc Verify set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([10, 20, 30]);
      dst.set(src);
      expect(src.length).assertEqual(3);
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2500
     * @tc.name int32ArraySetPart07Test025
     * @tc.desc Verify set for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0]);
      let src: Int32Array = new Int32Array([4, 5, 6]);
      dst.set(src);
      let sum: number = 0;
      for (let i = 0; i < dst.length; i++) {
        sum = sum + dst.$_get(i);
      }
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2600
     * @tc.name int32ArraySetPart07Test026
     * @tc.desc Verify 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2700
     * @tc.name int32ArraySetPart07Test027
     * @tc.desc Verify RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array(8);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2800
     * @tc.name int32ArraySetPart07Test028
     * @tc.desc Verify length=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let src: Int32Array = new Int32Array([1]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_2900
     * @tc.name int32ArraySetPart07Test029
     * @tc.desc Verify RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([9, 9, 9]);
      let src: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(9);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3000
     * @tc.name int32ArraySetPart07Test030
     * @tc.desc Verify RangeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2]);
      let src: Int32Array = new Int32Array([3, 4, 5]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3100
     * @tc.name int32ArraySetPart07Test031
     * @tc.desc Verify int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([2147483647]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3200
     * @tc.name int32ArraySetPart07Test032
     * @tc.desc Verify int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([-2147483648]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3300
     * @tc.name int32ArraySetPart07Test033
     * @tc.desc Verify 4294967295 0xFFFFFFFF ToInt32 -1 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([4294967295 as number]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3400
     * @tc.name int32ArraySetPart07Test034
     * @tc.desc Verify 4294967296 0x100000000 ToInt32 0 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([4294967296 as number]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3500
     * @tc.name int32ArraySetPart07Test035
     * @tc.desc Verify 3.5 3 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([3.5]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3600
     * @tc.name int32ArraySetPart07Test036
     * @tc.desc Verify -3.5 -3 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([-3.5]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3700
     * @tc.name int32ArraySetPart07Test037
     * @tc.desc Verify Number.NaN ToInt32 0 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([Number.NaN]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3800
     * @tc.name int32ArraySetPart07Test038
     * @tc.desc Verify -0 0 SameValueZero 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([-0]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_3900
     * @tc.name int32ArraySetPart07Test039
     * @tc.desc Verify ToInt32 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array =
      new Int32Array([2147483648 as number, -2147483649 as number, Number.NaN, 4294967295 as number]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
      expect(dst.$_get(1)).assertEqual(2147483647);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4000
     * @tc.name int32ArraySetPart07Test040
     * @tc.desc Verify Int32Array self-set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.set(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4100
     * @tc.name int32ArraySetPart07Test041
     * @tc.desc Verify self-set MAX/MIN/-1/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, -1, 0]);
      arr.set(arr);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4200
     * @tc.name int32ArraySetPart07Test042
     * @tc.desc Verify subarray(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let src: Int32Array = arr.subarray(0);
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4300
     * @tc.name int32ArraySetPart07Test043
     * @tc.desc Verify subarray(1) [1..end] [0..end-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let src: Int32Array = arr.subarray(1);
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(20);
      expect(arr.$_get(1)).assertEqual(30);
      expect(arr.$_get(2)).assertEqual(40);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4400
     * @tc.name int32ArraySetPart07Test044
     * @tc.desc Verify subarray(2) length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let src: Int32Array = arr.subarray(2, 4);
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4500
     * @tc.name int32ArraySetPart07Test045
     * @tc.desc Verify subarray subarray(length-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
      let src: Int32Array = arr.subarray(2);
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(300);
      expect(arr.$_get(1)).assertEqual(400);
      expect(arr.$_get(2)).assertEqual(300);
      expect(arr.$_get(3)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4600
     * @tc.name int32ArraySetPart07Test046
     * @tc.desc Verify ArrayBuffer Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let dst: Int32Array = new Int32Array(buf, 0, 4);
      let src: Int32Array = new Int32Array(buf, 16, 4);
      src.$_set(0, 11);
      src.$_set(1, 22);
      src.$_set(2, 33);
      src.$_set(3, 44);
      dst.$_set(0, 0);
      dst.$_set(1, 0);
      dst.$_set(2, 0);
      dst.$_set(3, 0);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(11);
      expect(dst.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4700
     * @tc.name int32ArraySetPart07Test047
     * @tc.desc Verify ArrayBuffer src dst set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let dst: Int32Array = new Int32Array(buf, 0, 6);
      let src: Int32Array = new Int32Array(buf, 8, 4);
      for (let i = 0; i < 6; i++) {
        dst.$_set(i, i + 1);
      }
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(4);
      expect(dst.$_get(2)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(6);
      expect(dst.$_get(4)).assertEqual(5);
      expect(dst.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4800
     * @tc.name int32ArraySetPart07Test048
     * @tc.desc Verify ArrayBuffer Int32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([7, 8, 9]);
      dst.set(src);
      expect(src.$_get(0)).assertEqual(7);
      expect(src.$_get(1)).assertEqual(8);
      expect(src.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_4900
     * @tc.name int32ArraySetPart07Test049
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let dst: Int32Array = new Int32Array(buf, 0, 4);
      let observer: Int32Array = new Int32Array(buf, 0, 4);
      let src: Int32Array = new Int32Array([1, 2, 3, 4]);
      dst.set(src);
      expect(observer.$_get(0)).assertEqual(1);
      expect(observer.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5000
     * @tc.name int32ArraySetPart07Test050
     * @tc.desc Verify ArrayBuffer byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let dst: Int32Array = new Int32Array(buf, 0, 5);
      let observer: Int32Array = new Int32Array(buf, 4, 3);
      let src: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      dst.set(src);
      expect(observer.$_get(0)).assertEqual(20);
      expect(observer.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5100
     * @tc.name int32ArraySetPart07Test051
     * @tc.desc Verify a shorter Int32Array set overwrites the destination prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let prefix: Int32Array = new Int32Array(buf, 0, 2);
      prefix.$_set(0, 111);
      prefix.$_set(1, 222);
      let dst: Int32Array = new Int32Array(buf, 8, 4);
      let src: Int32Array = new Int32Array([9, 8, 7, 6]);
      dst.set(src);
      expect(prefix.$_get(0)).assertEqual(111);
      expect(prefix.$_get(1)).assertEqual(222);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5200
     * @tc.name int32ArraySetPart07Test052
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src1: Int32Array = new Int32Array([1, 2, 3, 4]);
      let src2: Int32Array = new Int32Array([9, 9]);
      dst.set(src1);
      dst.set(src2);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(9);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5300
     * @tc.name int32ArraySetPart07Test053
     * @tc.desc Verify subarray Int32Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([100, 200, 300, 400, 500]);
      let src: Int32Array = parent.subarray(1, 4);
      let dst: Int32Array = new Int32Array(3);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(200);
      expect(dst.$_get(1)).assertEqual(300);
      expect(dst.$_get(2)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5400
     * @tc.name int32ArraySetPart07Test054
     * @tc.desc Verify set() copies values from a subarray with aligned byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60, 70, 80]);
      let src: Int32Array = parent.subarray(3);
      let dst: Int32Array = new Int32Array(5);
      dst.set(src);
      expect(src.byteOffset % 4).assertEqual(0);
      expect(dst.$_get(0)).assertEqual(40);
      expect(dst.$_get(4)).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5500
     * @tc.name int32ArraySetPart07Test055
     * @tc.desc Verify ArrayBuffer new Array(length) set dst src int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: DataView = new DataView(buf);
      view.setInt32(0, 123456, true);
      view.setInt32(4, -7890, true);
      let src: Int32Array = new Int32Array(buf, 0, 2);
      let dst: Int32Array = new Int32Array(2);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(123456);
      expect(dst.$_get(1)).assertEqual(-7890);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5600
     * @tc.name int32ArraySetPart07Test056
     * @tc.desc Verify set no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = new Int32Array(0);
      dst.set(empty);
      dst.set(empty);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5700
     * @tc.name int32ArraySetPart07Test057
     * @tc.desc Verify set leaves destination elements after a shorter source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0]);
      let src: Int32Array = new Int32Array([-2147483648]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5800
     * @tc.name int32ArraySetPart07Test058
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
      let src: Int32Array = new Int32Array([7, 8]);
      dst.set(src);
      expect(dst.$_get(2)).assertEqual(33);
      expect(dst.$_get(3)).assertEqual(44);
      expect(dst.$_get(4)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_5900
     * @tc.name int32ArraySetPart07Test059
     * @tc.desc Verify reverse set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      src.reverse();
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6000
     * @tc.name int32ArraySetPart07Test060
     * @tc.desc Verify fill set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let src: Int32Array = new Int32Array(4);
      src.fill(7);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6100
     * @tc.name int32ArraySetPart07Test061
     * @tc.desc Verify sort Int32Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([42, -7, 0, 2147483647]);
      src.sort();
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-7);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(42);
      expect(dst.$_get(3)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6200
     * @tc.name int32ArraySetPart07Test062
     * @tc.desc Verify set throws RangeError for an oversized source and does not modify the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: Int32Array = new Int32Array([5, 6, 7]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(src.$_get(0)).assertEqual(5);
      expect(src.$_get(1)).assertEqual(6);
      expect(src.$_get(2)).assertEqual(7);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6300
     * @tc.name int32ArraySetPart07Test063
     * @tc.desc Verify set preserves INT32_MAX and INT32_MIN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([9, 9, 9, 9]);
      let src: Int32Array = new Int32Array(3);
      src.fill(0);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6400
     * @tc.name int32ArraySetPart07Test064
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([2147483647, -2147483648]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6500
     * @tc.name int32ArraySetPart07Test065
     * @tc.desc Verify -1 0xFFFFFFFF set -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([-1, -1, -1, -1]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART07_6600
     * @tc.name int32ArraySetPart07Test066
     * @tc.desc Verify ArrayBuffer set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart07Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: ArrayBuffer = new ArrayBuffer(32);
      let src: Int32Array = new Int32Array(big, 8, 3);
      src.$_set(0, 50);
      src.$_set(1, 51);
      src.$_set(2, 52);
      let dst: Int32Array = new Int32Array(3);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(50);
      expect(dst.$_get(1)).assertEqual(51);
      expect(dst.$_get(2)).assertEqual(52);
    });
  });
}
