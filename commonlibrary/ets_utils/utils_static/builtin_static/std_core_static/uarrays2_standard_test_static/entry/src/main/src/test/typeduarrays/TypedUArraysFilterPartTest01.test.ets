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
 * See the Language for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysFilterPartTest01(): void {
  describe('TypedUArraysFilterPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0100
     * @tc.name testTypedUArraysFilterPartTestFileA001
     * @tc.desc Verify filter 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 10, 20, 30]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0200
     * @tc.name testTypedUArraysFilterPartTestFileA002
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter((v) => v > 15);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(20);
      expect(Array.from(result)[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0300
     * @tc.name testTypedUArraysFilterPartTestFileA003
     * @tc.desc Verify thisArg Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const limit = 150;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(200);
      expect(Array.from(result)[1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0400
     * @tc.name testTypedUArraysFilterPartTestFileA004
     * @tc.desc Verify thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.filter((v) => v > 1000);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(2000);
      expect(Array.from(result)[1]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0500
     * @tc.name testTypedUArraysFilterPartTestFileA005
     * @tc.desc Verify thisArg BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([50n, 150n, 250n, 350n]);
      const limit = 200n;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(250n);
      expect(Array.from(result)[1]).assertEqual(350n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0600
     * @tc.name testTypedUArraysFilterPartTestFileA006
     * @tc.desc Verify Uint8Array 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0700
     * @tc.name testTypedUArraysFilterPartTestFileA007
     * @tc.desc Verify Uint8Array 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 10, 20]);
      const result = arr.filter((v) => v === 1);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0800
     * @tc.name testTypedUArraysFilterPartTestFileA008
     * @tc.desc Verify Uint8Array 127 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127, 200, 255]);
      const result = arr.filter((v) => v === 127);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_0900
     * @tc.name testTypedUArraysFilterPartTestFileA009
     * @tc.desc Verify Uint8Array 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 255]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1000
     * @tc.name testTypedUArraysFilterPartTestFileA010
     * @tc.desc Verify Uint8Array 0xFF Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x80, 0xFF]);
      const result = arr.filter((v) => v === 0xFF);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1100
     * @tc.name testTypedUArraysFilterPartTestFileA011
     * @tc.desc Verify Uint8Array 0x80 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x40, 0x80, 0xC0]);
      const result = arr.filter((v) => v === 0x80);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1200
     * @tc.name testTypedUArraysFilterPartTestFileA012
     * @tc.desc Verify Uint8Array -1 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, 10, 20]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1300
     * @tc.name testTypedUArraysFilterPartTestFileA013
     * @tc.desc Verify Uint8Array 256 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1400
     * @tc.name testTypedUArraysFilterPartTestFileA014
     * @tc.desc Verify Uint8Array 0x100 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x100, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1500
     * @tc.name testTypedUArraysFilterPartTestFileA015
     * @tc.desc Verify Uint8Array 0o377 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o10, 0o100, 0o377]);
      const result = arr.filter((v) => v === 0o377);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1600
     * @tc.name testTypedUArraysFilterPartTestFileA016
     * @tc.desc Verify Uint8Array 0b11111111 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b00000001, 0b10000000, 0b11111111]);
      const result = arr.filter((v) => v === 0b11111111);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1700
     * @tc.name testTypedUArraysFilterPartTestFileA017
     * @tc.desc Verify Uint16Array 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 100, 200]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1800
     * @tc.name testTypedUArraysFilterPartTestFileA018
     * @tc.desc Verify Uint16Array 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 100, 200]);
      const result = arr.filter((v) => v === 1);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_1900
     * @tc.name testTypedUArraysFilterPartTestFileA019
     * @tc.desc Verify Uint16Array 32767 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767, 40000, 65535]);
      const result = arr.filter((v) => v === 32767);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2000
     * @tc.name testTypedUArraysFilterPartTestFileA020
     * @tc.desc Verify Uint16Array 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 65535]);
      const result = arr.filter((v) => v === 65535);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2100
     * @tc.name testTypedUArraysFilterPartTestFileA021
     * @tc.desc Verify Uint16Array 0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x1000, 0x8000, 0xFFFF]);
      const result = arr.filter((v) => v === 0xFFFF);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2200
     * @tc.name testTypedUArraysFilterPartTestFileA022
     * @tc.desc Verify Uint16Array 0x8000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x4000, 0x8000, 0xC000]);
      const result = arr.filter((v) => v === 0x8000);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2300
     * @tc.name testTypedUArraysFilterPartTestFileA023
     * @tc.desc Verify Uint16Array -1 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, 100, 200]);
      const result = arr.filter((v) => v === 65535);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2400
     * @tc.name testTypedUArraysFilterPartTestFileA024
     * @tc.desc Verify Uint16Array 65536 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 100, 200]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2500
     * @tc.name testTypedUArraysFilterPartTestFileA025
     * @tc.desc Verify Uint16Array 0x10000 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10000, 100, 200]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2600
     * @tc.name testTypedUArraysFilterPartTestFileA026
     * @tc.desc Verify Uint32Array 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1000, 2000]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2700
     * @tc.name testTypedUArraysFilterPartTestFileA027
     * @tc.desc Verify Uint32Array 1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 1000, 2000]);
      const result = arr.filter((v) => v === 1);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2800
     * @tc.name testTypedUArraysFilterPartTestFileA028
     * @tc.desc Verify Uint32Array 2147483647 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647, 3000000000, 4294967295]);
      const result = arr.filter((v) => v === 2147483647);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_2900
     * @tc.name testTypedUArraysFilterPartTestFileA029
     * @tc.desc Verify Uint32Array 4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 4294967295]);
      const result = arr.filter((v) => v === 4294967295);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3000
     * @tc.name testTypedUArraysFilterPartTestFileA030
     * @tc.desc Verify Uint32Array 0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x10000000, 0x80000000, 0xFFFFFFFF]);
      const result = arr.filter((v) => v === 0xFFFFFFFF);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3100
     * @tc.name testTypedUArraysFilterPartTestFileA031
     * @tc.desc Verify Uint32Array 0x80000000 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x40000000, 0x80000000, 0xC0000000]);
      const result = arr.filter((v) => v === 0x80000000);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3200
     * @tc.name testTypedUArraysFilterPartTestFileA032
     * @tc.desc Verify Uint32Array -1 4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, 1000, 2000]);
      const result = arr.filter((v) => v === 4294967295);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3300
     * @tc.name testTypedUArraysFilterPartTestFileA033
     * @tc.desc Verify Uint32Array 4294967296 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 1000, 2000]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3400
     * @tc.name testTypedUArraysFilterPartTestFileA034
     * @tc.desc Verify BigUint64Array 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 100n, 200n]);
      const result = arr.filter((v) => v === 0n);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3500
     * @tc.name testTypedUArraysFilterPartTestFileA035
     * @tc.desc Verify BigUint64Array 1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 100n, 200n]);
      const result = arr.filter((v) => v === 1n);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3600
     * @tc.name testTypedUArraysFilterPartTestFileA036
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 100n, 200n]);
      const result = arr.filter((_v, i) => i === 1 || i === 2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3700
     * @tc.name testTypedUArraysFilterPartTestFileA037
     * @tc.desc Verify BigUint64Array BigInt('0x7FFFFFFFFFFFFFFF') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('0x4000000000000000'), BigInt('0x7FFFFFFFFFFFFFFF'), BigInt('0xFFFFFFFFFFFFFFFF')]);
      const result = arr.filter((v) => v === BigInt('9223372036854775807'));
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(BigInt('9223372036854775807'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3800
     * @tc.name testTypedUArraysFilterPartTestFileA038
     * @tc.desc Verify BigUint64Array BigInt('0xFFFFFFFFFFFFFFFF') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, BigInt('0xFFFFFFFFFFFFFFFF')]);
      const result = arr.filter((_v, i) => i === 0 || i === 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_3900
     * @tc.name testTypedUArraysFilterPartTestFileA039
     * @tc.desc Verify filter Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.filter((v) => v > 0);
      expect(Array.from(result).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4000
     * @tc.name testTypedUArraysFilterPartTestFileA040
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const result = arr.filter((v) => v === 99);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4100
     * @tc.name testTypedUArraysFilterPartTestFileA041
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const result = arr.filter((v) => v !== 99);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4200
     * @tc.name testTypedUArraysFilterPartTestFileA042
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42]);
      const result = arr.filter((v) => v === 42);
      expect(Array.from(result).length).assertEqual(4);
      expect(Array.from(result)[0]).assertEqual(42);
      expect(Array.from(result)[1]).assertEqual(42);
      expect(Array.from(result)[2]).assertEqual(42);
      expect(Array.from(result)[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4300
     * @tc.name testTypedUArraysFilterPartTestFileA043
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42]);
      const result = arr.filter((v) => v !== 42);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4400
     * @tc.name testTypedUArraysFilterPartTestFileA044
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255, 1, 64]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4500
     * @tc.name testTypedUArraysFilterPartTestFileA045
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x80, 0xFF, 0b00000001]);
      const result = arr.filter((v) => v === 0x80);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4600
     * @tc.name testTypedUArraysFilterPartTestFileA046
     * @tc.desc Verify 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      arr[99] = 99;
      const result = arr.filter((v) => v === 99);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4700
     * @tc.name testTypedUArraysFilterPartTestFileA047
     * @tc.desc Verify 1000 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([50, 60, 70, 80]);
      const result = arr.filter((v) => v > 55);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4800
     * @tc.name testTypedUArraysFilterPartTestFileA048
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -3, 10]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_4900
     * @tc.name testTypedUArraysFilterPartTestFileA049
     * @tc.desc Verify NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_5000
     * @tc.name testTypedUArraysFilterPartTestFileA050
     * @tc.desc Verify Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTERPARTTEST01_5100
     * @tc.name testTypedUArraysFilterPartTestFileA051
     * @tc.desc Verify 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPartTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      arr[0] = 99;
      const result = arr.filter((v) => v === 99);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(99);
    });
  });
}
