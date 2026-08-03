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

export default function typedUArraysMapTest05(): void {
  describe('TypedUArraysMapTest05', (): void => {
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
     * @tc.name testTypedUArraysMapTestFileE001
     * @tc.desc Verify Uint16Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0200
     * @tc.name testTypedUArraysMapTestFileE002
     * @tc.desc Verify Uint32Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0300
     * @tc.name testTypedUArraysMapTestFileE003
     * @tc.desc Verify BigUint64Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0400
     * @tc.name testTypedUArraysMapTestFileE004
     * @tc.desc Verify Uint8ClampedArray map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0500
     * @tc.name testTypedUArraysMapTestFileE005
     * @tc.desc Verify Uint8Array map length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0600
     * @tc.name testTypedUArraysMapTestFileE006
     * @tc.desc Verify Uint8Array map length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0700
     * @tc.name testTypedUArraysMapTestFileE007
     * @tc.desc Verify Uint8Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0800
     * @tc.name testTypedUArraysMapTestFileE008
     * @tc.desc Verify Uint16Array map length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10)
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0900
     * @tc.name testTypedUArraysMapTestFileE009
     * @tc.desc Verify Uint32Array map length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1000
     * @tc.name testTypedUArraysMapTestFileE010
     * @tc.desc Verify Uint8ClampedArray map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.byteLength).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1100
     * @tc.name testTypedUArraysMapTestFileE011
     * @tc.desc Verify Uint8Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result.byteLength).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1200
     * @tc.name testTypedUArraysMapTestFileE012
     * @tc.desc Verify Uint16Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.byteLength).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1300
     * @tc.name testTypedUArraysMapTestFileE013
     * @tc.desc Verify Uint32Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.byteLength).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1400
     * @tc.name testTypedUArraysMapTestFileE014
     * @tc.desc Verify BigUint64Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.byteLength).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1500
     * @tc.name testTypedUArraysMapTestFileE015
     * @tc.desc Verify Uint8ClampedArray map byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0)
      let result = arr.map((v) => v)
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1600
     * @tc.name testTypedUArraysMapTestFileE016
     * @tc.desc Verify Uint8Array map byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1700
     * @tc.name testTypedUArraysMapTestFileE017
     * @tc.desc Verify Uint8Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1800
     * @tc.name testTypedUArraysMapTestFileE018
     * @tc.desc Verify Uint16Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_1900
     * @tc.name testTypedUArraysMapTestFileE019
     * @tc.desc Verify Uint32Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2000
     * @tc.name testTypedUArraysMapTestFileE020
     * @tc.desc Verify BigUint64Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2100
     * @tc.name testTypedUArraysMapTestFileE021
     * @tc.desc Verify Uint8ClampedArray map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result[0]).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2200
     * @tc.name testTypedUArraysMapTestFileE022
     * @tc.desc Verify Uint32Array map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result2 = arr.map((v) => v - 1)
      expect(result2[0]).assertEqual(999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2300
     * @tc.name testTypedUArraysMapTestFileE023
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result2 = arr.map((v) => v * 2)
      expect(result2[0]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2400
     * @tc.name testTypedUArraysMapTestFileE024
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2500
     * @tc.name testTypedUArraysMapTestFileE025
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2600
     * @tc.name testTypedUArraysMapTestFileE026
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(arr[0]).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2700
     * @tc.name testTypedUArraysMapTestFileE027
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result[0]).assertEqual(2n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2800
     * @tc.name testTypedUArraysMapTestFileE028
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      const original = [10, 20, 30]
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(20)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_2900
     * @tc.name testTypedUArraysMapTestFileE029
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      const original = [100, 200, 300]
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(101)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3000
     * @tc.name testTypedUArraysMapTestFileE030
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      const original = [1000, 2000, 3000]
      let result = arr.map((v) => v - 1)
      expect(result[0]).assertEqual(999)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3100
     * @tc.name testTypedUArraysMapTestFileE031
     * @tc.desc Verify Uint8ClampedArray map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      const original = [50, 100, 150]
      let result = arr.map((v) => v / 2)
      expect(result[0]).assertEqual(25)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3200
     * @tc.name testTypedUArraysMapTestFileE032
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      const original = [1n, 2n, 3n]
      let result = arr.map((v) => v * 2n)
      expect(result[0]).assertEqual(2n)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3300
     * @tc.name testTypedUArraysMapTestFileE033
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(arr.length).assertEqual(0)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3400
     * @tc.name testTypedUArraysMapTestFileE034
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      const original = [42]
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(84)
      expect(arr[0]).assertEqual(original[0])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3500
     * @tc.name testTypedUArraysMapTestFileE035
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.map((v) => v + 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[50]).assertEqual(0)
      expect(arr[99]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3600
     * @tc.name testTypedUArraysMapTestFileE036
     * @tc.desc Verify Uint8Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2).map((v) => v + 1)
      expect(result[0]).assertEqual(3)
      expect(result[1]).assertEqual(5)
      expect(result[2]).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3700
     * @tc.name testTypedUArraysMapTestFileE037
     * @tc.desc Verify Uint16Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.map((v) => v * 2).map((v) => v - 5)
      expect(result[0]).assertEqual(15)
      expect(result[1]).assertEqual(35)
      expect(result[2]).assertEqual(55)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3800
     * @tc.name testTypedUArraysMapTestFileE038
     * @tc.desc Verify Uint32Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300])
      let result = arr.map((v) => v + 1).map((v) => v * 2)
      expect(result[0]).assertEqual(202)
      expect(result[1]).assertEqual(402)
      expect(result[2]).assertEqual(602)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_3900
     * @tc.name testTypedUArraysMapTestFileE039
     * @tc.desc Verify BigUint64Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n).map((v) => v + 1n)
      expect(result[0]).assertEqual(3n)
      expect(result[1]).assertEqual(5n)
      expect(result[2]).assertEqual(7n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4000
     * @tc.name testTypedUArraysMapTestFileE040
     * @tc.desc Verify Uint8Array map slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v * 2).slice(0, 2)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4100
     * @tc.name testTypedUArraysMapTestFileE041
     * @tc.desc Verify Uint8Array map subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v * 2).subarray(1, 3)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(4)
      expect(result[1]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4200
     * @tc.name testTypedUArraysMapTestFileE042
     * @tc.desc Verify Uint8Array map reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2).reverse()
      expect(result[0]).assertEqual(6)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4300
     * @tc.name testTypedUArraysMapTestFileE043
     * @tc.desc Verify Uint8Array map toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let mapped = arr.map((v) => v * 2)
      let result = new Uint8Array([mapped[2], mapped[1], mapped[0]])
      expect(result[0]).assertEqual(6)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4400
     * @tc.name testTypedUArraysMapTestFileE044
     * @tc.desc Verify Uint8Array map fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2).fill(0)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4500
     * @tc.name testTypedUArraysMapTestFileE045
     * @tc.desc Verify Uint8Array map set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      result.set(new Uint8Array([10, 20, 30]))
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(20)
      expect(result[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_4600
     * @tc.name testTypedUArraysMapTestFileE046
     * @tc.desc Verify Uint8Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.map((v, i) => v + i)
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(21)
      expect(result[2]).assertEqual(32)
    });
  });
}
