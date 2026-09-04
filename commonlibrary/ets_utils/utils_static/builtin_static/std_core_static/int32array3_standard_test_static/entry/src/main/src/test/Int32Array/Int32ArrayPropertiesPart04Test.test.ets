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

export default function int32ArrayPropertiesPart04Test(): void {
  describe('Int32ArrayPropertiesPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0100
     * @tc.name int32ArrayPropertiesPart04Test001
     * @tc.desc Verify fill BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.fill(9);
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0200
     * @tc.name int32ArrayPropertiesPart04Test002
     * @tc.desc Verify fill BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.fill(9);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0300
     * @tc.name int32ArrayPropertiesPart04Test003
     * @tc.desc Verify fill buffer fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let before: ArrayBuffer = arr.buffer;
      arr.fill(-1);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0400
     * @tc.name int32ArrayPropertiesPart04Test004
     * @tc.desc Verify fill byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 12, 3);
      let off0: number = arr.byteOffset;
      arr.fill(0);
      expect(arr.byteOffset).assertEqual(off0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0500
     * @tc.name int32ArrayPropertiesPart04Test005
     * @tc.desc Verify fill byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(7);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0600
     * @tc.name int32ArrayPropertiesPart04Test006
     * @tc.desc Verify fill length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(28);
      let arr: Int32Array = new Int32Array(buf, 4, 5);
      let len0: number = arr.length;
      arr.fill(-1);
      expect(arr.length).assertEqual(len0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0700
     * @tc.name int32ArrayPropertiesPart04Test007
     * @tc.desc Verify fill name 'Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(42);
      expect(arr.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0800
     * @tc.name int32ArrayPropertiesPart04Test008
     * @tc.desc Verify fill length=0 length byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.fill(1);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_0900
     * @tc.name int32ArrayPropertiesPart04Test009
     * @tc.desc Verify reverse buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let b0: ArrayBuffer = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(b0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1000
     * @tc.name int32ArrayPropertiesPart04Test010
     * @tc.desc Verify reverse byteOffset/byteLength/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(28);
      let arr: Int32Array = new Int32Array(buf, 8, 4);
      let o0: number = arr.byteOffset;
      let bl0: number = arr.byteLength;
      let l0: number = arr.length;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(o0);
      expect(arr.byteLength).assertEqual(bl0);
      expect(arr.length).assertEqual(l0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1100
     * @tc.name int32ArrayPropertiesPart04Test011
     * @tc.desc Verify sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 5);
      arr.$_set(1, 1);
      arr.$_set(2, 9);
      arr.$_set(3, 3);
      arr.$_set(4, 7);
      let b0: ArrayBuffer = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(b0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1200
     * @tc.name int32ArrayPropertiesPart04Test012
     * @tc.desc Verify sort byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 16, 3);
      let o0: number = arr.byteOffset;
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      arr.sort();
      expect(arr.byteOffset).assertEqual(o0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1300
     * @tc.name int32ArrayPropertiesPart04Test013
     * @tc.desc Verify copyWithin length/byteLength/byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 4, 4);
      let l0: number = arr.length;
      let o0: number = arr.byteOffset;
      let bl0: number = arr.byteLength;
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.copyWithin(2, 0);
      expect(arr.length).assertEqual(l0);
      expect(arr.byteOffset).assertEqual(o0);
      expect(arr.byteLength).assertEqual(bl0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1400
     * @tc.name int32ArrayPropertiesPart04Test014
     * @tc.desc Verify set length TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: Int32Array = new Int32Array([11, 22, 33]);
      dst.set(src, 1);
      expect(dst.length).assertEqual(5);
      expect(dst.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1500
     * @tc.name int32ArrayPropertiesPart04Test015
     * @tc.desc Verify $_set(0, 1) $_get(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1600
     * @tc.name int32ArrayPropertiesPart04Test016
     * @tc.desc Verify $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 7);
      arr.$_set(0, -1);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1700
     * @tc.name int32ArrayPropertiesPart04Test017
     * @tc.desc Verify fill(1) $_get 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1800
     * @tc.name int32ArrayPropertiesPart04Test018
     * @tc.desc Verify set(array, offset) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: Int32Array = new Int32Array([11, 22]);
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(11);
      expect(dst.$_get(3)).assertEqual(22);
      expect(dst.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_1900
     * @tc.name int32ArrayPropertiesPart04Test019
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2000
     * @tc.name int32ArrayPropertiesPart04Test020
     * @tc.desc Verify copyWithin(3, 0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.copyWithin(3, 0, 2);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2100
     * @tc.name int32ArrayPropertiesPart04Test021
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1, 9]);
      arr.sort();
      let ok: boolean = true;
      for (let i: int = 1; i < arr.length; i++) {
        if (arr.$_get(i) < arr.$_get(i - 1)) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2200
     * @tc.name int32ArrayPropertiesPart04Test022
     * @tc.desc Verify new Int32Array(arr.buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let mirror: Int32Array = new Int32Array(arr.buffer);
      arr.$_set(1, 77);
      expect(mirror.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2300
     * @tc.name int32ArrayPropertiesPart04Test023
     * @tc.desc Verify NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0.0 / 0.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2400
     * @tc.name int32ArrayPropertiesPart04Test024
     * @tc.desc Verify +Infinity ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 1.0 / 0.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2500
     * @tc.name int32ArrayPropertiesPart04Test025
     * @tc.desc Verify -Infinity ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -1.0 / 0.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2600
     * @tc.name int32ArrayPropertiesPart04Test026
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483649);
      expect(arr.$_get(0)).assertEqual(-2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483647);
      expect(arr.$_get(2)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2700
     * @tc.name int32ArrayPropertiesPart04Test027
     * @tc.desc Verify set 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array(1);
      src.$_set(0, 2147483649);
      let dst: Int32Array = new Int32Array(1);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2800
     * @tc.name int32ArrayPropertiesPart04Test028
     * @tc.desc Verify length/byteOffset/byteLength/BYTES_PER_ELEMENT/name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 2147483649);
      arr.$_set(1, -2147483649);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_2900
     * @tc.name int32ArrayPropertiesPart04Test029
     * @tc.desc Verify $_set subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(1, 3);
      parent.$_set(1, 77);
      parent.$_set(2, 88);
      expect(child.$_get(0)).assertEqual(77);
      expect(child.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3000
     * @tc.name int32ArrayPropertiesPart04Test030
     * @tc.desc Verify fill subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(0, 5);
      parent.fill(42);
      for (let i: int = 0; i < child.length; i++) {
        expect(child.$_get(i)).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3100
     * @tc.name int32ArrayPropertiesPart04Test031
     * @tc.desc Verify reverse subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let child: Int32Array = parent.subarray(0, 4);
      parent.reverse();
      expect(child.$_get(0)).assertEqual(4);
      expect(child.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3200
     * @tc.name int32ArrayPropertiesPart04Test032
     * @tc.desc Verify sort subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 5);
      parent.$_set(1, 1);
      parent.$_set(2, 3);
      let child: Int32Array = parent.subarray(0, 3);
      parent.sort();
      expect(child.$_get(0)).assertLess(child.$_get(1));
      expect(child.$_get(1)).assertLess(child.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3300
     * @tc.name int32ArrayPropertiesPart04Test033
     * @tc.desc Verify set(array, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(2, 5);
      let src: Int32Array = new Int32Array([111, 222, 333]);
      parent.set(src, 2);
      expect(child.$_get(0)).assertEqual(111);
      expect(child.$_get(1)).assertEqual(222);
      expect(child.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3400
     * @tc.name int32ArrayPropertiesPart04Test034
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 100);
      parent.$_set(1, 200);
      let child: Int32Array = parent.subarray(3, 5);
      parent.copyWithin(3, 0, 2);
      expect(child.$_get(0)).assertEqual(100);
      expect(child.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3500
     * @tc.name int32ArrayPropertiesPart04Test035
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(2, 4);
      child.$_set(0, 55);
      child.$_set(1, 66);
      expect(parent.$_get(2)).assertEqual(55);
      expect(parent.$_get(3)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3600
     * @tc.name int32ArrayPropertiesPart04Test036
     * @tc.desc Verify fill 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(1, 4);
      child.fill(7);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(1)).assertEqual(7);
      expect(parent.$_get(2)).assertEqual(7);
      expect(parent.$_get(3)).assertEqual(7);
      expect(parent.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3700
     * @tc.name int32ArrayPropertiesPart04Test037
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 0);
      parent.$_set(1, 10);
      parent.$_set(2, 20);
      parent.$_set(3, 30);
      parent.$_set(4, 40);
      let child: Int32Array = parent.subarray(1, 4);
      child.reverse();
      expect(parent.$_get(1)).assertEqual(30);
      expect(parent.$_get(2)).assertEqual(20);
      expect(parent.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3800
     * @tc.name int32ArrayPropertiesPart04Test038
     * @tc.desc Verify sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 0);
      parent.$_set(1, 9);
      parent.$_set(2, 5);
      parent.$_set(3, 7);
      let child: Int32Array = parent.subarray(1, 4);
      child.sort();
      expect(parent.$_get(1)).assertLessOrEqual(parent.$_get(2));
      expect(parent.$_get(2)).assertLessOrEqual(parent.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_3900
     * @tc.name int32ArrayPropertiesPart04Test039
     * @tc.desc Verify set(array, offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(1, 5);
      let src: Int32Array = new Int32Array([9, 8, 7]);
      child.set(src, 1);
      expect(parent.$_get(2)).assertEqual(9);
      expect(parent.$_get(3)).assertEqual(8);
      expect(parent.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4000
     * @tc.name int32ArrayPropertiesPart04Test040
     * @tc.desc Verify -2147483649 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(0, 2);
      child.$_set(0, -2147483649);
      expect(parent.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4100
     * @tc.name int32ArrayPropertiesPart04Test041
     * @tc.desc Verify two Int32Array views at separate offsets write and read independent regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 16, 2);
      a.$_set(0, 11);
      a.$_set(1, 22);
      b.$_set(0, 33);
      b.$_set(1, 44);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(1)).assertEqual(22);
      expect(b.$_get(0)).assertEqual(33);
      expect(b.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4200
     * @tc.name int32ArrayPropertiesPart04Test042
     * @tc.desc Verify -buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let viewA: Int32Array = new Int32Array(buf, 0, 4);
      let viewB: Int32Array = new Int32Array(buf, 4, 3);
      viewB.$_set(0, -1);
      expect(viewA.$_get(1)).assertEqual(-1);
      viewA.$_set(2, -2);
      expect(viewB.$_get(1)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4300
     * @tc.name int32ArrayPropertiesPart04Test043
     * @tc.desc Verify + 1 + 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(28);
      let full: Int32Array = new Int32Array(buf);
      let mid: Int32Array = new Int32Array(buf, 8, 3);
      let tail: Int32Array = new Int32Array(buf, 16, 2);
      mid.$_set(0, 101);
      mid.$_set(2, 202);
      expect(full.$_get(2)).assertEqual(101);
      expect(full.$_get(4)).assertEqual(202);
      let tailVal0: number = tail.$_get(0);
      expect(tailVal0).assertEqual(202);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4400
     * @tc.name int32ArrayPropertiesPart04Test044
     * @tc.desc Verify subarray buffer byteLength/length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.fill(9);
      let z: Int32Array = parent.subarray(2, 2);
      expect(z.length).assertEqual(0);
      expect(z.byteLength).assertEqual(0);
      expect(z.buffer).assertEqual(buf);
      expect(parent.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4500
     * @tc.name int32ArrayPropertiesPart04Test045
     * @tc.desc Verify constructor(buf, off, len) subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(2, 777);
      let b: Int32Array = new Int32Array(buf, 8, 3);
      let c: Int32Array = a.subarray(2, 5);
      expect(b.$_get(0)).assertEqual(777);
      expect(c.$_get(0)).assertEqual(777);
      b.$_set(1, 888);
      expect(c.$_get(1)).assertEqual(888);
      expect(a.$_get(3)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4600
     * @tc.name int32ArrayPropertiesPart04Test046
     * @tc.desc Verify buffer BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      let c: Int32Array = a.subarray(2, 6);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4700
     * @tc.name int32ArrayPropertiesPart04Test047
     * @tc.desc Verify buffer name 'Int32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      let c: Int32Array = a.subarray(1, 5);
      expect(a.name).assertEqual('Int32Array');
      expect(b.name).assertEqual('Int32Array');
      expect(c.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4800
     * @tc.name int32ArrayPropertiesPart04Test048
     * @tc.desc Verify subarray buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = a.subarray(2, 6);
      let c: Int32Array = b.subarray(1, 3);
      expect(c.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_4900
     * @tc.name int32ArrayPropertiesPart04Test049
     * @tc.desc Verify subarray byteOffset 2+1 4=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = a.subarray(2, 6);
      let c: Int32Array = b.subarray(1, 3);
      expect(c.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5000
     * @tc.name int32ArrayPropertiesPart04Test050
     * @tc.desc Verify subarray byteLength=length*4=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = a.subarray(2, 6);
      let c: Int32Array = b.subarray(1, 3);
      expect(c.byteLength).assertEqual(8);
      expect(c.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5100
     * @tc.name int32ArrayPropertiesPart04Test051
     * @tc.desc Verify subarray byteOffset/length/byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf, 4, 4);
      let b: Int32Array = a.subarray();
      expect(b.byteOffset).assertEqual(a.byteOffset);
      expect(b.length).assertEqual(a.length);
      expect(b.byteLength).assertEqual(a.byteLength);
      expect(b.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5200
     * @tc.name int32ArrayPropertiesPart04Test052
     * @tc.desc Verify subarray begin=-5 subarray(-3) byteOffset/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let a: Int32Array = new Int32Array(buf);
      for (let i: int = 0; i < 8; i++) {
        a.$_set(i, i);
      }
      let b: Int32Array = a.subarray(-5);
      let c: Int32Array = b.subarray(-3);
      expect(c.length).assertEqual(3);
      expect(c.$_get(0)).assertEqual(5);
      expect(c.$_get(2)).assertEqual(7);
      expect(c.byteOffset).assertEqual(20);
      expect(c.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5300
     * @tc.name int32ArrayPropertiesPart04Test053
     * @tc.desc Verify new Int32Array(sub.buffer) buffer byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      let full: Int32Array = new Int32Array(a.buffer);
      expect(full.length).assertEqual(6);
      expect(full.byteOffset).assertEqual(0);
      expect(full.$_get(2)).assertEqual(11);
      expect(full.$_get(3)).assertEqual(22);
      expect(full.$_get(4)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5400
     * @tc.name int32ArrayPropertiesPart04Test054
     * @tc.desc Verify new Int32Array(sub.buffer, sub.byteOffset, sub.length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let orig: Int32Array = new Int32Array(buf);
      for (let i: int = 0; i < 6; i++) {
        orig.$_set(i, i);
      }
      let sub: Int32Array = orig.subarray(2, 5);
      let twin: Int32Array = new Int32Array(sub.buffer, sub.byteOffset, sub.length);
      expect(twin.byteOffset).assertEqual(sub.byteOffset);
      expect(twin.length).assertEqual(sub.length);
      expect(twin.byteLength).assertEqual(sub.byteLength);
      expect(twin.$_get(0)).assertEqual(sub.$_get(0));
      twin.$_set(0, 77);
      expect(sub.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5500
     * @tc.name int32ArrayPropertiesPart04Test055
     * @tc.desc Verify subarray(begin>=end) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 42);
      let z: Int32Array = a.subarray(3, 2);
      expect(z.length).assertEqual(0);
      expect(z.byteLength).assertEqual(0);
      expect(z.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5600
     * @tc.name int32ArrayPropertiesPart04Test056
     * @tc.desc Verify forEach a.length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let captured: int = -1;
      arr.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        captured = arr.length;
      });
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5700
     * @tc.name int32ArrayPropertiesPart04Test057
     * @tc.desc Verify forEach a.BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bpe: int = -1;
      arr.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        bpe = arr.BYTES_PER_ELEMENT;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5800
     * @tc.name int32ArrayPropertiesPart04Test058
     * @tc.desc Verify forEach a.byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let off: int = -1;
      arr.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        off = arr.byteOffset;
      });
      expect(off).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_5900
     * @tc.name int32ArrayPropertiesPart04Test059
     * @tc.desc Verify map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number[] = [];
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => {
        seen.push(v);
        return v * 2;
      });
      expect(mapped.length).assertEqual(arr.length);
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(1);
      expect(seen[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6000
     * @tc.name int32ArrayPropertiesPart04Test060
     * @tc.desc Verify reduce a.buffer.byteLength a.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let blMatched: boolean = false;
      let acc: number = arr.reduce((sum: number, v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          blMatched = (arr.buffer.byteLength === arr.byteLength);
        }
        return sum + v;
      }, 0);
      expect(acc).assertEqual(10);
      expect(blMatched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6100
     * @tc.name int32ArrayPropertiesPart04Test061
     * @tc.desc Verify every true length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let cnt: int = 0;
      let r: boolean = arr.every((v: number, _i: int, _arr: Int32Array): boolean => {
        cnt = cnt + 1;
        return v > 0;
      });
      expect(r).assertTrue();
      expect(cnt).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6200
     * @tc.name int32ArrayPropertiesPart04Test062
     * @tc.desc Verify some length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 1, 0]);
      let cnt: int = 0;
      let r: boolean = arr.some((v: number, _i: int, _arr: Int32Array): boolean => {
        cnt = cnt + 1;
        return v === 1;
      });
      expect(r).assertTrue();
      expect(cnt < arr.length).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6300
     * @tc.name int32ArrayPropertiesPart04Test063
     * @tc.desc Verify filter a.byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 4, 4);
      let offs: number[] = [];
      let r: Int32Array = arr.filter((v: number, _i: int, _arr: Int32Array): boolean => {
        offs.push(arr.byteOffset);
        return true;
      });
      expect(r.length).assertEqual(4);
      for (let i: int = 0; i < offs.length; i++) {
        expect(offs[i]).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6400
     * @tc.name int32ArrayPropertiesPart04Test064
     * @tc.desc Verify forEach $_set 10 v+10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        a.$_set(i, v + 10);
      });
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(12);
      expect(arr.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6500
     * @tc.name int32ArrayPropertiesPart04Test065
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let seen: number[] = [];
      a.forEach((v: number, _i: int, _arr: Int32Array): void => {
        seen.push(v);
        b.$_set(1, 99);
      });
      expect(seen.length).assertEqual(4);
      expect(a.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6600
     * @tc.name int32ArrayPropertiesPart04Test066
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let lens: number[] = [];
      arr.forEach((v: number, i: int, _arr: Int32Array): void => {
        lens.push(arr.length);
        arr.$_set(i, v * 2);
      });
      for (let i: int = 0; i < lens.length; i++) {
        expect(lens[i]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6700
     * @tc.name int32ArrayPropertiesPart04Test067
     * @tc.desc Verify map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let out: Int32Array = arr.map((v: number, _i: int, a: Int32Array): number => {
        a.$_set(2, 100);
        return v + 1;
      });
      expect(out.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6800
     * @tc.name int32ArrayPropertiesPart04Test068
     * @tc.desc Verify for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let cnt: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        let v: number = arr.$_get(i);
        arr.$_set(cnt, v + 1);
        cnt = cnt + 1;
        if (cnt === 2) {
          break;
        }
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_6900
     * @tc.name int32ArrayPropertiesPart04Test069
     * @tc.desc Verify from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([1, 2, 3]);
      let cp: Int32Array = Int32Array.from(orig);
      let _d: boolean = cp.buffer !== orig.buffer;
      expect(_d).assertTrue();
      expect(cp.length).assertEqual(orig.length);
      cp.$_set(0, 99);
      expect(orig.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7000
     * @tc.name int32ArrayPropertiesPart04Test070
     * @tc.desc Verify of buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let b: Int32Array = Int32Array.of(10, 20, 30);
      let _d: boolean = a.buffer !== b.buffer;
      expect(_d).assertTrue();
      a.$_set(0, 100);
      expect(b.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7100
     * @tc.name int32ArrayPropertiesPart04Test071
     * @tc.desc Verify slice buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let sl: Int32Array = arr.slice(1, 3);
      let _d: boolean = sl.buffer !== buf;
      expect(_d).assertTrue();
      expect(sl.length).assertEqual(2);
      expect(sl.$_get(0)).assertEqual(2);
      expect(sl.$_get(1)).assertEqual(3);
      sl.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7200
     * @tc.name int32ArrayPropertiesPart04Test072
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let bl: number = arr.byteLength;
      let sl: Int32Array = arr.slice();
      arr.fill(0);
      expect(sl.$_get(0)).assertEqual(1);
      expect(sl.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7300
     * @tc.name int32ArrayPropertiesPart04Test073
     * @tc.desc Verify set source.length+offset > this.length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let len0: number = a.length;
      let off0: number = a.byteOffset;
      try {
        a.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(len0);
      expect(a.byteOffset).assertEqual(off0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7400
     * @tc.name int32ArrayPropertiesPart04Test074
     * @tc.desc Verify 4 byteOffset RangeError buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 123);
      let threw: boolean = false;
      try {
        let a: Int32Array = new Int32Array(buf, 1, 2);
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertTrue();
      expect(base.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7500
     * @tc.name int32ArrayPropertiesPart04Test075
     * @tc.desc Verify length buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let threw: boolean = false;
      try {
        let a: Int32Array = new Int32Array(buf, 4, 2);
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7600
     * @tc.name int32ArrayPropertiesPart04Test076
     * @tc.desc Verify $_set at length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      a.fill(5);
      try {
        a.$_set(3, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7700
     * @tc.name int32ArrayPropertiesPart04Test077
     * @tc.desc Verify $_set at -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(0, 3);
      child.fill(7);
      try {
        parent.$_set(-1, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7800
     * @tc.name int32ArrayPropertiesPart04Test078
     * @tc.desc Verify buffer length/byteLength=0 buffer buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let empty: Int32Array = new Int32Array(buf, 8, 0);
      expect(empty.length).assertEqual(0);
      expect(empty.byteLength).assertEqual(0);
      expect(empty.buffer).assertEqual(buf);
      expect(empty.BYTES_PER_ELEMENT).assertEqual(4);
      expect(empty.name).assertEqual('Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART04_7900
     * @tc.name int32ArrayPropertiesPart04Test079
     * @tc.desc Verify fill+reverse+sort buffer === buffer BYTES_PER_ELEMENT=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 4);
      arr.fill(0);
      arr.reverse();
      arr.sort();
      let src: Int32Array = new Int32Array([2]);
      arr.set(src, 1);
      arr.copyWithin(2, 0);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.name).assertEqual('Int32Array');
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

  });
}
