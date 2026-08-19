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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0100
     * @tc.name testTypedUArraysMapTestFileC001
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0200
     * @tc.name testTypedUArraysMapTestFileC002
     * @tc.desc Verify Uint16Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0300
     * @tc.name testTypedUArraysMapTestFileC003
     * @tc.desc Verify Uint32Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0400
     * @tc.name testTypedUArraysMapTestFileC004
     * @tc.desc Verify Uint8ClampedArray map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0500
     * @tc.name testTypedUArraysMapTestFileC005
     * @tc.desc Verify BigUint64Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0600
     * @tc.name testTypedUArraysMapTestFileC006
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0700
     * @tc.name testTypedUArraysMapTestFileC007
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0800
     * @tc.name testTypedUArraysMapTestFileC008
     * @tc.desc Verify Uint8Array map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_0900
     * @tc.name testTypedUArraysMapTestFileC009
     * @tc.desc Verify Uint32Array map instanceof Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.map((v) => v - 1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1000
     * @tc.name testTypedUArraysMapTestFileC010
     * @tc.desc Verify BigUint64Array map instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v * 2n);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1100
     * @tc.name testTypedUArraysMapTestFileC011
     * @tc.desc Verify Uint8ClampedArray map instanceof Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.map((v) => v / 2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1200
     * @tc.name testTypedUArraysMapTestFileC012
     * @tc.desc Verify Uint16Array map instanceof Uint32Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.map((v) => v + 1);
      expect(result).not().assertInstanceOf("Uint32Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1300
     * @tc.name testTypedUArraysMapTestFileC013
     * @tc.desc Verify Uint32Array map instanceof Uint16Array false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.map((v) => v - 1);
      expect(result).not().assertInstanceOf("Uint16Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1400
     * @tc.name testTypedUArraysMapTestFileC014
     * @tc.desc Verify Uint8Array map instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.map((v) => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1500
     * @tc.name testTypedUArraysMapTestFileC015
     * @tc.desc Verify BigUint64Array map instanceof BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.map((v) => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1600
     * @tc.name testTypedUArraysMapTestFileC016
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1700
     * @tc.name testTypedUArraysMapTestFileC017
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1800
     * @tc.name testTypedUArraysMapTestFileC018
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_1900
     * @tc.name testTypedUArraysMapTestFileC019
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2000
     * @tc.name testTypedUArraysMapTestFileC020
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2100
     * @tc.name testTypedUArraysMapTestFileC021
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2200
     * @tc.name testTypedUArraysMapTestFileC022
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v)
      expect(result === arr).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2300
     * @tc.name testTypedUArraysMapTestFileC023
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2400
     * @tc.name testTypedUArraysMapTestFileC024
     * @tc.desc Verify Uint8Array map 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(11)
      expect(result[1]).assertEqual(21)
      expect(result[2]).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2500
     * @tc.name testTypedUArraysMapTestFileC025
     * @tc.desc Verify Uint16Array map 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(200)
      expect(result[1]).assertEqual(400)
      expect(result[2]).assertEqual(600)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2600
     * @tc.name testTypedUArraysMapTestFileC026
     * @tc.desc Verify Uint32Array map 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(1001)
      expect(result[1]).assertEqual(2001)
      expect(result[2]).assertEqual(3001)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2700
     * @tc.name testTypedUArraysMapTestFileC027
     * @tc.desc Verify Uint8ClampedArray map 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 255]);
      let result = arr.map((v) => v / 2);
      expect(result[0]).assertEqual(50);
      expect(result[1]).assertEqual(100);
      expect(result[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2800
     * @tc.name testTypedUArraysMapTestFileC028
     * @tc.desc Verify BigUint64Array map 2n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result[0]).assertEqual(2n)
      expect(result[1]).assertEqual(4n)
      expect(result[2]).assertEqual(6n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_2900
     * @tc.name testTypedUArraysMapTestFileC029
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
      expect(result[3]).assertEqual(4)
      expect(result[4]).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3000
     * @tc.name testTypedUArraysMapTestFileC030
     * @tc.desc Verify Uint8Array map 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => 0)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3100
     * @tc.name testTypedUArraysMapTestFileC031
     * @tc.desc Verify Uint8Array map 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => 255)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3200
     * @tc.name testTypedUArraysMapTestFileC032
     * @tc.desc Verify Uint16Array map 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => 65535)
      expect(result[0]).assertEqual(65535)
      expect(result[1]).assertEqual(65535)
      expect(result[2]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3300
     * @tc.name testTypedUArraysMapTestFileC033
     * @tc.desc Verify Uint32Array map 4294967295 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => 4294967295)
      expect(result[0]).assertEqual(4294967295)
      expect(result[1]).assertEqual(4294967295)
      expect(result[2]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3400
     * @tc.name testTypedUArraysMapTestFileC034
     * @tc.desc Verify BigUint64Array map BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => BigInt('18446744073709551615'))
      expect(result[0]).assertEqual(BigInt('18446744073709551615'))
      expect(result[1]).assertEqual(BigInt('18446744073709551615'))
      expect(result[2]).assertEqual(BigInt('18446744073709551615'))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3500
     * @tc.name testTypedUArraysMapTestFileC035
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(84)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3600
     * @tc.name testTypedUArraysMapTestFileC036
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array([0, 0, 0])
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3700
     * @tc.name testTypedUArraysMapTestFileC037
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7])
      let result = arr.map((v) => v * 3)
      expect(result[0]).assertEqual(21)
      expect(result[1]).assertEqual(21)
      expect(result[2]).assertEqual(21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3800
     * @tc.name testTypedUArraysMapTestFileC038
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => 0xFF)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_3900
     * @tc.name testTypedUArraysMapTestFileC039
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => 0xFFFF)
      expect(result[0]).assertEqual(65535)
      expect(result[1]).assertEqual(65535)
      expect(result[2]).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4000
     * @tc.name testTypedUArraysMapTestFileC040
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => 0xFFFFFFFF)
      expect(result[0]).assertEqual(4294967295)
      expect(result[1]).assertEqual(4294967295)
      expect(result[2]).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4100
     * @tc.name testTypedUArraysMapTestFileC041
     * @tc.desc Verify Uint8Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4200
     * @tc.name testTypedUArraysMapTestFileC042
     * @tc.desc Verify Uint16Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.map((v) => v + 1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4300
     * @tc.name testTypedUArraysMapTestFileC043
     * @tc.desc Verify Uint32Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4400
     * @tc.name testTypedUArraysMapTestFileC044
     * @tc.desc Verify BigUint64Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4500
     * @tc.name testTypedUArraysMapTestFileC045
     * @tc.desc Verify Uint8ClampedArray map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4600
     * @tc.name testTypedUArraysMapTestFileC046
     * @tc.desc Verify Uint8Array map length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4700
     * @tc.name testTypedUArraysMapTestFileC047
     * @tc.desc Verify Uint8Array map length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAPTEST03_4800
     * @tc.name testTypedUArraysMapTestFileC048
     * @tc.desc Verify Uint16Array map length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileC048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      const arr = new Uint16Array(10)
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(10)
    });
  });
}
