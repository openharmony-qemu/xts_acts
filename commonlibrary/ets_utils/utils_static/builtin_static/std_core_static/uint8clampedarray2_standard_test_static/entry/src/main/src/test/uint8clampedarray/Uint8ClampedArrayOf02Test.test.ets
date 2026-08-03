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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArrayOfTwoTest(): void {
  describe('Uint8ClampedArrayOfTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0100
     * @tc.name testUint8ClampedArrayOfTwo001
     * @tc.desc Verify of(byte 10) byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 10;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0200
     * @tc.name testUint8ClampedArrayOfTwo002
     * @tc.desc Verify of(byte 1,2,3) byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0300
     * @tc.name testUint8ClampedArrayOfTwo003
     * @tc.desc Verify of(byte 1) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0400
     * @tc.name testUint8ClampedArrayOfTwo004
     * @tc.desc Verify of(byte 1,2) buffer.byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b);
      expect(arr.buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0500
     * @tc.name testUint8ClampedArrayOfTwo005
     * @tc.desc Verify of() length equals new Uint8ClampedArray(0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8ClampedArray = Uint8ClampedArray.of();
      const b: Uint8ClampedArray = new Uint8ClampedArray(0);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0600
     * @tc.name testUint8ClampedArrayOfTwo006
     * @tc.desc Verify of(byte 5) value differs from new Uint8ClampedArray(1) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const a: Uint8ClampedArray = Uint8ClampedArray.of(v);
      const b: Uint8ClampedArray = new Uint8ClampedArray(1);
      expect(a[0]).assertEqual(5);
      expect(b[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0700
     * @tc.name testUint8ClampedArrayOfTwo007
     * @tc.desc Verify of(byte 1,2,3) length equals new Uint8ClampedArray(3) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const x: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c);
      const y: Uint8ClampedArray = new Uint8ClampedArray(3);
      expect(x.length).assertEqual(y.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0800
     * @tc.name testUint8ClampedArrayOfTwo008
     * @tc.desc Verify of(100.0) returns [100] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(100.0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_0900
     * @tc.name testUint8ClampedArrayOfTwo009
     * @tc.desc Verify of(1..10) 10 number params returns length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1000
     * @tc.name testUint8ClampedArrayOfTwo010
     * @tc.desc Verify of(...[256x7.0]) returns length 256, arr[255]===7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<number> = [];
      for (let i: int = 0; i < 256; i++) {
        list.push(7.0);
      }
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...list);
      expect(arr.length).assertEqual(256);
      expect(arr[255]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1100
     * @tc.name testUint8ClampedArrayOfTwo011
     * @tc.desc Verify of(127.0) 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(127.0);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1200
     * @tc.name testUint8ClampedArrayOfTwo012
     * @tc.desc Verify of(128.0) 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(128.0);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1300
     * @tc.name testUint8ClampedArrayOfTwo013
     * @tc.desc Verify of(254.0) 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(254.0);
      expect(arr[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1400
     * @tc.name testUint8ClampedArrayOfTwo014
     * @tc.desc Verify of(0.4) round 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0.4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1500
     * @tc.name testUint8ClampedArrayOfTwo015
     * @tc.desc Verify of(255.4) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(255.4);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1600
     * @tc.name testUint8ClampedArrayOfTwo016
     * @tc.desc Verify of(-0.0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-0.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1700
     * @tc.name testUint8ClampedArrayOfTwo017
     * @tc.desc Verify of(Number.MAX_VALUE) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(Number.MAX_VALUE);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1800
     * @tc.name testUint8ClampedArrayOfTwo018
     * @tc.desc Verify of(Number.MIN_VALUE) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(Number.MIN_VALUE);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_1900
     * @tc.name testUint8ClampedArrayOfTwo019
     * @tc.desc Verify of(1e9) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1e9);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2000
     * @tc.name testUint8ClampedArrayOfTwo020
     * @tc.desc Verify of(-1e9) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-1e9);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2100
     * @tc.name testUint8ClampedArrayOfTwo021
     * @tc.desc Verify of(2147483648.0) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(2147483648.0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2200
     * @tc.name testUint8ClampedArrayOfTwo022
     * @tc.desc Verify of(-2147483648.0) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-2147483648.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2300
     * @tc.name testUint8ClampedArrayOfTwo023
     * @tc.desc Verify of(0x80) 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0x80);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2400
     * @tc.name testUint8ClampedArrayOfTwo024
     * @tc.desc Verify of(0xFF) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0xFF);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2500
     * @tc.name testUint8ClampedArrayOfTwo025
     * @tc.desc Verify of(0x100) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0x100);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2600
     * @tc.name testUint8ClampedArrayOfTwo026
     * @tc.desc Verify of(0o17) 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0o17);
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2700
     * @tc.name testUint8ClampedArrayOfTwo027
     * @tc.desc Verify of(0o377) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0o377);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2800
     * @tc.name testUint8ClampedArrayOfTwo028
     * @tc.desc Verify of(0o400) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0o400);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_2900
     * @tc.name testUint8ClampedArrayOfTwo029
     * @tc.desc Verify of(0b10000000) 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0b10000000);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3000
     * @tc.name testUint8ClampedArrayOfTwo030
     * @tc.desc Verify of(0b11111111) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0b11111111);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3100
     * @tc.name testUint8ClampedArrayOfTwo031
     * @tc.desc Verify of(0b100000000) clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0b100000000);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3200
     * @tc.name testUint8ClampedArrayOfTwo032
     * @tc.desc Verify of(1e2) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1e2);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3300
     * @tc.name testUint8ClampedArrayOfTwo033
     * @tc.desc Verify of(2.55e2) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(2.55e2);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3400
     * @tc.name testUint8ClampedArrayOfTwo034
     * @tc.desc Verify of(1e-1) round 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1e-1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3500
     * @tc.name testUint8ClampedArrayOfTwo035
     * @tc.desc Verify of(0.0, 0.0, 0.0) all 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0.0, 0.0, 0.0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3600
     * @tc.name testUint8ClampedArrayOfTwo036
     * @tc.desc Verify of(255.0, 255.0, 255.0) all 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(255.0, 255.0, 255.0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3700
     * @tc.name testUint8ClampedArrayOfTwo037
     * @tc.desc Verify of(300.0, 400.0, 1000.0) all clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(300.0, 400.0, 1000.0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3800
     * @tc.name testUint8ClampedArrayOfTwo038
     * @tc.desc Verify of(-1.0, -100.0, -1000.0) all clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-1.0, -100.0, -1000.0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_3900
     * @tc.name testUint8ClampedArrayOfTwo039
     * @tc.desc Verify of(NaN, 10.0, NaN) clamp to 0 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(Number.NaN, 10.0, Number.NaN);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4000
     * @tc.name testUint8ClampedArrayOfTwo040
     * @tc.desc Verify of(Infinity, -Infinity, 100.0) clamp to 255 0 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 100.0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4100
     * @tc.name testUint8ClampedArrayOfTwo041
     * @tc.desc Verify of ascending numbers 10 20 30 40 order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(10.0, 20.0, 30.0, 40.0);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4200
     * @tc.name testUint8ClampedArrayOfTwo042
     * @tc.desc Verify of descending numbers 40 30 20 10 order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(40.0, 30.0, 20.0, 10.0);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(30);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4300
     * @tc.name testUint8ClampedArrayOfTwo043
     * @tc.desc Verify of(-0.5, 0.0, 0.5) all clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-0.5, 0.0, 0.5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4400
     * @tc.name testUint8ClampedArrayOfTwo044
     * @tc.desc Verify of(254.5, 255.0, 255.5) clamp to 254 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(254.5, 255.0, 255.5);
      expect(arr[0]).assertEqual(254);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4500
     * @tc.name testUint8ClampedArrayOfTwo045
     * @tc.desc Verify of(1,2,3,4) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0, 3.0, 4.0);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4600
     * @tc.name testUint8ClampedArrayOfTwo046
     * @tc.desc Verify of(1).BYTES_PER_ELEMENT equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4700
     * @tc.name testUint8ClampedArrayOfTwo047
     * @tc.desc Verify of(1,2,3,4,5) buffer.byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0, 3.0, 4.0, 5.0);
      expect(arr.buffer.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4800
     * @tc.name testUint8ClampedArrayOfTwo048
     * @tc.desc Verify of(256.5) half-even clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(256.5);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_4900
     * @tc.name testUint8ClampedArrayOfTwo049
     * @tc.desc Verify of(-0.5) half-even clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-0.5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5000
     * @tc.name testUint8ClampedArrayOfTwo050
     * @tc.desc Verify of() no param length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5100
     * @tc.name testUint8ClampedArrayOfTwo051
     * @tc.desc Verify of() no param byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5200
     * @tc.name testUint8ClampedArrayOfTwo052
     * @tc.desc Verify of() no param byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5300
     * @tc.name testUint8ClampedArrayOfTwo053
     * @tc.desc Verify typeof of(1,2,3) result is "object"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const t: string = typeof arr;
      expect(t).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5400
     * @tc.name testUint8ClampedArrayOfTwo054
     * @tc.desc Verify of(1,2,3) returns [1,2,3] length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5500
     * @tc.name testUint8ClampedArrayOfTwo055
     * @tc.desc Verify of(1,2,3) result is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5600
     * @tc.name testUint8ClampedArrayOfTwo056
     * @tc.desc Verify of(1,2,3).name equals "Uint8ClampedArray"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5700
     * @tc.name testUint8ClampedArrayOfTwo057
     * @tc.desc Verify of(10,20,30) twice produces different buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Uint8ClampedArray.of(10, 20, 30);
      const a2 = Uint8ClampedArray.of(10, 20, 30);
      expect(a1.buffer).not().assertEqual(a2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5800
     * @tc.name testUint8ClampedArrayOfTwo058
     * @tc.desc Verify of(1,2,3).buffer.byteLength equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_5900
     * @tc.name testUint8ClampedArrayOfTwo059
     * @tc.desc Verify of(255, 0, 128) midpoint values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(255, 0, 128);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6000
     * @tc.name testUint8ClampedArrayOfTwo060
     * @tc.desc Verify of(10,20,30) elements match new Uint8ClampedArray([10,20,30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Uint8ClampedArray.of(10, 20, 30);
      const a2 = new Uint8ClampedArray([10, 20, 30]);
      expect(a1.length).assertEqual(3);
      expect(a1[0]).assertEqual(10);
      expect(a1[1]).assertEqual(20);
      expect(a1[2]).assertEqual(30);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[1]).assertEqual(a2[1]);
      expect(a1[2]).assertEqual(a2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6100
     * @tc.name testUint8ClampedArrayOfTwo061
     * @tc.desc Verify of(10,20,30,40).subarray(1,3) shares same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 40);
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6200
     * @tc.name testUint8ClampedArrayOfTwo062
     * @tc.desc Verify of(30,10,20).sort() returns [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(30, 10, 20);
      arr.sort();
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6300
     * @tc.name testUint8ClampedArrayOfTwo063
     * @tc.desc Verify of(1,2,3).reverse() returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6400
     * @tc.name testUint8ClampedArrayOfTwo064
     * @tc.desc Verify of(1,2,3,4).fill(99) all elements become 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3, 4);
      arr.fill(99);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
      expect(arr[3]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6500
     * @tc.name testUint8ClampedArrayOfTwo065
     * @tc.desc Verify of(1,2,3).set(0,88) element[0] becomes 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      arr.set(0, 88);
      expect(arr[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6600
     * @tc.name testUint8ClampedArrayOfTwo066
     * @tc.desc Verify of(1,2,3).map(x*2) returns [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const m = arr.map((x: number): number => { return x * 2; });
      expect(m[0]).assertEqual(2);
      expect(m[1]).assertEqual(4);
      expect(m[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6700
     * @tc.name testUint8ClampedArrayOfTwo067
     * @tc.desc Verify of(1,2,3).toReversed() returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6800
     * @tc.name testUint8ClampedArrayOfTwo068
     * @tc.desc Verify of(3,1,2).toSorted() returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(3, 1, 2);
      const s = arr.toSorted();
      expect(s.length).assertEqual(3);
      expect(s[0]).assertEqual(1);
      expect(s[1]).assertEqual(2);
      expect(s[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_6900
     * @tc.name testUint8ClampedArrayOfTwo069
     * @tc.desc Verify of(1,2,3).with(0,99) returns [99,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      const w = arr.with(0, 99);
      expect(w.length).assertEqual(3);
      expect(w[0]).assertEqual(99);
      expect(w[1]).assertEqual(2);
      expect(w[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7000
     * @tc.name testUint8ClampedArrayOfTwo070
     * @tc.desc Verify of(10,20,30,40).slice(1,3) returns [20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30, 40);
      const s = arr.slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s[0]).assertEqual(20);
      expect(s[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7100
     * @tc.name testUint8ClampedArrayOfTwo071
     * @tc.desc Verify of(1,2,3,4,5).filter(x>2) returns [3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3, 4, 5);
      const f = arr.filter((x: number): boolean => { return x > 2; });
      expect(f.length).assertEqual(3);
      expect(f[0]).assertEqual(3);
      expect(f[1]).assertEqual(4);
      expect(f[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7200
     * @tc.name testUint8ClampedArrayOfTwo072
     * @tc.desc Verify of(5,10,15).toString() equals new Uint8ClampedArray([5,10,15]).toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Uint8ClampedArray.of(5, 10, 15);
      const a2 = new Uint8ClampedArray([5, 10, 15]);
      expect(a1.toString()).assertEqual(a2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7300
     * @tc.name testUint8ClampedArrayOfTwo073
     * @tc.desc Verify of(7,14,21) mutating first array does not affect second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Uint8ClampedArray.of(7, 14, 21);
      const a2 = Uint8ClampedArray.of(7, 14, 21);
      a1[0] = 99;
      expect(a2[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7400
     * @tc.name testUint8ClampedArrayOfTwo074
     * @tc.desc Verify of(1,2,3).valueOf() returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7500
     * @tc.name testUint8ClampedArrayOfTwo075
     * @tc.desc Verify of(15,25,35).$_get(1) returns 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(15, 25, 35);
      expect(arr.$_get(1)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7600
     * @tc.name testUint8ClampedArrayOfTwo076
     * @tc.desc Verify of(1,2,3).$_set(1,77) then $_get(1) returns 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      arr.$_set(1, 77);
      expect(arr.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_TWO_7700
     * @tc.name testUint8ClampedArrayOfTwo077
     * @tc.desc Verify of(0) length and value match new Uint8ClampedArray([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = Uint8ClampedArray.of(0);
      const a2 = new Uint8ClampedArray([0]);
      expect(a1.length).assertEqual(a2.length);
      expect(a1[0]).assertEqual(a2[0]);
    });
  });
}
