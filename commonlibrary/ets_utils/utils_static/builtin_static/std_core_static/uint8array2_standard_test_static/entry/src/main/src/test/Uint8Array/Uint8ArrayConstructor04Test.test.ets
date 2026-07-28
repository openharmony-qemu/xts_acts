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
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayConstructor04Test(): void {
  describe('Uint8ArrayConstructor04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0100
     * @tc.name testUint8ArrayConstructor04_001
     * @tc.desc Verify default constructor and int length 0 constructor produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array();
      const b: Uint8Array = new Uint8Array(0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0200
     * @tc.name testUint8ArrayConstructor04_002
     * @tc.desc Verify default constructor and number length 0 constructor produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array();
      const b: Uint8Array = new Uint8Array(0.0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0300
     * @tc.name testUint8ArrayConstructor04_003
     * @tc.desc Verify negative int length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b: Uint8Array = new Uint8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0400
     * @tc.name testUint8ArrayConstructor04_004
     * @tc.desc Verify negative number length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const b: Uint8Array = new Uint8Array(-1.0);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0500
     * @tc.name testUint8ArrayConstructor04_005
     * @tc.desc Verify int length and equivalent number length produce same byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(10);
      const b: Uint8Array = new Uint8Array(10.0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0600
     * @tc.name testUint8ArrayConstructor04_006
     * @tc.desc Verify floating point length 10.7 truncates to 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(10.7);
      expect(a.length).assertEqual(10);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(10);
      expect(a[0]).assertEqual(0);
      expect(a[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0700
     * @tc.name testUint8ArrayConstructor04_007
     * @tc.desc Verify floating point length 3.1 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3.1);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0800
     * @tc.name testUint8ArrayConstructor04_008
     * @tc.desc Verify floating point length 0.9 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(0.9);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_0900
     * @tc.name testUint8ArrayConstructor04_009
     * @tc.desc Verify hex literal 0xFF as length is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(0xFF);
      expect(a.length).assertEqual(255);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(255);
      expect(a[0]).assertEqual(0);
      expect(a[254]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1000
     * @tc.name testUint8ArrayConstructor04_010
     * @tc.desc Verify octal literal 0o377 as length is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(0o377);
      expect(a.length).assertEqual(255);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(255);
      expect(a[0]).assertEqual(0);
      expect(a[254]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1100
     * @tc.name testUint8ArrayConstructor04_011
     * @tc.desc Verify scientific notation 1e2 as length is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1e2);
      expect(a.length).assertEqual(100);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(100);
      expect(a[0]).assertEqual(0);
      expect(a[99]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1200
     * @tc.name testUint8ArrayConstructor04_012
     * @tc.desc Verify FixedArray<int> and Array<int> with same values produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const arr: Array<int> = [1, 2, 3];
      const ua1: Uint8Array = new Uint8Array(fa);
      const ua2: Uint8Array = new Uint8Array(arr);
      expect(ua1.length).assertEqual(ua2.length);
      expect(ua1.byteOffset).assertEqual(ua2.byteOffset);
      expect(ua1.byteLength).assertEqual(ua2.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1300
     * @tc.name testUint8ArrayConstructor04_013
     * @tc.desc Verify FixedArray<int> and FixedArray<number> produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fi: FixedArray<int> = [10, 20, 30];
      const fn: FixedArray<number> = [10.0, 20.0, 30.0];
      const a: Uint8Array = new Uint8Array(fi);
      const b: Uint8Array = new Uint8Array(fn);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1400
     * @tc.name testUint8ArrayConstructor04_014
     * @tc.desc Verify empty FixedArray<int> and empty Array<int> both have length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array([]);
      const b: Array<int> = [];
      const c: Uint8Array = new Uint8Array(b);
      expect(a.length).assertEqual(0);
      expect(c.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(c.byteOffset).assertEqual(0);
      expect(c.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1500
     * @tc.name testUint8ArrayConstructor04_015
     * @tc.desc Verify ArrayBuffer single parameter and offset=0 constructor have same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab);
      const b: Uint8Array = new Uint8Array(ab, 0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1600
     * @tc.name testUint8ArrayConstructor04_016
     * @tc.desc Verify ArrayBuffer offset=0 and offset=0.0 produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab);
      const b: Uint8Array = new Uint8Array(ab, 0.0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1700
     * @tc.name testUint8ArrayConstructor04_017
     * @tc.desc Verify int offset and number offset at non-zero produce same byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab, 3);
      const b: Uint8Array = new Uint8Array(ab, 3.0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1800
     * @tc.name testUint8ArrayConstructor04_018
     * @tc.desc Verify int offset+length and number offset+length are equivalent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab, 1, 3);
      const b: Uint8Array = new Uint8Array(ab, 1.0, 3.0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_1900
     * @tc.name testUint8ArrayConstructor04_019
     * @tc.desc Verify offset+explicit length and offset+undefined length are equivalent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab, 2, 6);
      const b: Uint8Array = new Uint8Array(ab, 2, undefined);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2000
     * @tc.name testUint8ArrayConstructor04_020
     * @tc.desc Verify undefined+undefined and 0+full length are equivalent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab, undefined, undefined);
      const b: Uint8Array = new Uint8Array(ab, 0, 8);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2100
     * @tc.name testUint8ArrayConstructor04_021
     * @tc.desc Verify Uint8Array copy constructor length matches source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(3);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(src.length);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(src.byteLength);
      expect(dst[0]).assertEqual(0);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2200
     * @tc.name testUint8ArrayConstructor04_022
     * @tc.desc Verify FixedArray<int> with hex and decimal elements produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array([0xFF]);
      const b: Uint8Array = new Uint8Array([255]);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2300
     * @tc.name testUint8ArrayConstructor04_023
     * @tc.desc Verify binary literal 0b11111111 and 255 produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array([0b11111111]);
      const b: Uint8Array = new Uint8Array([255]);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2400
     * @tc.name testUint8ArrayConstructor04_024
     * @tc.desc Verify 0x7F and decimal 127 as length produce same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(0x7F);
      const b: Uint8Array = new Uint8Array(127);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2500
     * @tc.name testUint8ArrayConstructor04_025
     * @tc.desc Verify negative float length -3.5 throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a: Uint8Array = new Uint8Array(-3.5);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2600
     * @tc.name testUint8ArrayConstructor04_026
     * @tc.desc Verify -0 and 0 produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(-0);
      const b: Uint8Array = new Uint8Array(0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2700
     * @tc.name testUint8ArrayConstructor04_027
     * @tc.desc Verify float 2.0 and int 2 produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(2.0);
      const b: Uint8Array = new Uint8Array(2);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2800
     * @tc.name testUint8ArrayConstructor04_028
     * @tc.desc Verify offset=1 and offset=1.0 produce same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab, 1);
      const b: Uint8Array = new Uint8Array(ab, 1.0);
      expect(a.length).assertEqual(b.length);
      expect(a.byteOffset).assertEqual(b.byteOffset);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_2900
     * @tc.name testUint8ArrayConstructor04_029
     * @tc.desc Verify offset+explicit length and offset with remaining length are equivalent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const full: Uint8Array = new Uint8Array(ab, 2, 6);
      const rest: Uint8Array = new Uint8Array(ab, 2);
      expect(full.length).assertEqual(rest.length);
      expect(full.byteOffset).assertEqual(rest.byteOffset);
      expect(full.byteLength).assertEqual(rest.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3000
     * @tc.name testUint8ArrayConstructor04_030
     * @tc.desc Verify int length=5 constructor properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(5);
      expect(a.length).assertEqual(5);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(5);
      expect(a[0]).assertEqual(0);
      expect(a[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3100
     * @tc.name testUint8ArrayConstructor04_031
     * @tc.desc Verify number length=5.0 constructor properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(5.0);
      expect(a.length).assertEqual(5);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(5);
      expect(a[0]).assertEqual(0);
      expect(a[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3200
     * @tc.name testUint8ArrayConstructor04_032
     * @tc.desc Verify FixedArray<int> content constructor length matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: FixedArray<int> = [1, 2, 3, 4];
      const a: Uint8Array = new Uint8Array(data);
      expect(a.length).assertEqual(4);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(4);
      expect(a[0]).assertEqual(1);
      expect(a[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3300
     * @tc.name testUint8ArrayConstructor04_033
     * @tc.desc Verify FixedArray<number> content constructor length matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: FixedArray<number> = [1.0, 2.0, 3.0];
      const a: Uint8Array = new Uint8Array(data);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3400
     * @tc.name testUint8ArrayConstructor04_034
     * @tc.desc Verify Array<int> content constructor length matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [10, 20, 30, 40, 50];
      const a: Uint8Array = new Uint8Array(data);
      expect(a.length).assertEqual(5);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(5);
      expect(a[0]).assertEqual(10);
      expect(a[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3500
     * @tc.name testUint8ArrayConstructor04_035
     * @tc.desc Verify Uint8Array copy constructor length matches source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(7);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(src.length);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(src.byteLength);
      expect(dst[0]).assertEqual(0);
      expect(dst[6]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3600
     * @tc.name testUint8ArrayConstructor04_036
     * @tc.desc Verify ArrayBuffer constructor length matches buffer byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint8Array = new Uint8Array(ab);
      expect(a.length).assertEqual(10);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(10);
      expect(a[0]).assertEqual(0);
      expect(a[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3700
     * @tc.name testUint8ArrayConstructor04_037
     * @tc.desc Verify ArrayBuffer+offset view properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint8Array = new Uint8Array(ab, 3);
      expect(a.length).assertEqual(7);
      expect(a.byteOffset).assertEqual(3);
      expect(a.byteLength).assertEqual(7);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3800
     * @tc.name testUint8ArrayConstructor04_038
     * @tc.desc Verify ArrayBuffer+offset+length view properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint8Array = new Uint8Array(ab, 2, 4);
      expect(a.length).assertEqual(4);
      expect(a.byteOffset).assertEqual(2);
      expect(a.byteLength).assertEqual(4);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_3900
     * @tc.name testUint8ArrayConstructor04_039
     * @tc.desc Verify undefined offset+length equals full buffer view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(10);
      const a: Uint8Array = new Uint8Array(ab, undefined, undefined);
      expect(a.length).assertEqual(10);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(10);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4000
     * @tc.name testUint8ArrayConstructor04_040
     * @tc.desc Verify empty Array<int> has length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: Array<int> = [];
      const a: Uint8Array = new Uint8Array(empty);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4100
     * @tc.name testUint8ArrayConstructor04_041
     * @tc.desc Verify int length constructor length matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(5);
      const b: Uint8Array = new Uint8Array([1, 2, 3]);
      const c: Uint8Array = new Uint8Array(new ArrayBuffer(4));
      expect(a.length).assertEqual(5);
      expect(b.length).assertEqual(3);
      expect(c.length).assertEqual(4);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(5);
      expect(b.byteOffset).assertEqual(0);
      expect(b.byteLength).assertEqual(3);
      expect(c.byteOffset).assertEqual(0);
      expect(c.byteLength).assertEqual(4);
      expect(a[0]).assertEqual(0);
      expect(b[0]).assertEqual(1);
      expect(c[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4200
     * @tc.name testUint8ArrayConstructor04_042
     * @tc.desc Verify negative int length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a: Uint8Array = new Uint8Array(-5);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4300
     * @tc.name testUint8ArrayConstructor04_043
     * @tc.desc Verify negative number length throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a: Uint8Array = new Uint8Array(-5.0);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4400
     * @tc.name testUint8ArrayConstructor04_044
     * @tc.desc Verify float length 3.9 truncates to 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3.9);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4500
     * @tc.name testUint8ArrayConstructor04_045
     * @tc.desc Verify float length 0.1 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(0.1);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4600
     * @tc.name testUint8ArrayConstructor04_046
     * @tc.desc Verify offset=2 with remaining buffer has length=6
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab, 2);
      expect(a.length).assertEqual(6);
      expect(a.byteOffset).assertEqual(2);
      expect(a.byteLength).assertEqual(6);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4700
     * @tc.name testUint8ArrayConstructor04_047
     * @tc.desc Verify int length constructor buffer exists
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(5);
      expect(a.length).assertEqual(5);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(5);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4800
     * @tc.name testUint8ArrayConstructor04_048
     * @tc.desc Verify ArrayBuffer view constructor uses same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const a: Uint8Array = new Uint8Array(ab);
      expect(a.length).assertEqual(8);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(8);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_4900
     * @tc.name testUint8ArrayConstructor04_049
     * @tc.desc Verify overflow throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 0, 10);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5000
     * @tc.name testUint8ArrayConstructor04_050
     * @tc.desc Verify offset exceeds buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 10);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5100
     * @tc.name testUint8ArrayConstructor04_051
     * @tc.desc Verify offset+length exceeds remaining throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      try {
        const a: Uint8Array = new Uint8Array(ab, 3, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5200
     * @tc.name testUint8ArrayConstructor04_052
     * @tc.desc Verify offset equals buffer byteLength creates zero-length array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const a: Uint8Array = new Uint8Array(ab, 4);
      expect(a.length).assertEqual(0);
      expect(a.byteOffset).assertEqual(4);
      expect(a.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5300
     * @tc.name testUint8ArrayConstructor04_053
     * @tc.desc Verify length exceeds buffer throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 0, 5);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5400
     * @tc.name testUint8ArrayConstructor04_054
     * @tc.desc Verify number offset with overflow throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 1.0, 5);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5500
     * @tc.name testUint8ArrayConstructor04_055
     * @tc.desc Verify offset+length exceeds remaining throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 1, 4);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5600
     * @tc.name testUint8ArrayConstructor04_056
     * @tc.desc Verify negative offset throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5700
     * @tc.name testUint8ArrayConstructor04_057
     * @tc.desc Verify two consecutive illegal constructions both caught
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      let caught: number = 0;
      try {
        const a: Uint8Array = new Uint8Array(ab, 0, 10);
        expect().assertFail();
      } catch (e) {
        caught++;
        expect((e as Error).name).assertEqual('RangeError');
      }
      try {
        const b: Uint8Array = new Uint8Array(ab, 10);
        expect().assertFail();
      } catch (e) {
        caught++;
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(caught).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5800
     * @tc.name testUint8ArrayConstructor04_058
     * @tc.desc Verify legal construction after illegal still succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint8Array = new Uint8Array(ab, 0, 20);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      const b: Uint8Array = new Uint8Array(ab, 2, 4);
      expect(b.length).assertEqual(4);
      expect(b.byteOffset).assertEqual(2);
      expect(b.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_5900
     * @tc.name testUint8ArrayConstructor04_059
     * @tc.desc Verify float offset overflow throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 100.0, 1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6000
     * @tc.name testUint8ArrayConstructor04_060
     * @tc.desc Verify undefined length but illegal offset throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 10, undefined);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6100
     * @tc.name testUint8ArrayConstructor04_061
     * @tc.desc Verify number offset=0 with overflow throws RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      try {
        const a: Uint8Array = new Uint8Array(ab, 0.0, 20);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6200
     * @tc.name testUint8ArrayConstructor04_062
     * @tc.desc Verify reusing buffer after exception succeeds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      try {
        const a: Uint8Array = new Uint8Array(ab, 0, 20);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      const ok: Uint8Array = new Uint8Array(ab, 0, 4);
      expect(ok.length).assertEqual(4);
      expect(ok.byteOffset).assertEqual(0);
      expect(ok.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6300
     * @tc.name testUint8ArrayConstructor04_063
     * @tc.desc Verify int length=3 constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6400
     * @tc.name testUint8ArrayConstructor04_064
     * @tc.desc Verify number length=3.0 constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3.0);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6500
     * @tc.name testUint8ArrayConstructor04_065
     * @tc.desc Verify FixedArray<int> constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array([1, 2, 3]);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6600
     * @tc.name testUint8ArrayConstructor04_066
     * @tc.desc Verify FixedArray<number> constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array([10.0, 20.0, 30.0]);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(10);
      expect(a[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6700
     * @tc.name testUint8ArrayConstructor04_067
     * @tc.desc Verify Array<int> constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [100, 200, 255];
      const a: Uint8Array = new Uint8Array(data);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(100);
      expect(a[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6800
     * @tc.name testUint8ArrayConstructor04_068
     * @tc.desc Verify Uint8Array copy constructor length matches source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([5, 10, 15]);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(src.length);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(src.byteLength);
      expect(dst[0]).assertEqual(5);
      expect(dst[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_6900
     * @tc.name testUint8ArrayConstructor04_069
     * @tc.desc Verify ArrayBuffer constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(3);
      const a: Uint8Array = new Uint8Array(ab);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7000
     * @tc.name testUint8ArrayConstructor04_070
     * @tc.desc Verify ArrayBuffer+offset view length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(ab);
      dv.setUint8(0, 10);
      dv.setUint8(1, 20);
      dv.setUint8(2, 30);
      dv.setUint8(3, 40);
      const a: Uint8Array = new Uint8Array(ab, 1, 2);
      expect(a.length).assertEqual(2);
      expect(a.byteOffset).assertEqual(1);
      expect(a.byteLength).assertEqual(2);
      expect(a[0]).assertEqual(20);
      expect(a[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7100
     * @tc.name testUint8ArrayConstructor04_071
     * @tc.desc Verify ArrayBuffer+offset+length view properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const dv: DataView = new DataView(ab);
      dv.setUint8(0, 1);
      dv.setUint8(1, 2);
      dv.setUint8(2, 3);
      dv.setUint8(3, 4);
      dv.setUint8(4, 5);
      dv.setUint8(5, 6);
      const a: Uint8Array = new Uint8Array(ab, 2, 3);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(2);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(3);
      expect(a[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7200
     * @tc.name testUint8ArrayConstructor04_072
     * @tc.desc Verify undefined+undefined view covers full buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(3);
      const a: Uint8Array = new Uint8Array(ab, undefined, undefined);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7300
     * @tc.name testUint8ArrayConstructor04_073
     * @tc.desc Verify offset=2 view length is remaining bytes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const a: Uint8Array = new Uint8Array(ab, 2);
      expect(a.length).assertEqual(4);
      expect(a.byteOffset).assertEqual(2);
      expect(a.byteLength).assertEqual(4);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7400
     * @tc.name testUint8ArrayConstructor04_074
     * @tc.desc Verify offset=1 length=3 view length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const a: Uint8Array = new Uint8Array(ab, 1, 3);
      expect(a.length).assertEqual(3);
      expect(a.byteOffset).assertEqual(1);
      expect(a.byteLength).assertEqual(3);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7500
     * @tc.name testUint8ArrayConstructor04_075
     * @tc.desc Verify Array<int> constructor length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [1, 2, 3, 4, 5];
      const a: Uint8Array = new Uint8Array(data);
      expect(a.length).assertEqual(5);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(5);
      expect(a[0]).assertEqual(1);
      expect(a[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7600
     * @tc.name testUint8ArrayConstructor04_076
     * @tc.desc Verify copy constructor length matches source length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(5);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(5);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(5);
      expect(dst[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7700
     * @tc.name testUint8ArrayConstructor04_077
     * @tc.desc Verify copy constructor values initialized to zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(src.length);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(src.byteLength);
      expect(dst[0]).assertEqual(10);
      expect(dst[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7800
     * @tc.name testUint8ArrayConstructor04_078
     * @tc.desc Verify copy constructor buffer is independent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(4);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(src.length);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(src.byteLength);
      expect(dst[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_7900
     * @tc.name testUint8ArrayConstructor04_079
     * @tc.desc Verify two ArrayBuffer views on same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const view1: Uint8Array = new Uint8Array(ab, 0, 2);
      const view2: Uint8Array = new Uint8Array(ab, 2, 2);
      expect(view1.length).assertEqual(2);
      expect(view2.length).assertEqual(2);
      expect(view1.byteOffset).assertEqual(0);
      expect(view1.byteLength).assertEqual(2);
      expect(view2.byteOffset).assertEqual(2);
      expect(view2.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8000
     * @tc.name testUint8ArrayConstructor04_080
     * @tc.desc Verify undefined+undefined shares buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const a: Uint8Array = new Uint8Array(ab, undefined, undefined);
      expect(a.length).assertEqual(6);
      expect(a.byteOffset).assertEqual(0);
      expect(a.byteLength).assertEqual(6);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8100
     * @tc.name testUint8ArrayConstructor04_081
     * @tc.desc Verify new ArrayBuffer view initial values are all zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(5);
      const v: Uint8Array = new Uint8Array(ab);
      expect(v.length).assertEqual(5);
      expect(v.byteOffset).assertEqual(0);
      expect(v.byteLength).assertEqual(5);
      expect(v[0]).assertEqual(0);
      expect(v[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8200
     * @tc.name testUint8ArrayConstructor04_082
     * @tc.desc Verify same ArrayBuffer different overloads share data
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(8);
      const view1: Uint8Array = new Uint8Array(ab);
      view1[3] = 77;
      const view2: Uint8Array = new Uint8Array(ab, 3, 5);
      expect(view2.length).assertEqual(5);
      expect(view2.byteOffset).assertEqual(3);
      expect(view2.byteLength).assertEqual(5);
      expect(view2[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8300
     * @tc.name testUint8ArrayConstructor04_083
     * @tc.desc Verify ArrayBuffer view modification visible in source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const view: Uint8Array = new Uint8Array(ab);
      view[0] = 100;
      const src: Uint8Array = new Uint8Array(ab);
      expect(src.length).assertEqual(4);
      expect(src.byteOffset).assertEqual(0);
      expect(src.byteLength).assertEqual(4);
      expect(src[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8400
     * @tc.name testUint8ArrayConstructor04_084
     * @tc.desc Verify copy constructor with large source preserves length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(100);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(100);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(100);
      expect(dst[0]).assertEqual(0);
      expect(dst[99]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8500
     * @tc.name testUint8ArrayConstructor04_085
     * @tc.desc Verify ArrayBuffer view shares data
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const src: Uint8Array = new Uint8Array(ab);
      src[2] = 100;
      const view: Uint8Array = new Uint8Array(ab, 2, 4);
      expect(view.length).assertEqual(4);
      expect(view.byteOffset).assertEqual(2);
      expect(view.byteLength).assertEqual(4);
      expect(view[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8600
     * @tc.name testUint8ArrayConstructor04_086
     * @tc.desc Verify ArrayBuffer view offset=1 length=3 shares data
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const src: Uint8Array = new Uint8Array(ab);
      src[1] = 10;
      src[2] = 20;
      src[3] = 30;
      const view: Uint8Array = new Uint8Array(ab, 1, 3);
      expect(view.length).assertEqual(3);
      expect(view.byteOffset).assertEqual(1);
      expect(view.byteLength).assertEqual(3);
      expect(view[0]).assertEqual(10);
      expect(view[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8700
     * @tc.name testUint8ArrayConstructor04_087
     * @tc.desc Verify undefined+undefined shares data with source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const src: Uint8Array = new Uint8Array(ab);
      src[0] = 100;
      src[1] = 200;
      const view: Uint8Array = new Uint8Array(ab, undefined, undefined);
      expect(view.length).assertEqual(4);
      expect(view.byteOffset).assertEqual(0);
      expect(view.byteLength).assertEqual(4);
      expect(view[0]).assertEqual(100);
      expect(view[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8800
     * @tc.name testUint8ArrayConstructor04_088
     * @tc.desc Verify copy constructor with float length source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(3.9);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(3);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(3);
      expect(dst[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_8900
     * @tc.name testUint8ArrayConstructor04_089
     * @tc.desc Verify two ArrayBuffer views are independent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(4);
      const view1: Uint8Array = new Uint8Array(ab, 0, 2);
      const view2: Uint8Array = new Uint8Array(ab, 2, 2);
      view1[0] = 100;
      view1[1] = 200;
      expect(view2.length).assertEqual(2);
      expect(view1.length).assertEqual(2);
      expect(view1.byteOffset).assertEqual(0);
      expect(view1.byteLength).assertEqual(2);
      expect(view2.byteOffset).assertEqual(2);
      expect(view2.byteLength).assertEqual(2);
      expect(view1[0]).assertEqual(100);
      expect(view2[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_9000
     * @tc.name testUint8ArrayConstructor04_090
     * @tc.desc Verify copy constructor with large source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(1000);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(1000);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(1000);
      expect(dst[0]).assertEqual(0);
      expect(dst[999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_9100
     * @tc.name testUint8ArrayConstructor04_091
     * @tc.desc Verify ArrayBuffer view shares data at offset 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const src: Uint8Array = new Uint8Array(ab);
      src[3] = 100;
      const view: Uint8Array = new Uint8Array(ab, 3, 3);
      expect(view.length).assertEqual(3);
      expect(view.byteOffset).assertEqual(3);
      expect(view.byteLength).assertEqual(3);
      expect(view[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_9200
     * @tc.name testUint8ArrayConstructor04_092
     * @tc.desc Verify ArrayBuffer view shares data at offset 2 length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab: ArrayBuffer = new ArrayBuffer(6);
      const src: Uint8Array = new Uint8Array(ab);
      src[2] = 100;
      src[3] = 200;
      const view: Uint8Array = new Uint8Array(ab, 2, 2);
      expect(view.length).assertEqual(2);
      expect(view.byteOffset).assertEqual(2);
      expect(view.byteLength).assertEqual(2);
      expect(view[0]).assertEqual(100);
      expect(view[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_CONSTRUCTOR_04_9300
     * @tc.name testUint8ArrayConstructor04_093
     * @tc.desc Verify copy constructor with empty source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayConstructor04_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(0);
      const dst: Uint8Array = new Uint8Array(src);
      expect(dst.length).assertEqual(0);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.byteLength).assertEqual(0);
    });
  });
}