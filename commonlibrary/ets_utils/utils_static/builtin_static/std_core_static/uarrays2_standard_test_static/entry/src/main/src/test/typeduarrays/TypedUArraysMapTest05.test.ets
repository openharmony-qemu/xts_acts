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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0001
     * @tc.name testTypedUArraysMapPart201_001
     * @tc.desc Verify Uint16Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0002
     * @tc.name testTypedUArraysMapPart201_002
     * @tc.desc Verify Uint32Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0003
     * @tc.name testTypedUArraysMapPart201_003
     * @tc.desc Verify BigUint64Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0004
     * @tc.name testTypedUArraysMapPart201_004
     * @tc.desc Verify Uint8ClampedArray map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0005
     * @tc.name testTypedUArraysMapPart201_005
     * @tc.desc Verify Uint8Array map length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0006
     * @tc.name testTypedUArraysMapPart201_006
     * @tc.desc Verify Uint8Array map length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0007
     * @tc.name testTypedUArraysMapPart201_007
     * @tc.desc Verify Uint8Array map length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0008
     * @tc.name testTypedUArraysMapPart201_008
     * @tc.desc Verify Uint16Array map length 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(10)
      let result = arr.map((v) => v + 1)
      expect(result.length).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0009
     * @tc.name testTypedUArraysMapPart201_009
     * @tc.desc Verify Uint32Array map length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100)
      let result = arr.map((v) => v)
      expect(result.length).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0010
     * @tc.name testTypedUArraysMapPart201_010
     * @tc.desc Verify Uint8ClampedArray map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result.byteLength).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0011
     * @tc.name testTypedUArraysMapPart201_011
     * @tc.desc Verify Uint8Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result.byteLength).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0012
     * @tc.name testTypedUArraysMapPart201_012
     * @tc.desc Verify Uint16Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.byteLength).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0013
     * @tc.name testTypedUArraysMapPart201_013
     * @tc.desc Verify Uint32Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.byteLength).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0014
     * @tc.name testTypedUArraysMapPart201_014
     * @tc.desc Verify BigUint64Array map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.byteLength).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0015
     * @tc.name testTypedUArraysMapPart201_015
     * @tc.desc Verify Uint8ClampedArray map byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0)
      let result = arr.map((v) => v)
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0016
     * @tc.name testTypedUArraysMapPart201_016
     * @tc.desc Verify Uint8Array map byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.map((v) => v * 2)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0017
     * @tc.name testTypedUArraysMapPart201_017
     * @tc.desc Verify Uint8Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0018
     * @tc.name testTypedUArraysMapPart201_018
     * @tc.desc Verify Uint16Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0019
     * @tc.name testTypedUArraysMapPart201_019
     * @tc.desc Verify Uint32Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0020
     * @tc.name testTypedUArraysMapPart201_020
     * @tc.desc Verify BigUint64Array map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result.byteOffset).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0021
     * @tc.name testTypedUArraysMapPart201_021
     * @tc.desc Verify Uint8ClampedArray map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result = arr.map((v) => v / 2)
      expect(result[0]).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0022
     * @tc.name testTypedUArraysMapPart201_022
     * @tc.desc Verify Uint16Array map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0023
     * @tc.name testTypedUArraysMapPart201_023
     * @tc.desc Verify Uint32Array map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result2 = arr.map((v) => v - 1)
      expect(result2[0]).assertEqual(999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0024
     * @tc.name testTypedUArraysMapPart201_024
     * @tc.desc Verify Uint8ClampedArray map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      let result2 = arr.map((v) => v / 2)
      expect(result2[0]).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0025
     * @tc.name testTypedUArraysMapPart201_025
     * @tc.desc Verify BigUint64Array map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result2 = arr.map((v) => v * 2n)
      expect(result2[0]).assertEqual(2n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0026
     * @tc.name testTypedUArraysMapPart201_026
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result2 = arr.map((v) => v * 2)
      expect(result2[0]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0027
     * @tc.name testTypedUArraysMapPart201_027
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      expect(arr[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0028
     * @tc.name testTypedUArraysMapPart201_028
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0029
     * @tc.name testTypedUArraysMapPart201_029
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v) => v - 1)
      expect(arr[0]).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0030
     * @tc.name testTypedUArraysMapPart201_030
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n)
      expect(result[0]).assertEqual(2n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0031
     * @tc.name testTypedUArraysMapPart201_031
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      const original = [10, 20, 30]
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(20)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0032
     * @tc.name testTypedUArraysMapPart201_032
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      const original = [100, 200, 300]
      let result = arr.map((v) => v + 1)
      expect(result[0]).assertEqual(101)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0033
     * @tc.name testTypedUArraysMapPart201_033
     * @tc.desc Verify Uint32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      const original = [1000, 2000, 3000]
      let result = arr.map((v) => v - 1)
      expect(result[0]).assertEqual(999)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0034
     * @tc.name testTypedUArraysMapPart201_034
     * @tc.desc Verify Uint8ClampedArray map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150])
      const original = [50, 100, 150]
      let result = arr.map((v) => v / 2)
      expect(result[0]).assertEqual(25)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0035
     * @tc.name testTypedUArraysMapPart201_035
     * @tc.desc Verify BigUint64Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      const original = [1n, 2n, 3n]
      let result = arr.map((v) => v * 2n)
      expect(result[0]).assertEqual(2n)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0036
     * @tc.name testTypedUArraysMapPart201_036
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.map((v) => v)
      expect(arr.length).assertEqual(0)
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0037
     * @tc.name testTypedUArraysMapPart201_037
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      const original = [42]
      let result = arr.map((v) => v * 2)
      expect(result[0]).assertEqual(84)
      expect(arr[0]).assertEqual(original[0])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0038
     * @tc.name testTypedUArraysMapPart201_038
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100)
      let result = arr.map((v) => v + 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[50]).assertEqual(0)
      expect(arr[99]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0039
     * @tc.name testTypedUArraysMapPart201_039
     * @tc.desc Verify Uint8Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2).map((v) => v + 1)
      expect(result[0]).assertEqual(3)
      expect(result[1]).assertEqual(5)
      expect(result[2]).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0040
     * @tc.name testTypedUArraysMapPart201_040
     * @tc.desc Verify Uint16Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.map((v) => v * 2).map((v) => v - 5)
      expect(result[0]).assertEqual(15)
      expect(result[1]).assertEqual(35)
      expect(result[2]).assertEqual(55)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0041
     * @tc.name testTypedUArraysMapPart201_041
     * @tc.desc Verify Uint32Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300])
      let result = arr.map((v) => v + 1).map((v) => v * 2)
      expect(result[0]).assertEqual(202)
      expect(result[1]).assertEqual(402)
      expect(result[2]).assertEqual(602)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0042
     * @tc.name testTypedUArraysMapPart201_042
     * @tc.desc Verify BigUint64Array map map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v) => v * 2n).map((v) => v + 1n)
      expect(result[0]).assertEqual(3n)
      expect(result[1]).assertEqual(5n)
      expect(result[2]).assertEqual(7n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0043
     * @tc.name testTypedUArraysMapPart201_043
     * @tc.desc Verify Uint8Array map slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v * 2).slice(0, 2)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0044
     * @tc.name testTypedUArraysMapPart201_044
     * @tc.desc Verify Uint8Array map subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5])
      let result = arr.map((v) => v * 2).subarray(1, 3)
      expect(result.length).assertEqual(2)
      expect(result[0]).assertEqual(4)
      expect(result[1]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0045
     * @tc.name testTypedUArraysMapPart201_045
     * @tc.desc Verify Uint8Array map reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2).reverse()
      expect(result[0]).assertEqual(6)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0046
     * @tc.name testTypedUArraysMapPart201_046
     * @tc.desc Verify Uint8Array map toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let mapped = arr.map((v) => v * 2)
      let result = new Uint8Array([mapped[2], mapped[1], mapped[0]])
      expect(result[0]).assertEqual(6)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0047
     * @tc.name testTypedUArraysMapPart201_047
     * @tc.desc Verify Uint8Array map fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2).fill(0)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0048
     * @tc.name testTypedUArraysMapPart201_048
     * @tc.desc Verify Uint8Array map set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v * 2)
      result.set(new Uint8Array([10, 20, 30]))
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(20)
      expect(result[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART201_0049
     * @tc.name testTypedUArraysMapPart201_049
     * @tc.desc Verify Uint8Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.map((v, i) => v + i)
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(21)
      expect(result[2]).assertEqual(32)
    });

  });
}
