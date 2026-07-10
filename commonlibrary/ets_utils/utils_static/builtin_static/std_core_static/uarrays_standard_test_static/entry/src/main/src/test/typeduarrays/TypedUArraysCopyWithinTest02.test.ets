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

export default function typedUArraysCopyWithinTest02(): void {
  describe('TypedUArraysCopyWithinTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0100
     * @tc.name testTypedUArraysCopyWithinPart102_001
     * @tc.desc Verify start=0o1 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.copyWithin(0, 0o1, 5);
      const val0 = result[0];
      expect(val0).assertEqual(200);
      const val1 = result[1];
      expect(val1).assertEqual(300);
      const val2 = result[2];
      expect(val2).assertEqual(400);
      const val3 = result[3];
      expect(val3).assertEqual(500);
      const val4 = result[4];
      expect(val4).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0200
     * @tc.name testTypedUArraysCopyWithinPart102_002
     * @tc.desc Verify start=0b1 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, 0b1, 5);
      const val5 = result[0];
      expect(val5).assertEqual(2n);
      const val6 = result[1];
      expect(val6).assertEqual(3n);
      const val7 = result[2];
      expect(val7).assertEqual(4n);
      const val8 = result[3];
      expect(val8).assertEqual(5n);
      const val9 = result[4];
      expect(val9).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0300
     * @tc.name testTypedUArraysCopyWithinPart102_003
     * @tc.desc Verify start=0x5 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0x5, 5);
      const val10 = result[0];
      expect(val10).assertEqual(1);
      const val11 = result[1];
      expect(val11).assertEqual(2);
      const val12 = result[2];
      expect(val12).assertEqual(3);
      const val13 = result[3];
      expect(val13).assertEqual(4);
      const val14 = result[4];
      expect(val14).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0400
     * @tc.name testTypedUArraysCopyWithinPart102_004
     * @tc.desc Verify start=0o5 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0o5, 5);
      const val15 = result[0];
      expect(val15).assertEqual(1);
      const val16 = result[1];
      expect(val16).assertEqual(2);
      const val17 = result[2];
      expect(val17).assertEqual(3);
      const val18 = result[3];
      expect(val18).assertEqual(4);
      const val19 = result[4];
      expect(val19).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0500
     * @tc.name testTypedUArraysCopyWithinPart102_005
     * @tc.desc Verify start=0b101 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0b101, 5);
      const val20 = result[0];
      expect(val20).assertEqual(1);
      const val21 = result[1];
      expect(val21).assertEqual(2);
      const val22 = result[2];
      expect(val22).assertEqual(3);
      const val23 = result[3];
      expect(val23).assertEqual(4);
      const val24 = result[4];
      expect(val24).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0600
     * @tc.name testTypedUArraysCopyWithinPart102_006
     * @tc.desc Verify start=length/2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.copyWithin(0, 5, 10);
      const val25 = result[0];
      expect(val25).assertEqual(6);
      const val26 = result[1];
      expect(val26).assertEqual(7);
      const val27 = result[2];
      expect(val27).assertEqual(8);
      const val28 = result[3];
      expect(val28).assertEqual(9);
      const val29 = result[4];
      expect(val29).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0700
     * @tc.name testTypedUArraysCopyWithinPart102_007
     * @tc.desc Verify start=length/2 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.copyWithin(0, 5, 10);
      const val30 = result[0];
      expect(val30).assertEqual(6);
      const val31 = result[1];
      expect(val31).assertEqual(7);
      const val32 = result[2];
      expect(val32).assertEqual(8);
      const val33 = result[3];
      expect(val33).assertEqual(9);
      const val34 = result[4];
      expect(val34).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0800
     * @tc.name testTypedUArraysCopyWithinPart102_008
     * @tc.desc Verify start=length/2 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.copyWithin(0, 5, 10);
      const val35 = result[0];
      expect(val35).assertEqual(6);
      const val36 = result[1];
      expect(val36).assertEqual(7);
      const val37 = result[2];
      expect(val37).assertEqual(8);
      const val38 = result[3];
      expect(val38).assertEqual(9);
      const val39 = result[4];
      expect(val39).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_0900
     * @tc.name testTypedUArraysCopyWithinPart102_009
     * @tc.desc Verify start=length/2 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let result = arr.copyWithin(0, 5, 10);
      const val40 = result[0];
      expect(val40).assertEqual(6n);
      const val41 = result[1];
      expect(val41).assertEqual(7n);
      const val42 = result[2];
      expect(val42).assertEqual(8n);
      const val43 = result[3];
      expect(val43).assertEqual(9n);
      const val44 = result[4];
      expect(val44).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_1000
     * @tc.name testTypedUArraysCopyWithinPart102_010
     * @tc.desc Verify start=3 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 3, 5);
      const val45 = result[0];
      expect(val45).assertEqual(4);
      const val46 = result[1];
      expect(val46).assertEqual(5);
      const val47 = result[2];
      expect(val47).assertEqual(3);
      const val48 = result[3];
      expect(val48).assertEqual(4);
      const val49 = result[4];
      expect(val49).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_1100
     * @tc.name testTypedUArraysCopyWithinPart102_011
     * @tc.desc Verify start=4 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 4, 5);
      const val50 = result[0];
      expect(val50).assertEqual(5);
      const val51 = result[1];
      expect(val51).assertEqual(2);
      const val52 = result[2];
      expect(val52).assertEqual(3);
      const val53 = result[3];
      expect(val53).assertEqual(4);
      const val54 = result[4];
      expect(val54).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_1200
     * @tc.name testTypedUArraysCopyWithinPart102_012
     * @tc.desc Verify start=0x6 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0x6, 0x6);
      const val55 = result[0];
      expect(val55).assertEqual(1);
      const val56 = result[1];
      expect(val56).assertEqual(2);
      const val57 = result[2];
      expect(val57).assertEqual(3);
      const val58 = result[3];
      expect(val58).assertEqual(4);
      const val59 = result[4];
      expect(val59).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_1300
     * @tc.name testTypedUArraysCopyWithinPart102_013
     * @tc.desc Verify start=0o6 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0o6, 0o6);
      const val60 = result[0];
      expect(val60).assertEqual(1);
      const val61 = result[1];
      expect(val61).assertEqual(2);
      const val62 = result[2];
      expect(val62).assertEqual(3);
      const val63 = result[3];
      expect(val63).assertEqual(4);
      const val64 = result[4];
      expect(val64).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART102_1400
     * @tc.name testTypedUArraysCopyWithinPart102_014
     * @tc.desc Verify start=0b110 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0b110, 0b110);
      const val65 = result[0];
      expect(val65).assertEqual(1);
      const val66 = result[1];
      expect(val66).assertEqual(2);
      const val67 = result[2];
      expect(val67).assertEqual(3);
      const val68 = result[3];
      expect(val68).assertEqual(4);
      const val69 = result[4];
      expect(val69).assertEqual(5);
    });

  });
}
