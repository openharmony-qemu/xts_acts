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

export default function typedUArraysCopyWithinTest05(): void {
  describe('TypedUArraysCopyWithinTest05', (): void => {
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
    it('testTypedUArraysCopyWithinPart301_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0200
     * @tc.name testTypedUArraysCopyWithinPart301_002
     * @tc.desc Verify target null TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0300
     * @tc.name testTypedUArraysCopyWithinPart301_003
     * @tc.desc Verify target null TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0400
     * @tc.name testTypedUArraysCopyWithinPart301_004
     * @tc.desc Verify target null TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0500
     * @tc.name testTypedUArraysCopyWithinPart301_005
     * @tc.desc Verify target null TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0600
     * @tc.name testTypedUArraysCopyWithinPart301_006
     * @tc.desc Verify start null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0700
     * @tc.name testTypedUArraysCopyWithinPart301_007
     * @tc.desc Verify start null TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0800
     * @tc.name testTypedUArraysCopyWithinPart301_008
     * @tc.desc Verify start null TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_0900
     * @tc.name testTypedUArraysCopyWithinPart301_009
     * @tc.desc Verify start null TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1000
     * @tc.name testTypedUArraysCopyWithinPart301_010
     * @tc.desc Verify start null TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1100
     * @tc.name testTypedUArraysCopyWithinPart301_011
     * @tc.desc Verify end null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1200
     * @tc.name testTypedUArraysCopyWithinPart301_012
     * @tc.desc Verify end null TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1300
     * @tc.name testTypedUArraysCopyWithinPart301_013
     * @tc.desc Verify end null TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1400
     * @tc.name testTypedUArraysCopyWithinPart301_014
     * @tc.desc Verify end null TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1500
     * @tc.name testTypedUArraysCopyWithinPart301_015
     * @tc.desc Verify end null TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1600
     * @tc.name testTypedUArraysCopyWithinPart301_016
     * @tc.desc Verify target TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1700
     * @tc.name testTypedUArraysCopyWithinPart301_017
     * @tc.desc Verify start TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1800
     * @tc.name testTypedUArraysCopyWithinPart301_018
     * @tc.desc Verify end TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_1900
     * @tc.name testTypedUArraysCopyWithinPart301_019
     * @tc.desc Verify target TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2000
     * @tc.name testTypedUArraysCopyWithinPart301_020
     * @tc.desc Verify start TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2100
     * @tc.name testTypedUArraysCopyWithinPart301_021
     * @tc.desc Verify target TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2200
     * @tc.name testTypedUArraysCopyWithinPart301_022
     * @tc.desc Verify start TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2300
     * @tc.name testTypedUArraysCopyWithinPart301_023
     * @tc.desc Verify end TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2400
     * @tc.name testTypedUArraysCopyWithinPart301_024
     * @tc.desc Verify target undefined TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      try {
        (arr).copyWithin(0, 0);
        expect(arr.length).assertEqual(5);
      } catch (e) {
        expect(typeof e).assertEqual('object');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2500
     * @tc.name testTypedUArraysCopyWithinPart301_025
     * @tc.desc Verify start undefined TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      try {
        (arr as number).toFixed();
        expect(true).assertFail();
      } catch (e) {
        expect(typeof e).assertEqual("object");
      }
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2600
     * @tc.name testTypedUArraysCopyWithinPart301_026
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2700
     * @tc.name testTypedUArraysCopyWithinPart301_027
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2800
     * @tc.name testTypedUArraysCopyWithinPart301_028
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_2900
     * @tc.name testTypedUArraysCopyWithinPart301_029
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3000
     * @tc.name testTypedUArraysCopyWithinPart301_030
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.copyWithin(0, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3100
     * @tc.name testTypedUArraysCopyWithinPart301_031
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.copyWithin(0, 2);
      const val0 = result[0];
      expect(val0).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3200
     * @tc.name testTypedUArraysCopyWithinPart301_032
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = arr.copyWithin(0, 2);
      const val1 = result[0];
      expect(val1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3300
     * @tc.name testTypedUArraysCopyWithinPart301_033
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = arr.copyWithin(0, 2);
      const val2 = result[0];
      expect(val2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3400
     * @tc.name testTypedUArraysCopyWithinPart301_034
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let result = arr.copyWithin(0, 2);
      const val3 = result[0];
      expect(val3).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3500
     * @tc.name testTypedUArraysCopyWithinPart301_035
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.copyWithin(0, 2);
      const val4 = result[0];
      expect(val4).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3600
     * @tc.name testTypedUArraysCopyWithinPart301_036
     * @tc.desc Verify copyWithin Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7, 7]);
      let result = arr.copyWithin(1, 0);
      const val5 = result[1];
      expect(val5).assertEqual(7);
      const val6 = result[2];
      expect(val6).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3700
     * @tc.name testTypedUArraysCopyWithinPart301_037
     * @tc.desc Verify copyWithin Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF]);
      let result = arr.copyWithin(1, 0);
      const val7 = result[1];
      expect(val7).assertEqual(0xFFFF);
      const val8 = result[2];
      expect(val8).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3800
     * @tc.name testTypedUArraysCopyWithinPart301_038
     * @tc.desc Verify copyWithin Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF]);
      let result = arr.copyWithin(1, 0);
      const val9 = result[1];
      expect(val9).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_3900
     * @tc.name testTypedUArraysCopyWithinPart301_039
     * @tc.desc Verify copyWithin Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255, 255, 255]);
      let result = arr.copyWithin(1, 0);
      const val10 = result[1];
      expect(val10).assertEqual(255);
      const val11 = result[2];
      expect(val11).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4000
     * @tc.name testTypedUArraysCopyWithinPart301_040
     * @tc.desc Verify copyWithin BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      let result = arr.copyWithin(1, 0);
      const val12 = result[1];
      expect(val12).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4100
     * @tc.name testTypedUArraysCopyWithinPart301_041
     * @tc.desc Verify target Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val13 = result[3];
      expect(val13).assertEqual(1);
      const val14 = result[4];
      expect(val14).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4200
     * @tc.name testTypedUArraysCopyWithinPart301_042
     * @tc.desc Verify target Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val15 = result[3];
      expect(val15).assertEqual(1);
      const val16 = result[4];
      expect(val16).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4300
     * @tc.name testTypedUArraysCopyWithinPart301_043
     * @tc.desc Verify target Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val17 = result[3];
      expect(val17).assertEqual(1);
      const val18 = result[4];
      expect(val18).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4400
     * @tc.name testTypedUArraysCopyWithinPart301_044
     * @tc.desc Verify target Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-2, 0);
      const val19 = result[3];
      expect(val19).assertEqual(1);
      const val20 = result[4];
      expect(val20).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4500
     * @tc.name testTypedUArraysCopyWithinPart301_045
     * @tc.desc Verify target BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(-2, 0);
      const val21 = result[3];
      expect(val21).assertEqual(1n);
      const val22 = result[4];
      expect(val22).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4600
     * @tc.name testTypedUArraysCopyWithinPart301_046
     * @tc.desc Verify start Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val23 = result[0];
      expect(val23).assertEqual(3);
      const val24 = result[1];
      expect(val24).assertEqual(4);
      const val25 = result[2];
      expect(val25).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4700
     * @tc.name testTypedUArraysCopyWithinPart301_047
     * @tc.desc Verify start Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val26 = result[0];
      expect(val26).assertEqual(3);
      const val27 = result[1];
      expect(val27).assertEqual(4);
      const val28 = result[2];
      expect(val28).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4800
     * @tc.name testTypedUArraysCopyWithinPart301_048
     * @tc.desc Verify start Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val29 = result[0];
      expect(val29).assertEqual(3);
      const val30 = result[1];
      expect(val30).assertEqual(4);
      const val31 = result[2];
      expect(val31).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_4900
     * @tc.name testTypedUArraysCopyWithinPart301_049
     * @tc.desc Verify start Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart301_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val32 = result[0];
      expect(val32).assertEqual(3);
      const val33 = result[1];
      expect(val33).assertEqual(4);
      const val34 = result[2];
      expect(val34).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART301_5000
     * @tc.name testTypedUArraysCopyWithinPart301_050
     * @tc.desc Verify start BigUint64Array
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

  });
}
