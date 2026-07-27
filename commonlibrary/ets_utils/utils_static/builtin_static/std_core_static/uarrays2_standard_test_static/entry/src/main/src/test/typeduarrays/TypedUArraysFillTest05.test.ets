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

export default function typedUArraysFillTest05(): void {
  describe('TypedUArraysFillTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0100
     * @tc.name testTypedUArraysFillPart301_001
     * @tc.desc Verify value TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0200
     * @tc.name testTypedUArraysFillPart301_002
     * @tc.desc Verify value TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0300
     * @tc.name testTypedUArraysFillPart301_003
     * @tc.desc Verify value TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0400
     * @tc.name testTypedUArraysFillPart301_004
     * @tc.desc Verify value TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0500
     * @tc.name testTypedUArraysFillPart301_005
     * @tc.desc Verify value TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n);
      expect(result[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0600
     * @tc.name testTypedUArraysFillPart301_006
     * @tc.desc Verify value TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0700
     * @tc.name testTypedUArraysFillPart301_007
     * @tc.desc Verify value TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0800
     * @tc.name testTypedUArraysFillPart301_008
     * @tc.desc Verify value TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_0900
     * @tc.name testTypedUArraysFillPart301_009
     * @tc.desc Verify value TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1000
     * @tc.name testTypedUArraysFillPart301_010
     * @tc.desc Verify value TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(1n);
      expect(result[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1100
     * @tc.name testTypedUArraysFillPart301_011
     * @tc.desc Verify start null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1200
     * @tc.name testTypedUArraysFillPart301_012
     * @tc.desc Verify start null TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1300
     * @tc.name testTypedUArraysFillPart301_013
     * @tc.desc Verify start null TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1400
     * @tc.name testTypedUArraysFillPart301_014
     * @tc.desc Verify start null TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1500
     * @tc.name testTypedUArraysFillPart301_015
     * @tc.desc Verify start null TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n, 2);
      expect(result[0]).assertEqual(1n);
      expect(result[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1600
     * @tc.name testTypedUArraysFillPart301_016
     * @tc.desc Verify start TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 3);
      expect(result[0]).assertEqual(0);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1700
     * @tc.name testTypedUArraysFillPart301_017
     * @tc.desc Verify start TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 3);
      expect(result[0]).assertEqual(0);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1800
     * @tc.name testTypedUArraysFillPart301_018
     * @tc.desc Verify start TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 3);
      expect(result[0]).assertEqual(0);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_1900
     * @tc.name testTypedUArraysFillPart301_019
     * @tc.desc Verify start TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 3);
      expect(result[0]).assertEqual(0);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2000
     * @tc.name testTypedUArraysFillPart301_020
     * @tc.desc Verify start TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n, 0, 3);
      expect(result[0]).assertEqual(0n);
      expect(result[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2100
     * @tc.name testTypedUArraysFillPart301_021
     * @tc.desc Verify start TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2200
     * @tc.name testTypedUArraysFillPart301_022
     * @tc.desc Verify start TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2300
     * @tc.name testTypedUArraysFillPart301_023
     * @tc.desc Verify start TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2400
     * @tc.name testTypedUArraysFillPart301_024
     * @tc.desc Verify start TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2500
     * @tc.name testTypedUArraysFillPart301_025
     * @tc.desc Verify start TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, 3, 1);
      expect(result[0]).assertEqual(1n);
      expect(result[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2600
     * @tc.name testTypedUArraysFillPart301_026
     * @tc.desc Verify start true TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2700
     * @tc.name testTypedUArraysFillPart301_027
     * @tc.desc Verify start true TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2800
     * @tc.name testTypedUArraysFillPart301_028
     * @tc.desc Verify start true TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_2900
     * @tc.name testTypedUArraysFillPart301_029
     * @tc.desc Verify start true TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.fill(0);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[1];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3000
     * @tc.name testTypedUArraysFillPart301_030
     * @tc.desc Verify start true TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.fill(0n);
      const val0 = result[0];
      expect(val0).assertEqual(0n);
      const val1 = result[1];
      expect(val1).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3100
     * @tc.name testTypedUArraysFillPart301_031
     * @tc.desc Verify end null TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 1, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3200
     * @tc.name testTypedUArraysFillPart301_032
     * @tc.desc Verify end null TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 1, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3300
     * @tc.name testTypedUArraysFillPart301_033
     * @tc.desc Verify end null TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 1, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3400
     * @tc.name testTypedUArraysFillPart301_034
     * @tc.desc Verify end null TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 1, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3500
     * @tc.name testTypedUArraysFillPart301_035
     * @tc.desc Verify end null TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n, 1, 4);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(0n);
      expect(result[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3600
     * @tc.name testTypedUArraysFillPart301_036
     * @tc.desc Verify end TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3700
     * @tc.name testTypedUArraysFillPart301_037
     * @tc.desc Verify end TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3800
     * @tc.name testTypedUArraysFillPart301_038
     * @tc.desc Verify end TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_3900
     * @tc.name testTypedUArraysFillPart301_039
     * @tc.desc Verify end TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(99, 2, 2);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4000
     * @tc.name testTypedUArraysFillPart301_040
     * @tc.desc Verify end TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(99n, 2, 2);
      expect(result[0]).assertEqual(1n);
      expect(result[2]).assertEqual(3n);
      expect(result[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4100
     * @tc.name testTypedUArraysFillPart301_041
     * @tc.desc Verify end TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 7);
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4200
     * @tc.name testTypedUArraysFillPart301_042
     * @tc.desc Verify end TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 7);
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4300
     * @tc.name testTypedUArraysFillPart301_043
     * @tc.desc Verify end TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 7);
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4400
     * @tc.name testTypedUArraysFillPart301_044
     * @tc.desc Verify end TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 0, 7);
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4500
     * @tc.name testTypedUArraysFillPart301_045
     * @tc.desc Verify end TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n, 0, 7);
      expect(result[0]).assertEqual(0n);
      expect(result[4]).assertEqual(0n);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4600
     * @tc.name testTypedUArraysFillPart301_046
     * @tc.desc Verify end true TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4700
     * @tc.name testTypedUArraysFillPart301_047
     * @tc.desc Verify end true TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4800
     * @tc.name testTypedUArraysFillPart301_048
     * @tc.desc Verify end true TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_4900
     * @tc.name testTypedUArraysFillPart301_049
     * @tc.desc Verify end true TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.fill(0, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART301_5000
     * @tc.name testTypedUArraysFillPart301_050
     * @tc.desc Verify end true TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart301_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.fill(0n, 3, 1);
      expect(result[0]).assertEqual(1n);
      expect(result[3]).assertEqual(4n);
    });

  });
}
