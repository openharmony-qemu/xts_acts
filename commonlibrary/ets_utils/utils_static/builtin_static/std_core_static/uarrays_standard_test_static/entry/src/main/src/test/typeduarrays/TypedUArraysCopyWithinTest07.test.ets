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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0100
     * @tc.name testTypedUArraysCopyWithinPart301_001
     * @tc.desc Verify target null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val35 = result[0]; expect(val35).assertEqual(1n);
      const val36 = result[1]; expect(val36).assertEqual(2n);
      const val37 = result[2]; expect(val37).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5100
     * @tc.name testTypedUArraysCopyWithinPart301_051
     * @tc.desc Verify end Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val38 = result[0];
      expect(val38).assertEqual(1);
      const val39 = result[1];
      expect(val39).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5200
     * @tc.name testTypedUArraysCopyWithinPart301_052
     * @tc.desc Verify end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val40 = result[0];
      expect(val40).assertEqual(1);
      const val41 = result[1];
      expect(val41).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5300
     * @tc.name testTypedUArraysCopyWithinPart301_053
     * @tc.desc Verify end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val42 = result[0];
      expect(val42).assertEqual(1);
      const val43 = result[1];
      expect(val43).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5400
     * @tc.name testTypedUArraysCopyWithinPart301_054
     * @tc.desc Verify end Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val44 = result[0];
      expect(val44).assertEqual(1);
      const val45 = result[1];
      expect(val45).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5500
     * @tc.name testTypedUArraysCopyWithinPart301_055
     * @tc.desc Verify end BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val46 = result[0];
      expect(val46).assertEqual(1n);
      const val47 = result[1];
      expect(val47).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5600
     * @tc.name testTypedUArraysCopyWithinPart301_056
     * @tc.desc Verify target start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val48 = result[0]; expect(val48).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5700
     * @tc.name testTypedUArraysCopyWithinPart301_057
     * @tc.desc Verify target end Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val49 = result[3];
      expect(val49).assertEqual(1);
      const val50 = result[4];
      expect(val50).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5800
     * @tc.name testTypedUArraysCopyWithinPart301_058
     * @tc.desc Verify start end Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val51 = result[0]; expect(val51).assertEqual(1);
      const val52 = result[1]; expect(val52).assertEqual(2);
      const val53 = result[2]; expect(val53).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5900
     * @tc.name testTypedUArraysCopyWithinPart301_059
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val54 = result[0]; expect(val54).assertEqual(1);
      const val55 = result[1]; expect(val55).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6000
     * @tc.name testTypedUArraysCopyWithinPart301_060
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(-2, 0);
      const val56 = result[0]; expect(val56).assertEqual(1n);
      const val57 = result[1]; expect(val57).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6100
     * @tc.name testTypedUArraysCopyWithinPart301_061
     * @tc.desc Verify target length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6200
     * @tc.name testTypedUArraysCopyWithinPart301_062
     * @tc.desc Verify target length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6300
     * @tc.name testTypedUArraysCopyWithinPart301_063
     * @tc.desc Verify target length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6400
     * @tc.name testTypedUArraysCopyWithinPart301_064
     * @tc.desc Verify target length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6500
     * @tc.name testTypedUArraysCopyWithinPart301_065
     * @tc.desc Verify target length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(5, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6600
     * @tc.name testTypedUArraysCopyWithinPart301_066
     * @tc.desc Verify target length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6700
     * @tc.name testTypedUArraysCopyWithinPart301_067
     * @tc.desc Verify target length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6800
     * @tc.name testTypedUArraysCopyWithinPart301_068
     * @tc.desc Verify target length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_6900
     * @tc.name testTypedUArraysCopyWithinPart301_069
     * @tc.desc Verify target length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7000
     * @tc.name testTypedUArraysCopyWithinPart301_070
     * @tc.desc Verify target length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7100
     * @tc.name testTypedUArraysCopyWithinPart301_071
     * @tc.desc Verify start length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val58 = result[0];
      expect(val58).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7200
     * @tc.name testTypedUArraysCopyWithinPart301_072
     * @tc.desc Verify start length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val59 = result[0];
      expect(val59).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7300
     * @tc.name testTypedUArraysCopyWithinPart301_073
     * @tc.desc Verify start length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val60 = result[0];
      expect(val60).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7400
     * @tc.name testTypedUArraysCopyWithinPart301_074
     * @tc.desc Verify start length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val61 = result[0];
      expect(val61).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7500
     * @tc.name testTypedUArraysCopyWithinPart301_075
     * @tc.desc Verify start length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val62 = result[0];
      expect(val62).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7600
     * @tc.name testTypedUArraysCopyWithinPart301_076
     * @tc.desc Verify start length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val63 = result[0];
      expect(val63).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7700
     * @tc.name testTypedUArraysCopyWithinPart301_077
     * @tc.desc Verify start length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val64 = result[0];
      expect(val64).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7800
     * @tc.name testTypedUArraysCopyWithinPart301_078
     * @tc.desc Verify start length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val65 = result[0];
      expect(val65).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_7900
     * @tc.name testTypedUArraysCopyWithinPart301_079
     * @tc.desc Verify start length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val66 = result[0];
      expect(val66).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8000
     * @tc.name testTypedUArraysCopyWithinPart301_080
     * @tc.desc Verify start length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val67 = result[0];
      expect(val67).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8100
     * @tc.name testTypedUArraysCopyWithinPart301_081
     * @tc.desc Verify end length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val68 = result[0];
      expect(val68).assertEqual(1);
      const val69 = result[1];
      expect(val69).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8200
     * @tc.name testTypedUArraysCopyWithinPart301_082
     * @tc.desc Verify end length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val70 = result[0];
      expect(val70).assertEqual(1);
      const val71 = result[1];
      expect(val71).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8300
     * @tc.name testTypedUArraysCopyWithinPart301_083
     * @tc.desc Verify end length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val72 = result[0];
      expect(val72).assertEqual(1);
      const val73 = result[1];
      expect(val73).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8400
     * @tc.name testTypedUArraysCopyWithinPart301_084
     * @tc.desc Verify end length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val74 = result[0];
      expect(val74).assertEqual(1);
      const val75 = result[1];
      expect(val75).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8500
     * @tc.name testTypedUArraysCopyWithinPart301_085
     * @tc.desc Verify end length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val76 = result[0];
      expect(val76).assertEqual(1n);
      const val77 = result[1];
      expect(val77).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8600
     * @tc.name testTypedUArraysCopyWithinPart301_086
     * @tc.desc Verify end length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val78 = result[0];
      expect(val78).assertEqual(1);
      const val79 = result[1];
      expect(val79).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8700
     * @tc.name testTypedUArraysCopyWithinPart301_087
     * @tc.desc Verify end length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val80 = result[0];
      expect(val80).assertEqual(1);
      const val81 = result[1];
      expect(val81).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8800
     * @tc.name testTypedUArraysCopyWithinPart301_088
     * @tc.desc Verify end length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val82 = result[0];
      expect(val82).assertEqual(1);
      const val83 = result[1];
      expect(val83).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_8900
     * @tc.name testTypedUArraysCopyWithinPart301_089
     * @tc.desc Verify end length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val84 = result[0];
      expect(val84).assertEqual(1);
      const val85 = result[1];
      expect(val85).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9000
     * @tc.name testTypedUArraysCopyWithinPart301_090
     * @tc.desc Verify end length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0);
      const val86 = result[0];
      expect(val86).assertEqual(1n);
      const val87 = result[1];
      expect(val87).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9100
     * @tc.name testTypedUArraysCopyWithinPart301_091
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9200
     * @tc.name testTypedUArraysCopyWithinPart301_092
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9300
     * @tc.name testTypedUArraysCopyWithinPart301_093
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9400
     * @tc.name testTypedUArraysCopyWithinPart301_094
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9500
     * @tc.name testTypedUArraysCopyWithinPart301_095
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(10, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9600
     * @tc.name testTypedUArraysCopyWithinPart301_096
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9700
     * @tc.name testTypedUArraysCopyWithinPart301_097
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9800
     * @tc.name testTypedUArraysCopyWithinPart301_098
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_9900
     * @tc.name testTypedUArraysCopyWithinPart301_099
     * @tc.desc Verify target Number.MAX_SAFE_INTEGER Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(5);
    });

  });
}
