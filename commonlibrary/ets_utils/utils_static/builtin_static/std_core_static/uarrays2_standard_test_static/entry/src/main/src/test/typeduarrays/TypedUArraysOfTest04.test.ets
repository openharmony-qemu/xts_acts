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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0530
     * @tc.name testTypedUArraysOfPart202_053
     * @tc.desc Verify BigInt64Array.of 0n 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'));
      const val74 = result[0];
      expect(val74).assertEqual(0n);
      const val75 = result[1];
      expect(val75).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0540
     * @tc.name testTypedUArraysOfPart202_054
     * @tc.desc Verify BigUint64Array.of 0n 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'));
      const val76 = result[0];
      expect(val76).assertEqual(0n);
      const val77 = result[1];
      expect(val77).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0550
     * @tc.name testTypedUArraysOfPart202_055
     * @tc.desc Verify Uint8Array.of 0x00 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0x00, 0xFF);
      const val78 = result[0];
      expect(val78).assertEqual(0);
      const val79 = result[1];
      expect(val79).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0560
     * @tc.name testTypedUArraysOfPart202_056
     * @tc.desc Verify Uint16Array.of 0x0000 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0x0000, 0xFFFF);
      const val80 = result[0];
      expect(val80).assertEqual(0);
      const val81 = result[1];
      expect(val81).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0570
     * @tc.name testTypedUArraysOfPart202_057
     * @tc.desc Verify Uint32Array.of 0x00000000 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0x00000000, 0xFFFFFFFF);
      const val82 = result[0];
      expect(val82).assertEqual(0);
      const val83 = result[1];
      expect(val83).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0580
     * @tc.name testTypedUArraysOfPart202_058
     * @tc.desc Verify BigInt64Array.of -BigInt('9223372036854775808') 9223372036854775807n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(-9223372036854775808n, 9223372036854775807n);
      const val84 = result[0];
      expect(val84).assertEqual(-9223372036854775808n);
      const val85 = result[1];
      expect(val85).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0590
     * @tc.name testTypedUArraysOfPart202_059
     * @tc.desc Verify BigUint64Array.of 0n BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('18446744073709551615'));
      const val86 = result[0];
      expect(val86).assertEqual(0n);
      const val87 = result[1];
      expect(val87).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0600
     * @tc.name testTypedUArraysOfPart202_060
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
      expect(result.length).assertEqual(16);
      const val88 = result[0];
      expect(val88).assertEqual(0);
      const val89 = result[15];
      expect(val89).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0610
     * @tc.name testTypedUArraysOfPart202_061
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('0'), BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'), BigInt('5'), BigInt('6'), BigInt('7'), BigInt('8'), BigInt('9'), BigInt('10'));
      expect(result.length).assertEqual(11);
      const val90 = result[0];
      expect(val90).assertEqual(0n);
      const val91 = result[10];
      expect(val91).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0620
     * @tc.name testTypedUArraysOfPart202_062
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('0'), BigInt('1'), BigInt('2'), BigInt('3'), BigInt('4'), BigInt('5'), BigInt('6'), BigInt('7'), BigInt('8'), BigInt('9'), BigInt('10'));
      expect(result.length).assertEqual(11);
      const val92 = result[0];
      expect(val92).assertEqual(0n);
      const val93 = result[10];
      expect(val93).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0630
     * @tc.name testTypedUArraysOfPart202_063
     * @tc.desc Verify Uint8Array.of 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0640
     * @tc.name testTypedUArraysOfPart202_064
     * @tc.desc Verify Uint16Array.of 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0650
     * @tc.name testTypedUArraysOfPart202_065
     * @tc.desc Verify Uint32Array.of 0 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0660
     * @tc.name testTypedUArraysOfPart202_066
     * @tc.desc Verify BigInt64Array.of 0n -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0670
     * @tc.name testTypedUArraysOfPart202_067
     * @tc.desc Verify BigUint64Array.of 0n BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0680
     * @tc.name testTypedUArraysOfPart202_068
     * @tc.desc Verify Uint8Array.of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 1, 1, 1, 1, 1, 1, 1);
      expect(result.length).assertEqual(8);
      const val109 = result[0];
      expect(val109).assertEqual(1);
      const val110 = result[7];
      expect(val110).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0690
     * @tc.name testTypedUArraysOfPart202_069
     * @tc.desc Verify Uint16Array.of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 1, 1, 1, 1, 1, 1, 1);
      expect(result.length).assertEqual(8);
      const val111 = result[0];
      expect(val111).assertEqual(1);
      const val112 = result[7];
      expect(val112).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0700
     * @tc.name testTypedUArraysOfPart202_070
     * @tc.desc Verify Uint32Array.of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 1, 1, 1, 1, 1, 1, 1);
      expect(result.length).assertEqual(8);
      const val113 = result[0];
      expect(val113).assertEqual(1);
      const val114 = result[7];
      expect(val114).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0710
     * @tc.name testTypedUArraysOfPart202_071
     * @tc.desc Verify BigInt64Array.of 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'));
      expect(result.length).assertEqual(8);
      const val115 = result[0];
      expect(val115).assertEqual(1n);
      const val116 = result[7];
      expect(val116).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0720
     * @tc.name testTypedUArraysOfPart202_072
     * @tc.desc Verify BigUint64Array.of 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'), BigInt('1'));
      expect(result.length).assertEqual(8);
      const val117 = result[0];
      expect(val117).assertEqual(1n);
      const val118 = result[7];
      expect(val118).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0730
     * @tc.name testTypedUArraysOfPart202_073
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0);
      expect(result.length).assertEqual(11);
      const val119 = result[0];
      expect(val119).assertEqual(10);
      const val120 = result[10];
      expect(val120).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0740
     * @tc.name testTypedUArraysOfPart202_074
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('10'), BigInt('9'), BigInt('8'), BigInt('7'), BigInt('6'), BigInt('5'), BigInt('4'), BigInt('3'), BigInt('2'), BigInt('1'), BigInt('0'));
      expect(result.length).assertEqual(11);
      const val121 = result[0];
      expect(val121).assertEqual(10n);
      const val122 = result[10];
      expect(val122).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0750
     * @tc.name testTypedUArraysOfPart202_075
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('10'), BigInt('9'), BigInt('8'), BigInt('7'), BigInt('6'), BigInt('5'), BigInt('4'), BigInt('3'), BigInt('2'), BigInt('1'), BigInt('0'));
      expect(result.length).assertEqual(11);
      const val123 = result[0];
      expect(val123).assertEqual(10n);
      const val124 = result[10];
      expect(val124).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0760
     * @tc.name testTypedUArraysOfPart202_076
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0770
     * @tc.name testTypedUArraysOfPart202_077
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0780
     * @tc.name testTypedUArraysOfPart202_078
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 4, 8, 16, 32, 64, 128);
      expect(result.length).assertEqual(8);
      const val131 = result[0];
      expect(val131).assertEqual(1);
      const val132 = result[7];
      expect(val132).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0790
     * @tc.name testTypedUArraysOfPart202_079
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768);
      expect(result.length).assertEqual(16);
      const val133 = result[0];
      expect(val133).assertEqual(1);
      const val134 = result[15];
      expect(val134).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0800
     * @tc.name testTypedUArraysOfPart202_080
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, 2147483648);
      expect(result.length).assertEqual(32);
      const val135 = result[0];
      expect(val135).assertEqual(1);
      const val136 = result[31];
      expect(val136).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0810
     * @tc.name testTypedUArraysOfPart202_081
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('1'), BigInt('2'), BigInt('4'), BigInt('8'), BigInt('16'), BigInt('32'), BigInt('64'), BigInt('128'));
      expect(result.length).assertEqual(8);
      const val137 = result[0];
      expect(val137).assertEqual(1n);
      const val138 = result[7];
      expect(val138).assertEqual(128n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0820
     * @tc.name testTypedUArraysOfPart202_082
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('1'), BigInt('2'), BigInt('4'), BigInt('8'), BigInt('16'), BigInt('32'), BigInt('64'), BigInt('128'));
      expect(result.length).assertEqual(8);
      const val139 = result[0];
      expect(val139).assertEqual(1n);
      const val140 = result[7];
      expect(val140).assertEqual(128n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0830
     * @tc.name testTypedUArraysOfPart202_083
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0840
     * @tc.name testTypedUArraysOfPart202_084
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0850
     * @tc.name testTypedUArraysOfPart202_085
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0860
     * @tc.name testTypedUArraysOfPart202_086
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47);
      expect(result.length).assertEqual(15);
      const val150 = result[0];
      expect(val150).assertEqual(2);
      const val151 = result[14];
      expect(val151).assertEqual(47);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0870
     * @tc.name testTypedUArraysOfPart202_087
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('2'), BigInt('3'), BigInt('5'), BigInt('7'), BigInt('11'), BigInt('13'), BigInt('17'), BigInt('19'), BigInt('23'), BigInt('29'), BigInt('31'), BigInt('37'), BigInt('41'), BigInt('43'), BigInt('47'));
      expect(result.length).assertEqual(15);
      const val152 = result[0];
      expect(val152).assertEqual(2n);
      const val153 = result[14];
      expect(val153).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0880
     * @tc.name testTypedUArraysOfPart202_088
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('2'), BigInt('3'), BigInt('5'), BigInt('7'), BigInt('11'), BigInt('13'), BigInt('17'), BigInt('19'), BigInt('23'), BigInt('29'), BigInt('31'), BigInt('37'), BigInt('41'), BigInt('43'), BigInt('47'));
      expect(result.length).assertEqual(15);
      const val154 = result[0];
      expect(val154).assertEqual(2n);
      const val155 = result[14];
      expect(val155).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0890
     * @tc.name testTypedUArraysOfPart202_089
     * @tc.desc Verify Uint8Array.of ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(32, 33, 34, 35, 36, 37, 38, 39, 40, 41);
      expect(result.length).assertEqual(10);
      const val156 = result[0];
      expect(val156).assertEqual(32);
      const val157 = result[9];
      expect(val157).assertEqual(41);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0900
     * @tc.name testTypedUArraysOfPart202_090
     * @tc.desc Verify BigInt64Array.of ASCII BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(BigInt('32'), BigInt('33'), BigInt('34'), BigInt('35'), BigInt('36'), BigInt('37'), BigInt('38'), BigInt('39'), BigInt('40'), BigInt('41'));
      expect(result.length).assertEqual(10);
      const val158 = result[0];
      expect(val158).assertEqual(32n);
      const val159 = result[9];
      expect(val159).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0910
     * @tc.name testTypedUArraysOfPart202_091
     * @tc.desc Verify BigUint64Array.of ASCII BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('32'), BigInt('33'), BigInt('34'), BigInt('35'), BigInt('36'), BigInt('37'), BigInt('38'), BigInt('39'), BigInt('40'), BigInt('41'));
      expect(result.length).assertEqual(10);
      const val160 = result[0];
      expect(val160).assertEqual(32n);
      const val161 = result[9];
      expect(val161).assertEqual(41n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0920
     * @tc.name testTypedUArraysOfPart202_092
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0930
     * @tc.name testTypedUArraysOfPart202_093
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0940
     * @tc.name testTypedUArraysOfPart202_094
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0950
     * @tc.name testTypedUArraysOfPart202_095
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0960
     * @tc.name testTypedUArraysOfPart202_096
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0970
     * @tc.name testTypedUArraysOfPart202_097
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0980
     * @tc.name testTypedUArraysOfPart202_098
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_0990
     * @tc.name testTypedUArraysOfPart202_099
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1000
     * @tc.name testTypedUArraysOfPart202_100
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1010
     * @tc.name testTypedUArraysOfPart202_101
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1020
     * @tc.name testTypedUArraysOfPart202_102
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1030
     * @tc.name testTypedUArraysOfPart202_103
     * @tc.desc Verify BigInt64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART202_1040
     * @tc.name testTypedUArraysOfPart202_104
     * @tc.desc Verify BigUint64Array.of BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfPart202_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_0100
     * @tc.name testTypedUArraysClamped001
     * @tc.desc Verify Uint8ClampedArray clamps negative value to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysClamped001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = -1;
      arr[1] = -100;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_0200
     * @tc.name testTypedUArraysClamped002
     * @tc.desc Verify Uint8ClampedArray clamps value over 255 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysClamped002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 256;
      arr[1] = 1000;
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CLAMPED_0300
     * @tc.name testTypedUArraysClamped003
     * @tc.desc Verify Uint8ClampedArray clamps fractional value to nearest integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysClamped003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 1.3;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_0100
     * @tc.name testTypedUArraysSubscript001
     * @tc.desc Verify Uint8Array subscript read write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscript001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_0200
     * @tc.name testTypedUArraysSubscript002
     * @tc.desc Verify BigUint64Array subscript read write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscript002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(3);
      arr[0] = 100n;
      arr[1] = 200n;
      arr[2] = 300n;
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200n);
      expect(arr[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBSCRIPT_0300
     * @tc.name testTypedUArraysSubscript003
     * @tc.desc Verify Uint16Array subscript read write with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubscript003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(2);
      arr[0] = 0;
      arr[1] = 65535;
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DEFAULTITER_0100
     * @tc.name testTypedUArraysDefaultIter001
     * @tc.desc Verify Uint8Array default iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let sum: number = 0;
      for (const val of arr) {
        sum = sum + val;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_DEFAULTITER_0200
     * @tc.name testTypedUArraysDefaultIter002
     * @tc.desc Verify BigUint64Array default iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysDefaultIter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(10n, 20n, 30n);
      let sum: BigInt = 0n;
      for (const val of arr) {
        sum = sum + val;
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_ARRAY_0100
     * @tc.name testTypedUArraysConstructorArray001
     * @tc.desc Verify Uint8Array constructor from plain array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_ARRAY_0200
     * @tc.name testTypedUArraysConstructorArray002
     * @tc.desc Verify Uint32Array constructor from plain array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_BUF_0100
     * @tc.name testTypedUArraysConstructorBuf001
     * @tc.desc Verify Uint8Array constructor from ArrayBuffer with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorBuf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_BUF_0200
     * @tc.name testTypedUArraysConstructorBuf002
     * @tc.desc Verify Uint16Array constructor from ArrayBuffer with byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorBuf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REVERSE_0100
     * @tc.name testTypedUArraysReverse001
     * @tc.desc Verify Uint8Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReverse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING_0100
     * @tc.name testTypedUArraysToString01
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('100'), BigInt('200'), BigInt('300'));
      const str = result.toString();
      expect(str).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_JOIN_0100
     * @tc.name testTypedUArraysJoin01
     * @tc.desc Verify BigUint64Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysJoin01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('10'), BigInt('20'), BigInt('30'));
      const joined = result.join('-');
      expect(joined).assertEqual('10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDLASTINDEX_0100
     * @tc.name testTypedUArraysFindLastIndex001
     * @tc.desc Verify Uint8Array findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindLastIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 2, 1);
      const idx = result.findLastIndex((x: number) => x === 2);
      expect(idx).assertEqual(3);
    });

  });
}
