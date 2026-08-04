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

export default function Uint8ArrayFindLast02Test(): void {
  describe('Uint8ArrayFindLast02Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0100
     * @tc.name testUint8ArrayFindLast001
     * @tc.desc Verify findLast returns number type when matching element value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2);
      let result: number = arr.findLast((v: number): boolean => { return v === 0; });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0200
     * @tc.name testUint8ArrayFindLast002
     * @tc.desc Verify findLast returns number type when matching element value is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(254, 255);
      let result: number = arr.findLast((v: number): boolean => { return v === 255; });
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0300
     * @tc.name testUint8ArrayFindLast003
     * @tc.desc Verify findLast returns number type when matching with bitwise operation condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(64, 128, 192);
      let result: number = arr.findLast((v: number): boolean => { return (v & 0x40) !== 0; });
      expect(result).assertEqual(192);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0400
     * @tc.name testUint8ArrayFindLast004
     * @tc.desc Verify findLast returns number type when matching based on index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      let result: number = arr.findLast((v: number, i: int): boolean => { return i === 0; });
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0500
     * @tc.name testUint8ArrayFindLast005
     * @tc.desc Verify findLast returns number type when single element array matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(99);
      let result: number = arr.findLast((v: number): boolean => { return v === 99; });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0600
     * @tc.name testUint8ArrayFindLast006
     * @tc.desc Verify findLast returns exact value 77 when matching
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(33, 55, 77);
      let result: number = arr.findLast((v: number): boolean => { return v === 77; });
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0700
     * @tc.name testUint8ArrayFindLast007
     * @tc.desc Verify findLast returns exact value 160 when matching
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(160, 170, 180);
      let result: number = arr.findLast((v: number): boolean => { return v === 160; });
      expect(result).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0800
     * @tc.name testUint8ArrayFindLast008
     * @tc.desc Verify findLast returns exact value 9 when matching
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(9, 19, 29);
      let result: number = arr.findLast((v: number): boolean => { return v === 9; });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_0900
     * @tc.name testUint8ArrayFindLast009
     * @tc.desc Verify findLast returns last matching value 220 when v >= 210
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(200, 210, 220);
      let result: number = arr.findLast((v: number): boolean => { return v >= 210; });
      expect(result).assertEqual(220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1000
     * @tc.name testUint8ArrayFindLast010
     * @tc.desc Verify findLast returns last matching value 33 when v <= 33
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(22, 33, 44);
      let result: number = arr.findLast((v: number): boolean => { return v <= 33; });
      expect(result).assertEqual(33);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1100
     * @tc.name testUint8ArrayFindLast011
     * @tc.desc Verify findLast returns 90 when v > 80 and v < 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(70, 90, 110);
      let result: number = arr.findLast((v: number): boolean => { return v > 80 && v < 100; });
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1200
     * @tc.name testUint8ArrayFindLast012
     * @tc.desc Verify findLast returns last matching value 14 when divisible by 7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(6, 7, 14);
      let result: number = arr.findLast((v: number): boolean => { return v % 7 === 0; });
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1300
     * @tc.name testUint8ArrayFindLast013
     * @tc.desc Verify findLast returns last matching value 27 when v % 8 === 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(11, 19, 27);
      let result: number = arr.findLast((v: number): boolean => { return v % 8 === 3; });
      expect(result).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1400
     * @tc.name testUint8ArrayFindLast014
     * @tc.desc Verify findLast returns 150 when v * 3 > 200
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(50, 100, 150);
      let result: number = arr.findLast((v: number): boolean => { return v * 3 > 200; });
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1500
     * @tc.name testUint8ArrayFindLast015
     * @tc.desc Verify findLast returns 200 when v + 30 > 200
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(180, 190, 200);
      let result: number = arr.findLast((v: number): boolean => { return v + 30 > 200; });
      expect(result).assertEqual(200);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1600
     * @tc.name testUint8ArrayFindLast016
     * @tc.desc Verify findLast returns 20 when v - 40 < 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 50);
      let result: number = arr.findLast((v: number): boolean => { return v - 40 < 0; });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1700
     * @tc.name testUint8ArrayFindLast017
     * @tc.desc Verify findLast returns 152 when v > 150
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(150, 151, 152);
      let result: number = arr.findLast((v: number): boolean => { return v > 150; });
      expect(result).assertEqual(152);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1800
     * @tc.name testUint8ArrayFindLast018
     * @tc.desc Verify findLast returns 148 when v < 150 (tail-to-head traversal)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(150, 149, 148);
      let result: number = arr.findLast((v: number): boolean => { return v < 150; });
      expect(result).assertEqual(148);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_1900
     * @tc.name testUint8ArrayFindLast019
     * @tc.desc Verify findLast returns 240 when matching binary literal 0b11110000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x0F, 0xF0, 0xFF);
      let result: number = arr.findLast((v: number): boolean => { return v === 0b11110000; });
      expect(result).assertEqual(240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2000
     * @tc.name testUint8ArrayFindLast020
     * @tc.desc Verify findLast returns 15 when matching binary literal 0b00001111
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x0F, 0xF0, 0xFF);
      let result: number = arr.findLast((v: number): boolean => { return v === 0b00001111; });
      expect(result).assertEqual(15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2100
     * @tc.name testUint8ArrayFindLast021
     * @tc.desc Verify findLast returns 63 when matching octal literal 0o77
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x3F, 0x7F, 0xFF);
      let result: number = arr.findLast((v: number): boolean => { return v === 0o77; });
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2200
     * @tc.name testUint8ArrayFindLast022
     * @tc.desc Verify findLast returns 170 when matching hexadecimal literal 0xAA
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0xAA, 0xBB, 0xCC);
      let result: number = arr.findLast((v: number): boolean => { return v === 0xAA; });
      expect(result).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2300
     * @tc.name testUint8ArrayFindLast023
     * @tc.desc Verify findLast returns 128 when value is between 0x80 and 0xBF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(64, 128, 192);
      let result: number = arr.findLast((v: number): boolean => { return v >= 0x80 && v <= 0xBF; });
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2400
     * @tc.name testUint8ArrayFindLast024
     * @tc.desc Verify findLast returns 33 when v > 0 and divisible by 11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(11, 22, 33);
      let result: number = arr.findLast((v: number): boolean => { return v > 0 && v % 11 === 0; });
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2500
     * @tc.name testUint8ArrayFindLast025
     * @tc.desc Verify findLast returns 204 when matching binary literal 0b11001100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x33, 0x66, 0xCC);
      let result: number = arr.findLast((v: number): boolean => { return v === 0b11001100; });
      expect(result).assertEqual(204);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2600
     * @tc.name testUint8ArrayFindLast026
     * @tc.desc Verify findLast returns exact value 222 when matching
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(111, 222);
      let result: number = arr.findLast((v: number): boolean => { return v === 222; });
      expect(result).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2700
     * @tc.name testUint8ArrayFindLast027
     * @tc.desc Verify findLast returns 32 when v < 128 (last element match)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(128, 64, 32);
      let result: number = arr.findLast((v: number): boolean => { return v < 128; });
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2800
     * @tc.name testUint8ArrayFindLast028
     * @tc.desc Verify findLast returns 90 when matching hexadecimal 0x5A
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x3C, 0x5A, 0x78);
      let result: number = arr.findLast((v: number): boolean => { return v === 0x5A; });
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_2900
     * @tc.name testUint8ArrayFindLast029
     * @tc.desc Verify findLast returns last matching value when even index and v > 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number = arr.findLast((v: number, i: int): boolean => { return i % 2 === 0 && v > 15; });
      expect(result).assertEqual(50);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3000
     * @tc.name testUint8ArrayFindLast030
     * @tc.desc Verify array length remains unchanged after findLast with match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let lenBefore: int = arr.length;
      arr.findLast((v: number): boolean => { return v === 40; });
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3100
     * @tc.name testUint8ArrayFindLast031
     * @tc.desc Verify subarray length remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let sub: Uint8Array = arr.subarray(1, 4);
      let lenBefore: int = sub.length;
      sub.findLast((v: number): boolean => { return v > 2; });
      expect(sub.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3200
     * @tc.name testUint8ArrayFindLast032
     * @tc.desc Verify byteLength remains unchanged after findLast with match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let blBefore: int = arr.byteLength;
      arr.findLast((v: number): boolean => { return v > 3; });
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3300
     * @tc.name testUint8ArrayFindLast033
     * @tc.desc Verify buffer.byteLength remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let bufBlBefore: int = arr.buffer.byteLength;
      arr.findLast((v: number): boolean => { return v > 1; });
      expect(arr.buffer.byteLength).assertEqual(bufBlBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3400
     * @tc.name testUint8ArrayFindLast034
     * @tc.desc Verify BYTES_PER_ELEMENT remains 1 after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.findLast((v: number): boolean => { return v > 1; });
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3500
     * @tc.name testUint8ArrayFindLast035
     * @tc.desc Verify byteOffset remains unchanged after findLast (no offset view)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let offsetBefore: int = arr.byteOffset;
      arr.findLast((v: number): boolean => { return v > 1; });
      expect(arr.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3600
     * @tc.name testUint8ArrayFindLast036
     * @tc.desc Verify byteOffset remains unchanged after findLast (with offset view)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 2, 3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      let offsetBefore: int = arr.byteOffset;
      arr.findLast((v: number): boolean => { return v > 15; });
      expect(arr.byteOffset).assertEqual(offsetBefore);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3700
     * @tc.name testUint8ArrayFindLast037
     * @tc.desc Verify element at index 0 remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(7, 14, 21);
      arr.findLast((v: number): boolean => { return v > 10; });
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3800
     * @tc.name testUint8ArrayFindLast038
     * @tc.desc Verify element at index 2 remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      arr.findLast((v: number): boolean => { return v > 12; });
      expect(arr[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_3900
     * @tc.name testUint8ArrayFindLast039
     * @tc.desc Verify last element remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(3, 6, 9, 12);
      arr.findLast((v: number): boolean => { return v > 5; });
      expect(arr[3]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4000
     * @tc.name testUint8ArrayFindLast040
     * @tc.desc Verify sum of all elements remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(2, 4, 6, 8);
      let sumBefore: number = 0;
      for (let i: int = 0; i < arr.length; i++) {
        sumBefore = sumBefore + arr[i];
      }
      arr.findLast((v: number): boolean => { return v > 5; });
      let sumAfter: number = 0;
      for (let i: int = 0; i < arr.length; i++) {
        sumAfter = sumAfter + arr[i];
      }
      expect(sumAfter).assertEqual(sumBefore);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4100
     * @tc.name testUint8ArrayFindLast041
     * @tc.desc Verify single element array element remains unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(77);
      arr.findLast((v: number): boolean => { return v === 77; });
      expect(arr[0]).assertEqual(77);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4200
     * @tc.name testUint8ArrayFindLast042
     * @tc.desc Verify findLast returns correct value on subarray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let sub: Uint8Array = arr.subarray(1, 4);
      let result: number = sub.findLast((v: number): boolean => { return v > 25; });
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4300
     * @tc.name testUint8ArrayFindLast043
     * @tc.desc Verify subarray elements remain unchanged after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let sub: Uint8Array = arr.subarray(1, 4);
      sub.findLast((v: number): boolean => { return v > 25; });
      expect(sub[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4400
     * @tc.name testUint8ArrayFindLast044
     * @tc.desc Verify original array elements remain unchanged after subarray findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let sub: Uint8Array = arr.subarray(1, 4);
      sub.findLast((v: number): boolean => { return v > 25; });
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4500
     * @tc.name testUint8ArrayFindLast045
     * @tc.desc Verify two subarrays from same buffer do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let sub1: Uint8Array = arr.subarray(0, 3);
      let sub2: Uint8Array = arr.subarray(2, 5);
      sub1.findLast((v: number): boolean => { return v > 1; });
      expect(sub2[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4600
     * @tc.name testUint8ArrayFindLast046
     * @tc.desc Verify nested subarray findLast does not affect parent subarray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      let sub1: Uint8Array = arr.subarray(1, 5);
      let sub2: Uint8Array = sub1.subarray(1, 3);
      sub2.findLast((v: number): boolean => { return v > 3; });
      expect(sub1[2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4700
     * @tc.name testUint8ArrayFindLast047
     * @tc.desc Verify findLast returns correct value on Uint8Array with byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint8Array = new Uint8Array(buf, 3, 3);
      arr[0] = 77;
      arr[1] = 160;
      arr[2] = 9;
      let result: number = arr.findLast((v: number): boolean => { return v === 9; });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4800
     * @tc.name testUint8ArrayFindLast048
     * @tc.desc Verify two views from same buffer do not affect each other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let arr1: Uint8Array = new Uint8Array(buf);
      arr1[0] = 10;
      arr1[1] = 20;
      arr1[2] = 30;
      arr1[3] = 40;
      arr1[4] = 50;
      let arr2: Uint8Array = new Uint8Array(buf);
      arr1.findLast((v: number): boolean => { return v > 30; });
      expect(arr2[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_4900
     * @tc.name testUint8ArrayFindLast049
     * @tc.desc Verify findLast returns correct value on two-level nested subarray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      let sub1: Uint8Array = arr.subarray(0, 5);
      let sub2: Uint8Array = sub1.subarray(2, 4);
      let result: number = sub2.findLast((v: number): boolean => { return v > 3; });
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5000
     * @tc.name testUint8ArrayFindLast050
     * @tc.desc Verify buffer content remains unchanged after findLast (verified via new view)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr.findLast((v: number): boolean => { return v > 25; });
      let checkArr: Uint8Array = new Uint8Array(buf);
      expect(checkArr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5100
     * @tc.name testUint8ArrayFindLast051
     * @tc.desc Verify ArrayBuffer.isView remains true after findLast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.findLast((v: number): boolean => { return v > 1; });
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5200
     * @tc.name testUint8ArrayFindLast052
     * @tc.desc Verify 3 consecutive findLast calls return consistent values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(7, 14, 21, 28);
      let r1: number = arr.findLast((v: number): boolean => { return v > 15; });
      let r2: number = arr.findLast((v: number): boolean => { return v > 15; });
      let r3: number = arr.findLast((v: number): boolean => { return v > 15; });
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5300
     * @tc.name testUint8ArrayFindLast053
     * @tc.desc Verify toString does not affect subsequent findLast return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15);
      let r1: number = arr.findLast((v: number): boolean => { return v > 8; });
      arr.toString();
      let r2: number = arr.findLast((v: number): boolean => { return v > 8; });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5400
     * @tc.name testUint8ArrayFindLast054
     * @tc.desc Verify valueOf does not affect subsequent findLast return value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(3, 6, 9);
      let r1: number = arr.findLast((v: number): boolean => { return v % 3 === 0; });
      arr.valueOf();
      let r2: number = arr.findLast((v: number): boolean => { return v % 3 === 0; });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5500
     * @tc.name testUint8ArrayFindLast055
     * @tc.desc Verify two independent arrays with same content return same findLast value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Uint8Array = Uint8Array.of(11, 22, 33, 44);
      let arr2: Uint8Array = Uint8Array.of(11, 22, 33, 44);
      let r1: number = arr1.findLast((v: number): boolean => { return v > 30; });
      let r2: number = arr2.findLast((v: number): boolean => { return v > 30; });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5600
     * @tc.name testUint8ArrayFindLast056
     * @tc.desc Verify different predicates return their correct values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let r1: number = arr.findLast((v: number): boolean => { return v > 35; });
      let r2: number = arr.findLast((v: number): boolean => { return v > 25; });
      expect(r1).assertEqual(50);
      expect(r2).assertEqual(50);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5700
     * @tc.name testUint8ArrayFindLast057
     * @tc.desc Verify findLast return value remains unchanged after traversing array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      let r1: number = arr.findLast((v: number): boolean => { return v > 8; });
      for (let i: int = 0; i < arr.length; i++) {
        let x: number = arr[i];
      }
      let r2: number = arr.findLast((v: number): boolean => { return v > 8; });
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5800
     * @tc.name testUint8ArrayFindLast058
     * @tc.desc Verify findLast return value is within array range (<=255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(50, 100, 150, 200, 250);
      let result: number = arr.findLast((v: number): boolean => { return v > 100; });
      expect(result <= 255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_5900
     * @tc.name testUint8ArrayFindLast059
     * @tc.desc Verify findLast return value is within array range (>=0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      let result: number = arr.findLast((v: number): boolean => { return v > 25; });
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_LAST02_6000
     * @tc.name testUint8ArrayFindLast060
     * @tc.desc Verify findLast return value matches manual tail-to-head traversal result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(3, 6, 9, 12, 15);
      let result: number = arr.findLast((v: number): boolean => { return v > 10; });
      let manual: number = 0;
      for (let i: int = arr.length - 1; i >= 0; i--) {
        if (arr[i] > 10) {
          manual = arr[i];
          break;
        }
      }
      expect(result).assertEqual(manual);
    });
  });
}