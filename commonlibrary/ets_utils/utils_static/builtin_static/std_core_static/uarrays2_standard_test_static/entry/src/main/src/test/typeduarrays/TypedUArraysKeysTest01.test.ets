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

export default function typedUArraysKeysTest01(): void {
  describe('TypedUArraysKeysTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0100
     * @tc.name testTypedUArraysKeysPart101_001
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0200
     * @tc.name testTypedUArraysKeysPart101_002
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0300
     * @tc.name testTypedUArraysKeysPart101_003
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0400
     * @tc.name testTypedUArraysKeysPart101_004
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0500
     * @tc.name testTypedUArraysKeysPart101_005
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0600
     * @tc.name testTypedUArraysKeysPart101_006
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0700
     * @tc.name testTypedUArraysKeysPart101_007
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0800
     * @tc.name testTypedUArraysKeysPart101_008
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0900
     * @tc.name testTypedUArraysKeysPart101_009
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1000
     * @tc.name testTypedUArraysKeysPart101_010
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1100
     * @tc.name testTypedUArraysKeysPart101_011
     * @tc.desc Verify Uint8Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1200
     * @tc.name testTypedUArraysKeysPart101_012
     * @tc.desc Verify Uint8ClampedArray keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1300
     * @tc.name testTypedUArraysKeysPart101_013
     * @tc.desc Verify Uint16Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1400
     * @tc.name testTypedUArraysKeysPart101_014
     * @tc.desc Verify Uint32Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1500
     * @tc.name testTypedUArraysKeysPart101_015
     * @tc.desc Verify BigUint64Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1600
     * @tc.name testTypedUArraysKeysPart101_016
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1700
     * @tc.name testTypedUArraysKeysPart101_017
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1800
     * @tc.name testTypedUArraysKeysPart101_018
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1900
     * @tc.name testTypedUArraysKeysPart101_019
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2000
     * @tc.name testTypedUArraysKeysPart101_020
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2100
     * @tc.name testTypedUArraysKeysPart101_021
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2200
     * @tc.name testTypedUArraysKeysPart101_022
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2300
     * @tc.name testTypedUArraysKeysPart101_023
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2400
     * @tc.name testTypedUArraysKeysPart101_024
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2500
     * @tc.name testTypedUArraysKeysPart101_025
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2600
     * @tc.name testTypedUArraysKeysPart101_026
     * @tc.desc Verify Uint8Array 10 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const iter = arr.keys();
      for (let i = 0; i < 10; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2700
     * @tc.name testTypedUArraysKeysPart101_027
     * @tc.desc Verify Uint16Array 10 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10);
      const iter = arr.keys();
      for (let i = 0; i < 10; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2800
     * @tc.name testTypedUArraysKeysPart101_028
     * @tc.desc Verify Uint32Array 10 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(10);
      const iter = arr.keys();
      for (let i = 0; i < 10; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2900
     * @tc.name testTypedUArraysKeysPart101_029
     * @tc.desc Verify BigUint64Array 10 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(10);
      const iter = arr.keys();
      for (let i = 0; i < 10; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3000
     * @tc.name testTypedUArraysKeysPart101_030
     * @tc.desc Verify Uint8Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3100
     * @tc.name testTypedUArraysKeysPart101_031
     * @tc.desc Verify Uint16Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3200
     * @tc.name testTypedUArraysKeysPart101_032
     * @tc.desc Verify Uint32Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3300
     * @tc.name testTypedUArraysKeysPart101_033
     * @tc.desc Verify BigUint64Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3400
     * @tc.name testTypedUArraysKeysPart101_034
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3500
     * @tc.name testTypedUArraysKeysPart101_035
     * @tc.desc Verify Uint8Array 255 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3600
     * @tc.name testTypedUArraysKeysPart101_036
     * @tc.desc Verify Uint8Array 0xFF keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x00]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3700
     * @tc.name testTypedUArraysKeysPart101_037
     * @tc.desc Verify Uint8Array 0x00 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x00, 0x01, 0x02]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3800
     * @tc.name testTypedUArraysKeysPart101_038
     * @tc.desc Verify Uint8ClampedArray keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-10, -1, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_3900
     * @tc.name testTypedUArraysKeysPart101_039
     * @tc.desc Verify Uint8ClampedArray keys 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 300, 1000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4000
     * @tc.name testTypedUArraysKeysPart101_040
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 128, 255]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4100
     * @tc.name testTypedUArraysKeysPart101_041
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4200
     * @tc.name testTypedUArraysKeysPart101_042
     * @tc.desc Verify Uint16Array 65535 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535, 65535]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4300
     * @tc.name testTypedUArraysKeysPart101_043
     * @tc.desc Verify Uint16Array 0xFFFF keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0x0000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4400
     * @tc.name testTypedUArraysKeysPart101_044
     * @tc.desc Verify Uint16Array 0x0000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x0000, 0x0001, 0x0002]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4500
     * @tc.name testTypedUArraysKeysPart101_045
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4600
     * @tc.name testTypedUArraysKeysPart101_046
     * @tc.desc Verify Uint32Array 4294967295 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4700
     * @tc.name testTypedUArraysKeysPart101_047
     * @tc.desc Verify Uint32Array 0xFFFFFFFF keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0x00000000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4800
     * @tc.name testTypedUArraysKeysPart101_048
     * @tc.desc Verify Uint32Array 0x00000000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x00000000, 0x00000001, 0x00000002]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_4900
     * @tc.name testTypedUArraysKeysPart101_049
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_5000
     * @tc.name testTypedUArraysKeysPart101_050
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });
  });
}
