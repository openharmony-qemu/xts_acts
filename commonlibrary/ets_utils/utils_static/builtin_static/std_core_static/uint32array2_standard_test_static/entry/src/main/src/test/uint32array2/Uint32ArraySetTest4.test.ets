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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySetFourTest(): void {
  describe('Uint32ArraySetFourTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0100
     * @tc.name testUint32ArraySetFour001
     * @tc.desc Verify set(0, v:byte) writes byte at insertPos 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const v: byte = 9;
      arr.set(0, v);
      expect(arr.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0200
     * @tc.name testUint32ArraySetFour002
     * @tc.desc Verify set(index, val) number and byte overloads write distinct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0);
      const bv: byte = 22;
      a.set(0, 11);
      b.set(0, bv);
      expect(a.$_get(0)).assertEqual(11);
      expect(b.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0300
     * @tc.name testUint32ArraySetFour003
     * @tc.desc Verify set(FixedArray<number>, insertPos) writes at given insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: FixedArray<number> = [5.0, 6.0];
      arr.set(src, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0400
     * @tc.name testUint32ArraySetFour004
     * @tc.desc Verify set(Uint32Array) writes at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(Uint32Array.of(3, 4));
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0500
     * @tc.name testUint32ArraySetFour005
     * @tc.desc Verify set(Uint32Array, offset) writes at given offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(Uint32Array.of(7, 8), 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0600
     * @tc.name testUint32ArraySetFour006
     * @tc.desc Verify set(ArrayLike, offset) writes [9,10] at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([9, 10], 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0700
     * @tc.name testUint32ArraySetFour007
     * @tc.desc Verify set(FixedArray<number>) and set(FixedArray<number>, 0) give same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: FixedArray<number> = [7.0, 8.0];
      a.set(src);
      b.set(src, 0);
      expect(a.join(",")).assertEqual("7,8,0");
      expect(b.join(",")).assertEqual("7,8,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0800
     * @tc.name testUint32ArraySetFour008
     * @tc.desc Verify set(Uint32Array) and set(Uint32Array, 0) give same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: Uint32Array = Uint32Array.of(4, 5);
      a.set(src);
      b.set(src, 0);
      expect(a.join(",")).assertEqual("4,5,0");
      expect(b.join(",")).assertEqual("4,5,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_0900
     * @tc.name testUint32ArraySetFour009
     * @tc.desc Verify set(ArrayLike) and set(ArrayLike, 0) give same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0, 0);
      a.set([6, 7]);
      b.set([6, 7], 0);
      expect(a.$_get(0)).assertEqual(6);
      expect(a.$_get(1)).assertEqual(7);
      expect(b.$_get(0)).assertEqual(6);
      expect(b.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1000
     * @tc.name testUint32ArraySetFour010
     * @tc.desc Verify set() variants preserve length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0, 0);
      let c: Uint32Array = Uint32Array.of(0, 0, 0);
      const fa: FixedArray<number> = [1.0, 2.0];
      a.set(fa);
      b.set(Uint32Array.of(1, 2));
      c.set([1, 2]);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      expect(c.length).assertEqual(3);
      expect(a.join(',')).assertEqual('1,2,0');
      expect(b.join(',')).assertEqual('1,2,0');
      expect(c.join(',')).assertEqual('1,2,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1100
     * @tc.name testUint32ArraySetFour011
     * @tc.desc Verify set() on Uint32Array view writes at view index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Uint32Array = new Uint32Array(buf, 4, 2);
      view.set([9, 9]);
      expect(view.$_get(0)).assertEqual(9);
      expect(view.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1200
     * @tc.name testUint32ArraySetFour012
     * @tc.desc Verify set(Uint32Array, out-of-range offset) throws RangeError leaves array intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(Uint32Array.of(4, 5), 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1300
     * @tc.name testUint32ArraySetFour013
     * @tc.desc Verify set(Uint32Array, out-of-range offset) throws RangeError preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let beforeLen: int = arr.length;
      try {
        arr.set(Uint32Array.of(4, 5), 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1400
     * @tc.name testUint32ArraySetFour014
     * @tc.desc Verify set(Uint32Array) with source larger than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let beforeLen: int = arr.length;
      try {
        arr.set(Uint32Array.of(4, 5, 6, 7), 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(beforeLen);
      expect(arr.join(",")).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1500
     * @tc.name testUint32ArraySetFour015
     * @tc.desc Verify set(FixedArray<number>) with source larger than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const src: FixedArray<number> = [4.0, 5.0, 6.0, 7.0];
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1600
     * @tc.name testUint32ArraySetFour016
     * @tc.desc Verify set(source, offset) out-of-range throws RangeError then set(index, val) writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(Uint32Array.of(9, 9), 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      arr.set(0, 100);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1700
     * @tc.name testUint32ArraySetFour017
     * @tc.desc Verify set(index, val) writes value at given index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(1, 50);
      expect(arr.join(',')).assertEqual('0,50,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1800
     * @tc.name testUint32ArraySetFour018
     * @tc.desc Verify set(int, val:E) returns undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const v: byte = 5;
      let r: void = arr.set(0, v);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_1900
     * @tc.name testUint32ArraySetFour019
     * @tc.desc Verify set(int,val) result verified via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(0, 1);
      arr.set(1, 2);
      arr.set(2, 3);
      expect(arr.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2000
     * @tc.name testUint32ArraySetFour020
     * @tc.desc Verify set(Uint32Array) result verified via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(Uint32Array.of(4, 5, 6));
      expect(arr.toString()).assertEqual("4,5,6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2100
     * @tc.name testUint32ArraySetFour021
     * @tc.desc Verify set(ArrayLike) result verified via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([7, 8, 9]);
      expect(arr.toString()).assertEqual("7,8,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2200
     * @tc.name testUint32ArraySetFour022
     * @tc.desc Verify set() variants preserve byteLength=length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0, 0);
      let c: Uint32Array = Uint32Array.of(0, 0, 0);
      a.set(0, 1);
      const fa: FixedArray<number> = [1.0, 2.0];
      b.set(fa);
      c.set([1, 2]);
      expect(a.byteLength).assertEqual(12);
      expect(b.byteLength).assertEqual(12);
      expect(c.byteLength).assertEqual(12);
      expect(a.join(',')).assertEqual('1,0,0');
      expect(b.join(',')).assertEqual('1,2,0');
      expect(c.join(',')).assertEqual('1,2,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2300
     * @tc.name testUint32ArraySetFour023
     * @tc.desc Verify set() variants preserve name 'Uint32Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0);
      a.set(0, 1);
      b.set([1, 2]);
      expect(a.name).assertEqual("Uint32Array");
      expect(b.name).assertEqual("Uint32Array");
      expect(a.join(',')).assertEqual('1,0');
      expect(b.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2400
     * @tc.name testUint32ArraySetFour024
     * @tc.desc Verify set() result readable via $_get after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const fa: FixedArray<number> = [1.0, 2.0];
      arr.set(fa);
      arr.$_set(2, 3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2500
     * @tc.name testUint32ArraySetFour025
     * @tc.desc Verify set(Uint32Array) does not alias source after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.set(src);
      src.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(src.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2600
     * @tc.name testUint32ArraySetFour026
     * @tc.desc Verify set(FixedArray<number>) writes all source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2700
     * @tc.name testUint32ArraySetFour027
     * @tc.desc Verify set(Uint32Array) target mutation does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.set(src);
      arr.$_set(0, 888);
      expect(src.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2800
     * @tc.name testUint32ArraySetFour028
     * @tc.desc Verify set(ArrayLike) writes all source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([1, 2, 3]);
      arr.$_set(0, 777);
      expect(arr.$_get(0)).assertEqual(777);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_2900
     * @tc.name testUint32ArraySetFour029
     * @tc.desc Verify set(Uint32Array) leaves tail unchanged when source shorter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.set(Uint32Array.of(7, 8));
      expect(arr.join(',')).assertEqual('7,8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3000
     * @tc.name testUint32ArraySetFour030
     * @tc.desc Verify set(FixedArray<number>) leaves tail unchanged when source shorter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const fa: FixedArray<number> = [7.0, 8.0];
      arr.set(fa);
      expect(arr.join(',')).assertEqual('7,8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3100
     * @tc.name testUint32ArraySetFour031
     * @tc.desc Verify set() on Uint32Array view preserves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Uint32Array = new Uint32Array(buf, 4, 3);
      let beforeOffset: int = view.byteOffset;
      view.set([5, 6, 7]);
      expect(view.byteOffset).assertEqual(beforeOffset);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3200
     * @tc.name testUint32ArraySetFour032
     * @tc.desc Verify set() writes visible through second view over same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Uint32Array = new Uint32Array(buf, 0, 3);
      let other: Uint32Array = new Uint32Array(buf, 0, 3);
      view.set([11, 22, 33]);
      expect(other.$_get(0)).assertEqual(11);
      expect(other.$_get(1)).assertEqual(22);
      expect(other.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3300
     * @tc.name testUint32ArraySetFour033
     * @tc.desc Verify child view set() reflects in parent via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Uint32Array = new Uint32Array(buf, 0, 4);
      let child: Uint32Array = new Uint32Array(buf, 4, 2);
      child.set([42, 43]);
      expect(parent.$_get(1)).assertEqual(42);
      expect(parent.$_get(2)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3400
     * @tc.name testUint32ArraySetFour034
     * @tc.desc Verify set() calls leave buffer identity unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let buf1: ArrayBuffer = arr.buffer;
      arr.set([1, 2, 3]);
      let buf2: ArrayBuffer = arr.buffer;
      arr.set([4, 5, 6]);
      let buf3: ArrayBuffer = arr.buffer;
      expect(buf1).assertEqual(buf2);
      expect(buf2).assertEqual(buf3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3500
     * @tc.name testUint32ArraySetFour035
     * @tc.desc Verify set(Uint32Array) with aliased buffer sees later mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Uint32Array = new Uint32Array(buf, 0, 3);
      let b: Uint32Array = new Uint32Array(buf, 0, 3);
      a.set([1, 2, 3]);
      b.set(a);
      a.$_set(0, 100);
      expect(b.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3600
     * @tc.name testUint32ArraySetFour036
     * @tc.desc Verify set() result observable through entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([5, 6, 7]);
      let first: number = -1;
      for (const entry of arr.entries()) {
        first = entry[1];
        break;
      }
      expect(first).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3700
     * @tc.name testUint32ArraySetFour037
     * @tc.desc Verify set() result observable through values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const fa: FixedArray<number> = [8.0, 9.0, 10.0];
      arr.set(fa);
      let first: number = -1;
      for (const v of arr.values()) {
        first = v;
        break;
      }
      expect(first).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3800
     * @tc.name testUint32ArraySetFour038
     * @tc.desc Verify set(int, val:number) with -2 wraps to 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, -2);
      expect(arr.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_3900
     * @tc.name testUint32ArraySetFour039
     * @tc.desc Verify set(int, val:number) with NaN writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 1);
      arr.set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4000
     * @tc.name testUint32ArraySetFour040
     * @tc.desc Verify set(FixedArray<number>) with 4294967296 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 1);
      const src: FixedArray<number> = [4294967296.0, 4294967296.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4100
     * @tc.name testUint32ArraySetFour041
     * @tc.desc Verify set(Uint32Array) with -1 element wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      let src: Uint32Array = Uint32Array.of(0, 0);
      src.$_set(0, -1);
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4200
     * @tc.name testUint32ArraySetFour042
     * @tc.desc Verify set(ArrayLike) with 0xFFFFFFFF writes uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set([0xFFFFFFFF, 0xFFFFFFFF]);
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4300
     * @tc.name testUint32ArraySetFour043
     * @tc.desc Verify set(int, val:E) with number 255 writes 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const v: number = 255;
      arr.set(0, v);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4400
     * @tc.name testUint32ArraySetFour044
     * @tc.desc Verify set(int, val:number) writes independently to two arrays without aliasing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint32Array = Uint32Array.of(0, 0);
      let b: Uint32Array = Uint32Array.of(0, 0);
      a.set(0, 4294967295);
      b.set(0, 1);
      expect(a.$_get(0)).assertEqual(4294967295);
      expect(b.$_get(0)).assertEqual(1);
      expect(a === b).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4500
     * @tc.name testUint32ArraySetFour045
     * @tc.desc Verify set(FixedArray<number>) with 0.5 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 1);
      const src: FixedArray<number> = [0.5, 0.9];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4600
     * @tc.name testUint32ArraySetFour046
     * @tc.desc Verify set(FixedArray<number>) with -0.0 writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 1);
      const src: FixedArray<number> = [-0.0, -0.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4700
     * @tc.name testUint32ArraySetFour047
     * @tc.desc Verify set(Uint32Array, offset) with 0x1FFFFFFFF wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(0, 0);
      src.$_set(0, 0x1FFFFFFFF);
      arr.set(src, 1);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4800
     * @tc.name testUint32ArraySetFour048
     * @tc.desc Verify set(ArrayLike, offset) with 99.99 truncates to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([99.99, 100.01], 1);
      expect(arr.$_get(1)).assertEqual(99);
      expect(arr.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_4900
     * @tc.name testUint32ArraySetFour049
     * @tc.desc Verify set(int, val:number) preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let beforeLen: int = arr.length;
      arr.set(0, 0xFFFFFFFF);
      expect(arr.length).assertEqual(beforeLen);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5000
     * @tc.name testUint32ArraySetFour050
     * @tc.desc Verify set(FixedArray<number>) result verifiable via join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const src: FixedArray<number> = [-1.0, -2.0];
      arr.set(src);
      expect(arr.join(",")).assertEqual("4294967295,4294967294");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5100
     * @tc.name testUint32ArraySetFour051
     * @tc.desc Verify set(Uint32Array) with all zeros writes zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 1, 1);
      arr.set(Uint32Array.of(0, 0, 0));
      expect(arr.join(",")).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5200
     * @tc.name testUint32ArraySetFour052
     * @tc.desc Verify set(int,val) followed by set(FixedArray<number>) overwrites value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(0, 99);
      const fa: FixedArray<number> = [1.0, 2.0];
      arr.set(fa);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5300
     * @tc.name testUint32ArraySetFour053
     * @tc.desc Verify set(FixedArray<number>) followed by set(int,val) overwrites index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const fa: FixedArray<number> = [5.0, 6.0, 7.0];
      arr.set(fa);
      arr.set(1, 88);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(88);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5400
     * @tc.name testUint32ArraySetFour054
     * @tc.desc Verify set(Uint32Array) followed by set(ArrayLike) overwrites values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(Uint32Array.of(1, 2, 3));
      arr.set([4, 5, 6]);
      expect(arr.join(",")).assertEqual("4,5,6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5500
     * @tc.name testUint32ArraySetFour055
     * @tc.desc Verify set(int,val) with byte and number overloads at different indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const bv: byte = 7;
      arr.set(0, bv);
      arr.set(1, 11);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5600
     * @tc.name testUint32ArraySetFour056
     * @tc.desc Verify set(FixedArray<number>, insertPos) followed by set(int,val)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      const fa: FixedArray<number> = [1.0, 2.0];
      arr.set(fa, 1);
      arr.set(0, 9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5700
     * @tc.name testUint32ArraySetFour057
     * @tc.desc Verify set(Uint32Array, offset) join reflects offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      arr.set(Uint32Array.of(3, 4), 2);
      expect(arr.join(",")).assertEqual("0,0,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5800
     * @tc.name testUint32ArraySetFour058
     * @tc.desc Verify set() variants leave length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const len0: int = arr.length;
      arr.set(0, 1);
      expect(arr.$_get(0)).assertEqual(1);
      arr.set([2, 3]);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(3);
      arr.set(Uint32Array.of(4, 5, 6));
      const lenAfter: int = arr.length;
      expect(len0).assertEqual(lenAfter);
      expect(arr.join(',')).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_5900
     * @tc.name testUint32ArraySetFour059
     * @tc.desc Verify set() written values discoverable via indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(0, 111);
      arr.set([222, 333], 1);
      expect(arr.indexOf(111)).assertEqual(0);
      expect(arr.indexOf(222)).assertEqual(1);
      expect(arr.indexOf(333)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6000
     * @tc.name testUint32ArraySetFour060
     * @tc.desc Verify set() written values discoverable via includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const fa: FixedArray<number> = [7.0, 8.0];
      arr.set(fa);
      arr.set(2, 9);
      expect(arr.includes(7)).assertTrue();
      expect(arr.includes(8)).assertTrue();
      expect(arr.includes(9)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6100
     * @tc.name testUint32ArraySetFour061
     * @tc.desc Verify set() written values isolated from slice() copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([1, 2, 3]);
      let copy: Uint32Array = arr.slice();
      copy.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(copy.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6200
     * @tc.name testUint32ArraySetFour062
     * @tc.desc Verify subarray set() writes through to parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let sub: Uint32Array = arr.subarray(1, 3);
      sub.set([88, 99]);
      expect(arr.$_get(1)).assertEqual(88);
      expect(arr.$_get(2)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6300
     * @tc.name testUint32ArraySetFour063
     * @tc.desc Verify parent array set() is visible through subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let sub: Uint32Array = arr.subarray(1, 3);
      arr.set([5, 6, 7, 8]);
      expect(sub.$_get(0)).assertEqual(6);
      expect(sub.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6400
     * @tc.name testUint32ArraySetFour064
     * @tc.desc Verify set(Uint32Array) on view with source larger than view throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Uint32Array = new Uint32Array(buf, 0, 2);
      try {
        view.set(Uint32Array.of(1, 2, 3));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(view.join(',')).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6500
     * @tc.name testUint32ArraySetFour065
     * @tc.desc Verify set(Uint32Array, offset) out-of-range on view throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Uint32Array = new Uint32Array(buf, 0, 2);
      try {
        view.set(Uint32Array.of(1, 2), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(view.join(',')).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6600
     * @tc.name testUint32ArraySetFour066
     * @tc.desc Verify set(Uint32Array, offset) at boundary on view writes value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Uint32Array = new Uint32Array(buf, 0, 3);
      view.set(Uint32Array.of(77), 2);
      expect(view.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6700
     * @tc.name testUint32ArraySetFour067
     * @tc.desc Verify set() on view visible through second view over same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Uint32Array = new Uint32Array(buf, 8, 2);
      view.set([42, 43]);
      let parent: Uint32Array = new Uint32Array(buf, 0, 4);
      expect(parent.$_get(2)).assertEqual(42);
      expect(parent.$_get(3)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6800
     * @tc.name testUint32ArraySetFour068
     * @tc.desc Verify set() on view preserves byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Uint32Array = new Uint32Array(buf, 4, 2);
      let before: int = view.byteLength;
      view.set([1, 2]);
      expect(view.byteLength).assertEqual(before);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_6900
     * @tc.name testUint32ArraySetFour069
     * @tc.desc Verify consecutive set() calls overwrite same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 1);
      arr.set(0, 2);
      arr.set(0, 3);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7000
     * @tc.name testUint32ArraySetFour070
     * @tc.desc Verify set() with empty FixedArray<number> leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const empty: FixedArray<number> = [];
      arr.set(empty);
      expect(arr.join(",")).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7100
     * @tc.name testUint32ArraySetFour071
     * @tc.desc Verify set(FixedArray<number>, insertPos=length) with empty source no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const empty: FixedArray<number> = [];
      arr.set(empty, 3);
      expect(arr.join(",")).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7200
     * @tc.name testUint32ArraySetFour072
     * @tc.desc Verify set(int,val) after reverse writes at given index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      arr.set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7300
     * @tc.name testUint32ArraySetFour073
     * @tc.desc Verify set(int,val) after sort writes at given index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(3, 1, 2);
      arr.sort();
      arr.set(2, 88);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7400
     * @tc.name testUint32ArraySetFour074
     * @tc.desc Verify fill() clears elements written by set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set([1, 2, 3]);
      arr.fill(0);
      expect(arr.join(",")).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7500
     * @tc.name testUint32ArraySetFour075
     * @tc.desc Verify set(int,val) after fill overwrites single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.fill(7);
      arr.set(1, 88);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(88);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7600
     * @tc.name testUint32ArraySetFour076
     * @tc.desc Verify copyWithin after set() propagates written values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      arr.set([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      expect(arr.join(",")).assertEqual("3,4,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_FOUR_7700
     * @tc.name testUint32ArraySetFour077
     * @tc.desc Verify set() with offset=length and non-empty source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(Uint32Array.of(9), arr.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.join(',')).assertEqual('1,2,3');
    });

  });
}
