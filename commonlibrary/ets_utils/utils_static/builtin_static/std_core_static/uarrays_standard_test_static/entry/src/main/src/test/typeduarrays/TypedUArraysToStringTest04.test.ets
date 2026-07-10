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

export default function typedUArraysToStringTest04(): void {
  describe('TypedUArraysToStringTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0100
     * @tc.name testTypedUArraysToString04_001
     * @tc.desc Verify Uint8Array Infinity toString clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([Number.POSITIVE_INFINITY, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0200
     * @tc.name testTypedUArraysToString04_002
     * @tc.desc Verify Uint16Array Infinity toString clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([Number.POSITIVE_INFINITY, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0300
     * @tc.name testTypedUArraysToString04_003
     * @tc.desc Verify Uint32Array Infinity toString clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([Number.POSITIVE_INFINITY, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0400
     * @tc.name testTypedUArraysToString04_004
     * @tc.desc Verify Uint8ClampedArray Infinity toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("255,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0500
     * @tc.name testTypedUArraysToString04_005
     * @tc.desc Verify Uint8Array -1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("255,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0600
     * @tc.name testTypedUArraysToString04_006
     * @tc.desc Verify Uint16Array -1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([-1, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("65535,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0700
     * @tc.name testTypedUArraysToString04_007
     * @tc.desc Verify Uint32Array -1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([-1, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("4294967295,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0800
     * @tc.name testTypedUArraysToString04_008
     * @tc.desc Verify Uint8ClampedArray -1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_0900
     * @tc.name testTypedUArraysToString04_009
     * @tc.desc Verify Uint8Array -0 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-0, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1000
     * @tc.name testTypedUArraysToString04_010
     * @tc.desc Verify Uint8Array 0.5 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0.5, 1.5, 2.5]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1100
     * @tc.name testTypedUArraysToString04_011
     * @tc.desc Verify Uint8Array 256 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1200
     * @tc.name testTypedUArraysToString04_012
     * @tc.desc Verify Uint16Array 65536 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65536, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1300
     * @tc.name testTypedUArraysToString04_013
     * @tc.desc Verify Uint32Array 4294967296 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967296, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1400
     * @tc.name testTypedUArraysToString04_014
     * @tc.desc Verify Uint8ClampedArray 256 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("255,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1500
     * @tc.name testTypedUArraysToString04_015
     * @tc.desc Verify Uint8ClampedArray -1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 1, 2]);
      let result = arr.toString();
      expect(result).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1600
     * @tc.name testTypedUArraysToString04_016
     * @tc.desc Verify Uint8Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0,0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1700
     * @tc.name testTypedUArraysToString04_017
     * @tc.desc Verify Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(4);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1800
     * @tc.name testTypedUArraysToString04_018
     * @tc.desc Verify Uint32Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(4);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_1900
     * @tc.name testTypedUArraysToString04_019
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(4);
      let result = arr.toString();
      expect(result).assertEqual("0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_2000
     * @tc.name testTypedUArraysToString04_020
     * @tc.desc Verify Uint8Array buffer+offset+length toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Uint8Array(buffer);
      view.set([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]);
      const arr = new Uint8Array(buffer, 4, 8);
      let result = arr.toString();
      expect(result).assertEqual("5,6,7,8,9,10,11,12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_2100
     * @tc.name testTypedUArraysToString04_021
     * @tc.desc Verify Uint16Array buffer+offset+length toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Uint16Array(buffer);
      view.set([1, 2, 3, 4, 5, 6, 7, 8]);
      const arr = new Uint16Array(buffer, 4, 4);
      let result = arr.toString();
      expect(result).assertEqual("3,4,5,6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_2200
     * @tc.name testTypedUArraysToString04_022
     * @tc.desc Verify Uint32Array buffer+offset+length toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Uint32Array(buffer);
      view.set([1, 2, 3, 4]);
      const arr = new Uint32Array(buffer, 4, 2);
      let result = arr.toString();
      expect(result).assertEqual("2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSTRING04_2300
     * @tc.name testTypedUArraysToString04_023
     * @tc.desc Verify BigUint64Array buffer+offset+length toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToString04_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32);
      const view = new BigUint64Array(buffer);
      view.set([1n, 2n, 3n, 4n]);
      const arr = new BigUint64Array(buffer, 16, 2);
      let result = arr.toString();
      expect(result).assertEqual("3,4");
    });

  });
}
