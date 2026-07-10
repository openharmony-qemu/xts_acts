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

export default function typedUArraysCopyWithinTest01(): void {
  describe('TypedUArraysCopyWithinTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0100
     * @tc.name testTypedUArraysCopyWithinPart101_001
     * @tc.desc Verify copyWithin 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        throw new Error('invalid copyWithin call');
      } catch (e) {
        expect(true).assertTrue();
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0200
     * @tc.name testTypedUArraysCopyWithinPart101_002
     * @tc.desc Verify copyWithin 0 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      try {
        throw new Error('invalid copyWithin call');
      } catch (e) {
        expect(true).assertTrue();
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0300
     * @tc.name testTypedUArraysCopyWithinPart101_003
     * @tc.desc Verify copyWithin 1 - target=0 start/end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(5);
      const val0 = result[0];
      expect(val0).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0400
     * @tc.name testTypedUArraysCopyWithinPart101_004
     * @tc.desc Verify copyWithin 1 - target=2 start/end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, 0);
      expect(result.length).assertEqual(5);
      const val1 = result[2];
      expect(val1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0500
     * @tc.name testTypedUArraysCopyWithinPart101_005
     * @tc.desc Verify copyWithin 1 - target=3 start/end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(3, 0);
      expect(result.length).assertEqual(5);
      const val2 = result[3];
      expect(val2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0600
     * @tc.name testTypedUArraysCopyWithinPart101_006
     * @tc.desc Verify copyWithin 1 - target=1 start/end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      expect(result.length).assertEqual(5);
      const val3 = result[1];
      expect(val3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0700
     * @tc.name testTypedUArraysCopyWithinPart101_007
     * @tc.desc Verify copyWithin 1 - target=1 start/end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      expect(result.length).assertEqual(5);
      const val4 = result[1];
      expect(val4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0800
     * @tc.name testTypedUArraysCopyWithinPart101_008
     * @tc.desc Verify copyWithin 1 - target=1 start/end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(1, 0);
      expect(result.length).assertEqual(5);
      const val5 = result[1];
      expect(val5).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0900
     * @tc.name testTypedUArraysCopyWithinPart101_009
     * @tc.desc Verify copyWithin 2 - target=0 start=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val6 = result[0];
      expect(val6).assertEqual(3);
      const val7 = result[1];
      expect(val7).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1000
     * @tc.name testTypedUArraysCopyWithinPart101_010
     * @tc.desc Verify copyWithin 2 - target=1 start=3 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 3);
      const val8 = result[1];
      expect(val8).assertEqual(4);
      const val9 = result[2];
      expect(val9).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1100
     * @tc.name testTypedUArraysCopyWithinPart101_011
     * @tc.desc Verify copyWithin 2 - target=0 start=1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.copyWithin(0, 1);
      const val10 = result[0];
      expect(val10).assertEqual(20);
      const val11 = result[1];
      expect(val11).assertEqual(30);
      const val12 = result[2];
      expect(val12).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1200
     * @tc.name testTypedUArraysCopyWithinPart101_012
     * @tc.desc Verify copyWithin 2 - target=2 start=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.copyWithin(2, 0);
      const val13 = result[2];
      expect(val13).assertEqual(100);
      const val14 = result[3];
      expect(val14).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1300
     * @tc.name testTypedUArraysCopyWithinPart101_013
     * @tc.desc Verify copyWithin 2 - target=0 start=2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 2);
      const val15 = result[0];
      expect(val15).assertEqual(3n);
      const val16 = result[1];
      expect(val16).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1400
     * @tc.name testTypedUArraysCopyWithinPart101_014
     * @tc.desc Verify copyWithin 3 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val17 = result[0]; expect(val17).assertEqual(1);
      const val18 = result[1]; expect(val18).assertEqual(2);
      const val19 = result[2]; expect(val19).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1500
     * @tc.name testTypedUArraysCopyWithinPart101_015
     * @tc.desc Verify copyWithin 3 - end length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val20 = result[0]; expect(val20).assertEqual(1);
      const val21 = result[1]; expect(val21).assertEqual(2);
      const val22 = result[2]; expect(val22).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1600
     * @tc.name testTypedUArraysCopyWithinPart101_016
     * @tc.desc Verify copyWithin 3 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val23 = result[0]; expect(val23).assertEqual(1);
      const val24 = result[1]; expect(val24).assertEqual(2);
      const val25 = result[2]; expect(val25).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1700
     * @tc.name testTypedUArraysCopyWithinPart101_017
     * @tc.desc Verify copyWithin 3 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.copyWithin(0, 0);
      const val26 = result[0]; expect(val26).assertEqual(10);
      const val27 = result[1]; expect(val27).assertEqual(20);
      const val28 = result[2]; expect(val28).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1800
     * @tc.name testTypedUArraysCopyWithinPart101_018
     * @tc.desc Verify copyWithin 3 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.copyWithin(0, 0);
      const val29 = result[0]; expect(val29).assertEqual(100);
      const val30 = result[1]; expect(val30).assertEqual(200);
      const val31 = result[2]; expect(val31).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_1900
     * @tc.name testTypedUArraysCopyWithinPart101_019
     * @tc.desc Verify copyWithin 3 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val32 = result[0]; expect(val32).assertEqual(1n);
      const val33 = result[1]; expect(val33).assertEqual(2n);
      const val34 = result[2]; expect(val34).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2000
     * @tc.name testTypedUArraysCopyWithinPart101_020
     * @tc.desc Verify target=0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val35 = result[0];
      expect(val35).assertEqual(3);
      const val36 = result[1];
      expect(val36).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2100
     * @tc.name testTypedUArraysCopyWithinPart101_021
     * @tc.desc Verify target=1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      const val37 = result[1]; expect(val37).assertEqual(1);
      const val38 = result[2]; expect(val38).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2200
     * @tc.name testTypedUArraysCopyWithinPart101_022
     * @tc.desc Verify target=2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, 0);
      const val39 = result[2];
      expect(val39).assertEqual(1);
      const val40 = result[3];
      expect(val40).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2300
     * @tc.name testTypedUArraysCopyWithinPart101_023
     * @tc.desc Verify target=length-1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(4, 0);
      const val41 = result[4]; expect(val41).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2400
     * @tc.name testTypedUArraysCopyWithinPart101_024
     * @tc.desc Verify target=length - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
      const val42 = result[0];
      expect(val42).assertEqual(1);
      const val43 = result[1];
      expect(val43).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2500
     * @tc.name testTypedUArraysCopyWithinPart101_025
     * @tc.desc Verify target=length+1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(6, 0);
      expect(result.length).assertEqual(5);
      const val44 = result[0];
      expect(val44).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2600
     * @tc.name testTypedUArraysCopyWithinPart101_026
     * @tc.desc Verify target=-1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-1, 0);
      const val45 = result[4];
      expect(val45).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2700
     * @tc.name testTypedUArraysCopyWithinPart101_027
     * @tc.desc Verify target=-2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val46 = result[3];
      expect(val46).assertEqual(1);
      const val47 = result[4];
      expect(val47).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2800
     * @tc.name testTypedUArraysCopyWithinPart101_028
     * @tc.desc Verify target=-3 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-3, 0);
      const val48 = result[2];
      expect(val48).assertEqual(1);
      const val49 = result[3];
      expect(val49).assertEqual(2);
      const val50 = result[4];
      expect(val50).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_2900
     * @tc.name testTypedUArraysCopyWithinPart101_029
     * @tc.desc Verify target=-length - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-5, 0);
      const val51 = result[0]; expect(val51).assertEqual(1);
      const val52 = result[1]; expect(val52).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3000
     * @tc.name testTypedUArraysCopyWithinPart101_030
     * @tc.desc Verify target=-length-1 - 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-5, 0);
      const val53 = result[0]; expect(val53).assertEqual(1);
      const val54 = result[1]; expect(val54).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3100
     * @tc.name testTypedUArraysCopyWithinPart101_031
     * @tc.desc Verify target=-length-2 - 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-5, 0);
      const val55 = result[0]; expect(val55).assertEqual(1);
      const val56 = result[1]; expect(val56).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3200
     * @tc.name testTypedUArraysCopyWithinPart101_032
     * @tc.desc Verify target= - length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(100, 0);
      expect(result.length).assertEqual(5);
      const val57 = result[0];
      expect(val57).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3300
     * @tc.name testTypedUArraysCopyWithinPart101_033
     * @tc.desc Verify target= - -length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-5, 0);
      const val58 = result[0]; expect(val58).assertEqual(1);
      const val59 = result[1]; expect(val59).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3400
     * @tc.name testTypedUArraysCopyWithinPart101_034
     * @tc.desc Verify target=0x1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x1, 0);
      const val60 = result[1]; expect(val60).assertEqual(1);
      const val61 = result[2]; expect(val61).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3500
     * @tc.name testTypedUArraysCopyWithinPart101_035
     * @tc.desc Verify target=0o1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0o1, 0);
      const val62 = result[1]; expect(val62).assertEqual(1);
      const val63 = result[2]; expect(val63).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3600
     * @tc.name testTypedUArraysCopyWithinPart101_036
     * @tc.desc Verify target=0b1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0b1, 0);
      const val64 = result[1]; expect(val64).assertEqual(1);
      const val65 = result[2]; expect(val65).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3700
     * @tc.name testTypedUArraysCopyWithinPart101_037
     * @tc.desc Verify target=0xFF - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0xFF, 0);
      expect(result.length).assertEqual(5);
      const val66 = result[0];
      expect(val66).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3800
     * @tc.name testTypedUArraysCopyWithinPart101_038
     * @tc.desc Verify target=0x100 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x100, 0);
      expect(result.length).assertEqual(5);
      const val67 = result[0];
      expect(val67).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_3900
     * @tc.name testTypedUArraysCopyWithinPart101_039
     * @tc.desc Verify target=0x80 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x80, 0);
      expect(result.length).assertEqual(5);
      const val68 = result[0];
      expect(val68).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4000
     * @tc.name testTypedUArraysCopyWithinPart101_040
     * @tc.desc Verify target=0 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val69 = result[0];
      expect(val69).assertEqual(3);
      const val70 = result[1];
      expect(val70).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4100
     * @tc.name testTypedUArraysCopyWithinPart101_041
     * @tc.desc Verify target=1 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.copyWithin(1, 0);
      const val71 = result[1]; expect(val71).assertEqual(10);
      const val72 = result[2]; expect(val72).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4200
     * @tc.name testTypedUArraysCopyWithinPart101_042
     * @tc.desc Verify target=-1 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.copyWithin(-1, 0);
      const val73 = result[4];
      expect(val73).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4300
     * @tc.name testTypedUArraysCopyWithinPart101_043
     * @tc.desc Verify target=-2 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(-2, 0);
      const val74 = result[3];
      expect(val74).assertEqual(1n);
      const val75 = result[4];
      expect(val75).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4400
     * @tc.name testTypedUArraysCopyWithinPart101_044
     * @tc.desc Verify target=0x7FFF - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x7FFF, 0);
      expect(result.length).assertEqual(5);
      const val76 = result[0];
      expect(val76).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4500
     * @tc.name testTypedUArraysCopyWithinPart101_045
     * @tc.desc Verify target=0x8000 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x8000, 0);
      expect(result.length).assertEqual(5);
      const val77 = result[0];
      expect(val77).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4600
     * @tc.name testTypedUArraysCopyWithinPart101_046
     * @tc.desc Verify target=0xFFFFFFFF - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr;
      expect(result.length).assertEqual(5);
      const val78 = result[0];
      expect(val78).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4700
     * @tc.name testTypedUArraysCopyWithinPart101_047
     * @tc.desc Verify target=0x100000000 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr;
      expect(result.length).assertEqual(5);
      const val79 = result[0];
      expect(val79).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4800
     * @tc.name testTypedUArraysCopyWithinPart101_048
     * @tc.desc Verify target=0x2 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.copyWithin(0x2, 0);
      const val80 = result[2]; expect(val80).assertEqual(10);
      const val81 = result[3]; expect(val81).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_4900
     * @tc.name testTypedUArraysCopyWithinPart101_049
     * @tc.desc Verify target=0o2 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.copyWithin(0o2, 0);
      const val82 = result[2]; expect(val82).assertEqual(100);
      const val83 = result[3]; expect(val83).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5000
     * @tc.name testTypedUArraysCopyWithinPart101_050
     * @tc.desc Verify target=0b10 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 2);
      const valx = result[0];
      expect(valx).assertEqual(3n);
      const valy = result[1];
      expect(valy).assertEqual(4n);
      const valz = result[2];
      expect(valz).assertEqual(5n);
    });

  });
}
