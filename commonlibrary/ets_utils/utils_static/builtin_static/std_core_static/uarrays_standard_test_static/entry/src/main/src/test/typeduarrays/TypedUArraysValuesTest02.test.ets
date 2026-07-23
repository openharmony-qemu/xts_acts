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

export default function typedUArraysValuesTest02(): void {
  describe('TypedUArraysValuesTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0100
     * @tc.name testTypedUArraysValuesPart102_001
     * @tc.desc Verify values() BigUint64Array for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n]);
      const it = arr.values();
      let sum = 0n;
      for (const v of it) {
        sum = sum + v;
      }
      expect(sum).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0200
     * @tc.name testTypedUArraysValuesPart102_002
     * @tc.desc Verify values() Uint32Array for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      const it = arr.values();
      let sum: number = 0;
      for (const v of it) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0300
     * @tc.name testTypedUArraysValuesPart102_003
     * @tc.desc Verify values() Uint16Array for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const it = arr.values();
      let sum: number = 0;
      for (const v of it) {
        sum = sum + v;
      }
      expect(sum).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0400
     * @tc.name testTypedUArraysValuesPart102_004
     * @tc.desc Verify values() Uint8ClampedArray for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const it = arr.values();
      let sum: number = 0;
      for (const v of it) {
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0500
     * @tc.name testTypedUArraysValuesPart102_005
     * @tc.desc Verify Uint8Array.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0600
     * @tc.name testTypedUArraysValuesPart102_006
     * @tc.desc Verify BigUint64Array.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0700
     * @tc.name testTypedUArraysValuesPart102_007
     * @tc.desc Verify Uint8Array.values() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0800
     * @tc.name testTypedUArraysValuesPart102_008
     * @tc.desc Verify BigUint64Array.values() BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_0900
     * @tc.name testTypedUArraysValuesPart102_009
     * @tc.desc Verify Uint16Array.values() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1000
     * @tc.name testTypedUArraysValuesPart102_010
     * @tc.desc Verify Uint32Array.values() Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1100
     * @tc.name testTypedUArraysValuesPart102_011
     * @tc.desc Verify values() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n]);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1200
     * @tc.name testTypedUArraysValuesPart102_012
     * @tc.desc Verify values() 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1300
     * @tc.name testTypedUArraysValuesPart102_013
     * @tc.desc Verify values() 1000 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1000);
      const it = arr.values();
      const _r = it.next();
      expect(_r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1400
     * @tc.name testTypedUArraysValuesPart102_014
     * @tc.desc Verify Uint8Array NaN values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([NaN]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1500
     * @tc.name testTypedUArraysValuesPart102_015
     * @tc.desc Verify Uint8Array Infinity values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Infinity]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1600
     * @tc.name testTypedUArraysValuesPart102_016
     * @tc.desc Verify Uint8Array -Infinity values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-Infinity]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1700
     * @tc.name testTypedUArraysValuesPart102_017
     * @tc.desc Verify Uint8ClampedArray Infinity values() 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Infinity]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1800
     * @tc.name testTypedUArraysValuesPart102_018
     * @tc.desc Verify Uint8Array 0.5 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0.5]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_1900
     * @tc.name testTypedUArraysValuesPart102_019
     * @tc.desc Verify Uint8Array 1.9 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.9]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2000
     * @tc.name testTypedUArraysValuesPart102_020
     * @tc.desc Verify Uint8ClampedArray 0.5 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2100
     * @tc.name testTypedUArraysValuesPart102_021
     * @tc.desc Verify Uint8ClampedArray 1.9 values() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1.9]);
      const it = arr.values();
      let result = it.next();
      expect(result.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2200
     * @tc.name testTypedUArraysValuesPart102_022
     * @tc.desc Verify BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2300
     * @tc.name testTypedUArraysValuesPart102_023
     * @tc.desc Verify BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2400
     * @tc.name testTypedUArraysValuesPart102_024
     * @tc.desc Verify length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4]);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2500
     * @tc.name testTypedUArraysValuesPart102_025
     * @tc.desc Verify length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_VALUES_PART102_2600
     * @tc.name testTypedUArraysValuesPart102_026
     * @tc.desc Verify buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysValuesPart102_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

  });
}
