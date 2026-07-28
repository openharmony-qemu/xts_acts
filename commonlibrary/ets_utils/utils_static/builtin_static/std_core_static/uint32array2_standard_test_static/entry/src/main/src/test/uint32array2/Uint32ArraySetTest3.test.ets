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

export default function uint32ArraySetThreeTest(): void {
  describe('Uint32ArraySetThreeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0100
     * @tc.name testUint32ArraySetThree001
     * @tc.desc Verify set(FixedArray<number>) writes all elements at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [10, 20, 30];
      values.set(src);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(2)).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0200
     * @tc.name testUint32ArraySetThree002
     * @tc.desc Verify set(Array<number>) writes at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [11.0, 22.0, 33.0];
      values.set(src);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0300
     * @tc.name testUint32ArraySetThree003
     * @tc.desc Verify set(Array<number>, offset) writes at given offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const src: Array<number> = [5.0, 6.0];
      values.set(src, 2);
      expect(values.$_get(2)).assertEqual(5);
      expect(values.$_get(3)).assertEqual(6);
      expect(values.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0400
     * @tc.name testUint32ArraySetThree004
     * @tc.desc Verify set() with empty FixedArray<number> leaves target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const src: FixedArray<number> = [];
      values.set(src);
      expect(values.length).assertEqual(3);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0500
     * @tc.name testUint32ArraySetThree005
     * @tc.desc Verify set() with FixedArray<number>=[42] writes single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [42];
      values.set(src);
      expect(values.$_get(0)).assertEqual(42);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0600
     * @tc.name testUint32ArraySetThree006
     * @tc.desc Verify set() with FixedArray<number> of 20 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(20);
      const src: FixedArray<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
      values.set(src);
      expect(values.$_get(19)).assertEqual(20);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0700
     * @tc.name testUint32ArraySetThree007
     * @tc.desc Verify set() with FixedArray<number> all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9);
      const src: FixedArray<number> = [0, 0, 0];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0800
     * @tc.name testUint32ArraySetThree008
     * @tc.desc Verify set() with FixedArray<number>=[int32.MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [2147483647];
      values.set(src);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_0900
     * @tc.name testUint32ArraySetThree009
     * @tc.desc Verify set() with FixedArray<number>=[int32.MIN] wraps to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [-2147483648];
      values.set(src);
      expect(values.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1000
     * @tc.name testUint32ArraySetThree010
     * @tc.desc Verify set() with FixedArray<number>=[-1] wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [-1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1100
     * @tc.name testUint32ArraySetThree011
     * @tc.desc Verify set() with FixedArray<number>=[-100] wraps to 4294967196
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [-100];
      values.set(src);
      expect(values.$_get(0)).assertEqual(4294967196);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1200
     * @tc.name testUint32ArraySetThree012
     * @tc.desc Verify set() with FixedArray<number>=[0o17] writes 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [0o17];
      values.set(src);
      expect(values.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1300
     * @tc.name testUint32ArraySetThree013
     * @tc.desc Verify set() with FixedArray<number> repeated value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [7, 7, 7];
      values.set(src);
      expect(values.$_get(0)).assertEqual(7);
      expect(values.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1400
     * @tc.name testUint32ArraySetThree014
     * @tc.desc Verify set() with FixedArray<number>=[1,2] leaves tail unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9, 9, 9);
      const src: FixedArray<number> = [1, 2];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(9);
      expect(values.$_get(4)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1500
     * @tc.name testUint32ArraySetThree015
     * @tc.desc Verify set(FixedArray<number>, 0) with empty source leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const src: FixedArray<number> = [];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1600
     * @tc.name testUint32ArraySetThree016
     * @tc.desc Verify set(FixedArray<number>, 1) writes single element at insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [7.0];
      values.set(src, 1);
      expect(values.$_get(1)).assertEqual(7);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1700
     * @tc.name testUint32ArraySetThree017
     * @tc.desc Verify set(FixedArray<number>, 1) writes three elements at insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      values.set(src, 1);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1800
     * @tc.name testUint32ArraySetThree018
     * @tc.desc Verify set(FixedArray<number>, 1) with 10 elements writes range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(11);
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      values.set(src, 1);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(10)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_1900
     * @tc.name testUint32ArraySetThree019
     * @tc.desc Verify set(FixedArray<number>, 1) writes zeros at insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 5, 5);
      const src: FixedArray<number> = [0.0, 0.0];
      values.set(src, 1);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2000
     * @tc.name testUint32ArraySetThree020
     * @tc.desc Verify set(FixedArray<number>, 0) with uint32.MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [4294967295];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2100
     * @tc.name testUint32ArraySetThree021
     * @tc.desc Verify set(FixedArray<number>, 0) with 3.14 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [3.14];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2200
     * @tc.name testUint32ArraySetThree022
     * @tc.desc Verify set(FixedArray<number>, 0) with NaN writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [Number.NaN];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2300
     * @tc.name testUint32ArraySetThree023
     * @tc.desc Verify set(FixedArray<number>, 0) with Infinity writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2400
     * @tc.name testUint32ArraySetThree024
     * @tc.desc Verify set(FixedArray<number>, 0) with 2^53-1 wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [9007199254740991];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2500
     * @tc.name testUint32ArraySetThree025
     * @tc.desc Verify set(FixedArray<number>, 0) with 1e5 writes 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [1e5];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2600
     * @tc.name testUint32ArraySetThree026
     * @tc.desc Verify set(FixedArray<number>, 0) writes three repeated elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [5.0, 5.0, 5.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(5);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2700
     * @tc.name testUint32ArraySetThree027
     * @tc.desc Verify set(FixedArray<number>, 0) writes two elements leaves tail unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9);
      const src: FixedArray<number> = [1.0, 2.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2800
     * @tc.name testUint32ArraySetThree028
     * @tc.desc Verify set(FixedArray<number>, 1) writes two elements at insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: FixedArray<number> = [3.0, 4.0];
      values.set(src, 1);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_2900
     * @tc.name testUint32ArraySetThree029
     * @tc.desc Verify set(FixedArray<number>, length-1) writes single element at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [8.0];
      values.set(src, 2);
      expect(values.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3000
     * @tc.name testUint32ArraySetThree030
     * @tc.desc Verify set(FixedArray<number>, length+1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1.0];
      try {
        values.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3100
     * @tc.name testUint32ArraySetThree031
     * @tc.desc Verify set(FixedArray<number>) at overlap-insertPos throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      try {
        values.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3200
     * @tc.name testUint32ArraySetThree032
     * @tc.desc Verify set(FixedArray<number>, 2) writes two elements at insertPos=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: FixedArray<number> = [1.0, 2.0];
      values.set(src, 2);
      expect(values.$_get(2)).assertEqual(1);
      expect(values.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3300
     * @tc.name testUint32ArraySetThree033
     * @tc.desc Verify set(Array<number>, 1) writes two elements at offset=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: Array<number> = [7.0, 8.0];
      values.set(src, 1);
      expect(values.$_get(1)).assertEqual(7);
      expect(values.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3400
     * @tc.name testUint32ArraySetThree034
     * @tc.desc Verify set(Array<number>, length-1) writes single element at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [9.0];
      values.set(src, 2);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3500
     * @tc.name testUint32ArraySetThree035
     * @tc.desc Verify set(Array<number>, length) with single-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [6.0];
      try {
        values.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3600
     * @tc.name testUint32ArraySetThree036
     * @tc.desc Verify set(Array<number>, length+1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [1.0];
      try {
        values.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3700
     * @tc.name testUint32ArraySetThree037
     * @tc.desc Verify set(Array<number>) at overlap-offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [1.0, 2.0];
      try {
        values.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3800
     * @tc.name testUint32ArraySetThree038
     * @tc.desc Verify set(Array<number>, 2) writes two elements at offset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: Array<number> = [3.0, 4.0];
      values.set(src, 2);
      expect(values.$_get(2)).assertEqual(3);
      expect(values.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_3900
     * @tc.name testUint32ArraySetThree039
     * @tc.desc Verify set(Array<number>, 0) with empty source leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const src: Array<number> = [];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4000
     * @tc.name testUint32ArraySetThree040
     * @tc.desc Verify set(Array<number>, 0) writes single element leaves tail unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: Array<number> = [9.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(9);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4100
     * @tc.name testUint32ArraySetThree041
     * @tc.desc Verify set(Array<number>, 0) writes 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(100);
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push((i + 1) * 1.0);
      }
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(99)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4200
     * @tc.name testUint32ArraySetThree042
     * @tc.desc Verify set(Array<number>, 0) writes zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 7, 7);
      const src: Array<number> = [0.0, 0.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4300
     * @tc.name testUint32ArraySetThree043
     * @tc.desc Verify set(Array<number>, 0) with uint32.MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [4294967295];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4400
     * @tc.name testUint32ArraySetThree044
     * @tc.desc Verify set(Array<number>, 0) with 3.14 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [3.14];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4500
     * @tc.name testUint32ArraySetThree045
     * @tc.desc Verify set(Array<number>, 0) with NaN writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [Number.NaN];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4600
     * @tc.name testUint32ArraySetThree046
     * @tc.desc Verify set(Array<number>, 0) with Infinity writes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [Number.POSITIVE_INFINITY];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4700
     * @tc.name testUint32ArraySetThree047
     * @tc.desc Verify set(Array<number>, 0) with repeated value 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: Array<number> = [4.0, 4.0, 4.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(4);
      expect(values.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4800
     * @tc.name testUint32ArraySetThree048
     * @tc.desc Verify set(Array<number>) with 4294967297 overflow wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [4294967297];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_4900
     * @tc.name testUint32ArraySetThree049
     * @tc.desc Verify set(Array<number>) with 8589934591 overflow wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [8589934591];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5000
     * @tc.name testUint32ArraySetThree050
     * @tc.desc Verify set(Array<number>) with 8589934592 overflow wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [8589934592];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5100
     * @tc.name testUint32ArraySetThree051
     * @tc.desc Verify set(Array<number>) with -1 wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [-1];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5200
     * @tc.name testUint32ArraySetThree052
     * @tc.desc Verify set(Array<number>) with 2147483648 stays 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: Array<number> = [2147483648];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5300
     * @tc.name testUint32ArraySetThree053
     * @tc.desc Verify set(Array<number>) 1..20 writes endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(20);
      const src: Array<number> = [];
      for (let i = 0; i < 20; i++) {
        src.push(i + 1);
      }
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(19)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5400
     * @tc.name testUint32ArraySetThree054
     * @tc.desc Verify set(FixedArray<number>) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [1, 2];
      const ret = values.set(src);
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5500
     * @tc.name testUint32ArraySetThree055
     * @tc.desc Verify set(Array<number>, 0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: Array<number> = [1.0, 2.0];
      const ret = values.set(src, 0);
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5600
     * @tc.name testUint32ArraySetThree056
     * @tc.desc Verify set(FixedArray<number>) preserves length and byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
      expect(values.length).assertEqual(3);
      expect(values.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5700
     * @tc.name testUint32ArraySetThree057
     * @tc.desc Verify set(FixedArray<number>, 1) preserves byteOffset and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      values.set(src, 1);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(2);
      expect(values.byteOffset).assertEqual(0);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5800
     * @tc.name testUint32ArraySetThree058
     * @tc.desc Verify set(FixedArray<number>, 0) writes two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [33.0, 44.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(33);
      expect(values.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_5900
     * @tc.name testUint32ArraySetThree059
     * @tc.desc Verify set(FixedArray<number>, 1) with two elements leaves head and tail intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const src: FixedArray<number> = [9.0, 9.0];
      values.set(src, 1);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(3)).assertEqual(4);
      expect(values.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6000
     * @tc.name testUint32ArraySetThree060
     * @tc.desc Verify set(Array<number>, 0) writes two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: Array<number> = [55.0, 66.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(55);
      expect(values.$_get(1)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6100
     * @tc.name testUint32ArraySetThree061
     * @tc.desc Verify set(Array<number>, 0) writes three repeated elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0);
      const src: Array<number> = [8.0, 8.0, 8.0];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(8);
      expect(values.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6200
     * @tc.name testUint32ArraySetThree062
     * @tc.desc Verify set(Array<number>) with [100,200] writes both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: Array<number> = [100, 200];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(100);
      expect(values.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6300
     * @tc.name testUint32ArraySetThree063
     * @tc.desc Verify set(FixedArray<number>) on empty target with empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const src: FixedArray<number> = [];
      values.set(src);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6400
     * @tc.name testUint32ArraySetThree064
     * @tc.desc Verify set(FixedArray<number>, 0) on empty target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const src: FixedArray<number> = [1.0];
      try {
        values.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6500
     * @tc.name testUint32ArraySetThree065
     * @tc.desc Verify set(Array<number>, 0) on empty target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const src: Array<number> = [1.0];
      try {
        values.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6600
     * @tc.name testUint32ArraySetThree066
     * @tc.desc Verify set(Array<number>, 0) empty on empty target keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const src: Array<number> = [];
      values.set(src, 0);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6700
     * @tc.name testUint32ArraySetThree067
     * @tc.desc Verify set(FixedArray<number>) writes int boundary values [0,int32.MAX,-1,int32.MIN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: FixedArray<number> = [0, 2147483647, -1, -2147483648];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(2147483647);
      expect(values.$_get(2)).assertEqual(4294967295);
      expect(values.$_get(3)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6800
     * @tc.name testUint32ArraySetThree068
     * @tc.desc Verify set(FixedArray<number>, 0) writes number boundary values with overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const src: FixedArray<number> = [0.0, 4294967295, 0x100000000, -1.0, Number.NaN];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(4294967295);
      expect(values.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_6900
     * @tc.name testUint32ArraySetThree069
     * @tc.desc Verify set(Array<number>) mixed boundary and overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: Array<number> = [0, 4294967295, 4294967296, -1];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_7000
     * @tc.name testUint32ArraySetThree070
     * @tc.desc Verify set(FixedArray<number>, 0) with 0x100000000 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [0x100000000];
      values.set(src, 0);
      const readBack = values.$_get(0);
      expect(readBack).assertEqual(0);
      expect(values.at(0)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_7100
     * @tc.name testUint32ArraySetThree071
     * @tc.desc Verify set(FixedArray<number>) reflected through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const view = values.subarray(1, 3);
      const src: FixedArray<number> = [10, 20, 30, 40];
      values.set(src);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_7200
     * @tc.name testUint32ArraySetThree072
     * @tc.desc Verify set(FixedArray<number>, 2) reflected through subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0, 0);
      const view = values.subarray(2, 4);
      const src: FixedArray<number> = [7.0, 8.0];
      values.set(src, 2);
      expect(view.$_get(0)).assertEqual(7);
      expect(view.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_7300
     * @tc.name testUint32ArraySetThree073
     * @tc.desc Verify set(Array<number>, 0) does not affect earlier slice() copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const copy = values.slice(0, 3);
      const src: Array<number> = [9.0, 9.0, 9.0];
      values.set(src, 0);
      expect(copy.$_get(0)).assertEqual(1);
      expect(values.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_7400
     * @tc.name testUint32ArraySetThree074
     * @tc.desc Verify set(FixedArray<number>) preserves buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [1, 2];
      values.set(src);
      expect(values.buffer.byteLength).assertEqual(8);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_THREE_7500
     * @tc.name testUint32ArraySetThree075
     * @tc.desc Verify set() throws RangeError for negative offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(2);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

  });
}
