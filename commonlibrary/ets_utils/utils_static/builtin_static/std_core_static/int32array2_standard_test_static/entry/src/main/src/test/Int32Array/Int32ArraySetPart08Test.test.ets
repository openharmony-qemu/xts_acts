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

export default function int32ArraySetPart08Test(): void {
  describe('Int32ArraySetPart08Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0100
     * @tc.name int32ArraySetPart08Test001
     * @tc.desc Verify (int, number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      dst.set(1, 99);
      expect(dst.length).assertEqual(4);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(99);
      expect(dst.$_get(2)).assertEqual(30);
      expect(dst.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0200
     * @tc.name int32ArraySetPart08Test002
     * @tc.desc Verify FixedArray<number> FixedArray offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [7, 8, 9, 10];
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(9);
      expect(dst.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0300
     * @tc.name int32ArraySetPart08Test003
     * @tc.desc Verify FixedArray<number> + FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [11, 22];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(11);
      expect(dst.$_get(3)).assertEqual(22);
      expect(dst.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0400
     * @tc.name int32ArraySetPart08Test004
     * @tc.desc Verify Int32Array Int32Array offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([4, 5, 6]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(4);
      expect(dst.$_get(1)).assertEqual(5);
      expect(dst.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0500
     * @tc.name int32ArraySetPart08Test005
     * @tc.desc Verify Int32Array + Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: Int32Array = new Int32Array([33, 44]);
      dst.set(src, 3);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(33);
      expect(dst.$_get(4)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0600
     * @tc.name int32ArraySetPart08Test006
     * @tc.desc Verify (0,0) set ArrayLike offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      dst.set(0, 0);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(4);
      expect(dst.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0700
     * @tc.name int32ArraySetPart08Test007
     * @tc.desc Verify FixedArray<E> FixedArray<number> E=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dstA: Int32Array = new Int32Array(3);
      let dstB: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      dstA.set(src);
      dstB.set(src, 0);
      expect(dstA.$_get(0)).assertEqual(1);
      expect(dstA.$_get(1)).assertEqual(2);
      expect(dstA.$_get(2)).assertEqual(3);
      expect(dstB.$_get(0)).assertEqual(1);
      expect(dstB.$_get(1)).assertEqual(2);
      expect(dstB.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0800
     * @tc.name int32ArraySetPart08Test008
     * @tc.desc Verify offset=0 offset Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dstA: Int32Array = new Int32Array([8, 8, 8]);
      let dstB: Int32Array = new Int32Array([8, 8, 8]);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      dstA.set(src);
      dstB.set(src, 0);
      expect(dstA.$_get(0)).assertEqual(1);
      expect(dstA.$_get(1)).assertEqual(2);
      expect(dstA.$_get(2)).assertEqual(3);
      expect(dstB.$_get(0)).assertEqual(1);
      expect(dstB.$_get(1)).assertEqual(2);
      expect(dstB.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_0900
     * @tc.name int32ArraySetPart08Test009
     * @tc.desc Verify FixedArray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dstFA: Int32Array = new Int32Array(4);
      let dstTA: Int32Array = new Int32Array(4);
      let fa: FixedArray<number> = [10, 20, 30, 40];
      let ta: Int32Array = new Int32Array([10, 20, 30, 40]);
      dstFA.set(fa);
      dstTA.set(ta);
      expect(dstFA.$_get(0)).assertEqual(dstTA.$_get(0));
      expect(dstFA.$_get(1)).assertEqual(dstTA.$_get(1));
      expect(dstFA.$_get(2)).assertEqual(dstTA.$_get(2));
      expect(dstFA.$_get(3)).assertEqual(dstTA.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1000
     * @tc.name int32ArraySetPart08Test010
     * @tc.desc Verify FixedArray offset=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([5, 5, 5, 5]);
      let src: FixedArray<number> = [1, 2];
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1100
     * @tc.name int32ArraySetPart08Test011
     * @tc.desc Verify Int32Array offset=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([6, 6, 6, 6]);
      let src: Int32Array = new Int32Array([7, 8]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(6);
      expect(dst.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1200
     * @tc.name int32ArraySetPart08Test012
     * @tc.desc Verify offset= target.length - source.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dstFA: Int32Array = new Int32Array(5);
      let dstTA: Int32Array = new Int32Array(5);
      let fa: FixedArray<number> = [77, 88];
      let ta: Int32Array = new Int32Array([77, 88]);
      dstFA.set(fa, 3);
      dstTA.set(ta, 3);
      expect(dstFA.$_get(3)).assertEqual(77);
      expect(dstFA.$_get(4)).assertEqual(88);
      expect(dstTA.$_get(3)).assertEqual(77);
      expect(dstTA.$_get(4)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1300
     * @tc.name int32ArraySetPart08Test013
     * @tc.desc Verify (int, E) undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let r: Object = dst.set(0, 1) as Object;
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1400
     * @tc.name int32ArraySetPart08Test014
     * @tc.desc Verify (int, number) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let r: Object = dst.set(1, 5) as Object;
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1500
     * @tc.name int32ArraySetPart08Test015
     * @tc.desc Verify FixedArray undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let fa: FixedArray<number> = [1, 2, 3];
      let r: Object = dst.set(fa) as Object;
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1600
     * @tc.name int32ArraySetPart08Test016
     * @tc.desc Verify FixedArray undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let fa: FixedArray<number> = [1];
      let r: Object = dst.set(fa, 2) as Object;
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1700
     * @tc.name int32ArraySetPart08Test017
     * @tc.desc Verify Int32Array undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([3, 4]);
      let r: Object = dst.set(src) as Object;
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1800
     * @tc.name int32ArraySetPart08Test018
     * @tc.desc Verify Int32Array undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([5]);
      let r: Object = dst.set(src, 3) as Object;
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_1900
     * @tc.name int32ArraySetPart08Test019
     * @tc.desc Verify FixedArray RangeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let big: FixedArray<number> = [1, 2, 3, 4];
      try {
        dst.set(big);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2000
     * @tc.name int32ArraySetPart08Test020
     * @tc.desc Verify Int32Array RangeError length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let big: Int32Array = new Int32Array([1, 2, 3]);
      try {
        dst.set(big);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2100
     * @tc.name int32ArraySetPart08Test021
     * @tc.desc Verify offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([9, 9, 9]);
      let fa: FixedArray<number> = [1, 2];
      try {
        dst.set(fa, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(9);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2200
     * @tc.name int32ArraySetPart08Test022
     * @tc.desc Verify offset Int32Array RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([5, 5, 5]);
      let src: Int32Array = new Int32Array([7, 8]);
      try {
        dst.set(src, -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(1)).assertEqual(5);
      expect(dst.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2300
     * @tc.name int32ArraySetPart08Test023
     * @tc.desc Verify offset+source.length byteLength/buffer/byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let bufBefore: ArrayBuffer = dst.buffer;
      let boBefore: number = dst.byteOffset;
      let blBefore: number = dst.byteLength;
      let fa: FixedArray<number> = [1, 2, 3];
      try {
        dst.set(fa, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.buffer).assertEqual(bufBefore);
      expect(dst.byteOffset).assertEqual(boBefore);
      expect(dst.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2400
     * @tc.name int32ArraySetPart08Test024
     * @tc.desc Verify set with a negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let dst: Int32Array = new Int32Array([11, 22]);
        dst.set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2500
     * @tc.name int32ArraySetPart08Test025
     * @tc.desc Verify set at array length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let dst: Int32Array = new Int32Array([33, 44]);
        dst.set(2, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2600
     * @tc.name int32ArraySetPart08Test026
     * @tc.desc Verify FixedArray set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([5, 6, 7]);
      let empty: FixedArray<number> = [];
      dst.set(empty);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(1)).assertEqual(6);
      expect(dst.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2700
     * @tc.name int32ArraySetPart08Test027
     * @tc.desc Verify Int32Array set length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2]);
      let empty: Int32Array = new Int32Array(0);
      dst.set(empty);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2800
     * @tc.name int32ArraySetPart08Test028
     * @tc.desc Verify FixedArray + offset no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([8, 9]);
      let empty: FixedArray<number> = [];
      dst.set(empty, 1);
      expect(dst.$_get(0)).assertEqual(8);
      expect(dst.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_2900
     * @tc.name int32ArraySetPart08Test029
     * @tc.desc Verify Int32Array + offset no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([3, 4]);
      let empty: Int32Array = new Int32Array(0);
      dst.set(empty, 1);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3000
     * @tc.name int32ArraySetPart08Test030
     * @tc.desc Verify set 4294967295 (0xFFFFFFFF) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      dst.set(0, 4294967295);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3100
     * @tc.name int32ArraySetPart08Test031
     * @tc.desc Verify FixedArray Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let fa: FixedArray<number> = [Number.NaN, 2.5];
      dst.set(fa);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3200
     * @tc.name int32ArraySetPart08Test032
     * @tc.desc Verify FixedArray 3.9 3 -2.1 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let fa: FixedArray<number> = [3.9, -2.1];
      dst.set(fa);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3300
     * @tc.name int32ArraySetPart08Test033
     * @tc.desc Verify Int32Array int32 set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([0, -1, 2147483647]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(-1);
      expect(dst.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3400
     * @tc.name int32ArraySetPart08Test034
     * @tc.desc Verify -0 ToInt32 0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      dst.set(0, -0);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3500
     * @tc.name int32ArraySetPart08Test035
     * @tc.desc Verify FixedArray -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      let fa: FixedArray<number> = [-0];
      dst.set(fa);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3600
     * @tc.name int32ArraySetPart08Test036
     * @tc.desc Verify 0.1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(1);
      dst.set(0, 0.1);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3700
     * @tc.name int32ArraySetPart08Test037
     * @tc.desc Verify Int32Array set buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([1, 2, 3]);
      dst.set(src);
      src.$_set(0, 999);
      expect(dst.$_get(0)).assertEqual(1);
      expect(src.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3800
     * @tc.name int32ArraySetPart08Test038
     * @tc.desc Verify Int32Array set buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let buf: ArrayBuffer = dst.buffer;
      let src: Int32Array = new Int32Array([4, 5, 6]);
      dst.set(src);
      expect(dst.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_3900
     * @tc.name int32ArraySetPart08Test039
     * @tc.desc Verify FixedArray set FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let fa: FixedArray<number> = [7, 8, 9];
      dst.set(fa);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(9);
      expect(fa[0]).assertEqual(7);
      expect(fa[1]).assertEqual(8);
      expect(fa[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4000
     * @tc.name int32ArraySetPart08Test040
     * @tc.desc Verify Int32Array subarray buffer set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let dst: Int32Array = base.subarray(4, 6);
      let src: Int32Array = base.subarray(0, 2);
      dst.set(src);
      expect(base.$_get(4)).assertEqual(1);
      expect(base.$_get(5)).assertEqual(2);
      expect(base.$_get(0)).assertEqual(1);
      expect(base.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4100
     * @tc.name int32ArraySetPart08Test041
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let dst: Int32Array = base.subarray(0, 4);
      let src: Int32Array = base.subarray(2, 6);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(30);
      expect(dst.$_get(1)).assertEqual(40);
      expect(dst.$_get(2)).assertEqual(50);
      expect(dst.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4200
     * @tc.name int32ArraySetPart08Test042
     * @tc.desc Verify set subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let prefix: Int32Array = dst.subarray(0, 3);
      dst.set(prefix, 2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(1);
      expect(dst.$_get(3)).assertEqual(2);
      expect(dst.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4300
     * @tc.name int32ArraySetPart08Test043
     * @tc.desc Verify set subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let fa: FixedArray<number> = [10, 20, 30, 40];
      dst.set(fa);
      let view: Int32Array = dst.subarray(1, 3);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4400
     * @tc.name int32ArraySetPart08Test044
     * @tc.desc Verify ArrayBuffer Int32Array set DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Int32Array = new Int32Array(buf);
      let fa: FixedArray<number> = [1, 2];
      dst.set(fa);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4500
     * @tc.name int32ArraySetPart08Test045
     * @tc.desc Verify ArrayBuffer Int32Array A set B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      let fa: FixedArray<number> = [55, 66];
      a.set(fa);
      b.set(a);
      expect(b.$_get(0)).assertEqual(55);
      expect(b.$_get(1)).assertEqual(66);
      expect(a.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4600
     * @tc.name int32ArraySetPart08Test046
     * @tc.desc Verify Int32Array set byteLength/byteOffset/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([9, 8, 7]);
      let lenBefore: number = src.length;
      let blBefore: number = src.byteLength;
      let boBefore: number = src.byteOffset;
      dst.set(src);
      expect(src.length).assertEqual(lenBefore);
      expect(src.byteLength).assertEqual(blBefore);
      expect(src.byteOffset).assertEqual(boBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4700
     * @tc.name int32ArraySetPart08Test047
     * @tc.desc Verify FixedArray set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let fa: FixedArray<number> = [1, 2, 3];
      let flen: number = fa.length;
      dst.set(fa);
      expect(fa.length).assertEqual(flen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4800
     * @tc.name int32ArraySetPart08Test048
     * @tc.desc Verify FixedArray set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let before: number = dst.length;
      let fa: FixedArray<number> = [1, 2];
      dst.set(fa);
      expect(dst.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_4900
     * @tc.name int32ArraySetPart08Test049
     * @tc.desc Verify Int32Array set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let before: number = dst.length;
      let src: Int32Array = new Int32Array([1, 2, 3]);
      dst.set(src);
      expect(dst.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5000
     * @tc.name int32ArraySetPart08Test050
     * @tc.desc Verify set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let before: number = dst.length;
      dst.set(1, 42);
      expect(dst.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5100
     * @tc.name int32ArraySetPart08Test051
     * @tc.desc Verify set BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let fa: FixedArray<number> = [1, 2];
      dst.set(fa, 1);
      expect(dst.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5200
     * @tc.name int32ArraySetPart08Test052
     * @tc.desc Verify set toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0]);
      dst.set(1, 7);
      let s: string = dst.toString();
      expect(s).assertEqual('0,7,0');
      expect(dst.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5300
     * @tc.name int32ArraySetPart08Test053
     * @tc.desc Verify set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let fa: FixedArray<number> = [10, 20];
      dst.set(fa, 1);
      expect(dst.$_get(1)).assertEqual(10);
      expect(dst.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5400
     * @tc.name int32ArraySetPart08Test054
     * @tc.desc Verify set $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let fa: FixedArray<number> = [1, 2];
      dst.set(fa);
      dst.$_set(0, 100);
      expect(dst.$_get(0)).assertEqual(100);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5500
     * @tc.name int32ArraySetPart08Test055
     * @tc.desc Verify set FixedArray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(6);
      dst.set(0, 11);
      let fa: FixedArray<number> = [22, 33];
      dst.set(fa, 1);
      let src: Int32Array = new Int32Array([55, 66]);
      dst.set(src, 4);
      expect(dst.$_get(0)).assertEqual(11);
      expect(dst.$_get(1)).assertEqual(22);
      expect(dst.$_get(2)).assertEqual(33);
      expect(dst.$_get(3)).assertEqual(0);
      expect(dst.$_get(4)).assertEqual(55);
      expect(dst.$_get(5)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5600
     * @tc.name int32ArraySetPart08Test056
     * @tc.desc Verify FixedArray set offset=0 set(0,val)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dstA: Int32Array = new Int32Array([5]);
      let dstB: Int32Array = new Int32Array([5]);
      dstA.set(0, 42);
      let fa: FixedArray<number> = [42];
      dstB.set(fa);
      expect(dstA.$_get(0)).assertEqual(42);
      expect(dstB.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5700
     * @tc.name int32ArraySetPart08Test057
     * @tc.desc Verify Int32Array set offset=0 set(0,val)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dstA: Int32Array = new Int32Array([7]);
      let dstB: Int32Array = new Int32Array([7]);
      dstA.set(0, 99);
      let src: Int32Array = new Int32Array([99]);
      dstB.set(src);
      expect(dstA.$_get(0)).assertEqual(99);
      expect(dstB.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5800
     * @tc.name int32ArraySetPart08Test058
     * @tc.desc Verify set / offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let fa: FixedArray<number> = [88, 99];
      dst.set(fa, 2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(88);
      expect(dst.$_get(3)).assertEqual(99);
      expect(dst.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_5900
     * @tc.name int32ArraySetPart08Test059
     * @tc.desc Verify 0 set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let fa: FixedArray<number> = [0, 0];
      dst.set(fa, 1);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6000
     * @tc.name int32ArraySetPart08Test060
     * @tc.desc Verify -1 set -1 int32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: Int32Array = new Int32Array([-1, -1]);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6100
     * @tc.name int32ArraySetPart08Test061
     * @tc.desc Verify offset=length past-end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let fa: FixedArray<number> = [];
      dst.set(fa, 3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6200
     * @tc.name int32ArraySetPart08Test062
     * @tc.desc Verify set FixedArray set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      dst.set(0, 111);
      let fa: FixedArray<number> = [222, 333, 444];
      dst.set(fa);
      expect(dst.$_get(0)).assertEqual(222);
      expect(dst.$_get(1)).assertEqual(333);
      expect(dst.$_get(2)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6300
     * @tc.name int32ArraySetPart08Test063
     * @tc.desc Verify Int32Array set set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([10, 20, 30]);
      dst.set(src);
      dst.set(1, 999);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(999);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6400
     * @tc.name int32ArraySetPart08Test064
     * @tc.desc Verify set on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let dst: Int32Array = new Int32Array(0);
        dst.set(0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6500
     * @tc.name int32ArraySetPart08Test065
     * @tc.desc Verify FixedArray set RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let fa: FixedArray<number> = [1];
      try {
        dst.set(fa);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART08_6600
     * @tc.name int32ArraySetPart08Test066
     * @tc.desc Verify set for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart08Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([10, 20, 30]);
      dst.set(src);
      let sum: number = 0;
      for (let i = 0; i < dst.length; i++) {
        sum = sum + dst.$_get(i);
      }
      expect(sum).assertEqual(60);
    });
  });
}
