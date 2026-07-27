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

export default function typedUArraysMapTest03(): void {
  describe('TypedUArraysMapTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0100
     * @tc.name testTypedUArraysMapPart201_001
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0200
     * @tc.name testTypedUArraysMapPart201_002
     * @tc.desc Verify Uint16Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0300
     * @tc.name testTypedUArraysMapPart201_003
     * @tc.desc Verify Uint32Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0400
     * @tc.name testTypedUArraysMapPart201_004
     * @tc.desc Verify Uint8ClampedArray map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0500
     * @tc.name testTypedUArraysMapPart201_005
     * @tc.desc Verify BigUint64Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0600
     * @tc.name testTypedUArraysMapPart201_006
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0700
     * @tc.name testTypedUArraysMapPart201_007
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0800
     * @tc.name testTypedUArraysMapPart201_008
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.map((v) => v)
      expect(typeof result).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0900
     * @tc.name testTypedUArraysMapPart201_009
     * @tc.desc Verify Uint32Array map instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.map((v) => v - 1);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1000
     * @tc.name testTypedUArraysMapPart201_010
     * @tc.desc Verify BigUint64Array map instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v * 2n);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1100
     * @tc.name testTypedUArraysMapPart201_011
     * @tc.desc Verify Uint8ClampedArray map instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.map((v) => v / 2);
      expect(typeof result).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1200
     * @tc.name testTypedUArraysMapPart201_012
     * @tc.desc Verify Uint16Array map instanceof Uint32Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.map((v) => v + 1);
      expect(result).not().assertInstanceOf("Uint32Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1300
     * @tc.name testTypedUArraysMapPart201_013
     * @tc.desc Verify Uint32Array map instanceof Uint16Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.map((v) => v - 1);
      expect(result).not().assertInstanceOf("Uint16Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1400
     * @tc.name testTypedUArraysMapPart201_014
     * @tc.desc Verify Uint8Array map instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.map((v) => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1500
     * @tc.name testTypedUArraysMapPart201_015
     * @tc.desc Verify BigUint64Array map instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.map((v) => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1600
     * @tc.name testTypedUArraysMapPart201_016
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1700
     * @tc.name testTypedUArraysMapPart201_017
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1800
     * @tc.name testTypedUArraysMapPart201_018
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1900
     * @tc.name testTypedUArraysMapPart201_019
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2000
     * @tc.name testTypedUArraysMapPart201_020
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2100
     * @tc.name testTypedUArraysMapPart201_021
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2200
     * @tc.name testTypedUArraysMapPart201_022
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2300
     * @tc.name testTypedUArraysMapPart201_023
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2400
     * @tc.name testTypedUArraysMapPart201_024
     * @tc.desc Verify Uint8Array map 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(11)
      expect(result[1]).assertEqual(21)
      expect(result[2]).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2500
     * @tc.name testTypedUArraysMapPart201_025
     * @tc.desc Verify Uint16Array map 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(200)
      expect(result[1]).assertEqual(400)
      expect(result[2]).assertEqual(600)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2600
     * @tc.name testTypedUArraysMapPart201_026
     * @tc.desc Verify Uint32Array map 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(1001)
      expect(result[1]).assertEqual(2001)
      expect(result[2]).assertEqual(3001)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2700
     * @tc.name testTypedUArraysMapPart201_027
     * @tc.desc Verify Uint8ClampedArray map 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 255]);
      let result = arr.map((v) => v / 2);
      expect(result[0]).assertEqual(50);
      expect(result[1]).assertEqual(100);
      expect(result[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2800
     * @tc.name testTypedUArraysMapPart201_028
     * @tc.desc Verify BigUint64Array map 2n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result[0]).assertEqual(2n)
      expect(result[1]).assertEqual(4n)
      expect(result[2]).assertEqual(6n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2900
     * @tc.name testTypedUArraysMapPart201_029
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
      expect(result[3]).assertEqual(4)
      expect(result[4]).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3000
     * @tc.name testTypedUArraysMapPart201_030
     * @tc.desc Verify Uint8Array map 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => 0)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3100
     * @tc.name testTypedUArraysMapPart201_031
     * @tc.desc Verify Uint8Array map 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => 255)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3200
     * @tc.name testTypedUArraysMapPart201_032
     * @tc.desc Verify Uint16Array map 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => 65535)
      expect(result[0]).assertEqual(65535)
      expect(result[1]).assertEqual(65535)
      expect(result[2]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3300
     * @tc.name testTypedUArraysMapPart201_033
     * @tc.desc Verify Uint32Array map 4294967295 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => 4294967295)
      expect(result[0]).assertEqual(4294967295)
      expect(result[1]).assertEqual(4294967295)
      expect(result[2]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3400
     * @tc.name testTypedUArraysMapPart201_034
     * @tc.desc Verify BigUint64Array map BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => BigInt('18446744073709551615'))
      expect(result[0]).assertEqual(BigInt('18446744073709551615'))
      expect(result[1]).assertEqual(BigInt('18446744073709551615'))
      expect(result[2]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3500
     * @tc.name testTypedUArraysMapPart201_035
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3600
     * @tc.name testTypedUArraysMapPart201_036
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(84)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3700
     * @tc.name testTypedUArraysMapPart201_037
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array([0, 0, 0])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3800
     * @tc.name testTypedUArraysMapPart201_038
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7])
      let result = arr.map((v) => v * 3)
      expect(result[0]).assertEqual(21)
      expect(result[1]).assertEqual(21)
      expect(result[2]).assertEqual(21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3900
     * @tc.name testTypedUArraysMapPart201_039
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => 0xFF)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4000
     * @tc.name testTypedUArraysMapPart201_040
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => 0xFFFF)
      expect(result[0]).assertEqual(65535)
      expect(result[1]).assertEqual(65535)
      expect(result[2]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4100
     * @tc.name testTypedUArraysMapPart201_041
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => 0xFFFFFFFF)
      expect(result[0]).assertEqual(4294967295)
      expect(result[1]).assertEqual(4294967295)
      expect(result[2]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4200
     * @tc.name testTypedUArraysMapPart201_042
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => BigInt('18446744073709551615'))
      expect(result[0]).assertEqual(BigInt('18446744073709551615'))
      expect(result[1]).assertEqual(BigInt('18446744073709551615'))
      expect(result[2]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4300
     * @tc.name testTypedUArraysMapPart201_043
     * @tc.desc Verify Uint8Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4400
     * @tc.name testTypedUArraysMapPart201_044
     * @tc.desc Verify Uint16Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.map((v) => v + 1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4500
     * @tc.name testTypedUArraysMapPart201_045
     * @tc.desc Verify Uint32Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4600
     * @tc.name testTypedUArraysMapPart201_046
     * @tc.desc Verify BigUint64Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4700
     * @tc.name testTypedUArraysMapPart201_047
     * @tc.desc Verify Uint8ClampedArray map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4800
     * @tc.name testTypedUArraysMapPart201_048
     * @tc.desc Verify Uint8Array map length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4900
     * @tc.name testTypedUArraysMapPart201_049
     * @tc.desc Verify Uint8Array map length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_5000
     * @tc.name testTypedUArraysMapPart201_050
     * @tc.desc Verify Uint16Array map length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint16Array(10)
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(10)
    });

  });
}
