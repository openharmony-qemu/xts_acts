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

export default function typedUArraysValuesTest04(): void {
  describe('TypedUArraysValuesTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0100
     * @tc.name testTypedUArraysValuesPart101_001
     * @tc.desc Verify Uint16Array 65537 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65537]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0200
     * @tc.name testTypedUArraysValuesPart101_002
     * @tc.desc Verify Uint16Array -1 values() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0300
     * @tc.name testTypedUArraysValuesPart101_003
     * @tc.desc Verify Uint16Array 0x10001 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x10001]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0400
     * @tc.name testTypedUArraysValuesPart101_004
     * @tc.desc Verify Uint16Array 0xFFFFFFFF values() 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0500
     * @tc.name testTypedUArraysValuesPart101_005
     * @tc.desc Verify Uint32Array values() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      const it = arr.values();
      let result = it.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0600
     * @tc.name testTypedUArraysValuesPart101_006
     * @tc.desc Verify Uint32Array [0]values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0700
     * @tc.name testTypedUArraysValuesPart101_007
     * @tc.desc Verify Uint32Array [1]values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0800
     * @tc.name testTypedUArraysValuesPart101_008
     * @tc.desc Verify Uint32Array [2147483647]values() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([2147483647]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_0900
     * @tc.name testTypedUArraysValuesPart101_009
     * @tc.desc Verify Uint32Array [4294967295]values() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1000
     * @tc.name testTypedUArraysValuesPart101_010
     * @tc.desc Verify Uint32Array [0xFFFFFFFF]values() 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1100
     * @tc.name testTypedUArraysValuesPart101_011
     * @tc.desc Verify Uint32Array [0x80000000]values() 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x80000000]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1200
     * @tc.name testTypedUArraysValuesPart101_012
     * @tc.desc Verify Uint32Array [1,2,3]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(1);
      expect(r2.value).assertEqual(2);
      expect(r3.value).assertEqual(3);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1300
     * @tc.name testTypedUArraysValuesPart101_013
     * @tc.desc Verify Uint32Array [0,4294967295,0]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 4294967295, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(4294967295);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1400
     * @tc.name testTypedUArraysValuesPart101_014
     * @tc.desc Verify Uint32Array [0x01,0xFFFFFFFF,0x80000000]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x01, 0xFFFFFFFF, 0x80000000]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0x01);
      expect(r2.value).assertEqual(0xFFFFFFFF);
      expect(r3.value).assertEqual(0x80000000);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1500
     * @tc.name testTypedUArraysValuesPart101_015
     * @tc.desc Verify Uint32Array values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0);
      expect(r2.value).assertEqual(0);
      expect(r3.value).assertEqual(0);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1600
     * @tc.name testTypedUArraysValuesPart101_016
     * @tc.desc Verify Uint32Array 4294967295 values() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(4294967295);
      expect(r2.value).assertEqual(4294967295);
      expect(r3.value).assertEqual(4294967295);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1700
     * @tc.name testTypedUArraysValuesPart101_017
     * @tc.desc Verify Uint32Array 4294967296 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1800
     * @tc.name testTypedUArraysValuesPart101_018
     * @tc.desc Verify Uint32Array 4294967297 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967297]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_1900
     * @tc.name testTypedUArraysValuesPart101_019
     * @tc.desc Verify Uint32Array -1 values() 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2000
     * @tc.name testTypedUArraysValuesPart101_020
     * @tc.desc Verify Uint32Array 0x100000000 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000000]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2100
     * @tc.name testTypedUArraysValuesPart101_021
     * @tc.desc Verify Uint32Array 0x100000001 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0x100000001]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2200
     * @tc.name testTypedUArraysValuesPart101_022
     * @tc.desc Verify BigUint64Array [0n]values() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2300
     * @tc.name testTypedUArraysValuesPart101_023
     * @tc.desc Verify BigUint64Array [1n]values() 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2400
     * @tc.name testTypedUArraysValuesPart101_024
     * @tc.desc Verify BigUint64Array [BigInt('18446744073709551615')]values() BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2500
     * @tc.name testTypedUArraysValuesPart101_025
     * @tc.desc Verify BigUint64Array [0n,1n,BigInt('18446744073709551615')]values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, BigInt('18446744073709551615')]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0n);
      expect(r2.value).assertEqual(1n);
      expect(r3.value).assertEqual(BigInt('18446744073709551615'));
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2600
     * @tc.name testTypedUArraysValuesPart101_026
     * @tc.desc Verify BigUint64Array values() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(0n);
      expect(r2.value).assertEqual(0n);
      expect(r3.value).assertEqual(0n);
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2700
     * @tc.name testTypedUArraysValuesPart101_027
     * @tc.desc Verify BigUint64Array values() BigInt('18446744073709551615'))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      const it = arr.values();
      const r1 = it.next();
      const r2 = it.next();
      const r3 = it.next();
      const r4 = it.next();
      expect(r1.value).assertEqual(BigInt('18446744073709551615'));
      expect(r2.value).assertEqual(BigInt('18446744073709551615'));
      expect(r3.value).assertEqual(BigInt('18446744073709551615'));
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2800
     * @tc.name testTypedUArraysValuesPart101_028
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551616') values() 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551616')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_2900
     * @tc.name testTypedUArraysValuesPart101_029
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551617') values() 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551617')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3000
     * @tc.name testTypedUArraysValuesPart101_030
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3100
     * @tc.name testTypedUArraysValuesPart101_031
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3200
     * @tc.name testTypedUArraysValuesPart101_032
     * @tc.desc Verify values() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3300
     * @tc.name testTypedUArraysValuesPart101_033
     * @tc.desc Verify values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3400
     * @tc.name testTypedUArraysValuesPart101_034
     * @tc.desc Verify values() Symbol.iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3500
     * @tc.name testTypedUArraysValuesPart101_035
     * @tc.desc Verify values() next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3600
     * @tc.name testTypedUArraysValuesPart101_036
     * @tc.desc Verify values() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      it.next();
      let result = it.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3700
     * @tc.name testTypedUArraysValuesPart101_037
     * @tc.desc Verify values() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      it.next();
      let result = it.next();
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3800
     * @tc.name testTypedUArraysValuesPart101_038
     * @tc.desc Verify values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const it = arr.values();
      let sum: number = 0;
      for (const v of it) {
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_3900
     * @tc.name testTypedUArraysValuesPart101_039
     * @tc.desc Verify values() Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10, 15]);
      const it = arr.values();
      const collected = Array.from(it);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(5);
      expect(collected[1]).assertEqual(10);
      expect(collected[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4000
     * @tc.name testTypedUArraysValuesPart101_040
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      const collected = Array.from(it);
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(1);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4100
     * @tc.name testTypedUArraysValuesPart101_041
     * @tc.desc Verify values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      let count = 0;
      for (const v of it) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4200
     * @tc.name testTypedUArraysValuesPart101_042
     * @tc.desc Verify values() Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const it = arr.values();
      const collected = Array.from(it);
      expect(collected.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4300
     * @tc.name testTypedUArraysValuesPart101_043
     * @tc.desc Verify values() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      const it = arr.values();
      let count = 0;
      for (const v of it) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4400
     * @tc.name testTypedUArraysValuesPart101_044
     * @tc.desc Verify values() next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1]);
      const it = arr.values();
      let result = it.next();
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4500
     * @tc.name testTypedUArraysValuesPart101_045
     * @tc.desc Verify values() Uint16Array next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFF);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4600
     * @tc.name testTypedUArraysValuesPart101_046
     * @tc.desc Verify values() Uint32Array next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0xFFFFFFFF);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4700
     * @tc.name testTypedUArraysValuesPart101_047
     * @tc.desc Verify values() BigUint64Array next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615')]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(BigInt('18446744073709551615'));
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_4800
     * @tc.name testTypedUArraysValuesPart101_048
     * @tc.desc Verify values() Uint8ClampedArray next() value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A200
     * @tc.name testTypedUArraysValuesPart101_101
     * @tc.desc Verify valueOf Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A300
     * @tc.name testTypedUArraysValuesPart101_102
     * @tc.desc Verify valueOf BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A400
     * @tc.name testTypedUArraysValuesPart101_103
     * @tc.desc Verify from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A500
     * @tc.name testTypedUArraysValuesPart101_104
     * @tc.desc Verify of Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A600
     * @tc.name testTypedUArraysValuesPart101_105
     * @tc.desc Verify of Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART101_A700
     * @tc.name testTypedUArraysValuesPart101_106
     * @tc.desc Verify of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart101_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(3n);
    });

  });
}
