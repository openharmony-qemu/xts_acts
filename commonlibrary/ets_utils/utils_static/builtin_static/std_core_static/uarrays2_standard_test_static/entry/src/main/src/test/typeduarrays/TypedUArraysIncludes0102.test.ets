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

export default function typedUArraysIncludes0102(): void {
  describe('TypedUArraysIncludes0102', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0100
     * @tc.name testTypedUArraysIncludesFileCX001
     * @tc.desc Verify Uint8ClampedArray includes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0200
     * @tc.name testTypedUArraysIncludesFileCX002
     * @tc.desc Verify Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 1])
      let result = arr.includes(255)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0300
     * @tc.name testTypedUArraysIncludesFileCX003
     * @tc.desc Verify Uint8ClampedArray 256 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 1])
      let result = arr.includes(256)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0400
     * @tc.name testTypedUArraysIncludesFileCX004
     * @tc.desc Verify Uint8ClampedArray -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2])
      let result = arr.includes(-1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0500
     * @tc.name testTypedUArraysIncludesFileCX005
     * @tc.desc Verify Uint8ClampedArray 300 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 1])
      let result = arr.includes(300)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0600
     * @tc.name testTypedUArraysIncludesFileCX006
     * @tc.desc Verify Uint8ClampedArray -10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2])
      let result = arr.includes(-10)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0700
     * @tc.name testTypedUArraysIncludesFileCX007
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0800
     * @tc.name testTypedUArraysIncludesFileCX008
     * @tc.desc Verify fromIndex 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(20, 1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_0900
     * @tc.name testTypedUArraysIncludesFileCX009
     * @tc.desc Verify fromIndex 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(30, 2)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1000
     * @tc.name testTypedUArraysIncludesFileCX010
     * @tc.desc Verify fromIndex length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40])
      let result = arr.includes(40, 3)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1100
     * @tc.name testTypedUArraysIncludesFileCX011
     * @tc.desc Verify fromIndex length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, 3)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1200
     * @tc.name testTypedUArraysIncludesFileCX012
     * @tc.desc Verify fromIndex length+1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, 4)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1300
     * @tc.name testTypedUArraysIncludesFileCX013
     * @tc.desc Verify fromIndex -1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(30, -1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1400
     * @tc.name testTypedUArraysIncludesFileCX014
     * @tc.desc Verify fromIndex -2 length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(20, -2)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1500
     * @tc.name testTypedUArraysIncludesFileCX015
     * @tc.desc Verify fromIndex -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, -3)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1600
     * @tc.name testTypedUArraysIncludesFileCX016
     * @tc.desc Verify fromIndex -length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, -4)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1700
     * @tc.name testTypedUArraysIncludesFileCX017
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(99, 0)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1800
     * @tc.name testTypedUArraysIncludesFileCX018
     * @tc.desc Verify fromIndex 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, 1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_1900
     * @tc.name testTypedUArraysIncludesFileCX019
     * @tc.desc Verify fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(10, -1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2000
     * @tc.name testTypedUArraysIncludesFileCX020
     * @tc.desc Verify Uint16Array fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.includes(10, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2100
     * @tc.name testTypedUArraysIncludesFileCX021
     * @tc.desc Verify Uint32Array fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300])
      let result = arr.includes(100, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2200
     * @tc.name testTypedUArraysIncludesFileCX022
     * @tc.desc Verify BigUint64Array fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n])
      let result = arr.includes(10n, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2300
     * @tc.name testTypedUArraysIncludesFileCX023
     * @tc.desc Verify Uint8ClampedArray fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30])
      let result = arr.includes(10, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2400
     * @tc.name testTypedUArraysIncludesFileCX024
     * @tc.desc Verify Uint16Array fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.includes(30, -1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2500
     * @tc.name testTypedUArraysIncludesFileCX025
     * @tc.desc Verify Uint16Array fromIndex length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.includes(10, 3)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2600
     * @tc.name testTypedUArraysIncludesFileCX026
     * @tc.desc Verify Uint32Array fromIndex -length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300])
      let result = arr.includes(100, -3)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2700
     * @tc.name testTypedUArraysIncludesFileCX027
     * @tc.desc Verify Uint8ClampedArray fromIndex 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30])
      let result = arr.includes(20, 1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2800
     * @tc.name testTypedUArraysIncludesFileCX028
     * @tc.desc Verify BigUint64Array fromIndex -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n])
      let result = arr.includes(20n, -2)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_2900
     * @tc.name testTypedUArraysIncludesFileCX029
     * @tc.desc Verify Uint8Array fromIndex 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.includes(0, 0)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3000
     * @tc.name testTypedUArraysIncludesFileCX030
     * @tc.desc Verify fromIndex 1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5])
      let result = arr.includes(5, 1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3100
     * @tc.name testTypedUArraysIncludesFileCX031
     * @tc.desc Verify fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5])
      let result = arr.includes(5, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3200
     * @tc.name testTypedUArraysIncludesFileCX032
     * @tc.desc Verify fromIndex -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5])
      let result = arr.includes(5, -1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3300
     * @tc.name testTypedUArraysIncludesFileCX033
     * @tc.desc Verify fromIndex 0 [0,1,2] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(2, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3400
     * @tc.name testTypedUArraysIncludesFileCX034
     * @tc.desc Verify fromIndex 1 [0,1,2] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(2, 1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3500
     * @tc.name testTypedUArraysIncludesFileCX035
     * @tc.desc Verify fromIndex 2 [0,1,2] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(2, 2)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3600
     * @tc.name testTypedUArraysIncludesFileCX036
     * @tc.desc Verify fromIndex 3 [0,1,2] false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(2, 3)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3700
     * @tc.name testTypedUArraysIncludesFileCX037
     * @tc.desc Verify fromIndex 0 [0,1,2] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(0, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3800
     * @tc.name testTypedUArraysIncludesFileCX038
     * @tc.desc Verify fromIndex 0 [0,1,2] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(1, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_3900
     * @tc.name testTypedUArraysIncludesFileCX039
     * @tc.desc Verify fromIndex 1 [0,1,2] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(1, 1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_4000
     * @tc.name testTypedUArraysIncludesFileCX040
     * @tc.desc Verify fromIndex -1 [0,1,2] 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(2, -1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_4100
     * @tc.name testTypedUArraysIncludesFileCX041
     * @tc.desc Verify fromIndex -2 [0,1,2] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(1, -2)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_4200
     * @tc.name testTypedUArraysIncludesFileCX042
     * @tc.desc Verify fromIndex 0 [0,1,2,3] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3])
      let result = arr.includes(3, 0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_4300
     * @tc.name testTypedUArraysIncludesFileCX043
     * @tc.desc Verify fromIndex 1 [0,1,2,3] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3])
      let result = arr.includes(3, 1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES0102_4400
     * @tc.name testTypedUArraysIncludesFileCX044
     * @tc.desc Verify fromIndex 2 [0,1,2,3] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludesFileCX044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3])
      let result = arr.includes(3, 2)
      expect(result).assertEqual(true)
    });

  });
}
