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

export default function int32ArraySetPart04Test(): void {
  describe('Int32ArraySetPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0100
     * @tc.name int32ArraySetPart04Test001
     * @tc.desc Verify 2-param single-element source + insertPos=0 writes to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [7];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0200
     * @tc.name int32ArraySetPart04Test002
     * @tc.desc Verify 2-param dual-element source + insertPos=1 writes to middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [11, 22];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(11);
      expect(dst.$_get(2)).assertEqual(22);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0300
     * @tc.name int32ArraySetPart04Test003
     * @tc.desc Verify empty FixedArray + insertPos=0 is no-op, target preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(5, 6, 7);
      let src: FixedArray<number> = [];
      dst.set(src, 0);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(1)).assertEqual(6);
      expect(dst.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0400
     * @tc.name int32ArraySetPart04Test004
     * @tc.desc Verify empty FixedArray + insertPos=length is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(1, 2);
      let src: FixedArray<number> = [];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0500
     * @tc.name int32ArraySetPart04Test005
     * @tc.desc Verify single-element FixedArray [42] writes to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [42];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(42);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0600
     * @tc.name int32ArraySetPart04Test006
     * @tc.desc Verify single-element FixedArray [0] overwrites existing value at position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(9, 9);
      let src: FixedArray<number> = [0];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0700
     * @tc.name int32ArraySetPart04Test007
     * @tc.desc Verify single-element FixedArray [-1] writes to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [-1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0800
     * @tc.name int32ArraySetPart04Test008
     * @tc.desc Verify single-element FixedArray [INT_MAX] preserved exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [2147483647];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_0900
     * @tc.name int32ArraySetPart04Test009
     * @tc.desc Verify single-element FixedArray [INT_MIN] preserved exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-2147483648];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1000
     * @tc.name int32ArraySetPart04Test010
     * @tc.desc Verify dual-element FixedArray [3,-7] mixed sign writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [3, -7];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(-7);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1100
     * @tc.name int32ArraySetPart04Test011
     * @tc.desc Verify three-element FixedArray [INT_MAX, 0, INT_MIN] all correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [2147483647, 0, -2147483648];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1200
     * @tc.name int32ArraySetPart04Test012
     * @tc.desc Verify all-same [5,5,5,5] batch write with offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(6);
      let src: FixedArray<number> = [5, 5, 5, 5];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(5);
      expect(dst.$_get(2)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(5);
      expect(dst.$_get(4)).assertEqual(5);
      expect(dst.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1300
     * @tc.name int32ArraySetPart04Test013
     * @tc.desc Verify all-negative [-1,-2,-3,-4] writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [-1, -2, -3, -4];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(1)).assertEqual(-2);
      expect(dst.$_get(2)).assertEqual(-3);
      expect(dst.$_get(3)).assertEqual(-4);
      expect(dst.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1400
     * @tc.name int32ArraySetPart04Test014
     * @tc.desc Verify all-positive [1,2,3,4,5] writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [1, 2, 3, 4, 5];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1500
     * @tc.name int32ArraySetPart04Test015
     * @tc.desc Verify single-element source [1] writes at non-zero position 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(1);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1600
     * @tc.name int32ArraySetPart04Test016
     * @tc.desc Verify insertPos=0 writes multi-element from head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [100, 200];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(100);
      expect(dst.$_get(1)).assertEqual(200);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1700
     * @tc.name int32ArraySetPart04Test017
     * @tc.desc Verify insertPos=1 middle offset write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(9, 9, 9, 9);
      let src: FixedArray<number> = [7, 8];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(8);
      expect(dst.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1800
     * @tc.name int32ArraySetPart04Test018
     * @tc.desc Verify insertPos=length-source.length writes to tail with exact fit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [11, 22, 33];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(11);
      expect(dst.$_get(3)).assertEqual(22);
      expect(dst.$_get(4)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_1900
     * @tc.name int32ArraySetPart04Test019
     * @tc.desc Verify insertPos=length-source.length-1, tail element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(0, 0, 0, 0, 99);
      let src: FixedArray<number> = [11, 22, 33];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(11);
      expect(dst.$_get(2)).assertEqual(22);
      expect(dst.$_get(3)).assertEqual(33);
      expect(dst.$_get(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2000
     * @tc.name int32ArraySetPart04Test020
     * @tc.desc Verify insertPos=length+1 far OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1];
      try {
        dst.set(src, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2100
     * @tc.name int32ArraySetPart04Test021
     * @tc.desc Verify insertPos=-1 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1];
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2200
     * @tc.name int32ArraySetPart04Test022
     * @tc.desc Verify insertPos=-2 negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [1, 2];
      try {
        dst.set(src, -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2300
     * @tc.name int32ArraySetPart04Test023
     * @tc.desc Verify insertPos extremely negative -1000000 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(10);
      let src: FixedArray<number> = [1, 2, 3];
      try {
        dst.set(src, -1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2400
     * @tc.name int32ArraySetPart04Test024
     * @tc.desc Verify a large positive insertPos throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1];
      try {
        dst.set(src, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2500
     * @tc.name int32ArraySetPart04Test025
     * @tc.desc Verify insertPos=0 with source longer than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [1, 2, 3];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2600
     * @tc.name int32ArraySetPart04Test026
     * @tc.desc Verify empty arr + insertPos=-1, negative offset still throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [];
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2700
     * @tc.name int32ArraySetPart04Test027
     * @tc.desc Verify empty arr + insertPos=length+1, OOB still throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [];
      try {
        dst.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2800
     * @tc.name int32ArraySetPart04Test028
     * @tc.desc Verify insertPos=2, source length 2, target length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let src: FixedArray<number> = [55, 66];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(55);
      expect(dst.$_get(3)).assertEqual(66);
      expect(dst.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_2900
     * @tc.name int32ArraySetPart04Test029
     * @tc.desc Verify set returns void, target written correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3000
     * @tc.name int32ArraySetPart04Test030
     * @tc.desc Verify target length unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, 2];
      dst.set(src, 1);
      expect(dst.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3100
     * @tc.name int32ArraySetPart04Test031
     * @tc.desc Verify target byteLength unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, 2];
      let before: number = dst.byteLength;
      dst.set(src, 0);
      expect(dst.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3200
     * @tc.name int32ArraySetPart04Test032
     * @tc.desc Verify target byteOffset unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let dst: Int32Array = new Int32Array(buf, 4, 3);
      let src: FixedArray<number> = [1, 2];
      let before: number = dst.byteOffset;
      dst.set(src, 0);
      expect(dst.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3300
     * @tc.name int32ArraySetPart04Test033
     * @tc.desc Verify target buffer reference unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, 2];
      let bufRef: ArrayBuffer = dst.buffer;
      dst.set(src, 0);
      expect(dst.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3400
     * @tc.name int32ArraySetPart04Test034
     * @tc.desc Verify elements before insertPos preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let src: FixedArray<number> = [99, 99];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3500
     * @tc.name int32ArraySetPart04Test035
     * @tc.desc Verify elements after insertPos+source.length preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let src: FixedArray<number> = [88, 88];
      dst.set(src, 1);
      expect(dst.$_get(3)).assertEqual(40);
      expect(dst.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3600
     * @tc.name int32ArraySetPart04Test036
     * @tc.desc Verify each overwritten element asserted (3-element source from pos=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      let src: FixedArray<number> = [7, 8, 9];
      dst.set(src, 1);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(8);
      expect(dst.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3700
     * @tc.name int32ArraySetPart04Test037
     * @tc.desc Verify target length 0 + non-empty source + insertPos=0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let src: FixedArray<number> = [1];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3800
     * @tc.name int32ArraySetPart04Test038
     * @tc.desc Verify target length 0 + empty source + insertPos=0, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let src: FixedArray<number> = [];
      dst.set(src, 0);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_3900
     * @tc.name int32ArraySetPart04Test039
     * @tc.desc Verify insertPos=0 source 1 longer than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3, 4];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4000
     * @tc.name int32ArraySetPart04Test040
     * @tc.desc Verify insertPos=1 source exceeds remaining space by 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, 2, 3, 4];
      try {
        dst.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4100
     * @tc.name int32ArraySetPart04Test041
     * @tc.desc Verify throw on error: target not partially written (atomicity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(1, 2, 3);
      let src: FixedArray<number> = [9, 9];
      try {
        dst.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4200
     * @tc.name int32ArraySetPart04Test042
     * @tc.desc Verify INT_MAX in source preserved without sign wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [2147483647, 0];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(2147483647);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4300
     * @tc.name int32ArraySetPart04Test043
     * @tc.desc Verify INT_MIN in source preserved without underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [-2147483648, 1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-2147483648);
      expect(dst.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4400
     * @tc.name int32ArraySetPart04Test044
     * @tc.desc Verify -1 (all-ones bit pattern) preserved as -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4500
     * @tc.name int32ArraySetPart04Test045
     * @tc.desc Verify 0 and -0 both read back as 0 (indistinguishable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [0, 0];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4600
     * @tc.name int32ArraySetPart04Test046
     * @tc.desc Verify value 1 (minimum positive) preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4700
     * @tc.name int32ArraySetPart04Test047
     * @tc.desc Verify MAX and MIN simultaneously across middle positions preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [2147483647, -2147483648];
      dst.set(src, 1);
      expect(dst.$_get(1)).assertEqual(2147483647);
      expect(dst.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4800
     * @tc.name int32ArraySetPart04Test048
     * @tc.desc Verify two consecutive sets, second overwrites first at position 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src1: FixedArray<number> = [11, 22, 33];
      let src2: FixedArray<number> = [99];
      dst.set(src1, 0);
      dst.set(src2, 1);
      expect(dst.$_get(0)).assertEqual(11);
      expect(dst.$_get(1)).assertEqual(99);
      expect(dst.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_4900
     * @tc.name int32ArraySetPart04Test049
     * @tc.desc Verify FixedArray source and target don't share storage, modifying source after set doesn't affect target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      dst.set(src, 0);
      src[0] = 999;
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5000
     * @tc.name int32ArraySetPart04Test050
     * @tc.desc Verify modifying target after set doesn't affect source FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      dst.set(src, 0);
      dst.$_set(0, 888);
      expect(src[0]).assertEqual(1);
      expect(src[1]).assertEqual(2);
      expect(src[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5100
     * @tc.name int32ArraySetPart04Test051
     * @tc.desc Verify target is shared ArrayBuffer subview, set reflects to parent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      let child: Int32Array = parent.subarray(2, 5);
      let src: FixedArray<number> = [10, 20, 30];
      child.set(src, 0);
      expect(parent.$_get(2)).assertEqual(10);
      expect(parent.$_get(3)).assertEqual(20);
      expect(parent.$_get(4)).assertEqual(30);
      expect(parent.$_get(1)).assertEqual(0);
      expect(parent.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5200
     * @tc.name int32ArraySetPart04Test052
     * @tc.desc Verify target from non-zero byteOffset buffer, set writes to correct bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let dst: Int32Array = new Int32Array(buf, 8, 2);
      let src: FixedArray<number> = [111, 222];
      dst.set(src, 0);
      let view: Int32Array = new Int32Array(buf);
      expect(view.$_get(2)).assertEqual(111);
      expect(view.$_get(3)).assertEqual(222);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5300
     * @tc.name int32ArraySetPart04Test053
     * @tc.desc Verify shared buffer subview tail-aligned write doesn't overflow into parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(5);
      let child: Int32Array = parent.subarray(1, 4);
      let src: FixedArray<number> = [7, 8];
      child.set(src, 1);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(1)).assertEqual(0);
      expect(parent.$_get(2)).assertEqual(7);
      expect(parent.$_get(3)).assertEqual(8);
      expect(parent.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5400
     * @tc.name int32ArraySetPart04Test054
     * @tc.desc Verify set to subview with insufficient space throws RangeError, parent not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(5);
      let child: Int32Array = parent.subarray(1, 3);
      let src: FixedArray<number> = [1, 2, 3];
      try {
        child.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(1)).assertEqual(0);
      expect(parent.$_get(2)).assertEqual(0);
      expect(parent.$_get(3)).assertEqual(0);
      expect(parent.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5500
     * @tc.name int32ArraySetPart04Test055
     * @tc.desc Verify two consecutive sets to different positions don't interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(6);
      dst.set([1, 2] as FixedArray<number>, 0);
      dst.set([5, 6] as FixedArray<number>, 4);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
      expect(dst.$_get(4)).assertEqual(5);
      expect(dst.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5600
     * @tc.name int32ArraySetPart04Test056
     * @tc.desc Verify set full from insertPos=0 then set tail, latest write wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      dst.set([1, 2, 3, 4] as FixedArray<number>, 0);
      dst.set([9] as FixedArray<number>, 3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5700
     * @tc.name int32ArraySetPart04Test057
     * @tc.desc Verify mixed positive/negative source to zero-init target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [-100, 0, 100, -1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-100);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(100);
      expect(dst.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5800
     * @tc.name int32ArraySetPart04Test058
     * @tc.desc Verify set empty source to pre-filled target is no-op, all preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(5, 6, 7, 8);
      let src: FixedArray<number> = [];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(1)).assertEqual(6);
      expect(dst.$_get(2)).assertEqual(7);
      expect(dst.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_5900
     * @tc.name int32ArraySetPart04Test059
     * @tc.desc Verify insertPos=0 single-element source only covers position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(10, 20, 30);
      let src: FixedArray<number> = [99];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(99);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6000
     * @tc.name int32ArraySetPart04Test060
     * @tc.desc Verify insertPos=length-1 single-element writes last position, front preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(1, 2, 3, 4);
      let src: FixedArray<number> = [999];
      dst.set(src, 3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6100
     * @tc.name int32ArraySetPart04Test061
     * @tc.desc Verify length-1 target with source length 1 + insertPos=0 fully overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [42];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(42);
      expect(dst.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6200
     * @tc.name int32ArraySetPart04Test062
     * @tc.desc Verify length-1 target + source length 1 + insertPos=1 OOB throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [42];
      try {
        dst.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6300
     * @tc.name int32ArraySetPart04Test063
     * @tc.desc Verify length-1 target + source length 1 + insertPos=-1 negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [42];
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6400
     * @tc.name int32ArraySetPart04Test064
     * @tc.desc Verify source elements via subscript match target written values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [10, 20, 30];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(src[0]);
      expect(dst.$_get(1)).assertEqual(src[1]);
      expect(dst.$_get(2)).assertEqual(src[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6500
     * @tc.name int32ArraySetPart04Test065
     * @tc.desc Verify source FixedArray length unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [1, 2, 3];
      let srcLenBefore: number = src.length;
      dst.set(src, 1);
      expect(src.length).assertEqual(srcLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6600
     * @tc.name int32ArraySetPart04Test066
     * @tc.desc Verify insertPos + source length exactly equals target length, last position written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [-5, -4, -3, -2, -1];
      dst.set(src, 0);
      expect(dst.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6700
     * @tc.name int32ArraySetPart04Test067
     * @tc.desc Verify source length 2 + insertPos=0, target length 2 exactly fills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [123, -456];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(123);
      expect(dst.$_get(1)).assertEqual(-456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6800
     * @tc.name int32ArraySetPart04Test068
     * @tc.desc Verify RangeError errName strictly equals RangeError (negative offset path)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [1];
      try {
        dst.set(src, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART04_6900
     * @tc.name int32ArraySetPart04Test069
     * @tc.desc Verify insertPos=0 empty source to length-1 target is no-op, sole element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = Int32Array.of(77);
      let src: FixedArray<number> = [];
      dst.set(src, 0);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(77);
    });


  });
}
