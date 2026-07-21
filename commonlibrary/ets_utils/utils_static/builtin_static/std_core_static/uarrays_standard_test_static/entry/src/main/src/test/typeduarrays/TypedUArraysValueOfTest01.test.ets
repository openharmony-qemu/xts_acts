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

export default function typedUArraysValueOfTest01(): void {
  describe('TypedUArraysValueOfTest01', (): void => {
    beforeAll((): void => {
    });

    beforeEach((): void => {
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0100
     * @tc.name testTypedUArraysValueOf01_001
     * @tc.desc Verify Uint8Array valueOf instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0200
     * @tc.name testTypedUArraysValueOf01_002
     * @tc.desc Verify Uint16Array valueOf instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0300
     * @tc.name testTypedUArraysValueOf01_003
     * @tc.desc Verify Uint32Array valueOf instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0400
     * @tc.name testTypedUArraysValueOf01_004
     * @tc.desc Verify BigUint64Array valueOf instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0500
     * @tc.name testTypedUArraysValueOf01_005
     * @tc.desc Verify Uint8Array valueOf typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0600
     * @tc.name testTypedUArraysValueOf01_006
     * @tc.desc Verify Uint16Array valueOf typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0700
     * @tc.name testTypedUArraysValueOf01_007
     * @tc.desc Verify Uint32Array valueOf typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0800
     * @tc.name testTypedUArraysValueOf01_008
     * @tc.desc Verify BigUint64Array valueOf typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_0900
     * @tc.name testTypedUArraysValueOf01_009
     * @tc.desc Verify Uint8Array valueOf instanceof Object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1000
     * @tc.name testTypedUArraysValueOf01_010
     * @tc.desc Verify Uint16Array valueOf instanceof Object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1100
     * @tc.name testTypedUArraysValueOf01_011
     * @tc.desc Verify Uint32Array valueOf instanceof Object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1200
     * @tc.name testTypedUArraysValueOf01_012
     * @tc.desc Verify BigUint64Array valueOf instanceof Object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      let result = arr.valueOf();
      expect(typeof result).assertEqual('object');
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1300
     * @tc.name testTypedUArraysValueOf01_013
     * @tc.desc Verify Uint8Array valueOf Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      let result = arr.valueOf();
      expect(Array.isArray(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1400
     * @tc.name testTypedUArraysValueOf01_014
     * @tc.desc Verify Uint16Array valueOf Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      let result = arr.valueOf();
      expect(Array.isArray(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1500
     * @tc.name testTypedUArraysValueOf01_015
     * @tc.desc Verify Uint32Array valueOf Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      let result = arr.valueOf();
      expect(Array.isArray(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1600
     * @tc.name testTypedUArraysValueOf01_016
     * @tc.desc Verify BigUint64Array valueOf Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      let result = arr.valueOf();
      expect(Array.isArray(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1700
     * @tc.name testTypedUArraysValueOf01_017
     * @tc.desc Verify Uint8Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1800
     * @tc.name testTypedUArraysValueOf01_018
     * @tc.desc Verify Uint16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_1900
     * @tc.name testTypedUArraysValueOf01_019
     * @tc.desc Verify Uint32Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2000
     * @tc.name testTypedUArraysValueOf01_020
     * @tc.desc Verify BigUint64Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2100
     * @tc.name testTypedUArraysValueOf01_021
     * @tc.desc Verify Uint8Array valueOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      let result = arr.valueOf();
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2200
     * @tc.name testTypedUArraysValueOf01_022
     * @tc.desc Verify Uint16Array valueOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(8);
      let result = arr.valueOf();
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2300
     * @tc.name testTypedUArraysValueOf01_023
     * @tc.desc Verify Uint32Array valueOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(8);
      let result = arr.valueOf();
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2400
     * @tc.name testTypedUArraysValueOf01_024
     * @tc.desc Verify BigUint64Array valueOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(8);
      let result = arr.valueOf();
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2500
     * @tc.name testTypedUArraysValueOf01_025
     * @tc.desc Verify Uint8Array valueOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      let result = arr.valueOf();
      expect(result.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2600
     * @tc.name testTypedUArraysValueOf01_026
     * @tc.desc Verify Uint16Array valueOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(8);
      let result = arr.valueOf();
      expect(result.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2700
     * @tc.name testTypedUArraysValueOf01_027
     * @tc.desc Verify Uint32Array valueOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(8);
      let result = arr.valueOf();
      expect(result.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2800
     * @tc.name testTypedUArraysValueOf01_028
     * @tc.desc Verify BigUint64Array valueOf byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(8);
      let result = arr.valueOf();
      expect(result.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_2900
     * @tc.name testTypedUArraysValueOf01_029
     * @tc.desc Verify Uint8Array valueOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      let result = arr.valueOf();
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3000
     * @tc.name testTypedUArraysValueOf01_030
     * @tc.desc Verify Uint16Array valueOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(8);
      let result = arr.valueOf();
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3100
     * @tc.name testTypedUArraysValueOf01_031
     * @tc.desc Verify Uint32Array valueOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(8);
      let result = arr.valueOf();
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3200
     * @tc.name testTypedUArraysValueOf01_032
     * @tc.desc Verify BigUint64Array valueOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(8);
      let result = arr.valueOf();
      expect(result.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3300
     * @tc.name testTypedUArraysValueOf01_033
     * @tc.desc Verify Uint8Array valueOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      let result = arr.valueOf();
      expect(result.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3400
     * @tc.name testTypedUArraysValueOf01_034
     * @tc.desc Verify Uint16Array valueOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(8);
      let result = arr.valueOf();
      expect(result.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3500
     * @tc.name testTypedUArraysValueOf01_035
     * @tc.desc Verify Uint32Array valueOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(8);
      let result = arr.valueOf();
      expect(result.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_3600
     * @tc.name testTypedUArraysValueOf01_036
     * @tc.desc Verify BigUint64Array valueOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(8);
      let result = arr.valueOf();
      expect(result.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4100
     * @tc.name testTypedUArraysValueOf01_041
     * @tc.desc Verify Uint8Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.valueOf();
      result[0] = 255;
      const val0: number = arr[0];
      expect(val0).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4200
     * @tc.name testTypedUArraysValueOf01_042
     * @tc.desc Verify Uint16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.valueOf();
      result[0] = 65535;
      const val1: number = arr[0];
      expect(val1).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4300
     * @tc.name testTypedUArraysValueOf01_043
     * @tc.desc Verify Uint32Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.valueOf();
      result[0] = 4294967295;
      const val2: number = arr[0];
      expect(val2).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4400
     * @tc.name testTypedUArraysValueOf01_044
     * @tc.desc Verify BigUint64Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.valueOf();
      result[0] = BigInt('18446744073709551615');
      const val3: BigInt = arr[0];
      expect(val3).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4500
     * @tc.name testTypedUArraysValueOf01_045
     * @tc.desc Verify Uint8Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.valueOf();
      result[0] = 128;
      const val4: number = arr[0];
      expect(val4).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4600
     * @tc.name testTypedUArraysValueOf01_046
     * @tc.desc Verify Uint16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.valueOf();
      result[0] = 32768;
      const val5: number = arr[0];
      expect(val5).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4700
     * @tc.name testTypedUArraysValueOf01_047
     * @tc.desc Verify Uint32Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.valueOf();
      result[0] = 2147483648;
      const val6: number = arr[0];
      expect(val6).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4800
     * @tc.name testTypedUArraysValueOf01_048
     * @tc.desc Verify BigUint64Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.valueOf();
      result[0] = BigInt('9223372036854775808');
      const val7: BigInt = arr[0];
      expect(val7).assertEqual(BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_4900
     * @tc.name testTypedUArraysValueOf01_049
     * @tc.desc Verify Uint8Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.valueOf();
      result[1] = 99;
      const val8: number = arr[1];
      expect(val8).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_5000
     * @tc.name testTypedUArraysValueOf01_050
     * @tc.desc Verify Uint16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.valueOf();
      result[2] = 99;
      const val9: number = arr[2];
      expect(val9).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_5500
     * @tc.name testTypedUArraysValueOf01_055
     * @tc.desc Verify Uint8Array constructor name equals Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_5600
     * @tc.name testTypedUArraysValueOf01_056
     * @tc.desc Verify Uint16Array default value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_5700
     * @tc.name testTypedUArraysValueOf01_057
     * @tc.desc Verify Uint32Array default value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_5800
     * @tc.name testTypedUArraysValueOf01_058
     * @tc.desc Verify BigUint64Array default value is 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(1);
      expect(arr[0]).assertEqual(0n);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6000
     * @tc.name testTypedUArraysValueOf01_060
     * @tc.desc Verify Uint16Array index access read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6100
     * @tc.name testTypedUArraysValueOf01_061
     * @tc.desc Verify Uint32Array index access read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      expect(arr[0]).assertEqual(1000);
      expect(arr[1]).assertEqual(2000);
      expect(arr[2]).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6200
     * @tc.name testTypedUArraysValueOf01_062
     * @tc.desc Verify BigUint64Array index access read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200n);
      expect(arr[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6300
     * @tc.name testTypedUArraysValueOf01_063
     * @tc.desc Verify Uint8Array index access write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      arr[0] = 42;
      arr[1] = 128;
      arr[2] = 255;
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(128);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6400
     * @tc.name testTypedUArraysValueOf01_064
     * @tc.desc Verify Uint16Array index access write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      arr[0] = 42;
      arr[1] = 32768;
      arr[2] = 65535;
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6500
     * @tc.name testTypedUArraysValueOf01_065
     * @tc.desc Verify Uint32Array index access write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      arr[0] = 42;
      arr[1] = 2147483648;
      arr[2] = 4294967295;
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(2147483648);
      expect(arr[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6600
     * @tc.name testTypedUArraysValueOf01_066
     * @tc.desc Verify BigUint64Array index access write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      arr[0] = 42n;
      arr[1] = BigInt('9223372036854775808');
      arr[2] = BigInt('18446744073709551615');
      expect(arr[0]).assertEqual(42n);
      expect(arr[1]).assertEqual(BigInt('9223372036854775808'));
      expect(arr[2]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6700
     * @tc.name testTypedUArraysValueOf01_067
     * @tc.desc Verify Uint8Array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6800
     * @tc.name testTypedUArraysValueOf01_068
     * @tc.desc Verify Uint16Array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_6900
     * @tc.name testTypedUArraysValueOf01_069
     * @tc.desc Verify Uint32Array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7000
     * @tc.name testTypedUArraysValueOf01_070
     * @tc.desc Verify BigUint64Array length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(10);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7100
     * @tc.name testTypedUArraysValueOf01_071
     * @tc.desc Verify Uint8Array byteLength property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7200
     * @tc.name testTypedUArraysValueOf01_072
     * @tc.desc Verify Uint16Array byteLength property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(8);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7300
     * @tc.name testTypedUArraysValueOf01_073
     * @tc.desc Verify Uint32Array byteLength property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(8);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7400
     * @tc.name testTypedUArraysValueOf01_074
     * @tc.desc Verify BigUint64Array byteLength property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(8);
      expect(arr.byteLength).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7500
     * @tc.name testTypedUArraysValueOf01_075
     * @tc.desc Verify Uint8Array byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint8Array(buffer, 4, 8);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7600
     * @tc.name testTypedUArraysValueOf01_076
     * @tc.desc Verify Uint16Array byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint16Array(buffer, 4, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7700
     * @tc.name testTypedUArraysValueOf01_077
     * @tc.desc Verify Uint32Array byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint32Array(buffer, 4, 2);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7800
     * @tc.name testTypedUArraysValueOf01_078
     * @tc.desc Verify BigUint64Array byteOffset property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new BigUint64Array(buffer, 8, 1);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_7900
     * @tc.name testTypedUArraysValueOf01_079
     * @tc.desc Verify Uint8Array buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint8Array(buffer);
      expect(arr.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8000
     * @tc.name testTypedUArraysValueOf01_080
     * @tc.desc Verify Uint16Array buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint16Array(buffer);
      expect(arr.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8100
     * @tc.name testTypedUArraysValueOf01_081
     * @tc.desc Verify Uint32Array buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint32Array(buffer);
      expect(arr.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8200
     * @tc.name testTypedUArraysValueOf01_082
     * @tc.desc Verify BigUint64Array buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new BigUint64Array(buffer);
      expect(arr.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8300
     * @tc.name testTypedUArraysValueOf01_083
     * @tc.desc Verify Uint8Array set from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.set([1, 2, 3, 4, 5]);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8400
     * @tc.name testTypedUArraysValueOf01_084
     * @tc.desc Verify Uint16Array set from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      arr.set([1, 2, 3, 4, 5]);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8500
     * @tc.name testTypedUArraysValueOf01_085
     * @tc.desc Verify Uint32Array set from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr.set([1, 2, 3, 4, 5]);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8600
     * @tc.name testTypedUArraysValueOf01_086
     * @tc.desc Verify BigUint64Array set from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      arr.set([1n, 2n, 3n, 4n, 5n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8700
     * @tc.name testTypedUArraysValueOf01_087
     * @tc.desc Verify Uint8Array set with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      arr.set([10, 20, 30], 2);
      expect(arr[2]).assertEqual(10);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8800
     * @tc.name testTypedUArraysValueOf01_088
     * @tc.desc Verify Uint8Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      arr.fill(42);
      expect(arr[0]).assertEqual(42);
      expect(arr[2]).assertEqual(42);
      expect(arr[4]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_8900
     * @tc.name testTypedUArraysValueOf01_089
     * @tc.desc Verify Uint16Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      arr.fill(65535);
      expect(arr[0]).assertEqual(65535);
      expect(arr[4]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9000
     * @tc.name testTypedUArraysValueOf01_090
     * @tc.desc Verify Uint32Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr.fill(4294967295);
      expect(arr[0]).assertEqual(4294967295);
      expect(arr[4]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9100
     * @tc.name testTypedUArraysValueOf01_091
     * @tc.desc Verify BigUint64Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      arr.fill(BigInt('18446744073709551615'));
      expect(arr[0]).assertEqual(BigInt('18446744073709551615'));
      expect(arr[4]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9200
     * @tc.name testTypedUArraysValueOf01_092
     * @tc.desc Verify Uint8Array fill with start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(99, 1, 4);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[3]).assertEqual(99);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9300
     * @tc.name testTypedUArraysValueOf01_093
     * @tc.desc Verify Uint8Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9400
     * @tc.name testTypedUArraysValueOf01_094
     * @tc.desc Verify Uint16Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9500
     * @tc.name testTypedUArraysValueOf01_095
     * @tc.desc Verify Uint32Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUEOF01_9600
     * @tc.name testTypedUArraysValueOf01_096
     * @tc.desc Verify BigUint64Array copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValueOf01_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(4n);
    });

  });
}
