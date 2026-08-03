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

export default function typedUArraysOfTest04(): void {
  describe('TypedUArraysOfTest04', (): void => {
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
     * @tc.name testTypedUArraysOfTestFileD001
     * @tc.desc Verify BigInt64Array.of 0n 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'));
      const val74 = result[0];
      expect(val74).assertEqual(0n);
      const val75 = result[1];
      expect(val75).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0200
     * @tc.name testTypedUArraysOfTestFileD002
     * @tc.desc Verify BigUint64Array.of 0n 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'));
      const val76 = result[0];
      expect(val76).assertEqual(0n);
      const val77 = result[1];
      expect(val77).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0300
     * @tc.name testTypedUArraysOfTestFileD003
     * @tc.desc Verify Uint8Array.of 0x00 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0x00, 0xFF);
      const val78 = result[0];
      expect(val78).assertEqual(0);
      const val79 = result[1];
      expect(val79).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0400
     * @tc.name testTypedUArraysOfTestFileD004
     * @tc.desc Verify Uint16Array.of 0x0000 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0x0000, 0xFFFF);
      const val80 = result[0];
      expect(val80).assertEqual(0);
      const val81 = result[1];
      expect(val81).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0500
     * @tc.name testTypedUArraysOfTestFileD005
     * @tc.desc Verify Uint32Array.of 0x00000000 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0x00000000, 0xFFFFFFFF);
      const val82 = result[0];
      expect(val82).assertEqual(0);
      const val83 = result[1];
      expect(val83).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0600
     * @tc.name testTypedUArraysOfTestFileD006
     * @tc.desc Verify BigInt64Array.of -BigInt('9223372036854775808') 9223372036854775807n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(-9223372036854775808n, 9223372036854775807n);
      const val84 = result[0];
      expect(val84).assertEqual(-9223372036854775808n);
      const val85 = result[1];
      expect(val85).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0700
     * @tc.name testTypedUArraysOfTestFileD007
     * @tc.desc Verify BigUint64Array.of 0n BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('18446744073709551615'));
      const val86 = result[0];
      expect(val86).assertEqual(0n);
      const val87 = result[1];
      expect(val87).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0800
     * @tc.name testTypedUArraysOfTestFileD008
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
      expect(result.length).assertEqual(16);
      const val88 = result[0];
      expect(val88).assertEqual(0);
      const val89 = result[15];
      expect(val89).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0900
     * @tc.name testTypedUArraysOfTestFileD009
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'), BigInt('5'), BigInt('6'), BigInt('7'), BigInt('8'), BigInt('9'), BigInt('10'));
      expect(result.length).assertEqual(11);
      const val90 = result[0];
      expect(val90).assertEqual(0n);
      const val91 = result[10];
      expect(val91).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1000
     * @tc.name testTypedUArraysOfTestFileD010
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'), BigInt('5'), BigInt('6'), BigInt('7'), BigInt('8'), BigInt('9'), BigInt('10'));
      expect(result.length).assertEqual(11);
      const val92 = result[0];
      expect(val92).assertEqual(0n);
      const val93 = result[10];
      expect(val93).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1100
     * @tc.name testTypedUArraysOfTestFileD011
     * @tc.desc Verify Uint8Array.of 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 255, 0, 255, 0, 255);
      expect(result.length).assertEqual(6);
      const val94 = result[0];
      expect(val94).assertEqual(0);
      const val95 = result[1];
      expect(val95).assertEqual(255);
      const val96 = result[5];
      expect(val96).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1200
     * @tc.name testTypedUArraysOfTestFileD012
     * @tc.desc Verify Uint16Array.of 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0, 65535, 0, 65535, 0, 65535);
      expect(result.length).assertEqual(6);
      const val97 = result[0];
      expect(val97).assertEqual(0);
      const val98 = result[1];
      expect(val98).assertEqual(65535);
      const val99 = result[5];
      expect(val99).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1300
     * @tc.name testTypedUArraysOfTestFileD013
     * @tc.desc Verify Uint32Array.of 0 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0, 4294967295, 0, 4294967295, 0, 4294967295);
      expect(result.length).assertEqual(6);
      const val100 = result[0];
      expect(val100).assertEqual(0);
      const val101 = result[1];
      expect(val101).assertEqual(4294967295);
      const val102 = result[5];
      expect(val102).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1400
     * @tc.name testTypedUArraysOfTestFileD014
     * @tc.desc Verify BigInt64Array.of 0n -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('-1'), BigInt('0'), BigInt('-1'), BigInt('0'), BigInt('-1'));
      expect(result.length).assertEqual(6);
      const val103 = result[0];
      expect(val103).assertEqual(0n);
      const val104 = result[1];
      expect(val104).assertEqual(-1n);
      const val105 = result[5];
      expect(val105).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1500
     * @tc.name testTypedUArraysOfTestFileD015
     * @tc.desc Verify BigUint64Array.of 0n BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('18446744073709551615'), 0n, BigInt('18446744073709551615'), 0n, BigInt('18446744073709551615'));
      expect(result.length).assertEqual(6);
      const val106 = result[0];
      expect(val106).assertEqual(0n);
      const val107 = result[1];
      expect(val107).assertEqual(BigInt('18446744073709551615'));
      const val108 = result[5];
      expect(val108).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1600
     * @tc.name testTypedUArraysOfTestFileD016
     * @tc.desc Verify Uint8Array.of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 1, 1, 1, 1, 1, 1, 1);
      expect(result.length).assertEqual(8);
      const val109 = result[0];
      expect(val109).assertEqual(1);
      const val110 = result[7];
      expect(val110).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1700
     * @tc.name testTypedUArraysOfTestFileD017
     * @tc.desc Verify Uint16Array.of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 1, 1, 1, 1, 1, 1, 1);
      expect(result.length).assertEqual(8);
      const val111 = result[0];
      expect(val111).assertEqual(1);
      const val112 = result[7];
      expect(val112).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1800
     * @tc.name testTypedUArraysOfTestFileD018
     * @tc.desc Verify Uint32Array.of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 1, 1, 1, 1, 1, 1, 1);
      expect(result.length).assertEqual(8);
      const val113 = result[0];
      expect(val113).assertEqual(1);
      const val114 = result[7];
      expect(val114).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1900
     * @tc.name testTypedUArraysOfTestFileD019
     * @tc.desc Verify BigInt64Array.of 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'));
      expect(result.length).assertEqual(8);
      const val115 = result[0];
      expect(val115).assertEqual(1n);
      const val116 = result[7];
      expect(val116).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2000
     * @tc.name testTypedUArraysOfTestFileD020
     * @tc.desc Verify BigUint64Array.of 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'));
      expect(result.length).assertEqual(8);
      const val117 = result[0];
      expect(val117).assertEqual(1n);
      const val118 = result[7];
      expect(val118).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2100
     * @tc.name testTypedUArraysOfTestFileD021
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0);
      expect(result.length).assertEqual(11);
      const val119 = result[0];
      expect(val119).assertEqual(10);
      const val120 = result[10];
      expect(val120).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2200
     * @tc.name testTypedUArraysOfTestFileD022
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('10'), BigInt('9'), BigInt('8'), BigInt('7'), BigInt('6'), BigInt('5'), BigInt('4'), BigInt('3'), BigInt('2'), BigInt('1'), BigInt('0'));
      expect(result.length).assertEqual(11);
      const val121 = result[0];
      expect(val121).assertEqual(10n);
      const val122 = result[10];
      expect(val122).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2300
     * @tc.name testTypedUArraysOfTestFileD023
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('10'), BigInt('9'), BigInt('8'), BigInt('7'), BigInt('6'), BigInt('5'), BigInt('4'), BigInt('3'), BigInt('2'), BigInt('1'), BigInt('0'));
      expect(result.length).assertEqual(11);
      const val123 = result[0];
      expect(val123).assertEqual(10n);
      const val124 = result[10];
      expect(val124).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2400
     * @tc.name testTypedUArraysOfTestFileD024
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 4, 3, 2, 1);
      expect(result.length).assertEqual(9);
      const val125 = result[0];
      expect(val125).assertEqual(1);
      const val126 = result[4];
      expect(val126).assertEqual(5);
      const val127 = result[8];
      expect(val127).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2500
     * @tc.name testTypedUArraysOfTestFileD025
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'), BigInt('5'), BigInt('4'), BigInt('3'), BigInt('2'), BigInt('1'));
      expect(result.length).assertEqual(9);
      const val128 = result[0];
      expect(val128).assertEqual(1n);
      const val129 = result[4];
      expect(val129).assertEqual(5n);
      const val130 = result[8];
      expect(val130).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2600
     * @tc.name testTypedUArraysOfTestFileD026
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 4, 8, 16, 32, 64, 128);
      expect(result.length).assertEqual(8);
      const val131 = result[0];
      expect(val131).assertEqual(1);
      const val132 = result[7];
      expect(val132).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2700
     * @tc.name testTypedUArraysOfTestFileD027
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768);
      expect(result.length).assertEqual(16);
      const val133 = result[0];
      expect(val133).assertEqual(1);
      const val134 = result[15];
      expect(val134).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2800
     * @tc.name testTypedUArraysOfTestFileD028
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, 2147483648);
      expect(result.length).assertEqual(32);
      const val135 = result[0];
      expect(val135).assertEqual(1);
      const val136 = result[31];
      expect(val136).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_2900
     * @tc.name testTypedUArraysOfTestFileD029
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('4'), BigInt('8'), BigInt('16'), BigInt('32'), BigInt('64'), BigInt('128'));
      expect(result.length).assertEqual(8);
      const val137 = result[0];
      expect(val137).assertEqual(1n);
      const val138 = result[7];
      expect(val138).assertEqual(128n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3000
     * @tc.name testTypedUArraysOfTestFileD030
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('4'), BigInt('8'), BigInt('16'), BigInt('32'), BigInt('64'), BigInt('128'));
      expect(result.length).assertEqual(8);
      const val139 = result[0];
      expect(val139).assertEqual(1n);
      const val140 = result[7];
      expect(val140).assertEqual(128n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3100
     * @tc.name testTypedUArraysOfTestFileD031
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144);
      expect(result.length).assertEqual(13);
      const val141 = result[0];
      expect(val141).assertEqual(0);
      const val142 = result[1];
      expect(val142).assertEqual(1);
      const val143 = result[12];
      expect(val143).assertEqual(144);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3200
     * @tc.name testTypedUArraysOfTestFileD032
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'), BigInt('1'), BigInt('2'), BigInt('3'), BigInt('5'), BigInt('8'), BigInt('13'), BigInt('21'), BigInt('34'), BigInt('55'), BigInt('89'), BigInt('144'));
      expect(result.length).assertEqual(13);
      const val144 = result[0];
      expect(val144).assertEqual(0n);
      const val145 = result[1];
      expect(val145).assertEqual(1n);
      const val146 = result[12];
      expect(val146).assertEqual(144n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3300
     * @tc.name testTypedUArraysOfTestFileD033
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'), BigInt('1'), BigInt('2'), BigInt('3'), BigInt('5'), BigInt('8'), BigInt('13'), BigInt('21'), BigInt('34'), BigInt('55'), BigInt('89'), BigInt('144'));
      expect(result.length).assertEqual(13);
      const val147 = result[0];
      expect(val147).assertEqual(0n);
      const val148 = result[1];
      expect(val148).assertEqual(1n);
      const val149 = result[12];
      expect(val149).assertEqual(144n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3400
     * @tc.name testTypedUArraysOfTestFileD034
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47);
      expect(result.length).assertEqual(15);
      const val150 = result[0];
      expect(val150).assertEqual(2);
      const val151 = result[14];
      expect(val151).assertEqual(47);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3500
     * @tc.name testTypedUArraysOfTestFileD035
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('2'), BigInt('3'), BigInt('5'), BigInt('7'), BigInt('11'), BigInt('13'), BigInt('17'), BigInt('19'), BigInt('23'), BigInt('29'), BigInt('31'), BigInt('37'), BigInt('41'), BigInt('43'), BigInt('47'));
      expect(result.length).assertEqual(15);
      const val152 = result[0];
      expect(val152).assertEqual(2n);
      const val153 = result[14];
      expect(val153).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3600
     * @tc.name testTypedUArraysOfTestFileD036
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('2'), BigInt('3'), BigInt('5'), BigInt('7'), BigInt('11'), BigInt('13'), BigInt('17'), BigInt('19'), BigInt('23'), BigInt('29'), BigInt('31'), BigInt('37'), BigInt('41'), BigInt('43'), BigInt('47'));
      expect(result.length).assertEqual(15);
      const val154 = result[0];
      expect(val154).assertEqual(2n);
      const val155 = result[14];
      expect(val155).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3700
     * @tc.name testTypedUArraysOfTestFileD037
     * @tc.desc Verify Uint8Array.of ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(32, 33, 34, 35, 36, 37, 38, 39, 40, 41);
      expect(result.length).assertEqual(10);
      const val156 = result[0];
      expect(val156).assertEqual(32);
      const val157 = result[9];
      expect(val157).assertEqual(41);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3800
     * @tc.name testTypedUArraysOfTestFileD038
     * @tc.desc Verify BigInt64Array.of ASCII BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('32'), BigInt('33'), BigInt('34'), BigInt('35'), BigInt('36'), BigInt('37'), BigInt('38'), BigInt('39'), BigInt('40'), BigInt('41'));
      expect(result.length).assertEqual(10);
      const val158 = result[0];
      expect(val158).assertEqual(32n);
      const val159 = result[9];
      expect(val159).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_3900
     * @tc.name testTypedUArraysOfTestFileD039
     * @tc.desc Verify BigUint64Array.of ASCII BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('32'), BigInt('33'), BigInt('34'), BigInt('35'), BigInt('36'), BigInt('37'), BigInt('38'), BigInt('39'), BigInt('40'), BigInt('41'));
      expect(result.length).assertEqual(10);
      const val160 = result[0];
      expect(val160).assertEqual(32n);
      const val161 = result[9];
      expect(val161).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4000
     * @tc.name testTypedUArraysOfTestFileD040
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 0xA, 0o12, 0b1010);
      expect(result.length).assertEqual(4);
      const val162 = result[0];
      expect(val162).assertEqual(10);
      const val163 = result[1];
      expect(val163).assertEqual(10);
      const val164 = result[2];
      expect(val164).assertEqual(10);
      const val165 = result[3];
      expect(val165).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4100
     * @tc.name testTypedUArraysOfTestFileD041
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(100, 0x64, 0o144, 0b1100100);
      expect(result.length).assertEqual(4);
      const val166 = result[0];
      expect(val166).assertEqual(100);
      const val167 = result[1];
      expect(val167).assertEqual(100);
      const val168 = result[2];
      expect(val168).assertEqual(100);
      const val169 = result[3];
      expect(val169).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4200
     * @tc.name testTypedUArraysOfTestFileD042
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1000, 0x3E8, 0o1750, 0b1111101000);
      expect(result.length).assertEqual(4);
      const val170 = result[0];
      expect(val170).assertEqual(1000);
      const val171 = result[1];
      expect(val171).assertEqual(1000);
      const val172 = result[2];
      expect(val172).assertEqual(1000);
      const val173 = result[3];
      expect(val173).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4300
     * @tc.name testTypedUArraysOfTestFileD043
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('100'), BigInt('100'), BigInt('100'), BigInt('100'));
      expect(result.length).assertEqual(4);
      const val174 = result[0];
      expect(val174).assertEqual(100n);
      const val175 = result[1];
      expect(val175).assertEqual(100n);
      const val176 = result[2];
      expect(val176).assertEqual(100n);
      const val177 = result[3];
      expect(val177).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4400
     * @tc.name testTypedUArraysOfTestFileD044
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('100'), BigInt('100'), BigInt('100'), BigInt('100'));
      expect(result.length).assertEqual(4);
      const val178 = result[0];
      expect(val178).assertEqual(100n);
      const val179 = result[1];
      expect(val179).assertEqual(100n);
      const val180 = result[2];
      expect(val180).assertEqual(100n);
      const val181 = result[3];
      expect(val181).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4500
     * @tc.name testTypedUArraysOfTestFileD045
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1e1, 2e1, 3e1, 4e1, 5e1);
      expect(result.length).assertEqual(5);
      const val182 = result[0];
      expect(val182).assertEqual(10);
      const val183 = result[1];
      expect(val183).assertEqual(20);
      const val184 = result[2];
      expect(val184).assertEqual(30);
      const val185 = result[3];
      expect(val185).assertEqual(40);
      const val186 = result[4];
      expect(val186).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4600
     * @tc.name testTypedUArraysOfTestFileD046
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1e2, 2e2, 3e2, 4e2, 5e2);
      expect(result.length).assertEqual(5);
      const val187 = result[0];
      expect(val187).assertEqual(100);
      const val188 = result[1];
      expect(val188).assertEqual(200);
      const val189 = result[2];
      expect(val189).assertEqual(300);
      const val190 = result[3];
      expect(val190).assertEqual(400);
      const val191 = result[4];
      expect(val191).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4700
     * @tc.name testTypedUArraysOfTestFileD047
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1e3, 2e3, 3e3, 4e3, 5e3);
      expect(result.length).assertEqual(5);
      const val192 = result[0];
      expect(val192).assertEqual(1000);
      const val193 = result[1];
      expect(val193).assertEqual(2000);
      const val194 = result[2];
      expect(val194).assertEqual(3000);
      const val195 = result[3];
      expect(val195).assertEqual(4000);
      const val196 = result[4];
      expect(val196).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4800
     * @tc.name testTypedUArraysOfTestFileD048
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1 + 1, 2 * 2, 3 + 4, 5 * 2);
      expect(result.length).assertEqual(4);
      const val197 = result[0];
      expect(val197).assertEqual(2);
      const val198 = result[1];
      expect(val198).assertEqual(4);
      const val199 = result[2];
      expect(val199).assertEqual(7);
      const val200 = result[3];
      expect(val200).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_4900
     * @tc.name testTypedUArraysOfTestFileD049
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(10 + 10, 20 * 2, 30 + 40, 50 * 2);
      expect(result.length).assertEqual(4);
      const val201 = result[0];
      expect(val201).assertEqual(20);
      const val202 = result[1];
      expect(val202).assertEqual(40);
      const val203 = result[2];
      expect(val203).assertEqual(70);
      const val204 = result[3];
      expect(val204).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5000
     * @tc.name testTypedUArraysOfTestFileD050
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(100 + 100, 200 * 2, 300 + 400, 500 * 2);
      expect(result.length).assertEqual(4);
      const val205 = result[0];
      expect(val205).assertEqual(200);
      const val206 = result[1];
      expect(val206).assertEqual(400);
      const val207 = result[2];
      expect(val207).assertEqual(700);
      const val208 = result[3];
      expect(val208).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5100
     * @tc.name testTypedUArraysOfTestFileD051
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1') + BigInt('1'), BigInt('2') * BigInt('2'), BigInt('3') + BigInt('4'), BigInt('5') * BigInt('2'));
      expect(result.length).assertEqual(4);
      const val209 = result[0];
      expect(val209).assertEqual(2n);
      const val210 = result[1];
      expect(val210).assertEqual(4n);
      const val211 = result[2];
      expect(val211).assertEqual(7n);
      const val212 = result[3];
      expect(val212).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_5200
     * @tc.name testTypedUArraysOfTestFileD052
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1') + BigInt('1'), BigInt('2') * BigInt('2'), BigInt('3') + BigInt('4'), BigInt('5') * BigInt('2'));
      expect(result.length).assertEqual(4);
      const val213 = result[0];
      expect(val213).assertEqual(2n);
      const val214 = result[1];
      expect(val214).assertEqual(4n);
      const val215 = result[2];
      expect(val215).assertEqual(7n);
      const val216 = result[3];
      expect(val216).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_5300
     * @tc.name testTypedUArraysOfTestFileD053
     * @tc.desc Verify Uint8ClampedArray clamps negative value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = -1;
      arr[1] = -100;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_5400
     * @tc.name testTypedUArraysOfTestFileD054
     * @tc.desc Verify Uint8ClampedArray clamps value over 255 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 256;
      arr[1] = 1000;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_5500
     * @tc.name testTypedUArraysOfTestFileD055
     * @tc.desc Verify Uint8ClampedArray clamps fractional value to nearest integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 1.3;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_5600
     * @tc.name testTypedUArraysOfTestFileD056
     * @tc.desc Verify Uint8Array subscript read write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_5700
     * @tc.name testTypedUArraysOfTestFileD057
     * @tc.desc Verify BigUint64Array subscript read write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      arr[0] = 100n;
      arr[1] = 200n;
      arr[2] = 300n;
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200n);
      expect(arr[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_5800
     * @tc.name testTypedUArraysOfTestFileD058
     * @tc.desc Verify Uint16Array subscript read write with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      arr[0] = 0;
      arr[1] = 65535;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DEFAULTITER_5900
     * @tc.name testTypedUArraysOfTestFileD059
     * @tc.desc Verify Uint8Array default iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let sum: number = 0;
      for (const val of arr) {
        sum = sum + val;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DEFAULTITER_6000
     * @tc.name testTypedUArraysOfTestFileD060
     * @tc.desc Verify BigUint64Array default iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(10n, 20n, 30n);
      let sum: BigInt = 0n;
      for (const val of arr) {
        sum = sum + val;
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_ARRAY_6100
     * @tc.name testTypedUArraysOfTestFileD061
     * @tc.desc Verify Uint8Array constructor from plain array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_ARRAY_6200
     * @tc.name testTypedUArraysOfTestFileD062
     * @tc.desc Verify Uint32Array constructor from plain array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_BUF_6300
     * @tc.name testTypedUArraysOfTestFileD063
     * @tc.desc Verify Uint8Array constructor from ArrayBuffer with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_BUF_6400
     * @tc.name testTypedUArraysOfTestFileD064
     * @tc.desc Verify Uint16Array constructor from ArrayBuffer with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_6500
     * @tc.name testTypedUArraysOfTestFileD065
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING_6600
     * @tc.name testTypedUArraysOfTestFileD066
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('100'), BigInt('200'), BigInt('300'));
      const str = result.toString();
      expect(str).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_6700
     * @tc.name testTypedUArraysOfTestFileD067
     * @tc.desc Verify BigUint64Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('10'), BigInt('20'), BigInt('30'));
      const joined = result.join('-');
      expect(joined).assertEqual('10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_6800
     * @tc.name testTypedUArraysOfTestFileD068
     * @tc.desc Verify Uint8Array findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileD068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 2, 1);
      const idx = result.findLastIndex((x: number) => x === 2);
      expect(idx).assertEqual(3);
    });

  });
}

