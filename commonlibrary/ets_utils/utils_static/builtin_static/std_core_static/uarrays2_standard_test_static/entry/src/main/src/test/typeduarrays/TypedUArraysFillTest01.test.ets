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

export default function typedUArraysFillTest01(): void {
  describe('TypedUArraysFillTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0100
     * @tc.name testTypedUArraysFillPart101_001
     * @tc.desc Verify fill 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0200
     * @tc.name testTypedUArraysFillPart101_002
     * @tc.desc Verify fill 0 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0300
     * @tc.name testTypedUArraysFillPart101_003
     * @tc.desc Verify fill 0 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0400
     * @tc.name testTypedUArraysFillPart101_004
     * @tc.desc Verify fill 0 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0500
     * @tc.name testTypedUArraysFillPart101_005
     * @tc.desc Verify fill 0 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.fill(0n);
      const val0 = arr[0];
      expect(val0).assertEqual(0n);
      const val1 = arr[1];
      expect(val1).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0600
     * @tc.name testTypedUArraysFillPart101_006
     * @tc.desc Verify fill 1 - value=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val2 = result[0];
      expect(val2).assertEqual(0);
      const val3 = result[1];
      expect(val3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0700
     * @tc.name testTypedUArraysFillPart101_007
     * @tc.desc Verify fill 1 - value=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val4 = result[0];
      expect(val4).assertEqual(0);
      const val5 = result[1];
      expect(val5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0800
     * @tc.name testTypedUArraysFillPart101_008
     * @tc.desc Verify fill 1 - value=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      const val6 = result[0];
      expect(val6).assertEqual(0);
      const val7 = result[1];
      expect(val7).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0900
     * @tc.name testTypedUArraysFillPart101_009
     * @tc.desc Verify fill 1 - value=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n);
      const val8 = result[0];
      expect(val8).assertEqual(0n);
      const val9 = result[1];
      expect(val9).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1000
     * @tc.name testTypedUArraysFillPart101_010
     * @tc.desc Verify fill 2 - value=1 start=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 2);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[2];
      expect(val11).assertEqual(1);
      const val12 = result[3];
      expect(val12).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1100
     * @tc.name testTypedUArraysFillPart101_011
     * @tc.desc Verify fill 2 - value=1 start=2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 2);
      const val13 = result[0];
      expect(val13).assertEqual(1);
      const val14 = result[2];
      expect(val14).assertEqual(1);
      const val15 = result[3];
      expect(val15).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1200
     * @tc.name testTypedUArraysFillPart101_012
     * @tc.desc Verify fill 2 - value=1 start=2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 2);
      const val16 = result[0];
      expect(val16).assertEqual(1);
      const val17 = result[2];
      expect(val17).assertEqual(1);
      const val18 = result[3];
      expect(val18).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1300
     * @tc.name testTypedUArraysFillPart101_013
     * @tc.desc Verify fill 2 - value=1 start=2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 2);
      const val19 = result[0];
      expect(val19).assertEqual(1);
      const val20 = result[2];
      expect(val20).assertEqual(1);
      const val21 = result[3];
      expect(val21).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1400
     * @tc.name testTypedUArraysFillPart101_014
     * @tc.desc Verify fill 2 - value=1n start=2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(1n, 2);
      const val22 = result[0];
      expect(val22).assertEqual(1n);
      const val23 = result[2];
      expect(val23).assertEqual(1n);
      const val24 = result[3];
      expect(val24).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1500
     * @tc.name testTypedUArraysFillPart101_015
     * @tc.desc Verify fill 3 - value=1 start=1 end=3 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 1, 3);
      const val25 = result[0];
      expect(val25).assertEqual(1);
      const val26 = result[1];
      expect(val26).assertEqual(1);
      const val27 = result[2];
      expect(val27).assertEqual(1);
      const val28 = result[3];
      expect(val28).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1600
     * @tc.name testTypedUArraysFillPart101_016
     * @tc.desc Verify fill 3 - value=1 start=1 end=3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 1, 3);
      const val29 = result[0];
      expect(val29).assertEqual(1);
      const val30 = result[1];
      expect(val30).assertEqual(1);
      const val31 = result[2];
      expect(val31).assertEqual(1);
      const val32 = result[3];
      expect(val32).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1700
     * @tc.name testTypedUArraysFillPart101_017
     * @tc.desc Verify fill 3 - value=1 start=1 end=3 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 1, 3);
      const val33 = result[0];
      expect(val33).assertEqual(1);
      const val34 = result[1];
      expect(val34).assertEqual(1);
      const val35 = result[2];
      expect(val35).assertEqual(1);
      const val36 = result[3];
      expect(val36).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1800
     * @tc.name testTypedUArraysFillPart101_018
     * @tc.desc Verify fill 3 - value=1 start=1 end=3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(1, 1, 3);
      const val37 = result[0];
      expect(val37).assertEqual(1);
      const val38 = result[1];
      expect(val38).assertEqual(1);
      const val39 = result[2];
      expect(val39).assertEqual(1);
      const val40 = result[3];
      expect(val40).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_1900
     * @tc.name testTypedUArraysFillPart101_019
     * @tc.desc Verify fill 3 - value=1n start=1 end=3 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(1n, 1, 3);
      const val41 = result[0];
      expect(val41).assertEqual(1n);
      const val42 = result[1];
      expect(val42).assertEqual(1n);
      const val43 = result[2];
      expect(val43).assertEqual(1n);
      const val44 = result[3];
      expect(val44).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2000
     * @tc.name testTypedUArraysFillPart101_020
     * @tc.desc Verify value=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.fill(0);
      const val45 = arr[0] ;
      expect(val45).assertEqual(0);
      const val46 = arr[1] ;
      expect(val46).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2100
     * @tc.name testTypedUArraysFillPart101_021
     * @tc.desc Verify value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(1);
      const val47 = arr[0] ;
      expect(val47).assertEqual(1);
      const val48 = arr[1] ;
      expect(val48).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2200
     * @tc.name testTypedUArraysFillPart101_022
     * @tc.desc Verify value=127 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(127);
      const val49 = arr[0] ;
      expect(val49).assertEqual(127);
      const val50 = arr[1] ;
      expect(val50).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2300
     * @tc.name testTypedUArraysFillPart101_023
     * @tc.desc Verify value=255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(255);
      const val51 = arr[0] ;
      expect(val51).assertEqual(255);
      const val52 = arr[1] ;
      expect(val52).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2400
     * @tc.name testTypedUArraysFillPart101_024
     * @tc.desc Verify value=0xFF Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(0xFF);
      const val53 = arr[0] ;
      expect(val53).assertEqual(255);
      const val54 = arr[1] ;
      expect(val54).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2500
     * @tc.name testTypedUArraysFillPart101_025
     * @tc.desc Verify value=0x80 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(0x80);
      const val55 = arr[0] ;
      expect(val55).assertEqual(128);
      const val56 = arr[1] ;
      expect(val56).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2600
     * @tc.name testTypedUArraysFillPart101_026
     * @tc.desc Verify value=-1 Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(-1);
      const val57 = arr[0] ;
      expect(val57).assertEqual(255);
      const val58 = arr[1] ;
      expect(val58).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2700
     * @tc.name testTypedUArraysFillPart101_027
     * @tc.desc Verify value=256 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(256);
      const val59 = arr[0] ;
      expect(val59).assertEqual(0);
      const val60 = arr[1] ;
      expect(val60).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2800
     * @tc.name testTypedUArraysFillPart101_028
     * @tc.desc Verify value=0x100 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(0x100);
      const val61 = arr[0] ;
      expect(val61).assertEqual(0);
      const val62 = arr[1] ;
      expect(val62).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_2900
     * @tc.name testTypedUArraysFillPart101_029
     * @tc.desc Verify value=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      arr.fill(0);
      const val63 = arr[0] ;
      expect(val63).assertEqual(0);
      const val64 = arr[1] ;
      expect(val64).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3000
     * @tc.name testTypedUArraysFillPart101_030
     * @tc.desc Verify value=1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(1);
      const val65 = arr[0] ;
      expect(val65).assertEqual(1);
      const val66 = arr[1] ;
      expect(val66).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3100
     * @tc.name testTypedUArraysFillPart101_031
     * @tc.desc Verify value=32767 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(32767);
      const val67 = arr[0] ;
      expect(val67).assertEqual(32767);
      const val68 = arr[1] ;
      expect(val68).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3200
     * @tc.name testTypedUArraysFillPart101_032
     * @tc.desc Verify value=65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(65535);
      const val69 = arr[0] ;
      expect(val69).assertEqual(65535);
      const val70 = arr[1] ;
      expect(val70).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3300
     * @tc.name testTypedUArraysFillPart101_033
     * @tc.desc Verify value=0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(0xFFFF);
      const val71 = arr[0] ;
      expect(val71).assertEqual(65535);
      const val72 = arr[1] ;
      expect(val72).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3400
     * @tc.name testTypedUArraysFillPart101_034
     * @tc.desc Verify value=0x8000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(0x8000);
      const val73 = arr[0] ;
      expect(val73).assertEqual(32768);
      const val74 = arr[1] ;
      expect(val74).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3500
     * @tc.name testTypedUArraysFillPart101_035
     * @tc.desc Verify value=-1 Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(-1);
      const val75 = arr[0] ;
      expect(val75).assertEqual(65535);
      const val76 = arr[1] ;
      expect(val76).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3600
     * @tc.name testTypedUArraysFillPart101_036
     * @tc.desc Verify value=65536 Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(65536);
      const val77 = arr[0] ;
      expect(val77).assertEqual(0);
      const val78 = arr[1] ;
      expect(val78).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3700
     * @tc.name testTypedUArraysFillPart101_037
     * @tc.desc Verify value=0x10000 Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(0x10000);
      const val79 = arr[0] ;
      expect(val79).assertEqual(0);
      const val80 = arr[1] ;
      expect(val80).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3800
     * @tc.name testTypedUArraysFillPart101_038
     * @tc.desc Verify value=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      arr.fill(0);
      const val81 = arr[0] ;
      expect(val81).assertEqual(0);
      const val82 = arr[1] ;
      expect(val82).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_3900
     * @tc.name testTypedUArraysFillPart101_039
     * @tc.desc Verify value=1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(1);
      const val83 = arr[0] ;
      expect(val83).assertEqual(1);
      const val84 = arr[1] ;
      expect(val84).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4000
     * @tc.name testTypedUArraysFillPart101_040
     * @tc.desc Verify value=2147483647 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(2147483647);
      const val85 = arr[0] ;
      expect(val85).assertEqual(2147483647);
      const val86 = arr[1] ;
      expect(val86).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4100
     * @tc.name testTypedUArraysFillPart101_041
     * @tc.desc Verify value=4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(4294967295);
      const val87 = arr[0] ;
      expect(val87).assertEqual(4294967295);
      const val88 = arr[1] ;
      expect(val88).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4200
     * @tc.name testTypedUArraysFillPart101_042
     * @tc.desc Verify value=0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(0xFFFFFFFF);
      const val89 = arr[0] ;
      expect(val89).assertEqual(4294967295);
      const val90 = arr[1] ;
      expect(val90).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4300
     * @tc.name testTypedUArraysFillPart101_043
     * @tc.desc Verify value=0x80000000 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(0x80000000);
      const val91 = arr[0] ;
      expect(val91).assertEqual(2147483648);
      const val92 = arr[1] ;
      expect(val92).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4400
     * @tc.name testTypedUArraysFillPart101_044
     * @tc.desc Verify value=-1 Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(-1);
      const val93 = arr[0] ;
      expect(val93).assertEqual(4294967295);
      const val94 = arr[1] ;
      expect(val94).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4500
     * @tc.name testTypedUArraysFillPart101_045
     * @tc.desc Verify value=0x100000000 Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(0x100000000);
      const val95 = arr[0] ;
      expect(val95).assertEqual(0);
      const val96 = arr[1] ;
      expect(val96).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4600
     * @tc.name testTypedUArraysFillPart101_046
     * @tc.desc Verify value=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.fill(0);
      const val97 = arr[0] ;
      expect(val97).assertEqual(0);
      const val98 = arr[1] ;
      expect(val98).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4700
     * @tc.name testTypedUArraysFillPart101_047
     * @tc.desc Verify value=1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(1);
      const val99 = arr[0] ;
      expect(val99).assertEqual(1);
      const val100 = arr[1] ;
      expect(val100).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4800
     * @tc.name testTypedUArraysFillPart101_048
     * @tc.desc Verify value=127 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(127);
      const val101 = arr[0] ;
      expect(val101).assertEqual(127);
      const val102 = arr[1] ;
      expect(val102).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_4900
     * @tc.name testTypedUArraysFillPart101_049
     * @tc.desc Verify value=255 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(255);
      const val55 = arr[0];
      expect(val55).assertEqual(255);
      const val56 = arr[1];
      expect(val56).assertEqual(255);
    });

  });
}
