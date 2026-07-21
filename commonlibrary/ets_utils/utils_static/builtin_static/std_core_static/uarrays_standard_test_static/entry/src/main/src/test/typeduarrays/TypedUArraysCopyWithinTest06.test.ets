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

export default function typedUArraysCopyWithinTest06(): void {
  describe('TypedUArraysCopyWithinTest06', (): void => {
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
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0100
     * @tc.name testTypedUArraysCopyWithinPart302_001
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      try {
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0200
     * @tc.name testTypedUArraysCopyWithinPart302_002
     * @tc.desc Verify start Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val0 = result[0];
      expect(val0).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0300
     * @tc.name testTypedUArraysCopyWithinPart302_003
     * @tc.desc Verify start Number.MAX_SAFE_INTEGER Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val1 = result[0];
      expect(val1).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0400
     * @tc.name testTypedUArraysCopyWithinPart302_004
     * @tc.desc Verify start Number.MAX_SAFE_INTEGER Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val2 = result[0];
      expect(val2).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0500
     * @tc.name testTypedUArraysCopyWithinPart302_005
     * @tc.desc Verify start Number.MAX_SAFE_INTEGER Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val3 = result[0];
      expect(val3).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0600
     * @tc.name testTypedUArraysCopyWithinPart302_006
     * @tc.desc Verify start Number.MAX_SAFE_INTEGER BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val4 = result[0];
      expect(val4).assertEqual(1n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0700
     * @tc.name testTypedUArraysCopyWithinPart302_007
     * @tc.desc Verify end Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val5 = result[0]; expect(val5).assertEqual(1);
      const val6 = result[1]; expect(val6).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0800
     * @tc.name testTypedUArraysCopyWithinPart302_008
     * @tc.desc Verify end Number.MAX_SAFE_INTEGER Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val7 = result[0]; expect(val7).assertEqual(1);
      const val8 = result[1]; expect(val8).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_0900
     * @tc.name testTypedUArraysCopyWithinPart302_009
     * @tc.desc Verify end Number.MAX_SAFE_INTEGER Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val9 = result[0]; expect(val9).assertEqual(1);
      const val10 = result[1]; expect(val10).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1000
     * @tc.name testTypedUArraysCopyWithinPart302_010
     * @tc.desc Verify end Number.MAX_SAFE_INTEGER Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val11 = result[0]; expect(val11).assertEqual(1);
      const val12 = result[1]; expect(val12).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1100
     * @tc.name testTypedUArraysCopyWithinPart302_011
     * @tc.desc Verify end Number.MAX_SAFE_INTEGER BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val13 = result[0]; expect(val13).assertEqual(1n);
      const val14 = result[1]; expect(val14).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1200
     * @tc.name testTypedUArraysCopyWithinPart302_012
     * @tc.desc Verify target Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1300
     * @tc.name testTypedUArraysCopyWithinPart302_013
     * @tc.desc Verify target Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      try {
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1400
     * @tc.name testTypedUArraysCopyWithinPart302_014
     * @tc.desc Verify target Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      try {
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1500
     * @tc.name testTypedUArraysCopyWithinPart302_015
     * @tc.desc Verify target Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      try {
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1600
     * @tc.name testTypedUArraysCopyWithinPart302_016
     * @tc.desc Verify target BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      try {
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1700
     * @tc.name testTypedUArraysCopyWithinPart302_017
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, 0);
      const val15 = result[2];
      expect(val15).assertEqual(1);
      const val16 = result[3];
      expect(val16).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1800
     * @tc.name testTypedUArraysCopyWithinPart302_018
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, 0);
      const val17 = result[2];
      expect(val17).assertEqual(1);
      const val18 = result[3];
      expect(val18).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_1900
     * @tc.name testTypedUArraysCopyWithinPart302_019
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, 0);
      const val19 = result[2];
      expect(val19).assertEqual(1);
      const val20 = result[3];
      expect(val20).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2000
     * @tc.name testTypedUArraysCopyWithinPart302_020
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, 0);
      const val21 = result[2];
      expect(val21).assertEqual(1);
      const val22 = result[3];
      expect(val22).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2100
     * @tc.name testTypedUArraysCopyWithinPart302_021
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(2, 0);
      const val23 = result[2];
      expect(val23).assertEqual(1n);
      const val24 = result[3];
      expect(val24).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2200
     * @tc.name testTypedUArraysCopyWithinPart302_022
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val25 = result[0];
      expect(val25).assertEqual(3);
      const val26 = result[1];
      expect(val26).assertEqual(4);
      const val27 = result[2];
      expect(val27).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2300
     * @tc.name testTypedUArraysCopyWithinPart302_023
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val28 = result[0];
      expect(val28).assertEqual(3);
      const val29 = result[1];
      expect(val29).assertEqual(4);
      const val30 = result[2];
      expect(val30).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2400
     * @tc.name testTypedUArraysCopyWithinPart302_024
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val31 = result[0];
      expect(val31).assertEqual(3);
      const val32 = result[1];
      expect(val32).assertEqual(4);
      const val33 = result[2];
      expect(val33).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2500
     * @tc.name testTypedUArraysCopyWithinPart302_025
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val34 = result[0];
      expect(val34).assertEqual(3);
      const val35 = result[1];
      expect(val35).assertEqual(4);
      const val36 = result[2];
      expect(val36).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2600
     * @tc.name testTypedUArraysCopyWithinPart302_026
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 2);
      const val37 = result[0];
      expect(val37).assertEqual(3n);
      const val38 = result[1];
      expect(val38).assertEqual(4n);
      const val39 = result[2];
      expect(val39).assertEqual(5n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2700
     * @tc.name testTypedUArraysCopyWithinPart302_027
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2800
     * @tc.name testTypedUArraysCopyWithinPart302_028
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_2900
     * @tc.name testTypedUArraysCopyWithinPart302_029
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3000
     * @tc.name testTypedUArraysCopyWithinPart302_030
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3100
     * @tc.name testTypedUArraysCopyWithinPart302_031
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(1, 0);
      expect(result).assertEqual(arr);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3200
     * @tc.name testTypedUArraysCopyWithinPart302_032
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3300
     * @tc.name testTypedUArraysCopyWithinPart302_033
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3400
     * @tc.name testTypedUArraysCopyWithinPart302_034
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3500
     * @tc.name testTypedUArraysCopyWithinPart302_035
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3600
     * @tc.name testTypedUArraysCopyWithinPart302_036
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3700
     * @tc.name testTypedUArraysCopyWithinPart302_037
     * @tc.desc Verify start end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val40 = result[0]; expect(val40).assertEqual(1);
      const val41 = result[1]; expect(val41).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3800
     * @tc.name testTypedUArraysCopyWithinPart302_038
     * @tc.desc Verify start end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val42 = result[0]; expect(val42).assertEqual(1);
      const val43 = result[1]; expect(val43).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_3900
     * @tc.name testTypedUArraysCopyWithinPart302_039
     * @tc.desc Verify start end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val44 = result[0]; expect(val44).assertEqual(1);
      const val45 = result[1]; expect(val45).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4000
     * @tc.name testTypedUArraysCopyWithinPart302_040
     * @tc.desc Verify start end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val46 = result[0]; expect(val46).assertEqual(1);
      const val47 = result[1]; expect(val47).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4100
     * @tc.name testTypedUArraysCopyWithinPart302_041
     * @tc.desc Verify start end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val48 = result[0]; expect(val48).assertEqual(1n);
      const val49 = result[1]; expect(val49).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4200
     * @tc.name testTypedUArraysCopyWithinPart302_042
     * @tc.desc Verify start end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val50 = result[0]; expect(val50).assertEqual(1);
      const val51 = result[1]; expect(val51).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4300
     * @tc.name testTypedUArraysCopyWithinPart302_043
     * @tc.desc Verify start end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val52 = result[0]; expect(val52).assertEqual(1);
      const val53 = result[1]; expect(val53).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4400
     * @tc.name testTypedUArraysCopyWithinPart302_044
     * @tc.desc Verify start end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val54 = result[0]; expect(val54).assertEqual(1);
      const val55 = result[1]; expect(val55).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4500
     * @tc.name testTypedUArraysCopyWithinPart302_045
     * @tc.desc Verify start end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val56 = result[0]; expect(val56).assertEqual(1);
      const val57 = result[1]; expect(val57).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4600
     * @tc.name testTypedUArraysCopyWithinPart302_046
     * @tc.desc Verify start end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val58 = result[0]; expect(val58).assertEqual(1n);
      const val59 = result[1]; expect(val59).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4700
     * @tc.name testTypedUArraysCopyWithinPart302_047
     * @tc.desc Verify copyWithin buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 1, 5, 3, 4, 6]);
      let result = arr.copyWithin(0, 0);
      const val60 = result[0];
      expect(val60).assertEqual(arr[2]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4800
     * @tc.name testTypedUArraysCopyWithinPart302_048
     * @tc.desc Verify copyWithin buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([5, 1, 5, 3, 4, 6]);
      let result = arr.copyWithin(0, 0);
      const val61 = result[0];
      expect(val61).assertEqual(arr[2]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_4900
     * @tc.name testTypedUArraysCopyWithinPart302_049
     * @tc.desc Verify copyWithin buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([5, 1, 5, 3, 4, 6]);
      let result = arr.copyWithin(0, 0);
      const val62 = result[0];
      expect(val62).assertEqual(arr[2]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_5000
     * @tc.name testTypedUArraysCopyWithinPart302_050
     * @tc.desc Verify copyWithin buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 1, 5, 3, 4, 6]);
      let result = arr.copyWithin(0, 0);
      const val63 = result[0];
      expect(val63).assertEqual(arr[2]);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART302_5100
     * @tc.name testTypedUArraysCopyWithinPart302_051
     * @tc.desc Verify copyWithin buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart302_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 1n, 5n, 3n, 4n, 6n]);
      let result = arr.copyWithin(0, 0);
      const val64 = result[0];
      expect(val64).assertEqual(arr[2]);
    });

  });
}
