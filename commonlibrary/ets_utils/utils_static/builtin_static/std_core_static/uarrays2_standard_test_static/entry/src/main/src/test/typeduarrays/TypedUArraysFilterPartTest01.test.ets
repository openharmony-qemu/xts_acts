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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_000100
     * @tc.name testTypedUArraysFilterPart101_001
     * @tc.desc Verify filter 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 10, 20, 30]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005000
     * @tc.name testTypedUArraysFilterPart101_050
     * @tc.desc Verify thisArg Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result = arr.filter((v) => v > 15);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(20);
      expect(Array.from(result)[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005100
     * @tc.name testTypedUArraysFilterPart101_051
     * @tc.desc Verify thisArg Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const limit = 150;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(200);
      expect(Array.from(result)[1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005200
     * @tc.name testTypedUArraysFilterPart101_052
     * @tc.desc Verify thisArg Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const result = arr.filter((v) => v > 1000);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(2000);
      expect(Array.from(result)[1]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005300
     * @tc.name testTypedUArraysFilterPart101_053
     * @tc.desc Verify thisArg BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([50n, 150n, 250n, 350n]);
      const limit = 200n;
      const result = arr.filter((v) => v > limit);
      expect(Array.from(result).length).assertEqual(2);
      expect(Array.from(result)[0]).assertEqual(250n);
      expect(Array.from(result)[1]).assertEqual(350n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005400
     * @tc.name testTypedUArraysFilterPart101_054
     * @tc.desc Verify Uint8Array 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005500
     * @tc.name testTypedUArraysFilterPart101_055
     * @tc.desc Verify Uint8Array 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 10, 20]);
      const result = arr.filter((v) => v === 1);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005600
     * @tc.name testTypedUArraysFilterPart101_056
     * @tc.desc Verify Uint8Array 127 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127, 200, 255]);
      const result = arr.filter((v) => v === 127);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005700
     * @tc.name testTypedUArraysFilterPart101_057
     * @tc.desc Verify Uint8Array 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 255]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005800
     * @tc.name testTypedUArraysFilterPart101_058
     * @tc.desc Verify Uint8Array 0xFF Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x80, 0xFF]);
      const result = arr.filter((v) => v === 0xFF);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_005900
     * @tc.name testTypedUArraysFilterPart101_059
     * @tc.desc Verify Uint8Array 0x80 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x40, 0x80, 0xC0]);
      const result = arr.filter((v) => v === 0x80);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006000
     * @tc.name testTypedUArraysFilterPart101_060
     * @tc.desc Verify Uint8Array -1 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, 10, 20]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006100
     * @tc.name testTypedUArraysFilterPart101_061
     * @tc.desc Verify Uint8Array 256 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006200
     * @tc.name testTypedUArraysFilterPart101_062
     * @tc.desc Verify Uint8Array 0x100 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x100, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006300
     * @tc.name testTypedUArraysFilterPart101_063
     * @tc.desc Verify Uint8Array 0o377 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0o10, 0o100, 0o377]);
      const result = arr.filter((v) => v === 0o377);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006400
     * @tc.name testTypedUArraysFilterPart101_064
     * @tc.desc Verify Uint8Array 0b11111111 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0b00000001, 0b10000000, 0b11111111]);
      const result = arr.filter((v) => v === 0b11111111);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006500
     * @tc.name testTypedUArraysFilterPart101_065
     * @tc.desc Verify Uint16Array 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 100, 200]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006600
     * @tc.name testTypedUArraysFilterPart101_066
     * @tc.desc Verify Uint16Array 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 100, 200]);
      const result = arr.filter((v) => v === 1);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006700
     * @tc.name testTypedUArraysFilterPart101_067
     * @tc.desc Verify Uint16Array 32767 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([32767, 40000, 65535]);
      const result = arr.filter((v) => v === 32767);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006800
     * @tc.name testTypedUArraysFilterPart101_068
     * @tc.desc Verify Uint16Array 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 65535]);
      const result = arr.filter((v) => v === 65535);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_006900
     * @tc.name testTypedUArraysFilterPart101_069
     * @tc.desc Verify Uint16Array 0xFFFF Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x1000, 0x8000, 0xFFFF]);
      const result = arr.filter((v) => v === 0xFFFF);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007000
     * @tc.name testTypedUArraysFilterPart101_070
     * @tc.desc Verify Uint16Array 0x8000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x4000, 0x8000, 0xC000]);
      const result = arr.filter((v) => v === 0x8000);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007100
     * @tc.name testTypedUArraysFilterPart101_071
     * @tc.desc Verify Uint16Array -1 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, 100, 200]);
      const result = arr.filter((v) => v === 65535);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007200
     * @tc.name testTypedUArraysFilterPart101_072
     * @tc.desc Verify Uint16Array 65536 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 100, 200]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007300
     * @tc.name testTypedUArraysFilterPart101_073
     * @tc.desc Verify Uint16Array 0x10000 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10000, 100, 200]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007400
     * @tc.name testTypedUArraysFilterPart101_074
     * @tc.desc Verify Uint32Array 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1000, 2000]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007500
     * @tc.name testTypedUArraysFilterPart101_075
     * @tc.desc Verify Uint32Array 1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 1000, 2000]);
      const result = arr.filter((v) => v === 1);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007600
     * @tc.name testTypedUArraysFilterPart101_076
     * @tc.desc Verify Uint32Array 2147483647 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647, 3000000000, 4294967295]);
      const result = arr.filter((v) => v === 2147483647);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007700
     * @tc.name testTypedUArraysFilterPart101_077
     * @tc.desc Verify Uint32Array 4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 4294967295]);
      const result = arr.filter((v) => v === 4294967295);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007800
     * @tc.name testTypedUArraysFilterPart101_078
     * @tc.desc Verify Uint32Array 0xFFFFFFFF Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x10000000, 0x80000000, 0xFFFFFFFF]);
      const result = arr.filter((v) => v === 0xFFFFFFFF);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_007900
     * @tc.name testTypedUArraysFilterPart101_079
     * @tc.desc Verify Uint32Array 0x80000000 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x40000000, 0x80000000, 0xC0000000]);
      const result = arr.filter((v) => v === 0x80000000);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008000
     * @tc.name testTypedUArraysFilterPart101_080
     * @tc.desc Verify Uint32Array -1 4294967295 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, 1000, 2000]);
      const result = arr.filter((v) => v === 4294967295);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008100
     * @tc.name testTypedUArraysFilterPart101_081
     * @tc.desc Verify Uint32Array 4294967296 0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 1000, 2000]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008200
     * @tc.name testTypedUArraysFilterPart101_082
     * @tc.desc Verify BigUint64Array 0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 100n, 200n]);
      const result = arr.filter((v) => v === 0n);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008300
     * @tc.name testTypedUArraysFilterPart101_083
     * @tc.desc Verify BigUint64Array 1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 100n, 200n]);
      const result = arr.filter((v) => v === 1n);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008400
     * @tc.name testTypedUArraysFilterPart101_084
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 100n, 200n]);
      const result = arr.filter((_v, i) => i === 1 || i === 2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008500
     * @tc.name testTypedUArraysFilterPart101_085
     * @tc.desc Verify BigUint64Array BigInt('0x7FFFFFFFFFFFFFFF') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('0x4000000000000000'), BigInt('0x7FFFFFFFFFFFFFFF'), BigInt('0xFFFFFFFFFFFFFFFF')]);
      const result = arr.filter((v) => v === BigInt('9223372036854775807'));
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(BigInt('9223372036854775807'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008600
     * @tc.name testTypedUArraysFilterPart101_086
     * @tc.desc Verify BigUint64Array BigInt('0xFFFFFFFFFFFFFFFF') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, BigInt('0xFFFFFFFFFFFFFFFF')]);
      const result = arr.filter((_v, i) => i === 0 || i === 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008700
     * @tc.name testTypedUArraysFilterPart101_087
     * @tc.desc Verify filter Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.filter((v) => v > 0);
      expect(Array.from(result).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008800
     * @tc.name testTypedUArraysFilterPart101_088
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const result = arr.filter((v) => v === 99);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_008900
     * @tc.name testTypedUArraysFilterPart101_089
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      const result = arr.filter((v) => v !== 99);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009000
     * @tc.name testTypedUArraysFilterPart101_090
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42]);
      const result = arr.filter((v) => v === 42);
      expect(Array.from(result).length).assertEqual(4);
      expect(Array.from(result)[0]).assertEqual(42);
      expect(Array.from(result)[1]).assertEqual(42);
      expect(Array.from(result)[2]).assertEqual(42);
      expect(Array.from(result)[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009100
     * @tc.name testTypedUArraysFilterPart101_091
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42, 42, 42, 42]);
      const result = arr.filter((v) => v !== 42);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009200
     * @tc.name testTypedUArraysFilterPart101_092
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255, 1, 64]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009300
     * @tc.name testTypedUArraysFilterPart101_093
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x80, 0xFF, 0b00000001]);
      const result = arr.filter((v) => v === 0x80);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009400
     * @tc.name testTypedUArraysFilterPart101_094
     * @tc.desc Verify 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      arr[99] = 99;
      const result = arr.filter((v) => v === 99);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009500
     * @tc.name testTypedUArraysFilterPart101_095
     * @tc.desc Verify 1000 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([50, 60, 70, 80]);
      const result = arr.filter((v) => v > 55);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009600
     * @tc.name testTypedUArraysFilterPart101_096
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -3, 10]);
      const result = arr.filter((v) => v === 255);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009700
     * @tc.name testTypedUArraysFilterPart101_097
     * @tc.desc Verify NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.NaN, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009800
     * @tc.name testTypedUArraysFilterPart101_098
     * @tc.desc Verify Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, 10, 20]);
      const result = arr.filter((v) => v === 0);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILTER_PART101_009900
     * @tc.name testTypedUArraysFilterPart101_099
     * @tc.desc Verify 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFilterPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      arr[0] = 99;
      const result = arr.filter((v) => v === 99);
      expect(Array.from(result).length).assertEqual(1);
      expect(Array.from(result)[0]).assertEqual(99);
    });
  });
}
