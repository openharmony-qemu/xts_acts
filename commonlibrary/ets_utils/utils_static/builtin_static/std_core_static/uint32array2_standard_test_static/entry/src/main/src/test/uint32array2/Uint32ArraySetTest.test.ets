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

export default function uint32ArraySetOneTest(): void {
  describe('Uint32ArraySetOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0100
     * @tc.name testUint32ArraySetOne001
     * @tc.desc Verify set(0, byte) writes value at insertPos 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: byte = 7;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0200
     * @tc.name testUint32ArraySetOne002
     * @tc.desc Verify set(length-1, byte) writes at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const v: byte = 9;
      values.set(2, v);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0300
     * @tc.name testUint32ArraySetOne003
     * @tc.desc Verify set(index, int) writes int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const vi: int = 1000;
      values.set(1, vi);
      expect(values.$_get(1)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0400
     * @tc.name testUint32ArraySetOne004
     * @tc.desc Verify set() with insertPos=length-1 writes byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const v: byte = 42;
      values.set(3, v);
      expect(values.$_get(3)).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0500
     * @tc.name testUint32ArraySetOne005
     * @tc.desc Verify set() with insertPos=int32.MAX throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const v: byte = 1;
      try {
        values.set(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0600
     * @tc.name testUint32ArraySetOne006
     * @tc.desc Verify set() with insertPos=int32.MIN throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const v: byte = 1;
      try {
        values.set(-2147483648, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0700
     * @tc.name testUint32ArraySetOne007
     * @tc.desc Verify set() writes val=0 as byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: byte = 0;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0800
     * @tc.name testUint32ArraySetOne008
     * @tc.desc Verify set() writes val=127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: byte = 127;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_0900
     * @tc.name testUint32ArraySetOne009
     * @tc.desc Verify set() writes val=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: number = 128;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1000
     * @tc.name testUint32ArraySetOne010
     * @tc.desc Verify set() writes val=200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: number = 200;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1100
     * @tc.name testUint32ArraySetOne011
     * @tc.desc Verify set() writes val=255 byte.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: number = 255;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1200
     * @tc.name testUint32ArraySetOne012
     * @tc.desc Verify set() writes int val=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = 0;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1300
     * @tc.name testUint32ArraySetOne013
     * @tc.desc Verify set() writes int val=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = 1;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1400
     * @tc.name testUint32ArraySetOne014
     * @tc.desc Verify set() writes int val=int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = 2147483647;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1500
     * @tc.name testUint32ArraySetOne015
     * @tc.desc Verify set() writes int val=-1 wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = -1;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1600
     * @tc.name testUint32ArraySetOne016
     * @tc.desc Verify set() writes int val=int32.MIN wraps to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = -2147483648;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1700
     * @tc.name testUint32ArraySetOne017
     * @tc.desc Verify set() writes int val=-2147483647 wraps to 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = -2147483647;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1800
     * @tc.name testUint32ArraySetOne018
     * @tc.desc Verify set() writes int val=-2 wraps to 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = -2;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_1900
     * @tc.name testUint32ArraySetOne019
     * @tc.desc Verify set() writes int val=-100 wraps to 4294967196
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = -100;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(4294967196);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2000
     * @tc.name testUint32ArraySetOne020
     * @tc.desc Verify set() writes int val=-65535 wraps to 4294901761
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = -65535;
      values.set(0, vi);
      expect(values.$_get(0)).assertEqual(4294901761);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2100
     * @tc.name testUint32ArraySetOne021
     * @tc.desc Verify set() int -1 and literal 4294967295 produce same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      const b = new Uint32Array(1);
      const vi: int = -1;
      a.set(0, vi);
      b.set(0, 4294967295);
      expect(a.$_get(0)).assertEqual(4294967295);
      expect(b.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2200
     * @tc.name testUint32ArraySetOne022
     * @tc.desc Verify set() writes byte at index 1 keeping surrounding zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const v: byte = 5;
      values.set(1, v);
      expect(values.join(',')).assertEqual('0,5,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2300
     * @tc.name testUint32ArraySetOne023
     * @tc.desc Verify set() overwrites element in Uint32Array.of target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const v: byte = 99;
      values.set(1, v);
      expect(values.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2400
     * @tc.name testUint32ArraySetOne024
     * @tc.desc Verify set() does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const v: byte = 5;
      values.set(0, v);
      expect(values.length).assertEqual(3);
      expect(values.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2500
     * @tc.name testUint32ArraySetOne025
     * @tc.desc Verify set() does not change byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const v: byte = 5;
      values.set(0, v);
      expect(values.byteLength).assertEqual(12);
      expect(values.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2600
     * @tc.name testUint32ArraySetOne026
     * @tc.desc Verify set() writes byte at two different indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const a: byte = 11;
      const b: byte = 22;
      values.set(0, a);
      values.set(2, b);
      expect(values.join(',')).assertEqual('11,0,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2700
     * @tc.name testUint32ArraySetOne027
     * @tc.desc Verify set() result verifiable via join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const v: byte = 7;
      values.set(0, v);
      expect(values.join(',')).assertEqual('7,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2800
     * @tc.name testUint32ArraySetOne028
     * @tc.desc Verify set() int value with BYTES_PER_ELEMENT=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const vi: int = 500;
      values.set(0, vi);
      expect(values.BYTES_PER_ELEMENT).assertEqual(4);
      expect(values.$_get(0)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_2900
     * @tc.name testUint32ArraySetOne029
     * @tc.desc Verify set(FixedArray<number>, 0) writes at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1, 2];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('1,2,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3000
     * @tc.name testUint32ArraySetOne030
     * @tc.desc Verify set(FixedArray<number>, 1) writes at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1, 2];
      values.set(src, 1);
      expect(values.join(',')).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3100
     * @tc.name testUint32ArraySetOne031
     * @tc.desc Verify set(FixedArray<number>, 0) writes byte-range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [10, 20];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3200
     * @tc.name testUint32ArraySetOne032
     * @tc.desc Verify set() with empty FixedArray at insertPos=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6);
      const src: FixedArray<number> = [];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3300
     * @tc.name testUint32ArraySetOne033
     * @tc.desc Verify set() with single-element FixedArray<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [42];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('42,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3400
     * @tc.name testUint32ArraySetOne034
     * @tc.desc Verify set() with FixedArray<number> at insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: FixedArray<number> = [7, 8, 9];
      values.set(src, 1);
      expect(values.join(',')).assertEqual('0,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3500
     * @tc.name testUint32ArraySetOne035
     * @tc.desc Verify set() with FixedArray<number> at insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1, 2, 3];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3600
     * @tc.name testUint32ArraySetOne036
     * @tc.desc Verify set() with all-zero FixedArray overwrites values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9);
      const src: FixedArray<number> = [0, 0, 0];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3700
     * @tc.name testUint32ArraySetOne037
     * @tc.desc Verify set() with FixedArray<number> of int32.MAX values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [2147483647, 2147483647];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('2147483647,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3800
     * @tc.name testUint32ArraySetOne038
     * @tc.desc Verify set() with FixedArray<number> negatives wrap to uint32 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [-1, -2];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('4294967295,4294967294');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_3900
     * @tc.name testUint32ArraySetOne039
     * @tc.desc Verify set() with FixedArray<number> value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [255, 0];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('255,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4000
     * @tc.name testUint32ArraySetOne040
     * @tc.desc Verify set() with FixedArray<number> values 127 and 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [127, 128];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('127,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4100
     * @tc.name testUint32ArraySetOne041
     * @tc.desc Verify set() with insertPos=length-src.length writes at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: FixedArray<number> = [5, 6];
      values.set(src, 2);
      expect(values.join(',')).assertEqual('0,0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4200
     * @tc.name testUint32ArraySetOne042
     * @tc.desc Verify set() with insertPos=length-src.length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const src: FixedArray<number> = [5, 6];
      try {
        values.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4300
     * @tc.name testUint32ArraySetOne043
     * @tc.desc Verify set() with insertPos=length and non-empty src throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        values.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4400
     * @tc.name testUint32ArraySetOne044
     * @tc.desc Verify set() with empty FixedArray at insertPos=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8);
      const src: FixedArray<number> = [];
      values.set(src, 2);
      expect(values.join(',')).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4500
     * @tc.name testUint32ArraySetOne045
     * @tc.desc Verify set() with insertPos=length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [];
      try {
        values.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4600
     * @tc.name testUint32ArraySetOne046
     * @tc.desc Verify set() with 6-element FixedArray on length=2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src: FixedArray<number> = [1, 2, 3, 4, 5, 6];
      try {
        values.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4700
     * @tc.name testUint32ArraySetOne047
     * @tc.desc Verify set() with FixedArray<number> [-1,-2,-3] wraps to uint32.MAX range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src: FixedArray<number> = [-1, -2, -3];
      values.set(src, 0);
      expect(values.join(',')).assertEqual('4294967295,4294967294,4294967293');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4800
     * @tc.name testUint32ArraySetOne048
     * @tc.desc Verify set() with FixedArray<number> [255] writes 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src: FixedArray<number> = [255];
      values.set(src, 0);
      expect(values.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_4900
     * @tc.name testUint32ArraySetOne049
     * @tc.desc Verify set() with FixedArray<number> single element at insertPos=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const src: FixedArray<number> = [99];
      values.set(src, 2);
      expect(values.join(',')).assertEqual('1,2,99,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5000
     * @tc.name testUint32ArraySetOne050
     * @tc.desc Verify set(Uint32Array) fills full target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.set(Uint32Array.of(7, 8, 9));
      expect(values.join(',')).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5100
     * @tc.name testUint32ArraySetOne051
     * @tc.desc Verify set() with empty Uint32Array leaves target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6);
      values.set(new Uint32Array(0));
      expect(values.join(',')).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5200
     * @tc.name testUint32ArraySetOne052
     * @tc.desc Verify set() with single-element Uint32Array writes at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.set(Uint32Array.of(42));
      expect(values.join(',')).assertEqual('42,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5300
     * @tc.name testUint32ArraySetOne053
     * @tc.desc Verify set() with Uint32Array partially fills target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      values.set(Uint32Array.of(1, 2, 3));
      expect(values.join(',')).assertEqual('1,2,3,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5400
     * @tc.name testUint32ArraySetOne054
     * @tc.desc Verify set() with Uint32Array overwrites all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      values.set(Uint32Array.of(1, 2, 3));
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5500
     * @tc.name testUint32ArraySetOne055
     * @tc.desc Verify set() with all-zero Uint32Array overwrites values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9);
      values.set(Uint32Array.of(0, 0, 0));
      expect(values.join(',')).assertEqual('0,0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5600
     * @tc.name testUint32ArraySetOne056
     * @tc.desc Verify set() with Uint32Array mixing 0 and uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.set(Uint32Array.of(0, 4294967295, 0));
      expect(values.join(',')).assertEqual('0,4294967295,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5700
     * @tc.name testUint32ArraySetOne057
     * @tc.desc Verify set() with Uint32Array of uint32.MAX-1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      values.set(Uint32Array.of(4294967294, 1));
      expect(values.join(',')).assertEqual('4294967294,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5800
     * @tc.name testUint32ArraySetOne058
     * @tc.desc Verify set() with Uint32Array copied from another Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src = new Uint32Array(Uint32Array.of(4, 5, 6));
      values.set(src);
      expect(values.join(',')).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_5900
     * @tc.name testUint32ArraySetOne059
     * @tc.desc Verify set() with Uint32Array of mixed uint32 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.set(Uint32Array.of(16777216, 1, 65535));
      expect(values.join(',')).assertEqual('16777216,1,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6000
     * @tc.name testUint32ArraySetOne060
     * @tc.desc Verify set() with 6-element Uint32Array on length=2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      try {
        values.set(Uint32Array.of(1, 2, 3, 4, 5, 6));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6100
     * @tc.name testUint32ArraySetOne061
     * @tc.desc Verify set() with Uint32Array.of(4294967296) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src = Uint32Array.of(4294967296);
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6200
     * @tc.name testUint32ArraySetOne062
     * @tc.desc Verify set() with Uint32Array.of(-1) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src = Uint32Array.of(-1);
      values.set(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6300
     * @tc.name testUint32ArraySetOne063
     * @tc.desc Verify set() with Uint32Array.of(4294967295) writes MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src = Uint32Array.of(4294967295);
      values.set(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6400
     * @tc.name testUint32ArraySetOne064
     * @tc.desc Verify set() with Uint32Array.of(8589934591) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src = Uint32Array.of(8589934591);
      values.set(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6500
     * @tc.name testUint32ArraySetOne065
     * @tc.desc Verify set() with Uint32Array of mixed uint32 boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const src = Uint32Array.of(0, 4294967295, 2147483648);
      values.set(src);
      expect(values.join(',')).assertEqual('0,4294967295,2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6600
     * @tc.name testUint32ArraySetOne066
     * @tc.desc Verify set() with Uint32Array.of(4294967297) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const src = Uint32Array.of(4294967297);
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6700
     * @tc.name testUint32ArraySetOne067
     * @tc.desc Verify set() with Uint32Array writes both elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const src = Uint32Array.of(11, 22);
      values.set(src);
      expect(values.join(',')).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6800
     * @tc.name testUint32ArraySetOne068
     * @tc.desc Verify set() with Uint32Array overwrites Uint32Array.of target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200);
      values.set(Uint32Array.of(1, 2));
      expect(values.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_6900
     * @tc.name testUint32ArraySetOne069
     * @tc.desc Verify set() with empty Uint32Array on non-empty target leaves values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.set(new Uint32Array(0));
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7000
     * @tc.name testUint32ArraySetOne070
     * @tc.desc Verify set() with Uint32Array shorter than target leaves tail unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8, 9);
      values.set(Uint32Array.of(1, 2));
      expect(values.join(',')).assertEqual('1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7100
     * @tc.name testUint32ArraySetOne071
     * @tc.desc Verify set() with same-length Uint32Array overwrites all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0, 0);
      values.set(Uint32Array.of(5, 6, 7, 8));
      expect(values.join(',')).assertEqual('5,6,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7200
     * @tc.name testUint32ArraySetOne072
     * @tc.desc Verify set() result verified via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      values.set(Uint32Array.of(3, 4));
      expect(values.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7300
     * @tc.name testUint32ArraySetOne073
     * @tc.desc Verify set() single-element Uint32Array with uint32.MAX leaves tail zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      values.set(Uint32Array.of(4294967295));
      expect(values.$_get(0)).assertEqual(4294967295);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7400
     * @tc.name testUint32ArraySetOne074
     * @tc.desc Verify set() with Uint32Array of zeros overwrites values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(99, 99);
      values.set(Uint32Array.of(0, 0));
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7500
     * @tc.name testUint32ArraySetOne075
     * @tc.desc Verify set() writes full Uint32Array of four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      values.set(Uint32Array.of(1, 2, 3, 4));
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7600
     * @tc.name testUint32ArraySetOne076
     * @tc.desc Verify set() with shorter Uint32Array leaves trailing zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      values.set(Uint32Array.of(1, 2));
      expect(values.join(',')).assertEqual('1,2,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7700
     * @tc.name testUint32ArraySetOne077
     * @tc.desc Verify set() with Uint32Array.of(16777215) writes 0xFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.set(Uint32Array.of(16777215));
      expect(values.$_get(0)).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7800
     * @tc.name testUint32ArraySetOne078
     * @tc.desc Verify set() with Uint32Array of int32.MAX and int32.MAX+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      values.set(Uint32Array.of(2147483647, 2147483648));
      expect(values.join(',')).assertEqual('2147483647,2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_7900
     * @tc.name testUint32ArraySetOne079
     * @tc.desc Verify set throws RangeError for negative offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(3);
      try {
        arr.set(Uint32Array.of(1, 2), -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_8000
     * @tc.name testUint32ArraySetOne080
     * @tc.desc Verify set handles overlapping source and target in shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const src: Uint32Array = arr.subarray(0, 2);
      arr.set(src, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(4);
    });

  });
}
