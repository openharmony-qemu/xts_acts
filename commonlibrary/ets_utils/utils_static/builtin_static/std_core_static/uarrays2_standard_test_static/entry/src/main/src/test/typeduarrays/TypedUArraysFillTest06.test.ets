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

export default function typedUArraysFillTest06(): void {
  describe('TypedUArraysFillTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0100
     * @tc.name testTypedUArraysFillPart302_001
     * @tc.desc Verify fill BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.fill(100n);
      const val0 = result[0];
      expect(val0).assertEqual(100n);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0200
     * @tc.name testTypedUArraysFillPart302_002
     * @tc.desc Verify fill Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7, 7]);
      let result = arr.fill(33);
      const val1 = result[0];
      expect(val1).assertEqual(33);
      const val2 = result[1];
      expect(val2).assertEqual(33);
      const val3 = result[2];
      expect(val3).assertEqual(33);
      const val4 = result[3];
      expect(val4).assertEqual(33);
      const val5 = result[4];
      expect(val5).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0300
     * @tc.name testTypedUArraysFillPart302_003
     * @tc.desc Verify fill Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF]);
      let result = arr.fill(0x1234);
      const val6 = result[0];
      expect(val6).assertEqual(0x1234);
      const val7 = result[1];
      expect(val7).assertEqual(0x1234);
      const val8 = result[2];
      expect(val8).assertEqual(0x1234);
      const val9 = result[3];
      expect(val9).assertEqual(0x1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0400
     * @tc.name testTypedUArraysFillPart302_004
     * @tc.desc Verify fill Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF]);
      let result = arr.fill(0xDEADBEEF);
      const val10 = result[0];
      expect(val10).assertEqual(0xDEADBEEF);
      const val11 = result[1];
      expect(val11).assertEqual(0xDEADBEEF);
      const val12 = result[2];
      expect(val12).assertEqual(0xDEADBEEF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0500
     * @tc.name testTypedUArraysFillPart302_005
     * @tc.desc Verify fill Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255, 255, 255]);
      let result = arr.fill(128);
      const val13 = result[0];
      expect(val13).assertEqual(128);
      const val14 = result[1];
      expect(val14).assertEqual(128);
      const val15 = result[2];
      expect(val15).assertEqual(128);
      const val16 = result[3];
      expect(val16).assertEqual(128);
      const val17 = result[4];
      expect(val17).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0600
     * @tc.name testTypedUArraysFillPart302_006
     * @tc.desc Verify fill BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      let result = arr.fill(42n);
      const val18 = result[0];
      expect(val18).assertEqual(42n);
      const val19 = result[1];
      expect(val19).assertEqual(42n);
      const val20 = result[2];
      expect(val20).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0700
     * @tc.name testTypedUArraysFillPart302_007
     * @tc.desc Verify value undefined 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99);
      const val0 = result[0];
      expect(val0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0800
     * @tc.name testTypedUArraysFillPart302_008
     * @tc.desc Verify value undefined 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99);
      const val0 = result[0];
      expect(val0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_0900
     * @tc.name testTypedUArraysFillPart302_009
     * @tc.desc Verify value undefined 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99);
      const val0 = result[0];
      expect(val0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1000
     * @tc.name testTypedUArraysFillPart302_010
     * @tc.desc Verify value undefined 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99);
      const val0 = result[0];
      expect(val0).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1100
     * @tc.name testTypedUArraysFillPart302_011
     * @tc.desc Verify value undefined 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n);
      const val0 = result[0];
      expect(val0).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1200
     * @tc.name testTypedUArraysFillPart302_012
     * @tc.desc Verify start undefined 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, undefined);
      const val46 = result[0];
      expect(val46).assertEqual(99);
      const val47 = result[1];
      expect(val47).assertEqual(99);
      const val48 = result[2];
      expect(val48).assertEqual(99);
      const val49 = result[3];
      expect(val49).assertEqual(99);
      const val50 = result[4];
      expect(val50).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1300
     * @tc.name testTypedUArraysFillPart302_013
     * @tc.desc Verify start undefined 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, undefined);
      const val51 = result[0];
      expect(val51).assertEqual(99);
      const val52 = result[1];
      expect(val52).assertEqual(99);
      const val53 = result[2];
      expect(val53).assertEqual(99);
      const val54 = result[3];
      expect(val54).assertEqual(99);
      const val55 = result[4];
      expect(val55).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1400
     * @tc.name testTypedUArraysFillPart302_014
     * @tc.desc Verify start undefined 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, undefined);
      const val56 = result[0];
      expect(val56).assertEqual(99);
      const val57 = result[1];
      expect(val57).assertEqual(99);
      const val58 = result[2];
      expect(val58).assertEqual(99);
      const val59 = result[3];
      expect(val59).assertEqual(99);
      const val60 = result[4];
      expect(val60).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1500
     * @tc.name testTypedUArraysFillPart302_015
     * @tc.desc Verify start undefined 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, undefined);
      const val61 = result[0];
      expect(val61).assertEqual(99);
      const val62 = result[1];
      expect(val62).assertEqual(99);
      const val63 = result[2];
      expect(val63).assertEqual(99);
      const val64 = result[3];
      expect(val64).assertEqual(99);
      const val65 = result[4];
      expect(val65).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1600
     * @tc.name testTypedUArraysFillPart302_016
     * @tc.desc Verify start undefined 0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, undefined);
      const val66 = result[0];
      expect(val66).assertEqual(99n);
      const val67 = result[1];
      expect(val67).assertEqual(99n);
      const val68 = result[2];
      expect(val68).assertEqual(99n);
      const val69 = result[3];
      expect(val69).assertEqual(99n);
      const val70 = result[4];
      expect(val70).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1700
     * @tc.name testTypedUArraysFillPart302_017
     * @tc.desc Verify end undefined length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(77, 1, undefined);
      const val71 = result[0];
      expect(val71).assertEqual(1);
      const val72 = result[1];
      expect(val72).assertEqual(77);
      const val73 = result[2];
      expect(val73).assertEqual(77);
      const val74 = result[3];
      expect(val74).assertEqual(77);
      const val75 = result[4];
      expect(val75).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1800
     * @tc.name testTypedUArraysFillPart302_018
     * @tc.desc Verify end undefined length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(77, 1, undefined);
      const val76 = result[0];
      expect(val76).assertEqual(1);
      const val77 = result[1];
      expect(val77).assertEqual(77);
      const val78 = result[2];
      expect(val78).assertEqual(77);
      const val79 = result[3];
      expect(val79).assertEqual(77);
      const val80 = result[4];
      expect(val80).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_1900
     * @tc.name testTypedUArraysFillPart302_019
     * @tc.desc Verify end undefined length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(77, 1, undefined);
      const val81 = result[0];
      expect(val81).assertEqual(1);
      const val82 = result[1];
      expect(val82).assertEqual(77);
      const val83 = result[2];
      expect(val83).assertEqual(77);
      const val84 = result[3];
      expect(val84).assertEqual(77);
      const val85 = result[4];
      expect(val85).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2000
     * @tc.name testTypedUArraysFillPart302_020
     * @tc.desc Verify end undefined length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(77, 1, undefined);
      const val86 = result[0];
      expect(val86).assertEqual(1);
      const val87 = result[1];
      expect(val87).assertEqual(77);
      const val88 = result[2];
      expect(val88).assertEqual(77);
      const val89 = result[3];
      expect(val89).assertEqual(77);
      const val90 = result[4];
      expect(val90).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2100
     * @tc.name testTypedUArraysFillPart302_021
     * @tc.desc Verify end undefined length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(77n, 1, undefined);
      const val91 = result[0];
      expect(val91).assertEqual(1n);
      const val92 = result[1];
      expect(val92).assertEqual(77n);
      const val93 = result[2];
      expect(val93).assertEqual(77n);
      const val94 = result[3];
      expect(val94).assertEqual(77n);
      const val95 = result[4];
      expect(val95).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2200
     * @tc.name testTypedUArraysFillPart302_022
     * @tc.desc Verify value NaN 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val96 = result[0];
      expect(val96).assertEqual(0);
      const val97 = result[1];
      expect(val97).assertEqual(0);
      const val98 = result[2];
      expect(val98).assertEqual(0);
      const val99 = result[3];
      expect(val99).assertEqual(0);
      const val100 = result[4];
      expect(val100).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2300
     * @tc.name testTypedUArraysFillPart302_023
     * @tc.desc Verify value NaN 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val101 = result[0];
      expect(val101).assertEqual(0);
      const val102 = result[1];
      expect(val102).assertEqual(0);
      const val103 = result[2];
      expect(val103).assertEqual(0);
      const val104 = result[3];
      expect(val104).assertEqual(0);
      const val105 = result[4];
      expect(val105).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2400
     * @tc.name testTypedUArraysFillPart302_024
     * @tc.desc Verify value NaN 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val106 = result[0];
      expect(val106).assertEqual(0);
      const val107 = result[1];
      expect(val107).assertEqual(0);
      const val108 = result[2];
      expect(val108).assertEqual(0);
      const val109 = result[3];
      expect(val109).assertEqual(0);
      const val110 = result[4];
      expect(val110).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2500
     * @tc.name testTypedUArraysFillPart302_025
     * @tc.desc Verify value NaN 0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val111 = result[0];
      expect(val111).assertEqual(0);
      const val112 = result[1];
      expect(val112).assertEqual(0);
      const val113 = result[2];
      expect(val113).assertEqual(0);
      const val114 = result[3];
      expect(val114).assertEqual(0);
      const val115 = result[4];
      expect(val115).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2600
     * @tc.name testTypedUArraysFillPart302_026
     * @tc.desc Verify value NaN 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n);
      const val116 = result[0];
      expect(val116).assertEqual(0n);
      const val117 = result[1];
      expect(val117).assertEqual(0n);
      const val118 = result[2];
      expect(val118).assertEqual(0n);
      const val119 = result[3];
      expect(val119).assertEqual(0n);
      const val120 = result[4];
      expect(val120).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2700
     * @tc.name testTypedUArraysFillPart302_027
     * @tc.desc Verify start end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      const val121 = result[0];
      expect(val121).assertEqual(1);
      const val122 = result[1];
      expect(val122).assertEqual(2);
      const val123 = result[2];
      expect(val123).assertEqual(3);
      const val124 = result[3];
      expect(val124).assertEqual(4);
      const val125 = result[4];
      expect(val125).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2800
     * @tc.name testTypedUArraysFillPart302_028
     * @tc.desc Verify start end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      const val126 = result[0];
      expect(val126).assertEqual(1);
      const val127 = result[1];
      expect(val127).assertEqual(2);
      const val128 = result[2];
      expect(val128).assertEqual(3);
      const val129 = result[3];
      expect(val129).assertEqual(4);
      const val130 = result[4];
      expect(val130).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_2900
     * @tc.name testTypedUArraysFillPart302_029
     * @tc.desc Verify start end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      const val131 = result[0];
      expect(val131).assertEqual(1);
      const val132 = result[1];
      expect(val132).assertEqual(2);
      const val133 = result[2];
      expect(val133).assertEqual(3);
      const val134 = result[3];
      expect(val134).assertEqual(4);
      const val135 = result[4];
      expect(val135).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3000
     * @tc.name testTypedUArraysFillPart302_030
     * @tc.desc Verify start end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      const val136 = result[0];
      expect(val136).assertEqual(1);
      const val137 = result[1];
      expect(val137).assertEqual(2);
      const val138 = result[2];
      expect(val138).assertEqual(3);
      const val139 = result[3];
      expect(val139).assertEqual(4);
      const val140 = result[4];
      expect(val140).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3100
     * @tc.name testTypedUArraysFillPart302_031
     * @tc.desc Verify start end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, 3, 1);
      const val141 = result[0];
      expect(val141).assertEqual(1n);
      const val142 = result[1];
      expect(val142).assertEqual(2n);
      const val143 = result[2];
      expect(val143).assertEqual(3n);
      const val144 = result[3];
      expect(val144).assertEqual(4n);
      const val145 = result[4];
      expect(val145).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3200
     * @tc.name testTypedUArraysFillPart302_032
     * @tc.desc Verify start end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      const val146 = result[0];
      expect(val146).assertEqual(1);
      const val147 = result[1];
      expect(val147).assertEqual(2);
      const val148 = result[2];
      expect(val148).assertEqual(3);
      const val149 = result[3];
      expect(val149).assertEqual(4);
      const val150 = result[4];
      expect(val150).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3300
     * @tc.name testTypedUArraysFillPart302_033
     * @tc.desc Verify start end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      const val151 = result[0];
      expect(val151).assertEqual(1);
      const val152 = result[1];
      expect(val152).assertEqual(2);
      const val153 = result[2];
      expect(val153).assertEqual(3);
      const val154 = result[3];
      expect(val154).assertEqual(4);
      const val155 = result[4];
      expect(val155).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3400
     * @tc.name testTypedUArraysFillPart302_034
     * @tc.desc Verify start end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      const val156 = result[0];
      expect(val156).assertEqual(1);
      const val157 = result[1];
      expect(val157).assertEqual(2);
      const val158 = result[2];
      expect(val158).assertEqual(3);
      const val159 = result[3];
      expect(val159).assertEqual(4);
      const val160 = result[4];
      expect(val160).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3500
     * @tc.name testTypedUArraysFillPart302_035
     * @tc.desc Verify start end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      const val161 = result[0];
      expect(val161).assertEqual(1);
      const val162 = result[1];
      expect(val162).assertEqual(2);
      const val163 = result[2];
      expect(val163).assertEqual(3);
      const val164 = result[3];
      expect(val164).assertEqual(4);
      const val165 = result[4];
      expect(val165).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART302_3600
     * @tc.name testTypedUArraysFillPart302_036
     * @tc.desc Verify start end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart302_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, 2, 2);
      const val166 = result[0];
      expect(val166).assertEqual(1n);
      const val167 = result[1];
      expect(val167).assertEqual(2n);
      const val168 = result[2];
      expect(val168).assertEqual(3n);
      const val169 = result[3];
      expect(val169).assertEqual(4n);
      const val170 = result[4];
      expect(val170).assertEqual(5n);
    });

  });
}
