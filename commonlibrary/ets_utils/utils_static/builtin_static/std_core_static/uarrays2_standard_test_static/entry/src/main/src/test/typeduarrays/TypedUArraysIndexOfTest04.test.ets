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

export default function typedUArraysIndexOfTest04(): void {
  describe('TypedUArraysIndexOfTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0001
     * @tc.name testTypedUArraysIndexOf0201_001
     * @tc.desc Verify indexOf() fromIndex=0 >= 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20, 0)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0002
     * @tc.name testTypedUArraysIndexOf0201_002
     * @tc.desc Verify indexOf() fromIndex=1 >= 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20, 1)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0003
     * @tc.name testTypedUArraysIndexOf0201_003
     * @tc.desc Verify indexOf() fromIndex=2 >= 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(30, 2)
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0004
     * @tc.name testTypedUArraysIndexOf0201_004
     * @tc.desc Verify indexOf() fromIndex=-1 >= length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(30, -1)
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0005
     * @tc.name testTypedUArraysIndexOf0201_005
     * @tc.desc Verify indexOf() fromIndex=-2 >= length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20, -2)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0006
     * @tc.name testTypedUArraysIndexOf0201_006
     * @tc.desc Verify indexOf() fromIndex=-3 >= 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(10, -3)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0007
     * @tc.name testTypedUArraysIndexOf0201_007
     * @tc.desc Verify indexOf() fromIndex=-4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(10, -4)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0008
     * @tc.name testTypedUArraysIndexOf0201_008
     * @tc.desc Verify indexOf() fromIndex=0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(10)
      expect(result).assertEqual(0)
    });

    /**

    /**

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0009
     * @tc.name testTypedUArraysIndexOf0201_009
     * @tc.desc Verify Uint8Array indexOf(256) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.indexOf(256)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0010
     * @tc.name testTypedUArraysIndexOf0201_010
     * @tc.desc Verify Uint8Array indexOf(-1) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 1])
      let result = arr.indexOf(-1)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0011
     * @tc.name testTypedUArraysIndexOf0201_011
     * @tc.desc Verify Uint16Array indexOf(65536) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2])
      let result = arr.indexOf(65536)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0012
     * @tc.name testTypedUArraysIndexOf0201_012
     * @tc.desc Verify Uint16Array indexOf(-1) 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 1])
      let result = arr.indexOf(-1)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0013
     * @tc.name testTypedUArraysIndexOf0201_013
     * @tc.desc Verify Uint32Array indexOf(4294967296) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1, 2])
      let result = arr.indexOf(4294967296)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0014
     * @tc.name testTypedUArraysIndexOf0201_014
     * @tc.desc Verify Uint32Array indexOf(-1) 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 1])
      let result = arr.indexOf(-1)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0015
     * @tc.name testTypedUArraysIndexOf0201_015
     * @tc.desc Verify BigUint64Array indexOf(18446744073709551616n 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n])
      let result = arr.indexOf(18446744073709551616n);
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0016
     * @tc.name testTypedUArraysIndexOf0201_016
     * @tc.desc Verify BigUint64Array indexOf(-1n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 1n])
      let result = arr.indexOf(-1n)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0017
     * @tc.name testTypedUArraysIndexOf0201_017
     * @tc.desc Verify Uint8ClampedArray indexOf(256) 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 1])
      let result = arr.indexOf(256)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0018
     * @tc.name testTypedUArraysIndexOf0201_018
     * @tc.desc Verify Uint8ClampedArray indexOf(-1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2])
      let result = arr.indexOf(-1)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0019
     * @tc.name testTypedUArraysIndexOf0201_019
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      const originalLength = arr.length
      arr.indexOf(20)
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0020
     * @tc.name testTypedUArraysIndexOf0201_020
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      arr.indexOf(20)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0021
     * @tc.name testTypedUArraysIndexOf0201_021
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      arr.indexOf(99)
      expect(arr[0]).assertEqual(10)
      expect(arr[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0022
     * @tc.name testTypedUArraysIndexOf0201_022
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      arr.indexOf(0)
      expect(arr.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0023
     * @tc.name testTypedUArraysIndexOf0201_023
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      arr.indexOf(42)
      expect(arr[0]).assertEqual(42)
      expect(arr.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0024
     * @tc.name testTypedUArraysIndexOf0201_024
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      arr.indexOf(1)
      arr.indexOf(2)
      arr.indexOf(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0025
     * @tc.name testTypedUArraysIndexOf0201_025
     * @tc.desc Verify indexOf() fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      arr.indexOf(200, 1)
      expect(arr[0]).assertEqual(100)
      expect(arr[1]).assertEqual(200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0026
     * @tc.name testTypedUArraysIndexOf0201_026
     * @tc.desc Verify indexOf() fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      arr.indexOf(30, -1)
      expect(arr[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0027
     * @tc.name testTypedUArraysIndexOf0201_027
     * @tc.desc Verify indexOf() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0xFFFFFFFF, 1])
      arr.indexOf(0xFFFFFFFF)
      expect(arr[1]).assertEqual(0xFFFFFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0028
     * @tc.name testTypedUArraysIndexOf0201_028
     * @tc.desc Verify indexOf() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('18446744073709551615')]);
      arr.indexOf(BigInt('18446744073709551615'));
      expect(arr[1]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0029
     * @tc.name testTypedUArraysIndexOf0201_029
     * @tc.desc Verify indexOf() searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(20)
      expect(arr[result.toInt()]).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0030
     * @tc.name testTypedUArraysIndexOf0201_030
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.indexOf(99)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0031
     * @tc.name testTypedUArraysIndexOf0201_031
     * @tc.desc Verify indexOf() Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0xFFFF, 1])
      let result = arr.indexOf(0xFFFF)
      expect(arr[result.toInt()]).assertEqual(0xFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0032
     * @tc.name testTypedUArraysIndexOf0201_032
     * @tc.desc Verify indexOf() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0xFFFFFFFF, 1])
      let result = arr.indexOf(0xFFFFFFFF)
      expect(arr[result.toInt()]).assertEqual(0xFFFFFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0033
     * @tc.name testTypedUArraysIndexOf0201_033
     * @tc.desc Verify indexOf() BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('18446744073709551615'), 1n])
      let result = arr.indexOf(BigInt('18446744073709551615'));
      expect(arr[result.toInt()]).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0034
     * @tc.name testTypedUArraysIndexOf0201_034
     * @tc.desc Verify indexOf() Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 128])
      let result = arr.indexOf(255)
      expect(arr[result.toInt()]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0035
     * @tc.name testTypedUArraysIndexOf0201_035
     * @tc.desc Verify indexOf() Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 128, 255])
      let result = arr.indexOf(128)
      expect(arr[result.toInt()]).assertEqual(128)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0036
     * @tc.name testTypedUArraysIndexOf0201_036
     * @tc.desc Verify indexOf() [0,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.indexOf(1)
      expect(arr[result.toInt()]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0037
     * @tc.name testTypedUArraysIndexOf0201_037
     * @tc.desc Verify indexOf() [0,1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3])
      let result = arr.indexOf(3)
      expect(arr[result.toInt()]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0038
     * @tc.name testTypedUArraysIndexOf0201_038
     * @tc.desc Verify indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42, 42, 42])
      let result = arr.indexOf(42)
      expect(arr[result.toInt()]).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0039
     * @tc.name testTypedUArraysIndexOf0201_039
     * @tc.desc Verify Uint8Array Uint16Array indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([10, 20, 30])
      const arr2 = new Uint16Array([10, 20, 30])
      expect(arr1.indexOf(20)).assertEqual(arr2.indexOf(20))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_0040
     * @tc.name testTypedUArraysIndexOf0201_040
     * @tc.desc Verify Uint32Array BigUint64Array indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint32Array([10, 20, 30])
      const arr2 = new BigUint64Array([10n, 20n, 30n])
      expect(arr1.indexOf(20)).assertEqual(arr2.indexOf(20n))
    });

    /**

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4100
     * @tc.name testTypedUArraysIndexOf0201_041
     * @tc.desc Verify indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2])
      const arr2 = new Uint16Array([1, 2])
      const arr3 = new Uint32Array([1, 2])
      const arr4 = new BigUint64Array([1n, 2n])
      const arr5 = new Uint8ClampedArray([1, 2])
      expect(arr1.indexOf(99)).assertEqual(-1)
      expect(arr2.indexOf(99)).assertEqual(-1)
      expect(arr3.indexOf(99)).assertEqual(-1)
      expect(arr4.indexOf(99n)).assertEqual(-1)
      expect(arr5.indexOf(99)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4200
     * @tc.name testTypedUArraysIndexOf0201_042
     * @tc.desc Verify indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([42])
      const arr2 = new Uint16Array([42])
      const arr3 = new Uint32Array([42])
      const arr4 = new BigUint64Array([42n])
      const arr5 = new Uint8ClampedArray([42])
      expect(arr1.indexOf(42)).assertEqual(0)
      expect(arr2.indexOf(42)).assertEqual(0)
      expect(arr3.indexOf(42)).assertEqual(0)
      expect(arr4.indexOf(42n)).assertEqual(0)
      expect(arr5.indexOf(42)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4300
     * @tc.name testTypedUArraysIndexOf0201_043
     * @tc.desc Verify buffer indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint8Array(buf, 4, 4)
      arr.set([10, 20, 30, 40])

      let result = arr.indexOf(20)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4400
     * @tc.name testTypedUArraysIndexOf0201_044
     * @tc.desc Verify buffer indexOf() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const arr = new Uint8Array(buf, 4, 0)
      let result = arr.indexOf(0)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4500
     * @tc.name testTypedUArraysIndexOf0201_045
     * @tc.desc Verify buffer indexOf() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32)
      const arr = new Uint16Array(buf, 8, 3)
      arr.set([100, 200, 300])

      let result = arr.indexOf(200)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4600
     * @tc.name testTypedUArraysIndexOf0201_046
     * @tc.desc Verify buffer indexOf() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16)
      const arr = new Uint8Array(buf, 4, 4)
      arr.set([10, 20, 30, 40])
      let result = arr.indexOf(20)
      expect(result).assertEqual(1)
      expect(arr[0]).assertEqual(10)
      expect(arr[3]).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INDEXOF0201_4700
     * @tc.name testTypedUArraysIndexOf0201_047
     * @tc.desc Verify buffer indexOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIndexOf0201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8)
      const arr = new Uint8Array(buf, 0, 4)
      arr.set([10, 20, 30, 40])
      const standalone = new Uint8Array([10, 20, 30, 40])
      expect(arr.indexOf(30)).assertEqual(standalone.indexOf(30))
    });

  });
}
