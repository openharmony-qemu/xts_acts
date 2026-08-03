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

export default function uint16ArrayWithPart1Test(): void {
  describe('Uint16ArrayWithPart1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0100
     * @tc.name testUint16ArrayWithPart1001
      * @tc.desc Replaces the middle element of a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1017, 2019, 3023);
      const val: int = 99;
      const result = arr.with(1, val);
      expect(result[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0200
     * @tc.name testUint16ArrayWithPart1002
      * @tc.desc Replaces the first element of a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1034, 2038, 3046);
      const val: int = 5;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0300
     * @tc.name testUint16ArrayWithPart1003
      * @tc.desc Replaces the last element of a three-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1051, 2057, 3069);
      const val: int = 9;
      const result = arr.with(2, val);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0400
     * @tc.name testUint16ArrayWithPart1004
      * @tc.desc Replaces the sole element of a single-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(100);
      const val: int = 200;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0500
     * @tc.name testUint16ArrayWithPart1005
      * @tc.desc Replaces the fifth element at the array boundary.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(11, 22, 33, 44, 55);
      const val: int = 255;
      const result = arr.with(4, val);
      expect(result[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0600
     * @tc.name testUint16ArrayWithPart1006
      * @tc.desc Replaces an interior element of a five-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(6, 12, 18, 24, 30);
      const val: int = 128;
      const result = arr.with(3, val);
      expect(result[3]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0700
     * @tc.name testUint16ArrayWithPart1007
      * @tc.desc Verifies Uint16Array.with replaces the last element for index minus one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1068, 2076, 3092);
      const val: int = 99;
      const result = arr.with(-1, val);
      expect(result[0]).assertEqual(1068);
      expect(result[1]).assertEqual(2076);
      expect(result[2]).assertEqual(val);
      expect(arr[2]).assertEqual(3092);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0800
     * @tc.name testUint16ArrayWithPart1008
      * @tc.desc Verifies Uint16Array.with replaces the first element for index equal to negative array length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 48, 96);
      const val: int = 76;
      const result = arr.with(-3, val);
      expect(result[0]).assertEqual(val);
      expect(result[1]).assertEqual(48);
      expect(result[2]).assertEqual(96);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_0900
     * @tc.name testUint16ArrayWithPart1009
      * @tc.desc Rejects an index below negative array length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1085, 2095, 3115);
      const val: int = 99;
      try {
        arr.with(-4, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1000
     * @tc.name testUint16ArrayWithPart1010
      * @tc.desc Rejects a far negative index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1102, 2114, 3138);
      const val: int = 99;
      try {
        arr.with(-1000, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1100
     * @tc.name testUint16ArrayWithPart1011
      * @tc.desc Rejects an index equal to array length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1119, 2133, 3161);
      const val: int = 99;
      try {
        arr.with(3, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1200
     * @tc.name testUint16ArrayWithPart1012
      * @tc.desc Rejects an index one past array length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1136, 2152, 3184);
      const val: int = 99;
      try {
        arr.with(4, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1300
     * @tc.name testUint16ArrayWithPart1013
      * @tc.desc Rejects a far positive index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1153, 2171, 3207);
      const val: int = 99;
      try {
        arr.with(100000, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1400
     * @tc.name testUint16ArrayWithPart1014
      * @tc.desc Rejects index zero on an empty array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array();
      const val: int = 99;
      try {
        arr.with(0, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1500
     * @tc.name testUint16ArrayWithPart1015
      * @tc.desc Stores zero at the first array position.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1170, 2190, 3230);
      const val: int = 0;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1600
     * @tc.name testUint16ArrayWithPart1016
      * @tc.desc Stores one at the first array position.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1187, 2209, 3253);
      const val: int = 1;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1700
     * @tc.name testUint16ArrayWithPart1017
      * @tc.desc Stores the byte-range value 127.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1204, 2228, 3276);
      const val: int = 127;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1800
     * @tc.name testUint16ArrayWithPart1018
      * @tc.desc Stores the byte-range value 128.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1221, 2247, 3299);
      const val: int = 128;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_1900
     * @tc.name testUint16ArrayWithPart1019
      * @tc.desc Stores the byte-range value 255.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1238, 2266, 3322);
      const val: int = 255;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2000
     * @tc.name testUint16ArrayWithPart1020
      * @tc.desc Stores hexadecimal 0x0F as decimal 15.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1255, 2285, 3345);
      const val: int = 0x0F;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2100
     * @tc.name testUint16ArrayWithPart1021
      * @tc.desc Stores hexadecimal 0xFF as decimal 255.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1272, 2304, 3368);
      const val: int = 0xFF;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2200
     * @tc.name testUint16ArrayWithPart1022
      * @tc.desc Stores binary 0b00001111 as decimal 15.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1289, 2323, 3391);
      const val: int = 0b00001111;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2300
     * @tc.name testUint16ArrayWithPart1023
      * @tc.desc Stores binary 0b11111111 as decimal 255.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1306, 2342, 3414);
      const val: int = 0b11111111;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2400
     * @tc.name testUint16ArrayWithPart1024
      * @tc.desc Stores octal 0o377 as decimal 255.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1323, 2361, 3437);
      const val: int = 0o377;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2500
     * @tc.name testUint16ArrayWithPart1025
      * @tc.desc Preserves the maximum Uint16 value 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1340, 2380, 3460);
      const val: int = 65535;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2600
     * @tc.name testUint16ArrayWithPart1026
      * @tc.desc Wraps 65536 to zero in Uint16 storage.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1357, 2399, 3483);
      const val: int = 65536;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2700
     * @tc.name testUint16ArrayWithPart1027
      * @tc.desc Wraps minus one to the maximum Uint16 value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1374, 2418, 3506);
      const val: int = -1;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2800
     * @tc.name testUint16ArrayWithPart1028
      * @tc.desc Wraps negative 65536 to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1391, 2437, 3529);
      const val: int = -65536;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_2900
     * @tc.name testUint16ArrayWithPart1029
      * @tc.desc Wraps hexadecimal 0x10000 to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1408, 2456, 3552);
      const val: int = 0x10000;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3000
     * @tc.name testUint16ArrayWithPart1030
      * @tc.desc Preserves hexadecimal 0xFFFF as 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1425, 2475, 3575);
      const val: int = 0xFFFF;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3100
     * @tc.name testUint16ArrayWithPart1031
      * @tc.desc Wraps hexadecimal 0x1FFFF to 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1442, 2494, 3598);
      const val: int = 0x1FFFF;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3200
     * @tc.name testUint16ArrayWithPart1032
      * @tc.desc Wraps decimal 131071 to 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1459, 2513, 3621);
      const val: int = 131071;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3300
     * @tc.name testUint16ArrayWithPart1033
      * @tc.desc Converts negative 32768 to 32768.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1476, 2532, 3644);
      const val: int = -32768;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3400
     * @tc.name testUint16ArrayWithPart1034
      * @tc.desc Wraps 65535 plus 65536 to 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1493, 2551, 3667);
      const val: int = 65535 + 65536;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3500
     * @tc.name testUint16ArrayWithPart1035
      * @tc.desc Wraps two Uint16 ranges to zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1510, 2570, 3690);
      const val: int = 2 * 65536;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3600
     * @tc.name testUint16ArrayWithPart1036
      * @tc.desc Wraps minus two to 65534.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1527, 2589, 3713);
      const val: int = -2;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3700
     * @tc.name testUint16ArrayWithPart1037
      * @tc.desc Wraps 65537 to one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1544, 2608, 3736);
      const val: int = 65537;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3800
     * @tc.name testUint16ArrayWithPart1038
      * @tc.desc Wraps negative 65535 to one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1561, 2627, 3759);
      const val: int = -65535;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_3900
     * @tc.name testUint16ArrayWithPart1039
      * @tc.desc Stores hexadecimal zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1578, 2646, 3782);
      const val: int = 0x00;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4000
     * @tc.name testUint16ArrayWithPart1040
      * @tc.desc Stores binary zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1595, 2665, 3805);
      const val: int = 0b0;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4100
     * @tc.name testUint16ArrayWithPart1041
      * @tc.desc Stores the all-ones 16-bit binary literal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1612, 2684, 3828);
      const val: int = 0b1111111111111111;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4200
     * @tc.name testUint16ArrayWithPart1042
      * @tc.desc Stores the maximum 16-bit octal literal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1629, 2703, 3851);
      const val: int = 0o177777;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4300
     * @tc.name testUint16ArrayWithPart1043
      * @tc.desc Stores octal zero.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1646, 2722, 3874);
      const val: int = 0o0;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4400
     * @tc.name testUint16ArrayWithPart1044
      * @tc.desc Stores hexadecimal 0x8000 as 32768.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1663, 2741, 3897);
      const val: int = 0x8000;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4500
     * @tc.name testUint16ArrayWithPart1045
      * @tc.desc Stores octal 0o100000 as 32768.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1680, 2760, 3920);
      const val: int = 0o100000;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4600
     * @tc.name testUint16ArrayWithPart1046
      * @tc.desc Stores hexadecimal 0xABCD as 43981.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1697, 2779, 3943);
      const val: int = 0xABCD;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4700
     * @tc.name testUint16ArrayWithPart1047
      * @tc.desc Stores hexadecimal 0x5555 as 21845.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1714, 2798, 3966);
      const val: int = 0x5555;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(21845);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4800
     * @tc.name testUint16ArrayWithPart1048
      * @tc.desc Replaces an element without changing the source array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1731, 2817, 3989);
      const val: int = 99;
      const result = arr.with(1, val);
      expect(result[1]).assertEqual(val);
      expect(arr[1]).assertEqual(2817);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_4900
     * @tc.name testUint16ArrayWithPart1049
      * @tc.desc Returns an equal-length array with an independent buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1748, 2836, 4012);
      const val: int = 99;
      const result = arr.with(1, val);
      expect(result.length).assertEqual(arr.length);
      expect(result.join(',')).assertEqual('1748,99,4012');
      expect(result).not().assertEqual(arr);
      expect(result.buffer).not().assertEqual(arr.buffer);
      expect(arr.join(',')).assertEqual('1748,2836,4012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5000
     * @tc.name testUint16ArrayWithPart1050
      * @tc.desc Returns a distinct array object after replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(49152, 7, 32001, 88);
      const val: int = 605;
      const result = arr.with(2, val);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5100
     * @tc.name testUint16ArrayWithPart1051
      * @tc.desc Allocates a result buffer distinct from the source buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(901, 65534, 42, 17000, 3);
      const val: int = 808;
      const result = arr.with(3, val);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5200
     * @tc.name testUint16ArrayWithPart1052
      * @tc.desc Replaces the final element with 77.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1765, 2855, 4035);
      const val: int = 77;
      const result = arr.with(2, val);
      expect(result[2]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5300
     * @tc.name testUint16ArrayWithPart1053
      * @tc.desc Preserves elements adjacent to the replaced middle element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1782, 2874, 4058);
      const val: int = 99;
      const result = arr.with(1, val);
      expect(result[0]).assertEqual(1782);
      expect(result[2]).assertEqual(4058);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5400
     * @tc.name testUint16ArrayWithPart1054
      * @tc.desc Replaces the first element while retaining all source values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(60001, 14, 4095, 222);
      const val: int = 50000;
      const result = arr.with(0, val);
      expect(result.join(',')).assertEqual('50000,14,4095,222');
      expect(arr[0]).assertEqual(60001);
      expect(arr[1]).assertEqual(14);
      expect(arr[2]).assertEqual(4095);
      expect(arr[3]).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5500
     * @tc.name testUint16ArrayWithPart1055
      * @tc.desc Preserves length when replacing the fourth element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(17, 60999, 404, 2, 33008, 71);
      const val: int = 12345;
      const result = arr.with(4, val);
      expect(result.length).assertEqual(6);
      expect(result[4]).assertEqual(12345);
      expect(arr.join(',')).assertEqual('17,60999,404,2,33008,71');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5600
     * @tc.name testUint16ArrayWithPart1056
      * @tc.desc Preserves trailing elements after first-element replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const val: int = 200;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(200);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5700
     * @tc.name testUint16ArrayWithPart1057
      * @tc.desc Preserves leading elements after last-element replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const val: int = 200;
      const result = arr.with(4, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5800
     * @tc.name testUint16ArrayWithPart1058
      * @tc.desc Preserves both sides after middle-element replacement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const val: int = 200;
      const result = arr.with(2, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(200);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_5900
     * @tc.name testUint16ArrayWithPart1059
      * @tc.desc Replaces index one with the supplied variable value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1799, 2893, 4081);
      const val: int = 99;
      const result = arr.with(1, val);
      expect(result[1]).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6000
     * @tc.name testUint16ArrayWithPart1060
      * @tc.desc Verifies Uint16Array.with replaces the last element for minus one in a five-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const val: int = 99;
      const result = arr.with(-1, val);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(result[3]).assertEqual(40);
      expect(result[4]).assertEqual(val);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6100
     * @tc.name testUint16ArrayWithPart1061
      * @tc.desc Rejects index five for a five-element array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const val: int = 99;
      try {
        arr.with(5, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6200
     * @tc.name testUint16ArrayWithPart1062
      * @tc.desc Rejects an index ten positions beyond the array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const val: int = 99;
      try {
        arr.with(15, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6300
     * @tc.name testUint16ArrayWithPart1063
      * @tc.desc Rejects the maximum signed 32-bit index.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1816, 2912, 4104);
      const val: int = 99;
      try {
        arr.with(0x7FFFFFFF, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6400
     * @tc.name testUint16ArrayWithPart1064
       * @tc.desc Rejects index minus five below the array range.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1833, 2931, 4127);
      const val: int = 99;
      try {
        arr.with(-5, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6500
     * @tc.name testUint16ArrayWithPart1065
      * @tc.desc Replaces the first element with maximum Uint16 value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1850, 2950, 4150);
      const val: int = 65535;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(2950);
      expect(result[2]).assertEqual(4150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6600
     * @tc.name testUint16ArrayWithPart1066
      * @tc.desc Wraps 65536 to zero at the final element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1867, 2969, 4173);
      const val: int = 65536;
      const result = arr.with(2, val);
      expect(result[0]).assertEqual(1867);
      expect(result[1]).assertEqual(2969);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6700
     * @tc.name testUint16ArrayWithPart1067
      * @tc.desc Wraps minus one at the first element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1884, 2988, 4196);
      const val: int = -1;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(2988);
      expect(result[2]).assertEqual(4196);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6800
     * @tc.name testUint16ArrayWithPart1068
      * @tc.desc Stores 0xFFFF at the middle element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1901, 3007, 4219);
      const val: int = 0xFFFF;
      const result = arr.with(1, val);
      expect(result[0]).assertEqual(1901);
      expect(result[1]).assertEqual(65535);
      expect(result[2]).assertEqual(4219);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_6900
     * @tc.name testUint16ArrayWithPart1069
      * @tc.desc Wraps 0x10000 to zero at the middle element.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1918, 3026, 4242);
      const val: int = 0x10000;
      const result = arr.with(1, val);
      expect(result[0]).assertEqual(1918);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(4242);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7000
     * @tc.name testUint16ArrayWithPart1070
      * @tc.desc Creates independent results for separate replacements.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1935, 3045, 4265);
      const v1: int = 100;
      const v2: int = 200;
      const r1 = arr.with(0, v1);
      const r2 = arr.with(2, v2);
      expect(r1[0]).assertEqual(100);
      expect(r2[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7100
     * @tc.name testUint16ArrayWithPart1071
      * @tc.desc Supports chained replacements on successive result arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1952, 3064, 4288);
      const v1: int = 100;
      const v2: int = 200;
      const result = arr.with(0, v1).with(1, v2);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(4288);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7200
     * @tc.name testUint16ArrayWithPart1072
      * @tc.desc Keeps independent results from the same source array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1969, 3083, 4311);
      const v1: int = 100;
      const v2: int = 200;
      const r1 = arr.with(0, v1);
      const r2 = arr.with(0, v2);
      expect(r1[0]).assertEqual(100);
      expect(r2[0]).assertEqual(200);
      expect(arr[0]).assertEqual(1969);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7300
     * @tc.name testUint16ArrayWithPart1073
      * @tc.desc Replaces one element in an array created with of.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(5, 10, 15, 20);
      const val: int = 50;
      const result = arr.with(2, val);
      expect(result[2]).assertEqual(50);
      expect(result[0]).assertEqual(5);
      expect(result[3]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7400
     * @tc.name testUint16ArrayWithPart1074
      * @tc.desc Replaces an element after constructing from FixedArray.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const arr = Uint16Array.from(source);
      const val: int = 99;
      const result = arr.with(1, val);
      expect(result[1]).assertEqual(99);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7500
     * @tc.name testUint16ArrayWithPart1075
      * @tc.desc Retains default zeros in a length-constructed array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      const val: int = 55;
      const result = arr.with(3, val);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7600
     * @tc.name testUint16ArrayWithPart1076
      * @tc.desc Preserves the copied array when replacing its result.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint16Array.of(1, 2, 3);
      const arr = new Uint16Array(src);
      const val: int = 100;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(100);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7700
     * @tc.name testUint16ArrayWithPart1077
      * @tc.desc Replaces each valid index in separate result arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1, 2, 3);
      const r0 = arr.with(0, 10);
      const r1 = arr.with(1, 20);
      const r2 = arr.with(2, 30);
      expect(r0[0]).assertEqual(10);
      expect(r1[1]).assertEqual(20);
      expect(r2[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7800
     * @tc.name testUint16ArrayWithPart1078
      * @tc.desc Stores 0x7FFF as the positive 16-bit midpoint.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0, 0);
      const val: int = 0x7FFF;
      const result = arr.with(1, val);
      expect(result[1]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_7900
     * @tc.name testUint16ArrayWithPart1079
      * @tc.desc Stores 0x8000 as the high-bit Uint16 value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(0, 0, 0);
      const val: int = 0x8000;
      const result = arr.with(1, val);
      expect(result[1]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8000
     * @tc.name testUint16ArrayWithPart1080
      * @tc.desc Replaces an element in a five-element Uint16 array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(50001, 6, 712, 40960, 93);
      const val: int = 1205;
      const result = arr.with(1, val);
      expect(result.join(',')).assertEqual('50001,1205,712,40960,93');
      expect(result).not().assertEqual(arr);
      expect(arr.join(',')).assertEqual('50001,6,712,40960,93');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8100
     * @tc.name testUint16ArrayWithPart1081
      * @tc.desc Wraps negative 65537 to 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(1986, 3102, 4334);
      const val: int = -65537;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8200
     * @tc.name testUint16ArrayWithPart1082
      * @tc.desc Replaces index zero with 65534 in an isolated copy.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2003, 3121, 4357);
      const val: int = 65534;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65534);
      expect(result[1]).assertEqual(3121);
      expect(result[2]).assertEqual(4357);
      expect(result.length).assertEqual(arr.length);
      expect(result).not().assertEqual(arr);
      expect(result.buffer).not().assertEqual(arr.buffer);
      expect(arr.join(',')).assertEqual('2003,3121,4357');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8300
     * @tc.name testUint16ArrayWithPart1083
      * @tc.desc Wraps 65538 to two.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2020, 3140, 4380);
      const val: int = 65538;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8400
     * @tc.name testUint16ArrayWithPart1084
      * @tc.desc Wraps minus three to 65533.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2037, 3159, 4403);
      const val: int = -3;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65533);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8500
     * @tc.name testUint16ArrayWithPart1085
      * @tc.desc Wraps hexadecimal 0x10001 to one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2054, 3178, 4426);
      const val: int = 0x10001;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8600
     * @tc.name testUint16ArrayWithPart1086
      * @tc.desc Wraps hexadecimal 0x2FFFF to 65535.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2071, 3197, 4449);
      const val: int = 0x2FFFF;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8700
     * @tc.name testUint16ArrayWithPart1087
      * @tc.desc Wraps 0x10000 plus one to one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2088, 3216, 4472);
      const val: int = 0x10000 + 1;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_WITH_PART1_8800
     * @tc.name testUint16ArrayWithPart1088
      * @tc.desc Wraps negative 65534 to two.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayWithPart1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of(2105, 3235, 4495);
      const val: int = -65534;
      const result = arr.with(0, val);
      expect(result[0]).assertEqual(2);
    });

  });
}
