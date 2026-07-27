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

export default function typedUArraysOfTest03(): void {
  describe('TypedUArraysOfTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0010
     * @tc.name testTypedUArraysOfPart202_001
     * @tc.desc Verify Uint8Array.of reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      result.reverse();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0020
     * @tc.name testTypedUArraysOfPart202_002
     * @tc.desc Verify Uint8Array.of map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const mapped = result.map((x) => x * 2);
      const val2 = mapped[0];
      expect(val2).assertEqual(2);
      const val3 = mapped[2];
      expect(val3).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0030
     * @tc.name testTypedUArraysOfPart202_003
     * @tc.desc Verify Uint8Array.of filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const filtered = result.filter((x) => x > 2);
      expect(filtered.length).assertEqual(3);
      const val4 = filtered[0];
      expect(val4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0040
     * @tc.name testTypedUArraysOfPart202_004
     * @tc.desc Verify Uint8Array.of every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const allPositive = result.every((x) => x >= 1);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0050
     * @tc.name testTypedUArraysOfPart202_005
     * @tc.desc Verify Uint8Array.of some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasThree = result.some((x) => x === 3);
      expect(hasThree).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0060
     * @tc.name testTypedUArraysOfPart202_006
     * @tc.desc Verify Uint8Array.of find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const found = result.find((x) => x > 3);
      expect(found).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0070
     * @tc.name testTypedUArraysOfPart202_007
     * @tc.desc Verify Uint8Array.of indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const idx = result.indexOf(3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0080
     * @tc.name testTypedUArraysOfPart202_008
     * @tc.desc Verify Uint8Array.of includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasTwo = result.includes(2);
      expect(hasTwo).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0090
     * @tc.name testTypedUArraysOfPart202_009
     * @tc.desc Verify Uint8Array.of reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const sum = result.reduce((a, b, c, d) => a + b);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0100
     * @tc.name testTypedUArraysOfPart202_010
     * @tc.desc Verify Uint16Array.of join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(10, 20, 30);
      const joined = result.join(',');
      expect(joined).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0110
     * @tc.name testTypedUArraysOfPart202_011
     * @tc.desc Verify Uint32Array.of toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(100, 200, 300);
      const str = result.toString();
      expect(str).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0120
     * @tc.name testTypedUArraysOfPart202_012
     * @tc.desc Verify BigInt64Array.of join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const joined = result.join(',');
      expect(joined).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0130
     * @tc.name testTypedUArraysOfPart202_013
     * @tc.desc Verify BigUint64Array.of toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const str = result.toString();
      expect(str).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0140
     * @tc.name testTypedUArraysOfPart202_014
     * @tc.desc Verify of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0150
     * @tc.name testTypedUArraysOfPart202_015
     * @tc.desc Verify of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(42);
      expect(result.length).assertEqual(1);
      const val5 = result[0];
      expect(val5).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0160
     * @tc.name testTypedUArraysOfPart202_016
     * @tc.desc Verify of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 20);
      expect(result.length).assertEqual(2);
      const val6 = result[0];
      expect(val6).assertEqual(10);
      const val7 = result[1];
      expect(val7).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0170
     * @tc.name testTypedUArraysOfPart202_017
     * @tc.desc Verify of 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(result.length).assertEqual(3);
      const val8 = result[0];
      expect(val8).assertEqual(1);
      const val9 = result[2];
      expect(val9).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0180
     * @tc.name testTypedUArraysOfPart202_018
     * @tc.desc Verify of 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4);
      expect(result.length).assertEqual(4);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[3];
      expect(val11).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0190
     * @tc.name testTypedUArraysOfPart202_019
     * @tc.desc Verify of 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(5, 10, 15, 20, 25);
      expect(result.length).assertEqual(5);
      const val12 = result[0];
      expect(val12).assertEqual(5);
      const val13 = result[4];
      expect(val13).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0200
     * @tc.name testTypedUArraysOfPart202_020
     * @tc.desc Verify of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(result.length).assertEqual(10);
      const val14 = result[0];
      expect(val14).assertEqual(1);
      const val15 = result[9];
      expect(val15).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0210
     * @tc.name testTypedUArraysOfPart202_021
     * @tc.desc Verify of 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
      expect(result.length).assertEqual(20);
      const val16 = result[0];
      expect(val16).assertEqual(1);
      const val17 = result[19];
      expect(val17).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0220
     * @tc.name testTypedUArraysOfPart202_022
     * @tc.desc Verify of 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50);
      expect(result.length).assertEqual(50);
      const val18 = result[0];
      expect(val18).assertEqual(1);
      const val19 = result[49];
      expect(val19).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0230
     * @tc.name testTypedUArraysOfPart202_023
     * @tc.desc Verify of 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100);
      expect(result.length).assertEqual(100);
      const val20 = result[0];
      expect(val20).assertEqual(1);
      const val21 = result[99];
      expect(val21).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0240
     * @tc.name testTypedUArraysOfPart202_024
     * @tc.desc Verify Uint8Array.of Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const val22 = result[0];
      expect(val22).assertEqual(1);
      const val23 = result[2];
      expect(val23).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0250
     * @tc.name testTypedUArraysOfPart202_025
     * @tc.desc Verify Uint16Array.of Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(100, 200, 300);
      const val24 = result[0];
      expect(val24).assertEqual(100);
      const val25 = result[2];
      expect(val25).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0260
     * @tc.name testTypedUArraysOfPart202_026
     * @tc.desc Verify Uint32Array.of Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1000, 2000, 3000);
      const val26 = result[0];
      expect(val26).assertEqual(1000);
      const val27 = result[2];
      expect(val27).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0270
     * @tc.name testTypedUArraysOfPart202_027
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const val28 = result[0];
      expect(val28).assertEqual(1n);
      const val29 = result[2];
      expect(val29).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0280
     * @tc.name testTypedUArraysOfPart202_028
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const val30 = result[0];
      expect(val30).assertEqual(1n);
      const val31 = result[2];
      expect(val31).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0290
     * @tc.name testTypedUArraysOfPart202_029
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'), BigInt('-1'), BigInt('2'), BigInt('-2'));
      const val32 = result[2];
      expect(val32).assertEqual(-1n);
      const val33 = result[4];
      expect(val33).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0300
     * @tc.name testTypedUArraysOfPart202_030
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'), BigInt('18446744073709551615'));
      const val34 = result[2];
      expect(val34).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0310
     * @tc.name testTypedUArraysOfPart202_031
     * @tc.desc Verify Uint8Array.of BigInt64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1, 2, 3);
      const r2 = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0320
     * @tc.name testTypedUArraysOfPart202_032
     * @tc.desc Verify Uint32Array.of BigUint64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint32Array.of(1, 2, 3, 4);
      const r2 = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'));
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0330
     * @tc.name testTypedUArraysOfPart202_033
     * @tc.desc Verify Uint8Array.of BigInt64Array.of byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1, 2, 3);
      const r2 = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0340
     * @tc.name testTypedUArraysOfPart202_034
     * @tc.desc Verify Uint16Array.of BigInt64Array.of byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint16Array.of(1, 2, 3);
      const r2 = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.byteLength).assertEqual(6);
      expect(r2.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0350
     * @tc.name testTypedUArraysOfPart202_035
     * @tc.desc Verify Uint32Array.of BigUint64Array.of byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint32Array.of(1, 2, 3);
      const r2 = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.byteLength).assertEqual(12);
      expect(r2.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0360
     * @tc.name testTypedUArraysOfPart202_036
     * @tc.desc Verify Uint8Array.of BigInt64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1);
      const r2 = BigInt64Array.of(BigInt('1'));
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0370
     * @tc.name testTypedUArraysOfPart202_037
     * @tc.desc Verify Uint16Array.of BigUint64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint16Array.of(1);
      const r2 = BigUint64Array.of(BigInt('1'));
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0380
     * @tc.name testTypedUArraysOfPart202_038
     * @tc.desc Verify Uint32Array.of BigInt64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint32Array.of(1);
      const r2 = BigInt64Array.of(BigInt('1'));
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0390
     * @tc.name testTypedUArraysOfPart202_039
     * @tc.desc Verify Uint8Array.of BigUint64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1);
      const r2 = BigUint64Array.of(BigInt('1'));
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0400
     * @tc.name testTypedUArraysOfPart202_040
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0x10, 0x20, 0x30);
      const val35 = result[0];
      expect(val35).assertEqual(16);
      const val36 = result[1];
      expect(val36).assertEqual(32);
      const val37 = result[2];
      expect(val37).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0410
     * @tc.name testTypedUArraysOfPart202_041
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0x100, 0x200, 0x300);
      const val38 = result[0];
      expect(val38).assertEqual(256);
      const val39 = result[1];
      expect(val39).assertEqual(512);
      const val40 = result[2];
      expect(val40).assertEqual(768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0420
     * @tc.name testTypedUArraysOfPart202_042
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0x1000, 0x2000, 0x3000);
      const val41 = result[0];
      expect(val41).assertEqual(4096);
      const val42 = result[1];
      expect(val42).assertEqual(8192);
      const val43 = result[2];
      expect(val43).assertEqual(12288);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0430
     * @tc.name testTypedUArraysOfPart202_043
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('16'), BigInt('32'), BigInt('48'));
      const val44 = result[0];
      expect(val44).assertEqual(16n);
      const val45 = result[1];
      expect(val45).assertEqual(32n);
      const val46 = result[2];
      expect(val46).assertEqual(48n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0440
     * @tc.name testTypedUArraysOfPart202_044
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('16'), BigInt('32'), BigInt('48'));
      const val47 = result[0];
      expect(val47).assertEqual(16n);
      const val48 = result[1];
      expect(val48).assertEqual(32n);
      const val49 = result[2];
      expect(val49).assertEqual(48n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0450
     * @tc.name testTypedUArraysOfPart202_045
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0b10000, 0b100000, 0b1100000);
      const val50 = result[0];
      expect(val50).assertEqual(16);
      const val51 = result[1];
      expect(val51).assertEqual(32);
      const val52 = result[2];
      expect(val52).assertEqual(96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0460
     * @tc.name testTypedUArraysOfPart202_046
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0b100000000, 0b1000000000, 0b11000000000);
      const val53 = result[0];
      expect(val53).assertEqual(256);
      const val54 = result[1];
      expect(val54).assertEqual(512);
      const val55 = result[2];
      expect(val55).assertEqual(1536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0470
     * @tc.name testTypedUArraysOfPart202_047
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0b100000000000, 0b1000000000000, 0b1100000000000);
      const val56 = result[0];
      expect(val56).assertEqual(2048);
      const val57 = result[1];
      expect(val57).assertEqual(4096);
      const val58 = result[2];
      expect(val58).assertEqual(6144);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0480
     * @tc.name testTypedUArraysOfPart202_048
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('16'), BigInt('32'), BigInt('96'));
      const val59 = result[0];
      expect(val59).assertEqual(16n);
      const val60 = result[1];
      expect(val60).assertEqual(32n);
      const val61 = result[2];
      expect(val61).assertEqual(96n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0490
     * @tc.name testTypedUArraysOfPart202_049
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('16'), BigInt('32'), BigInt('96'));
      const val62 = result[0];
      expect(val62).assertEqual(16n);
      const val63 = result[1];
      expect(val63).assertEqual(32n);
      const val64 = result[2];
      expect(val64).assertEqual(96n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0500
     * @tc.name testTypedUArraysOfPart202_050
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1e1, 2e1, 3e1);
      const val65 = result[0];
      expect(val65).assertEqual(10);
      const val66 = result[1];
      expect(val66).assertEqual(20);
      const val67 = result[2];
      expect(val67).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0510
     * @tc.name testTypedUArraysOfPart202_051
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1e2, 2e2, 3e2);
      const val68 = result[0];
      expect(val68).assertEqual(100);
      const val69 = result[1];
      expect(val69).assertEqual(200);
      const val70 = result[2];
      expect(val70).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0520
     * @tc.name testTypedUArraysOfPart202_052
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1e3, 2e3, 3e3);
      const val71 = result[0];
      expect(val71).assertEqual(1000);
      const val72 = result[1];
      expect(val72).assertEqual(2000);
      const val73 = result[2];
      expect(val73).assertEqual(3000);
    });

    it('testTypedUArraysOfPart202_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'));
      const val74 = result[0];
      expect(val74).assertEqual(0n);
      const val75 = result[1];
      expect(val75).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_0100
     * @tc.name testTypedUArraysMap001
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const mapped = result.map((x: number) => x + 1);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(3);
      expect(mapped[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_0100
     * @tc.name testTypedUArraysFilter001
     * @tc.desc Verify Uint8Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const filtered = result.filter((x: number) => x >= 3);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(3);
      expect(filtered[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0100
     * @tc.name testTypedUArraysEvery001
     * @tc.desc Verify Uint8Array every all elements greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const allPositive = result.every((x: number) => x > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_EVERY_0200
     * @tc.name testTypedUArraysEvery002
     * @tc.desc Verify Uint8Array every returns false on failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 0, 4, 5);
      const allPositive = result.every((x: number) => x > 0);
      expect(allPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SOME_0100
     * @tc.name testTypedUArraysSome001
     * @tc.desc Verify Uint8Array some finds matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSome001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const hasThree = result.some((x: number) => x === 3);
      expect(hasThree).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SOME_0200
     * @tc.name testTypedUArraysSome002
     * @tc.desc Verify Uint8Array some does not find non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSome002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasHundred = result.some((x: number) => x === 100);
      expect(hasHundred).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_0100
     * @tc.name testTypedUArraysFind001
     * @tc.desc Verify Uint8Array find returns matched element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const found = result.find((x: number) => x > 3);
      expect(found).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_0200
     * @tc.name testTypedUArraysFind002
     * @tc.desc Verify Uint8Array find returns undefined on no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFind002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const found = result.find((x: number) => x > 10);
      expect(found).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF_0100
     * @tc.name testTypedUArraysIndexOf001
     * @tc.desc Verify Uint8Array indexOf finds element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const idx = result.indexOf(3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF_0200
     * @tc.name testTypedUArraysIndexOf002
     * @tc.desc Verify Uint8Array indexOf returns -1 for not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const idx = result.indexOf(10);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0100
     * @tc.name testTypedUArraysIncludes001
     * @tc.desc Verify Uint8Array includes returns true for found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const hasValue = result.includes(4);
      expect(hasValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0200
     * @tc.name testTypedUArraysIncludes002
     * @tc.desc Verify Uint8Array includes returns false for not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasValue = result.includes(100);
      expect(hasValue).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_0100
     * @tc.name testTypedUArraysReduce001
     * @tc.desc Verify Uint8Array reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const sum = result.reduce((a: number, b: number) => a + b);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_0200
     * @tc.name testTypedUArraysReduce002
     * @tc.desc Verify Uint8Array reduce with initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduce002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const sum = result.reduce((a: number, b: number) => a + b, 10);
      expect(sum).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_0100
     * @tc.name testTypedUArraysReduceRight001
     * @tc.desc Verify Uint8Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const val = result.reduceRight((a: number, b: number) => a - b);
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_0100
     * @tc.name testTypedUArraysJoin001
     * @tc.desc Verify Uint8Array join with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const str = result.join();
      expect(str).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_0200
     * @tc.name testTypedUArraysJoin002
     * @tc.desc Verify Uint8Array join with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const str = result.join('-');
      expect(str).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING_0100
     * @tc.name testTypedUArraysToString001
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 20, 30);
      const str = result.toString();
      expect(str).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOLOCALESTRING_0100
     * @tc.name testTypedUArraysToLocaleString001
     * @tc.desc Verify Uint8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const str = result.toLocaleString();
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF_0100
     * @tc.name testTypedUArraysValueOf001
     * @tc.desc Verify Uint8Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const val = result.valueOf();
      expect(val.length).assertEqual(3);
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FOREACH_0100
     * @tc.name testTypedUArraysForEach001
     * @tc.desc Verify Uint8Array forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      let count: number = 0;
      result.forEach((x: number) => {
        count = count + x;
      });
      expect(count).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDINDEX_0100
     * @tc.name testTypedUArraysFindIndex001
     * @tc.desc Verify Uint8Array findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const idx = result.findIndex((x: number) => x > 3);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLAST_0100
     * @tc.name testTypedUArraysFindLast001
     * @tc.desc Verify Uint8Array findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 2, 1);
      const found = result.findLast((x: number) => x === 2);
      expect(found).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_LASTINDEXOF_0100
     * @tc.name testTypedUArraysLastIndexOf001
     * @tc.desc Verify Uint8Array lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 2, 1);
      const idx = result.lastIndexOf(2);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_WITH_0100
     * @tc.name testTypedUArraysWith001
     * @tc.desc Verify Uint8Array with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const replaced = result.with(1, 99);
      expect(replaced.length).assertEqual(3);
      expect(replaced[0]).assertEqual(1);
      expect(replaced[1]).assertEqual(99);
      expect(replaced[2]).assertEqual(3);
    });

  });
}
