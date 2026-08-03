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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
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
     * @tc.name testTypedUArraysKeysTestFileA001
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0200
     * @tc.name testTypedUArraysKeysTestFileA002
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0300
     * @tc.name testTypedUArraysKeysTestFileA003
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0400
     * @tc.name testTypedUArraysKeysTestFileA004
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0500
     * @tc.name testTypedUArraysKeysTestFileA005
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0600
     * @tc.name testTypedUArraysKeysTestFileA006
     * @tc.desc Verify Uint8Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0700
     * @tc.name testTypedUArraysKeysTestFileA007
     * @tc.desc Verify Uint8ClampedArray keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0800
     * @tc.name testTypedUArraysKeysTestFileA008
     * @tc.desc Verify Uint16Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_0900
     * @tc.name testTypedUArraysKeysTestFileA009
     * @tc.desc Verify Uint32Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1000
     * @tc.name testTypedUArraysKeysTestFileA010
     * @tc.desc Verify BigUint64Array keys next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1100
     * @tc.name testTypedUArraysKeysTestFileA011
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1200
     * @tc.name testTypedUArraysKeysTestFileA012
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1300
     * @tc.name testTypedUArraysKeysTestFileA013
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1400
     * @tc.name testTypedUArraysKeysTestFileA014
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1500
     * @tc.name testTypedUArraysKeysTestFileA015
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1600
     * @tc.name testTypedUArraysKeysTestFileA016
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1700
     * @tc.name testTypedUArraysKeysTestFileA017
     * @tc.desc Verify Uint8ClampedArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1800
     * @tc.name testTypedUArraysKeysTestFileA018
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_1900
     * @tc.name testTypedUArraysKeysTestFileA019
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2000
     * @tc.name testTypedUArraysKeysTestFileA020
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2100
     * @tc.name testTypedUArraysKeysTestFileA021
     * @tc.desc Verify Uint8Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2200
     * @tc.name testTypedUArraysKeysTestFileA022
     * @tc.desc Verify Uint16Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2300
     * @tc.name testTypedUArraysKeysTestFileA023
     * @tc.desc Verify Uint32Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2400
     * @tc.name testTypedUArraysKeysTestFileA024
     * @tc.desc Verify BigUint64Array 100 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(100);
      const iter = arr.keys();
      for (let i = 0; i < 100; i++) {
        expect(iter.next().value).assertEqual(i);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2500
     * @tc.name testTypedUArraysKeysTestFileA025
     * @tc.desc Verify Uint8Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2600
     * @tc.name testTypedUArraysKeysTestFileA026
     * @tc.desc Verify Uint8ClampedArray keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-10, -1, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2700
     * @tc.name testTypedUArraysKeysTestFileA027
     * @tc.desc Verify Uint16Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2800
     * @tc.name testTypedUArraysKeysTestFileA028
     * @tc.desc Verify Uint32Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_KEYS_PART101_2900
     * @tc.name testTypedUArraysKeysTestFileA029
     * @tc.desc Verify BigUint64Array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysKeysTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });
  });
}
