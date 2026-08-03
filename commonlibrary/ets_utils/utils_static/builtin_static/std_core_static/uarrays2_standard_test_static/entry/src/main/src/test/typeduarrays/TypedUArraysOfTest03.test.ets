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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0100
     * @tc.name testTypedUArraysOfTestFileC001
     * @tc.desc Verify Uint8Array.of reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      result.reverse();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0200
     * @tc.name testTypedUArraysOfTestFileC002
     * @tc.desc Verify Uint8Array.of map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const mapped = result.map((x) => x * 2);
      const val2 = mapped[0];
      expect(val2).assertEqual(2);
      const val3 = mapped[2];
      expect(val3).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0300
     * @tc.name testTypedUArraysOfTestFileC003
     * @tc.desc Verify Uint8Array.of filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const filtered = result.filter((x) => x > 2);
      expect(filtered.length).assertEqual(3);
      const val4 = filtered[0];
      expect(val4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0400
     * @tc.name testTypedUArraysOfTestFileC004
     * @tc.desc Verify Uint8Array.of every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const allPositive = result.every((x) => x >= 1);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0500
     * @tc.name testTypedUArraysOfTestFileC005
     * @tc.desc Verify Uint8Array.of some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasThree = result.some((x) => x === 3);
      expect(hasThree).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0600
     * @tc.name testTypedUArraysOfTestFileC006
     * @tc.desc Verify Uint8Array.of find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const found = result.find((x) => x > 3);
      expect(found).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0700
     * @tc.name testTypedUArraysOfTestFileC007
     * @tc.desc Verify Uint8Array.of indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const idx = result.indexOf(3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0800
     * @tc.name testTypedUArraysOfTestFileC008
     * @tc.desc Verify Uint8Array.of includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasTwo = result.includes(2);
      expect(hasTwo).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0900
     * @tc.name testTypedUArraysOfTestFileC009
     * @tc.desc Verify Uint8Array.of reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const sum = result.reduce((a, b, c, d) => a + b);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1000
     * @tc.name testTypedUArraysOfTestFileC010
     * @tc.desc Verify Uint16Array.of join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(10, 20, 30);
      const joined = result.join(',');
      expect(joined).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1100
     * @tc.name testTypedUArraysOfTestFileC011
     * @tc.desc Verify Uint32Array.of toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(100, 200, 300);
      const str = result.toString();
      expect(str).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1200
     * @tc.name testTypedUArraysOfTestFileC012
     * @tc.desc Verify BigInt64Array.of join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const joined = result.join(',');
      expect(joined).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1300
     * @tc.name testTypedUArraysOfTestFileC013
     * @tc.desc Verify BigUint64Array.of toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const str = result.toString();
      expect(str).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1400
     * @tc.name testTypedUArraysOfTestFileC014
     * @tc.desc Verify of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1500
     * @tc.name testTypedUArraysOfTestFileC015
     * @tc.desc Verify of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(42);
      expect(result.length).assertEqual(1);
      const val5 = result[0];
      expect(val5).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1600
     * @tc.name testTypedUArraysOfTestFileC016
     * @tc.desc Verify of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 20);
      expect(result.length).assertEqual(2);
      const val6 = result[0];
      expect(val6).assertEqual(10);
      const val7 = result[1];
      expect(val7).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1700
     * @tc.name testTypedUArraysOfTestFileC017
     * @tc.desc Verify of 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(result.length).assertEqual(3);
      const val8 = result[0];
      expect(val8).assertEqual(1);
      const val9 = result[2];
      expect(val9).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1800
     * @tc.name testTypedUArraysOfTestFileC018
     * @tc.desc Verify of 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4);
      expect(result.length).assertEqual(4);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[3];
      expect(val11).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1900
     * @tc.name testTypedUArraysOfTestFileC019
     * @tc.desc Verify of 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(5, 10, 15, 20, 25);
      expect(result.length).assertEqual(5);
      const val12 = result[0];
      expect(val12).assertEqual(5);
      const val13 = result[4];
      expect(val13).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2000
     * @tc.name testTypedUArraysOfTestFileC020
     * @tc.desc Verify of 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(result.length).assertEqual(10);
      const val14 = result[0];
      expect(val14).assertEqual(1);
      const val15 = result[9];
      expect(val15).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2100
     * @tc.name testTypedUArraysOfTestFileC021
     * @tc.desc Verify of 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
      expect(result.length).assertEqual(20);
      const val16 = result[0];
      expect(val16).assertEqual(1);
      const val17 = result[19];
      expect(val17).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2200
     * @tc.name testTypedUArraysOfTestFileC022
     * @tc.desc Verify of 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50);
      expect(result.length).assertEqual(50);
      const val18 = result[0];
      expect(val18).assertEqual(1);
      const val19 = result[49];
      expect(val19).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2300
     * @tc.name testTypedUArraysOfTestFileC023
     * @tc.desc Verify of 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100);
      expect(result.length).assertEqual(100);
      const val20 = result[0];
      expect(val20).assertEqual(1);
      const val21 = result[99];
      expect(val21).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2400
     * @tc.name testTypedUArraysOfTestFileC024
     * @tc.desc Verify Uint8Array.of Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const val22 = result[0];
      expect(val22).assertEqual(1);
      const val23 = result[2];
      expect(val23).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2500
     * @tc.name testTypedUArraysOfTestFileC025
     * @tc.desc Verify Uint16Array.of Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(100, 200, 300);
      const val24 = result[0];
      expect(val24).assertEqual(100);
      const val25 = result[2];
      expect(val25).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2600
     * @tc.name testTypedUArraysOfTestFileC026
     * @tc.desc Verify Uint32Array.of Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1000, 2000, 3000);
      const val26 = result[0];
      expect(val26).assertEqual(1000);
      const val27 = result[2];
      expect(val27).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2700
     * @tc.name testTypedUArraysOfTestFileC027
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const val28 = result[0];
      expect(val28).assertEqual(1n);
      const val29 = result[2];
      expect(val29).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2800
     * @tc.name testTypedUArraysOfTestFileC028
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      const val30 = result[0];
      expect(val30).assertEqual(1n);
      const val31 = result[2];
      expect(val31).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2900
     * @tc.name testTypedUArraysOfTestFileC029
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'), BigInt('-1'), BigInt('2'), BigInt('-2'));
      const val32 = result[2];
      expect(val32).assertEqual(-1n);
      const val33 = result[4];
      expect(val33).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3000
     * @tc.name testTypedUArraysOfTestFileC030
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'), BigInt('18446744073709551615'));
      const val34 = result[2];
      expect(val34).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3100
     * @tc.name testTypedUArraysOfTestFileC031
     * @tc.desc Verify Uint8Array.of BigInt64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1, 2, 3);
      const r2 = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3200
     * @tc.name testTypedUArraysOfTestFileC032
     * @tc.desc Verify Uint32Array.of BigUint64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint32Array.of(1, 2, 3, 4);
      const r2 = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'));
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3300
     * @tc.name testTypedUArraysOfTestFileC033
     * @tc.desc Verify Uint8Array.of BigInt64Array.of byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1, 2, 3);
      const r2 = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.byteLength).assertEqual(3);
      expect(r2.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3400
     * @tc.name testTypedUArraysOfTestFileC034
     * @tc.desc Verify Uint16Array.of BigInt64Array.of byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint16Array.of(1, 2, 3);
      const r2 = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.byteLength).assertEqual(6);
      expect(r2.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3500
     * @tc.name testTypedUArraysOfTestFileC035
     * @tc.desc Verify Uint32Array.of BigUint64Array.of byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint32Array.of(1, 2, 3);
      const r2 = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('3'));
      expect(r1.byteLength).assertEqual(12);
      expect(r2.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3600
     * @tc.name testTypedUArraysOfTestFileC036
     * @tc.desc Verify Uint8Array.of BigInt64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1);
      const r2 = BigInt64Array.of(BigInt('1'));
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3700
     * @tc.name testTypedUArraysOfTestFileC037
     * @tc.desc Verify Uint16Array.of BigUint64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint16Array.of(1);
      const r2 = BigUint64Array.of(BigInt('1'));
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3800
     * @tc.name testTypedUArraysOfTestFileC038
     * @tc.desc Verify Uint32Array.of BigInt64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint32Array.of(1);
      const r2 = BigInt64Array.of(BigInt('1'));
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3900
     * @tc.name testTypedUArraysOfTestFileC039
     * @tc.desc Verify Uint8Array.of BigUint64Array.of BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8Array.of(1);
      const r2 = BigUint64Array.of(BigInt('1'));
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(1);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4000
     * @tc.name testTypedUArraysOfTestFileC040
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0x10, 0x20, 0x30);
      const val35 = result[0];
      expect(val35).assertEqual(16);
      const val36 = result[1];
      expect(val36).assertEqual(32);
      const val37 = result[2];
      expect(val37).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4100
     * @tc.name testTypedUArraysOfTestFileC041
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0x100, 0x200, 0x300);
      const val38 = result[0];
      expect(val38).assertEqual(256);
      const val39 = result[1];
      expect(val39).assertEqual(512);
      const val40 = result[2];
      expect(val40).assertEqual(768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4200
     * @tc.name testTypedUArraysOfTestFileC042
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0x1000, 0x2000, 0x3000);
      const val41 = result[0];
      expect(val41).assertEqual(4096);
      const val42 = result[1];
      expect(val42).assertEqual(8192);
      const val43 = result[2];
      expect(val43).assertEqual(12288);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4300
     * @tc.name testTypedUArraysOfTestFileC043
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('16'), BigInt('32'), BigInt('48'));
      const val44 = result[0];
      expect(val44).assertEqual(16n);
      const val45 = result[1];
      expect(val45).assertEqual(32n);
      const val46 = result[2];
      expect(val46).assertEqual(48n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4400
     * @tc.name testTypedUArraysOfTestFileC044
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('16'), BigInt('32'), BigInt('48'));
      const val47 = result[0];
      expect(val47).assertEqual(16n);
      const val48 = result[1];
      expect(val48).assertEqual(32n);
      const val49 = result[2];
      expect(val49).assertEqual(48n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4500
     * @tc.name testTypedUArraysOfTestFileC045
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0b10000, 0b100000, 0b1100000);
      const val50 = result[0];
      expect(val50).assertEqual(16);
      const val51 = result[1];
      expect(val51).assertEqual(32);
      const val52 = result[2];
      expect(val52).assertEqual(96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4600
     * @tc.name testTypedUArraysOfTestFileC046
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0b100000000, 0b1000000000, 0b11000000000);
      const val53 = result[0];
      expect(val53).assertEqual(256);
      const val54 = result[1];
      expect(val54).assertEqual(512);
      const val55 = result[2];
      expect(val55).assertEqual(1536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4700
     * @tc.name testTypedUArraysOfTestFileC047
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0b100000000000, 0b1000000000000, 0b1100000000000);
      const val56 = result[0];
      expect(val56).assertEqual(2048);
      const val57 = result[1];
      expect(val57).assertEqual(4096);
      const val58 = result[2];
      expect(val58).assertEqual(6144);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4800
     * @tc.name testTypedUArraysOfTestFileC048
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('16'), BigInt('32'), BigInt('96'));
      const val59 = result[0];
      expect(val59).assertEqual(16n);
      const val60 = result[1];
      expect(val60).assertEqual(32n);
      const val61 = result[2];
      expect(val61).assertEqual(96n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4900
     * @tc.name testTypedUArraysOfTestFileC049
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('16'), BigInt('32'), BigInt('96'));
      const val62 = result[0];
      expect(val62).assertEqual(16n);
      const val63 = result[1];
      expect(val63).assertEqual(32n);
      const val64 = result[2];
      expect(val64).assertEqual(96n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5000
     * @tc.name testTypedUArraysOfTestFileC050
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1e1, 2e1, 3e1);
      const val65 = result[0];
      expect(val65).assertEqual(10);
      const val66 = result[1];
      expect(val66).assertEqual(20);
      const val67 = result[2];
      expect(val67).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5100
     * @tc.name testTypedUArraysOfTestFileC051
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1e2, 2e2, 3e2);
      const val68 = result[0];
      expect(val68).assertEqual(100);
      const val69 = result[1];
      expect(val69).assertEqual(200);
      const val70 = result[2];
      expect(val70).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5200
     * @tc.name testTypedUArraysOfTestFileC052
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1e3, 2e3, 3e3);
      const val71 = result[0];
      expect(val71).assertEqual(1000);
      const val72 = result[1];
      expect(val72).assertEqual(2000);
      const val73 = result[2];
      expect(val73).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5300
     * @tc.name testTypedUArraysOfTestFileC053
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'));
      const val74 = result[0];
      expect(val74).assertEqual(0n);
      const val75 = result[1];
      expect(val75).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5400
     * @tc.name testTypedUArraysOfTestFileC054
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const mapped = result.map((x: number) => x + 1);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(3);
      expect(mapped[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5500
     * @tc.name testTypedUArraysOfTestFileC055
     * @tc.desc Verify Uint8Array filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const filtered = result.filter((x: number) => x >= 3);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(3);
      expect(filtered[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5600
     * @tc.name testTypedUArraysOfTestFileC056
     * @tc.desc Verify Uint8Array every all elements greater than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const allPositive = result.every((x: number) => x > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5700
     * @tc.name testTypedUArraysOfTestFileC057
     * @tc.desc Verify Uint8Array every returns false on failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 0, 4, 5);
      const allPositive = result.every((x: number) => x > 0);
      expect(allPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5800
     * @tc.name testTypedUArraysOfTestFileC058
     * @tc.desc Verify Uint8Array some finds matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const hasThree = result.some((x: number) => x === 3);
      expect(hasThree).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5900
     * @tc.name testTypedUArraysOfTestFileC059
     * @tc.desc Verify Uint8Array some does not find non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasHundred = result.some((x: number) => x === 100);
      expect(hasHundred).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6000
     * @tc.name testTypedUArraysOfTestFileC060
     * @tc.desc Verify Uint8Array find returns matched element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const found = result.find((x: number) => x > 3);
      expect(found).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6100
     * @tc.name testTypedUArraysOfTestFileC061
     * @tc.desc Verify Uint8Array find returns undefined on no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const found = result.find((x: number) => x > 10);
      expect(found).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6200
     * @tc.name testTypedUArraysOfTestFileC062
     * @tc.desc Verify Uint8Array indexOf returns -1 for not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const idx = result.indexOf(10);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6300
     * @tc.name testTypedUArraysOfTestFileC063
     * @tc.desc Verify Uint8Array includes returns true for found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const hasValue = result.includes(4);
      expect(hasValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6400
     * @tc.name testTypedUArraysOfTestFileC064
     * @tc.desc Verify Uint8Array includes returns false for not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const hasValue = result.includes(100);
      expect(hasValue).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6500
     * @tc.name testTypedUArraysOfTestFileC065
     * @tc.desc Verify Uint8Array reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const sum = result.reduce((a: number, b: number) => a + b);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6600
     * @tc.name testTypedUArraysOfTestFileC066
     * @tc.desc Verify Uint8Array reduce with initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const sum = result.reduce((a: number, b: number) => a + b, 10);
      expect(sum).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6700
     * @tc.name testTypedUArraysOfTestFileC067
     * @tc.desc Verify Uint8Array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const val = result.reduceRight((a: number, b: number) => a - b);
      expect(val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6800
     * @tc.name testTypedUArraysOfTestFileC068
     * @tc.desc Verify Uint8Array join with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const str = result.join();
      expect(str).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_6900
     * @tc.name testTypedUArraysOfTestFileC069
     * @tc.desc Verify Uint8Array join with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const str = result.join('-');
      expect(str).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7000
     * @tc.name testTypedUArraysOfTestFileC070
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 20, 30);
      const str = result.toString();
      expect(str).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7100
     * @tc.name testTypedUArraysOfTestFileC071
     * @tc.desc Verify Uint8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const str = result.toLocaleString();
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7200
     * @tc.name testTypedUArraysOfTestFileC072
     * @tc.desc Verify Uint8Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const val = result.valueOf();
      expect(val.length).assertEqual(3);
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7300
     * @tc.name testTypedUArraysOfTestFileC073
     * @tc.desc Verify Uint8Array forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      let count: number = 0;
      result.forEach((x: number) => {
        count = count + x;
      });
      expect(count).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7400
     * @tc.name testTypedUArraysOfTestFileC074
     * @tc.desc Verify Uint8Array findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const idx = result.findIndex((x: number) => x > 3);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7500
     * @tc.name testTypedUArraysOfTestFileC075
     * @tc.desc Verify Uint8Array findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 2, 1);
      const found = result.findLast((x: number) => x === 2);
      expect(found).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7600
     * @tc.name testTypedUArraysOfTestFileC076
     * @tc.desc Verify Uint8Array lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 2, 1);
      const idx = result.lastIndexOf(2);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_7700
     * @tc.name testTypedUArraysOfTestFileC077
     * @tc.desc Verify Uint8Array with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileC077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const replaced = result.with(1, 99);
      expect(replaced.length).assertEqual(3);
      expect(replaced[0]).assertEqual(1);
      expect(replaced[1]).assertEqual(99);
      expect(replaced[2]).assertEqual(3);
    });
    });
    }
