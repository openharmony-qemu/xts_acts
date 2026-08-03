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

export default function typedUArraysCopyWithinTest07(): void {
  describe('TypedUArraysCopyWithinTest07', (): void => {
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
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0100
     * @tc.name testTypedUArraysCopyWithinPart301_001
     * @tc.desc Verify target null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val35 = result[0]; expect(val35).assertEqual(1n);
      const val36 = result[1]; expect(val36).assertEqual(2n);
      const val37 = result[2]; expect(val37).assertEqual(3n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0200
@tc.name testTypedUArraysCopyWithinPart301_002
     * @tc.desc Verify end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val38 = result[0];
      expect(val38).assertEqual(1);
      const val39 = result[1];
      expect(val39).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0300
@tc.name testTypedUArraysCopyWithinPart301_003
     * @tc.desc Verify end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val40 = result[0];
      expect(val40).assertEqual(1);
      const val41 = result[1];
      expect(val41).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0400
@tc.name testTypedUArraysCopyWithinPart301_004
     * @tc.desc Verify end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val42 = result[0];
      expect(val42).assertEqual(1);
      const val43 = result[1];
      expect(val43).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0500
@tc.name testTypedUArraysCopyWithinPart301_005
     * @tc.desc Verify end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val44 = result[0];
      expect(val44).assertEqual(1);
      const val45 = result[1];
      expect(val45).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0600
@tc.name testTypedUArraysCopyWithinPart301_006
     * @tc.desc Verify end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val46 = result[0];
      expect(val46).assertEqual(1n);
      const val47 = result[1];
      expect(val47).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0700
@tc.name testTypedUArraysCopyWithinPart301_007
     * @tc.desc Verify target start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val48 = result[0]; expect(val48).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0800
@tc.name testTypedUArraysCopyWithinPart301_008
     * @tc.desc Verify target end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val49 = result[3];
      expect(val49).assertEqual(1);
      const val50 = result[4];
      expect(val50).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0900
@tc.name testTypedUArraysCopyWithinPart301_009
     * @tc.desc Verify start end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val51 = result[0]; expect(val51).assertEqual(1);
      const val52 = result[1]; expect(val52).assertEqual(2);
      const val53 = result[2]; expect(val53).assertEqual(3);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1000
@tc.name testTypedUArraysCopyWithinPart301_010
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val54 = result[0]; expect(val54).assertEqual(1);
      const val55 = result[1]; expect(val55).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1100
@tc.name testTypedUArraysCopyWithinPart301_011
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(-2, 0);
      const val56 = result[0]; expect(val56).assertEqual(1n);
      const val57 = result[1]; expect(val57).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1200
@tc.name testTypedUArraysCopyWithinPart301_012
     * @tc.desc Verify target length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1300
@tc.name testTypedUArraysCopyWithinPart301_013
     * @tc.desc Verify target length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1400
@tc.name testTypedUArraysCopyWithinPart301_014
     * @tc.desc Verify target length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1500
@tc.name testTypedUArraysCopyWithinPart301_015
     * @tc.desc Verify target length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1600
@tc.name testTypedUArraysCopyWithinPart301_016
     * @tc.desc Verify target length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1700
@tc.name testTypedUArraysCopyWithinPart301_017
     * @tc.desc Verify target length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1800
@tc.name testTypedUArraysCopyWithinPart301_018
     * @tc.desc Verify target length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1900
@tc.name testTypedUArraysCopyWithinPart301_019
     * @tc.desc Verify target length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2000
@tc.name testTypedUArraysCopyWithinPart301_020
     * @tc.desc Verify target length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2100
@tc.name testTypedUArraysCopyWithinPart301_021
     * @tc.desc Verify target length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2200
@tc.name testTypedUArraysCopyWithinPart301_022
     * @tc.desc Verify start length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val58 = result[0];
      expect(val58).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2300
@tc.name testTypedUArraysCopyWithinPart301_023
     * @tc.desc Verify start length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val59 = result[0];
      expect(val59).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2400
@tc.name testTypedUArraysCopyWithinPart301_024
     * @tc.desc Verify start length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val60 = result[0];
      expect(val60).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2500
@tc.name testTypedUArraysCopyWithinPart301_025
     * @tc.desc Verify start length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val61 = result[0];
      expect(val61).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2600
@tc.name testTypedUArraysCopyWithinPart301_026
     * @tc.desc Verify start length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val62 = result[0];
      expect(val62).assertEqual(1n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2700
@tc.name testTypedUArraysCopyWithinPart301_027
     * @tc.desc Verify start length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val63 = result[0];
      expect(val63).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2800
@tc.name testTypedUArraysCopyWithinPart301_028
     * @tc.desc Verify start length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val64 = result[0];
      expect(val64).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2900
@tc.name testTypedUArraysCopyWithinPart301_029
     * @tc.desc Verify start length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val65 = result[0];
      expect(val65).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3000
@tc.name testTypedUArraysCopyWithinPart301_030
     * @tc.desc Verify start length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val66 = result[0];
      expect(val66).assertEqual(1);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3100
@tc.name testTypedUArraysCopyWithinPart301_031
     * @tc.desc Verify start length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val67 = result[0];
      expect(val67).assertEqual(1n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3200
@tc.name testTypedUArraysCopyWithinPart301_032
     * @tc.desc Verify end length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val68 = result[0];
      expect(val68).assertEqual(1);
      const val69 = result[1];
      expect(val69).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3300
@tc.name testTypedUArraysCopyWithinPart301_033
     * @tc.desc Verify end length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val70 = result[0];
      expect(val70).assertEqual(1);
      const val71 = result[1];
      expect(val71).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3400
@tc.name testTypedUArraysCopyWithinPart301_034
     * @tc.desc Verify end length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val72 = result[0];
      expect(val72).assertEqual(1);
      const val73 = result[1];
      expect(val73).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3500
@tc.name testTypedUArraysCopyWithinPart301_035
     * @tc.desc Verify end length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val74 = result[0];
      expect(val74).assertEqual(1);
      const val75 = result[1];
      expect(val75).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3600
@tc.name testTypedUArraysCopyWithinPart301_036
     * @tc.desc Verify end length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val76 = result[0];
      expect(val76).assertEqual(1n);
      const val77 = result[1];
      expect(val77).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3700
@tc.name testTypedUArraysCopyWithinPart301_037
     * @tc.desc Verify end length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val78 = result[0];
      expect(val78).assertEqual(1);
      const val79 = result[1];
      expect(val79).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3800
@tc.name testTypedUArraysCopyWithinPart301_038
     * @tc.desc Verify end length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val80 = result[0];
      expect(val80).assertEqual(1);
      const val81 = result[1];
      expect(val81).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3900
@tc.name testTypedUArraysCopyWithinPart301_039
     * @tc.desc Verify end length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val82 = result[0];
      expect(val82).assertEqual(1);
      const val83 = result[1];
      expect(val83).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4000
@tc.name testTypedUArraysCopyWithinPart301_040
     * @tc.desc Verify end length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val84 = result[0];
      expect(val84).assertEqual(1);
      const val85 = result[1];
      expect(val85).assertEqual(2);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4100
@tc.name testTypedUArraysCopyWithinPart301_041
     * @tc.desc Verify end length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val86 = result[0];
      expect(val86).assertEqual(1n);
      const val87 = result[1];
      expect(val87).assertEqual(2n);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4200
@tc.name testTypedUArraysCopyWithinPart301_042
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4300
@tc.name testTypedUArraysCopyWithinPart301_043
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4400
@tc.name testTypedUArraysCopyWithinPart301_044
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4500
@tc.name testTypedUArraysCopyWithinPart301_045
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4600
@tc.name testTypedUArraysCopyWithinPart301_046
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4700
@tc.name testTypedUArraysCopyWithinPart301_047
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4800
@tc.name testTypedUArraysCopyWithinPart301_048
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4900
@tc.name testTypedUArraysCopyWithinPart301_049
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

    /**
@tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5000
@tc.name testTypedUArraysCopyWithinPart301_050
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

  });
}
