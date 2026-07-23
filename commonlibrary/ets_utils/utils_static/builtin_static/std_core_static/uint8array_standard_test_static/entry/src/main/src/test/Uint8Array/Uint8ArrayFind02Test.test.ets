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

export default function Uint8ArrayFind02Test(): void {
  describe('Uint8ArrayFind02Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0100
     * @tc.name testUint8ArrayFind001
     * @tc.desc Verify find returns number for first element match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([55, 66, 77]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 55);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0200
     * @tc.name testUint8ArrayFind002
     * @tc.desc Verify find returns number for last element match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([33, 66, 99]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0300
     * @tc.name testUint8ArrayFind003
     * @tc.desc Verify find returns number for minimum boundary element 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 10, 20]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0400
     * @tc.name testUint8ArrayFind004
     * @tc.desc Verify find returns number for maximum boundary element 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 200, 100]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 255);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0500
     * @tc.name testUint8ArrayFind005
     * @tc.desc Verify find returns undefined when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 200);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0600
     * @tc.name testUint8ArrayFind006
     * @tc.desc Verify find returns undefined on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0700
     * @tc.name testUint8ArrayFind007
     * @tc.desc Verify find returns undefined when predicate always returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 15, 25]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0800
     * @tc.name testUint8ArrayFind008
     * @tc.desc Verify some returns true when multiple matches exist
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([44, 55, 66]);
      let found: boolean = arr.some((v: number, i: int, a: Uint8Array): boolean => v > 50);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_0900
     * @tc.name testUint8ArrayFind009
     * @tc.desc Verify some returns false when no element matches (strict equality)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 6, 9]);
      let found: boolean = arr.some((v: number, i: int, a: Uint8Array): boolean => v === 99);
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1000
     * @tc.name testUint8ArrayFind010
     * @tc.desc Verify find works on ArrayBuffer-backed array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 72;
      arr[1] = 84;
      arr[2] = 96;
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 96);
      expect(result).assertEqual(96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1100
     * @tc.name testUint8ArrayFind011
     * @tc.desc Verify find returns undefined on zero-length array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1200
     * @tc.name testUint8ArrayFind012
     * @tc.desc Verify find returns correct value for single-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([144]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(144);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1300
     * @tc.name testUint8ArrayFind013
     * @tc.desc Verify find returns number type for matching element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([60, 120, 180]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 100);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1400
     * @tc.name testUint8ArrayFind014
     * @tc.desc Verify find returns 6 from ascending sequence matching v>5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 2, 4, 6, 8]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 5);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1500
     * @tc.name testUint8ArrayFind015
     * @tc.desc Verify find returns 9 from single-element array exact match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([9]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 9);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1600
     * @tc.name testUint8ArrayFind016
     * @tc.desc Verify find from Array<int> construction returns 12
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [12, 24, 36];
      let arr: Uint8Array = new Uint8Array(src);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 12);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1700
     * @tc.name testUint8ArrayFind017
     * @tc.desc Verify find from hex literal construction returns 24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0x18, 0x30, 0x48];
      let arr: Uint8Array = new Uint8Array(src);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 0x18);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1800
     * @tc.name testUint8ArrayFind018
     * @tc.desc Verify find returns 32 from [32,64,96] matching v>=32
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([32, 64, 96]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v >= 32);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_1900
     * @tc.name testUint8ArrayFind019
     * @tc.desc Verify find from hex literal 0x24 returns 36
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0x24, 0x48, 0x6C]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 0x24);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2000
     * @tc.name testUint8ArrayFind020
     * @tc.desc Verify find returns 44 from [22,44,66] matching middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([22, 44, 66]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 44);
      expect(result).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2100
     * @tc.name testUint8ArrayFind021
     * @tc.desc Verify find from binary literal 0b110000 returns 48
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0b110000, 0b1100000, 0b10010000]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 0b110000);
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2200
     * @tc.name testUint8ArrayFind022
     * @tc.desc Verify find returns 55 from [55,0,255] matching v>0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([55, 0, 255]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 0);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2300
     * @tc.name testUint8ArrayFind023
     * @tc.desc Verify find on buffer-backed array returns 64
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 10;
      arr[1] = 64;
      arr[2] = 128;
      arr[3] = 192;
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 64);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2400
     * @tc.name testUint8ArrayFind024
     * @tc.desc Verify find returns 66 from [33,66,99] matching middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([33, 66, 99]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 66);
      expect(result).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2500
     * @tc.name testUint8ArrayFind025
     * @tc.desc Verify find returns 72 matching first element >70
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([72, 144, 216]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 70);
      expect(result).assertEqual(72);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2600
     * @tc.name testUint8ArrayFind026
     * @tc.desc Verify find returns 80 exact match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([80, 160, 240]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 80);
      expect(result).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2700
     * @tc.name testUint8ArrayFind027
     * @tc.desc Verify find returns 84 from [42,84,126] matching middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42, 84, 126]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 84);
      expect(result).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2800
     * @tc.name testUint8ArrayFind028
     * @tc.desc Verify find returns 88 from [44,88,132] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([44, 88, 132]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 88);
      expect(result).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_2900
     * @tc.name testUint8ArrayFind029
     * @tc.desc Verify find returns 96 from [48,96,144] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([48, 96, 144]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 96);
      expect(result).assertEqual(96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3000
     * @tc.name testUint8ArrayFind030
     * @tc.desc Verify find returns 104 from [52,104,156] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([52, 104, 156]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 104);
      expect(result).assertEqual(104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3100
     * @tc.name testUint8ArrayFind031
     * @tc.desc Verify find returns 108 exact match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([54, 108, 162]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 108);
      expect(result).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3200
     * @tc.name testUint8ArrayFind032
     * @tc.desc Verify find returns 112 from [56,112,168] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([56, 112, 168]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 112);
      expect(result).assertEqual(112);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3300
     * @tc.name testUint8ArrayFind033
     * @tc.desc Verify find returns 120 from [60,120,180] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([60, 120, 180]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 120);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3400
     * @tc.name testUint8ArrayFind034
     * @tc.desc Verify find returns 124 from [62,124,186] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([62, 124, 186]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 124);
      expect(result).assertEqual(124);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3500
     * @tc.name testUint8ArrayFind035
     * @tc.desc Verify find returns 130 from [65,130,195] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([65, 130, 195]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 130);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3600
     * @tc.name testUint8ArrayFind036
     * @tc.desc Verify find returns 132 from [66,132,198] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([66, 132, 198]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 132);
      expect(result).assertEqual(132);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3700
     * @tc.name testUint8ArrayFind037
     * @tc.desc Verify find returns 144 from [72,144,216] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([72, 144, 216]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 144);
      expect(result).assertEqual(144);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3800
     * @tc.name testUint8ArrayFind038
     * @tc.desc Verify find returns 160 from [80,160,240] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([80, 160, 240]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 160);
      expect(result).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_3900
     * @tc.name testUint8ArrayFind039
     * @tc.desc Verify find returns 176 from [88,176,255] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([88, 176, 255]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 176);
      expect(result).assertEqual(176);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4000
     * @tc.name testUint8ArrayFind040
     * @tc.desc Verify find returns 180 from [90,180,240] match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([90, 180, 240]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 180);
      expect(result).assertEqual(180);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4100
     * @tc.name testUint8ArrayFind041
     * @tc.desc Verify find matches arr[0] for first match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([55, 110, 165]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 50);
      expect(result).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4200
     * @tc.name testUint8ArrayFind042
     * @tc.desc Verify find matches arr[1] for second match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([30, 60, 90]);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 50);
      expect(result).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4300
     * @tc.name testUint8ArrayFind043
     * @tc.desc Verify findIndex does not change arr.length after finding element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 25);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4400
     * @tc.name testUint8ArrayFind044
     * @tc.desc Verify findIndex does not change arr.length when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 15]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 100);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4500
     * @tc.name testUint8ArrayFind045
     * @tc.desc Verify findIndex does not change ArrLen after finding element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 3);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4600
     * @tc.name testUint8ArrayFind046
     * @tc.desc Verify findIndex does not change arr length on non-zero offset view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 2, 3);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 0);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4700
     * @tc.name testUint8ArrayFind047
     * @tc.desc Verify findIndex does not change arr length by side effect
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 15);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4800
     * @tc.name testUint8ArrayFind048
     * @tc.desc Verify findIndex does not change arr buffer reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf);
      let bufRef: ArrayBuffer = arr.buffer;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 0);
      expect(arr.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_4900
     * @tc.name testUint8ArrayFind049
     * @tc.desc Verify findIndex does not change arr.buffer reference on match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      let bufRef: ArrayBuffer = arr.buffer;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 0);
      expect(arr.buffer).assertEqual(bufRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5000
     * @tc.name testUint8ArrayFind050
     * @tc.desc Verify findIndex on empty array keeps length at 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => true);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5100
     * @tc.name testUint8ArrayFind051
     * @tc.desc Verify multiple consecutive findIndex do not change arr.length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 6, 9, 12, 15]);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 5);
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v < 10);
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v % 3 === 0);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5200
     * @tc.name testUint8ArrayFind052
     * @tc.desc Verify findIndex does not change arr length on subview
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint8Array = new Uint8Array(buf, 2, 5);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 0);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5300
     * @tc.name testUint8ArrayFind053
     * @tc.desc Verify findIndex on offset view does not affect parent buffer length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint8Array = new Uint8Array(buf);
      let sub: Uint8Array = new Uint8Array(buf, 1, 4);
      let arrLenBefore: int = arr.length;
      sub.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 3);
      expect(arr.length).assertEqual(arrLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5400
     * @tc.name testUint8ArrayFind054
     * @tc.desc Verify findIndex does not change subview length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let sub: Uint8Array = new Uint8Array(buf, 1, 3);
      let subLenBefore: int = sub.length;
      sub.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 25);
      expect(sub.length).assertEqual(subLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5500
     * @tc.name testUint8ArrayFind055
     * @tc.desc Verify findIndex does not change arr[0] value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([11, 22, 33]);
      let valBefore: number = arr[0];
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 33);
      expect(arr[0]).assertEqual(valBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5600
     * @tc.name testUint8ArrayFind056
     * @tc.desc Verify findIndex does not change arr[1] value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([44, 55, 66]);
      let valBefore: number = arr[1];
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 55);
      expect(arr[1]).assertEqual(valBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5700
     * @tc.name testUint8ArrayFind057
     * @tc.desc Verify findIndex does not change elements when no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([7, 14, 21]);
      let valBefore: number = arr[2];
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 100);
      expect(arr[2]).assertEqual(valBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5800
     * @tc.name testUint8ArrayFind058
     * @tc.desc Verify findIndex does not modify buffer content on buffer-backed array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 17;
      arr[1] = 34;
      arr[2] = 51;
      let valBefore: number = arr[1];
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 50);
      expect(arr[1]).assertEqual(valBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_5900
     * @tc.name testUint8ArrayFind059
     * @tc.desc Verify findIndex early return does not modify subsequent elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5, 10, 15, 20, 25]);
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 10);
      expect(arr[4]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6000
     * @tc.name testUint8ArrayFind060
     * @tc.desc Verify find is idempotent - consecutive calls return same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([8, 16, 24, 32]);
      let r1: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 20);
      let r2: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 20);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6100
     * @tc.name testUint8ArrayFind061
     * @tc.desc Verify findIndex does not affect array iteration sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 6, 9]);
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 6);
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6200
     * @tc.name testUint8ArrayFind062
     * @tc.desc Verify findIndex on subview does not modify parent array unrelated elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 100;
      arr[3] = 200;
      arr[4] = 100;
      let sub: Uint8Array = new Uint8Array(buf, 1, 3);
      sub.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 200);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6300
     * @tc.name testUint8ArrayFind063
     * @tc.desc Verify findIndex with all-false predicate does not change array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([9, 18, 27, 36]);
      let snapshot: Array<number> = [arr[0], arr[1], arr[2], arr[3]];
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => false);
      expect(arr[0]).assertEqual(snapshot[0]);
      expect(arr[1]).assertEqual(snapshot[1]);
      expect(arr[2]).assertEqual(snapshot[2]);
      expect(arr[3]).assertEqual(snapshot[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6400
     * @tc.name testUint8ArrayFind064
     * @tc.desc Verify findIndex does not change arr[i] on original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([13, 26, 39, 52]);
      let valBefore: number = arr[2];
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 30);
      expect(arr[2]).assertEqual(valBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6500
     * @tc.name testUint8ArrayFind065
     * @tc.desc Verify find on offset view returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let sub: Uint8Array = new Uint8Array(buf, 1, 3);
      sub[0] = 10;
      sub[1] = 20;
      sub[2] = 30;
      let result: number | undefined = sub.find((v: number, i: int, a: Uint8Array): boolean => v > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6600
     * @tc.name testUint8ArrayFind066
     * @tc.desc Verify find on non-zero byteOffset view returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint8Array = new Uint8Array(buf, 2, 4);
      arr[0] = 11;
      arr[1] = 22;
      arr[2] = 33;
      arr[3] = 44;
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 33);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6700
     * @tc.name testUint8ArrayFind067
     * @tc.desc Verify find on subview consistent with parent array index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 5;
      arr[1] = 15;
      arr[2] = 25;
      arr[3] = 35;
      arr[4] = 45;
      let sub: Uint8Array = new Uint8Array(buf, 2, 3);
      let result: number | undefined = sub.find((v: number, i: int, a: Uint8Array): boolean => v === 35);
      expect(result).assertEqual(35);
      expect(result).assertEqual(arr[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6800
     * @tc.name testUint8ArrayFind068
     * @tc.desc Verify find on subview returns undefined when no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 100;
      arr[1] = 100;
      arr[2] = 200;
      arr[3] = 200;
      let sub: Uint8Array = new Uint8Array(buf, 0, 2);
      let result: number | undefined = sub.find((v: number, i: int, a: Uint8Array): boolean => v > 150);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_6900
     * @tc.name testUint8ArrayFind069
     * @tc.desc Verify find on view reflects new values after modifying parent buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Uint8Array = new Uint8Array(buf);
      let view: Uint8Array = new Uint8Array(buf);
      arr[0] = 18;
      arr[1] = 36;
      arr[2] = 54;
      let result: number | undefined = view.find((v: number, i: int, a: Uint8Array): boolean => v === 36);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7000
     * @tc.name testUint8ArrayFind070
     * @tc.desc Verify find on subview returns value consistent with parent array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 7;
      arr[1] = 14;
      arr[2] = 21;
      arr[3] = 28;
      arr[4] = 35;
      let sub: Uint8Array = new Uint8Array(buf, 2, 3);
      let resultSub: number | undefined = sub.find((v: number, i: int, a: Uint8Array): boolean => v === 28);
      let resultParent: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v === 28);
      expect(resultSub).assertEqual(resultParent);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7100
     * @tc.name testUint8ArrayFind071
     * @tc.desc Verify ArrayBuffer.isView returns true for Uint8Array after findIndex
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v > 0);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7200
     * @tc.name testUint8ArrayFind072
     * @tc.desc Verify findIndex does not change arr length on non-zero offset view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 3, 5);
      let lenBefore: int = arr.length;
      arr.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 0);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7300
     * @tc.name testUint8ArrayFind073
     * @tc.desc Verify find returns correct value consistent with arr[i] access
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 40;
      arr[1] = 80;
      arr[2] = 120;
      arr[3] = 160;
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => v > 100);
      expect(result).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7400
     * @tc.name testUint8ArrayFind074
     * @tc.desc Verify forEach on offset view iterates only view length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf, 1, 3);
      arr[0] = 50;
      arr[1] = 100;
      arr[2] = 150;
      let count: int = 0;
      arr.forEach((v: number, i: int, a: Uint8Array): void => {
        count = count + 1;
        return;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7500
     * @tc.name testUint8ArrayFind075
     * @tc.desc Verify findIndex on one view does not affect other views sharing same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let firstView: Uint8Array = new Uint8Array(buf);
      let secondView: Uint8Array = new Uint8Array(buf);
      firstView[0] = 33;
      firstView[1] = 66;
      firstView[2] = 99;
      firstView[3] = 132;
      let secondViewBefore: number = secondView[2];
      firstView.findIndex((v: number, i: int, a: Uint8Array): boolean => v === 99);
      expect(secondView[2]).assertEqual(secondViewBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7600
     * @tc.name testUint8ArrayFind076
     * @tc.desc Verify find on subview with non-zero offset returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 2;
      arr[1] = 4;
      arr[2] = 6;
      arr[3] = 8;
      arr[4] = 10;
      let sub: Uint8Array = new Uint8Array(buf, 1, 3);
      let result: number | undefined = sub.find((v: number, i: int, a: Uint8Array): boolean => v === 8);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7700
     * @tc.name testUint8ArrayFind077
     * @tc.desc Verify find on independent copy via new Uint8Array returns correct value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 3, 5, 7, 9]);
      let sliced: Uint8Array = new Uint8Array([arr[1], arr[2], arr[3]]);
      let result: number | undefined = sliced.find((v: number, i: int, a: Uint8Array): boolean => v === 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND02_7800
     * @tc.name testUint8ArrayFind078
     * @tc.desc Verify find on zero-length subview returns undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFind078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Uint8Array = new Uint8Array(buf, 2, 0);
      let result: number | undefined = arr.find((v: number, i: int, a: Uint8Array): boolean => true);
      expect(result).assertUndefined();
    });
  });
}