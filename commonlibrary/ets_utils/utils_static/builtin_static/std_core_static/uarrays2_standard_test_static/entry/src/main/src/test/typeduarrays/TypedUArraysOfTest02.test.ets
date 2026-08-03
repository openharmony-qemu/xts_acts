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

export default function typedUArraysOfTest02(): void {
  describe('TypedUArraysOfTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0100
     * @tc.name testTypedUArraysOfTestFileB001
     * @tc.desc Verify Uint8Array.of instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(Uint8Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0200
     * @tc.name testTypedUArraysOfTestFileB002
     * @tc.desc Verify Uint16Array.of instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 2, 3);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(Uint16Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0300
     * @tc.name testTypedUArraysOfTestFileB003
     * @tc.desc Verify Uint32Array.of instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 2, 3);
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(Uint32Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0400
     * @tc.name testTypedUArraysOfTestFileB004
     * @tc.desc Verify BigInt64Array.of instanceof BigInt64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(1n, 2n, 3n);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(BigInt64Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0500
     * @tc.name testTypedUArraysOfTestFileB005
     * @tc.desc Verify BigUint64Array.of instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(1n, 2n, 3n);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(BigUint64Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0600
     * @tc.name testTypedUArraysOfTestFileB006
     * @tc.desc Verify Uint8Array.of typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0700
     * @tc.name testTypedUArraysOfTestFileB007
     * @tc.desc Verify BigInt64Array.of typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(1n);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0800
     * @tc.name testTypedUArraysOfTestFileB008
     * @tc.desc Verify Uint8Array.of Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(Uint8Array.BYTES_PER_ELEMENT).not().assertEqual(Uint16Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_0900
     * @tc.name testTypedUArraysOfTestFileB009
     * @tc.desc Verify Uint16Array.of Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 2, 3);
      expect(Uint16Array.BYTES_PER_ELEMENT).not().assertEqual(Uint8Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1000
     * @tc.name testTypedUArraysOfTestFileB010
     * @tc.desc Verify Uint8Array.of Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(Array.isArray(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1100
     * @tc.name testTypedUArraysOfTestFileB011
     * @tc.desc Verify Uint8Array.of instanceof Object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1200
     * @tc.name testTypedUArraysOfTestFileB012
     * @tc.desc Verify BigInt64Array.of BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(1n, 2n, 3n);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(BigUint64Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1300
     * @tc.name testTypedUArraysOfTestFileB013
     * @tc.desc Verify BigUint64Array.of BigInt64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(1n, 2n, 3n);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(BigInt64Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1400
     * @tc.name testTypedUArraysOfTestFileB014
     * @tc.desc Verify Uint8Array.of 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 1, 127, 255);
      const val0 = result[0];
      expect(val0).assertEqual(0);
      const val1 = result[3];
      expect(val1).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1500
     * @tc.name testTypedUArraysOfTestFileB015
     * @tc.desc Verify Uint16Array.of 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0, 1, 32767, 65535);
      const val2 = result[0];
      expect(val2).assertEqual(0);
      const val3 = result[3];
      expect(val3).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1600
     * @tc.name testTypedUArraysOfTestFileB016
     * @tc.desc Verify Uint32Array.of 0 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0, 1, 2147483647, 4294967295);
      const val4 = result[0];
      expect(val4).assertEqual(0);
      const val5 = result[3];
      expect(val5).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1700
     * @tc.name testTypedUArraysOfTestFileB017
     * @tc.desc Verify BigInt64Array.of -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(0n, 1n, -1n);
      const val6 = result[2];
      expect(val6).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1800
     * @tc.name testTypedUArraysOfTestFileB018
     * @tc.desc Verify BigUint64Array.of BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(0n, 1n, BigInt('18446744073709551615'));
      const val7 = result[2];
      expect(val7).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_1900
     * @tc.name testTypedUArraysOfTestFileB019
     * @tc.desc Verify Uint8Array.of 0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0x80);
      const val8 = result[0];
      expect(val8).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2000
     * @tc.name testTypedUArraysOfTestFileB020
     * @tc.desc Verify Uint16Array.of 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(0x8000);
      const val9 = result[0];
      expect(val9).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2100
     * @tc.name testTypedUArraysOfTestFileB021
     * @tc.desc Verify Uint32Array.of 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(0x80000000);
      const val10 = result[0];
      expect(val10).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2200
     * @tc.name testTypedUArraysOfTestFileB022
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 1, 2, 3, 4, 5);
      const val11 = result[2];
      expect(val11).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2300
     * @tc.name testTypedUArraysOfTestFileB023
     * @tc.desc Verify Uint16Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(10, 20, 30);
      const val12 = result[1];
      expect(val12).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2400
     * @tc.name testTypedUArraysOfTestFileB024
     * @tc.desc Verify Uint32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(100, 200, 300);
      const val13 = result[2];
      expect(val13).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2500
     * @tc.name testTypedUArraysOfTestFileB025
     * @tc.desc Verify BigInt64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(100n, 200n, 300n);
      const val14 = result[1];
      expect(val14).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2600
     * @tc.name testTypedUArraysOfTestFileB026
     * @tc.desc Verify BigUint64Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(100n, 200n, 300n);
      const val15 = result[2];
      expect(val15).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2700
     * @tc.name testTypedUArraysOfTestFileB027
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(0, 0, 0, 0, 0);
      const val16 = result[0];
      expect(val16).assertEqual(0);
      const val17 = result[4];
      expect(val17).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2800
     * @tc.name testTypedUArraysOfTestFileB028
     * @tc.desc Verify Uint8Array.of 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(255, 255, 255, 255, 255);
      const val18 = result[0];
      expect(val18).assertEqual(255);
      const val19 = result[4];
      expect(val19).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_2900
     * @tc.name testTypedUArraysOfTestFileB029
     * @tc.desc Verify Uint16Array.of 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(65535, 65535, 65535);
      const val20 = result[0];
      expect(val20).assertEqual(65535);
      const val21 = result[2];
      expect(val21).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3000
     * @tc.name testTypedUArraysOfTestFileB030
     * @tc.desc Verify Uint32Array.of 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(4294967295, 4294967295);
      const val22 = result[0];
      expect(val22).assertEqual(4294967295);
      const val23 = result[1];
      expect(val23).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3100
     * @tc.name testTypedUArraysOfTestFileB031
     * @tc.desc Verify BigInt64Array.of -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(-1n, -1n, -1n);
      const val24 = result[0];
      expect(val24).assertEqual(-1n);
      const val25 = result[2];
      expect(val25).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3200
     * @tc.name testTypedUArraysOfTestFileB032
     * @tc.desc Verify BigUint64Array.of BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(BigInt('18446744073709551615'), BigInt('18446744073709551615'));
      const val26 = result[0];
      expect(val26).assertEqual(BigInt('18446744073709551615'));
      const val27 = result[1];
      expect(val27).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3300
     * @tc.name testTypedUArraysOfTestFileB033
     * @tc.desc Verify Uint8Array.of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3400
     * @tc.name testTypedUArraysOfTestFileB034
     * @tc.desc Verify Uint8Array.of length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3500
     * @tc.name testTypedUArraysOfTestFileB035
     * @tc.desc Verify Uint8Array.of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3600
     * @tc.name testTypedUArraysOfTestFileB036
     * @tc.desc Verify Uint8Array.of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3700
     * @tc.name testTypedUArraysOfTestFileB037
     * @tc.desc Verify Uint8Array.of length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3800
     * @tc.name testTypedUArraysOfTestFileB038
     * @tc.desc Verify Uint8Array.of length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_3900
     * @tc.name testTypedUArraysOfTestFileB039
     * @tc.desc Verify BigInt64Array.of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(1n, 2n, 3n);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4000
     * @tc.name testTypedUArraysOfTestFileB040
     * @tc.desc Verify BigUint64Array.of length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(1n, 2n, 3n, 4n);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4100
     * @tc.name testTypedUArraysOfTestFileB041
     * @tc.desc Verify Uint16Array.of length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4200
     * @tc.name testTypedUArraysOfTestFileB042
     * @tc.desc Verify Uint32Array.of length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4300
     * @tc.name testTypedUArraysOfTestFileB043
     * @tc.desc Verify Uint8Array.of byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4400
     * @tc.name testTypedUArraysOfTestFileB044
     * @tc.desc Verify Uint16Array.of byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(1, 2, 3);
      expect(result.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4500
     * @tc.name testTypedUArraysOfTestFileB045
     * @tc.desc Verify Uint32Array.of byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint32Array.of(1, 2, 3);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4600
     * @tc.name testTypedUArraysOfTestFileB046
     * @tc.desc Verify BigInt64Array.of byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigInt64Array.of(1n, 2n);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4700
     * @tc.name testTypedUArraysOfTestFileB047
     * @tc.desc Verify BigUint64Array.of byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(1n, 2n);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4800
     * @tc.name testTypedUArraysOfTestFileB048
     * @tc.desc Verify Uint8Array.of byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of();
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_4900
     * @tc.name testTypedUArraysOfTestFileB049
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of();
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5000
     * @tc.name testTypedUArraysOfTestFileB050
     * @tc.desc Verify Uint8Array entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const iterator = result.entries();
      const ir = iterator.next();
      const val0 = ir.value![0]!;
      expect(val0).assertEqual(0);
      const val1 = ir.value![1]!;
      expect(val1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5100
     * @tc.name testTypedUArraysOfTestFileB051
     * @tc.desc Verify Uint8Array keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(10, 20, 30);
      const iterator = result.keys();
      const kr = iterator.next();
      const kv = kr.value!;
      expect(kv).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5200
     * @tc.name testTypedUArraysOfTestFileB052
     * @tc.desc Verify Uint8Array values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(5, 10, 15);
      const iterator = result.values();
      const vr = iterator.next();
      expect(vr.value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5300
     * @tc.name testTypedUArraysOfTestFileB053
     * @tc.desc Verify BigUint64Array entries iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = BigUint64Array.of(10n, 20n, 30n);
      const iterator = result.entries();
      const ir = iterator.next();
      const v0 = ir.value![0]!;
      expect(v0).assertEqual(0);
      const v1 = ir.value![1]!;
      expect(v1).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5400
     * @tc.name testTypedUArraysOfTestFileB054
     * @tc.desc Verify Uint8Array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const sliced = result.slice(1, 4);
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual(2);
      expect(sliced[1]).assertEqual(3);
      expect(sliced[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5500
     * @tc.name testTypedUArraysOfTestFileB055
     * @tc.desc Verify Uint8Array subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3, 4, 5);
      const sub = result.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5600
     * @tc.name testTypedUArraysOfTestFileB056
     * @tc.desc Verify Uint16Array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint16Array.of(10, 20, 30, 40, 50);
      const sliced = result.slice(2);
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5700
     * @tc.name testTypedUArraysOfTestFileB057
     * @tc.desc Verify Uint8Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(1, 2, 3);
      const rev = result.toReversed();
      expect(rev.length).assertEqual(3);
      expect(rev[0]).assertEqual(3);
      expect(rev[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5800
     * @tc.name testTypedUArraysOfTestFileB058
     * @tc.desc Verify Uint8Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(3, 1, 2);
      const sorted = result.toSorted();
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(2);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_5900
     * @tc.name testTypedUArraysOfTestFileB059
     * @tc.desc Verify Uint8Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Uint8Array.of(3, 1, 2);
      result.sort();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6000
     * @tc.name testTypedUArraysOfTestFileB060
     * @tc.desc Verify Uint8Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(5);
      arr.set([1, 2, 3], 1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6100
     * @tc.name testTypedUArraysOfTestFileB061
     * @tc.desc Verify Uint8Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.fill(0, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6200
     * @tc.name testTypedUArraysOfTestFileB062
     * @tc.desc Verify Uint8Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6300
     * @tc.name testTypedUArraysOfTestFileB063
     * @tc.desc Verify Uint16Array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint16Array(4);
      arr.set([100, 200], 0);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6400
     * @tc.name testTypedUArraysOfTestFileB064
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1, 2, 3]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6500
     * @tc.name testTypedUArraysOfTestFileB065
     * @tc.desc Verify Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.from([10, 20, 30]);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_OF_PART201_6600
     * @tc.name testTypedUArraysOfTestFileB066
     * @tc.desc Verify BigUint64Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysOfTestFileB066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.from([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
    });
  });
}
