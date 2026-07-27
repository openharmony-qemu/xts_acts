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

export default function typedUArraysFindTest03(): void {
  describe('TypedUArraysFindTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0100
     * @tc.name testTypedUArraysFindPart201_001
     * @tc.desc Verify Uint8Array find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0200
     * @tc.name testTypedUArraysFindPart201_002
     * @tc.desc Verify Uint16Array find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0300
     * @tc.name testTypedUArraysFindPart201_003
     * @tc.desc Verify Uint32Array find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0400
     * @tc.name testTypedUArraysFindPart201_004
     * @tc.desc Verify Uint8ClampedArray find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0500
     * @tc.name testTypedUArraysFindPart201_005
     * @tc.desc Verify BigUint64Array find typeof BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect(typeof result).assertEqual('bigint')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0600
     * @tc.name testTypedUArraysFindPart201_006
     * @tc.desc Verify Uint8Array find typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 99)
      expect(typeof result).assertEqual('undefined')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0700
     * @tc.name testTypedUArraysFindPart201_007
     * @tc.desc Verify BigUint64Array find typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 99n)
      expect(typeof result).assertEqual('undefined')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0800
     * @tc.name testTypedUArraysFindPart201_008
     * @tc.desc Verify Uint8Array find 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 10, 30])
      let result = arr.find((v) => v === 10)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0900
     * @tc.name testTypedUArraysFindPart201_009
     * @tc.desc Verify Uint8Array find 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 128, 255])
      let result = arr.find((v) => v === 255)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1000
     * @tc.name testTypedUArraysFindPart201_010
     * @tc.desc Verify Uint8Array find 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 0, 2])
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1100
     * @tc.name testTypedUArraysFindPart201_011
     * @tc.desc Verify Uint16Array find 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 32768, 65535])
      let result = arr.find((v) => v === 65535)
      expect(result).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1200
     * @tc.name testTypedUArraysFindPart201_012
     * @tc.desc Verify Uint16Array find 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0xFFFF])
      let result = arr.find((v) => v === 0xFFFF)
      expect(result).assertEqual(0xFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1300
     * @tc.name testTypedUArraysFindPart201_013
     * @tc.desc Verify Uint32Array find 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 2147483648, 4294967295])
      let result = arr.find((v) => v === 4294967295)
      expect(result).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1400
     * @tc.name testTypedUArraysFindPart201_014
     * @tc.desc Verify Uint32Array find 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0xFFFFFFFF])
      let result = arr.find((v) => v === 0xFFFFFFFF)
      expect(result).assertEqual(0xFFFFFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1500
     * @tc.name testTypedUArraysFindPart201_015
     * @tc.desc Verify BigUint64Array find BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('9223372036854775808'), BigInt('18446744073709551615')]);
      let result = arr.find((v) => v === BigInt('18446744073709551615'));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1600
     * @tc.name testTypedUArraysFindPart201_016
     * @tc.desc Verify BigUint64Array find 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 0n, 2n])
      let result = arr.find((v) => v === 0n)
      expect(result).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1700
     * @tc.name testTypedUArraysFindPart201_017
     * @tc.desc Verify Uint8ClampedArray find 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 128, 255])
      let result = arr.find((v) => v === 255)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1800
     * @tc.name testTypedUArraysFindPart201_018
     * @tc.desc Verify Uint8ClampedArray find 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0, 2])
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1900
     * @tc.name testTypedUArraysFindPart201_019
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.find((v) => v === 42)
      expect(result).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2000
     * @tc.name testTypedUArraysFindPart201_020
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7])
      let result = arr.find((v) => v === 7)
      expect(result).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2100
     * @tc.name testTypedUArraysFindPart201_021
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2200
     * @tc.name testTypedUArraysFindPart201_022
     * @tc.desc Verify Uint16Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2300
     * @tc.name testTypedUArraysFindPart201_023
     * @tc.desc Verify Uint32Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2400
     * @tc.name testTypedUArraysFindPart201_024
     * @tc.desc Verify BigUint64Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0)
      let result = arr.find((v) => v === 0n)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2500
     * @tc.name testTypedUArraysFindPart201_025
     * @tc.desc Verify Uint8Array find 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3])
      let result = arr.find((v) => v < 1)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2600
     * @tc.name testTypedUArraysFindPart201_026
     * @tc.desc Verify Uint8Array find 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 255])
      let result = arr.find((v) => v > 250)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2700
     * @tc.name testTypedUArraysFindPart201_027
     * @tc.desc Verify Uint8Array find 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 128, 255])
      let result = arr.find((v) => v === 0x80)
      expect(result).assertEqual(128)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2800
     * @tc.name testTypedUArraysFindPart201_028
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.find((v) => v > 100)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2900
     * @tc.name testTypedUArraysFindPart201_029
     * @tc.desc Verify Uint16Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v > 100000)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3000
     * @tc.name testTypedUArraysFindPart201_030
     * @tc.desc Verify Uint32Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000])
      let result = arr.find((v) => v > 4294967295)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3100
     * @tc.name testTypedUArraysFindPart201_031
     * @tc.desc Verify BigUint64Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.find((v) => v > 100n)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3200
     * @tc.name testTypedUArraysFindPart201_032
     * @tc.desc Verify Uint8ClampedArray find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30])
      let result = arr.find((v) => v > 300)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3300
     * @tc.name testTypedUArraysFindPart201_033
     * @tc.desc Verify Uint8Array find false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.find((v) => v !== v)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3400
     * @tc.name testTypedUArraysFindPart201_034
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 25)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3500
     * @tc.name testTypedUArraysFindPart201_035
     * @tc.desc Verify BigUint64Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.find((v) => v === 5n)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3600
     * @tc.name testTypedUArraysFindPart201_036
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const original = [10, 20, 30]
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3700
     * @tc.name testTypedUArraysFindPart201_037
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const original = [100, 200, 300]
      let result = arr.find((v) => v === 200);
      expect(result).assertEqual(200)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3800
     * @tc.name testTypedUArraysFindPart201_038
     * @tc.desc Verify Uint32Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const original = [1000, 2000, 3000]
      let result = arr.find((v) => v === 2000);
      expect(result).assertEqual(2000)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3900
     * @tc.name testTypedUArraysFindPart201_039
     * @tc.desc Verify BigUint64Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const original = [10n, 20n, 30n]
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4000
     * @tc.name testTypedUArraysFindPart201_040
     * @tc.desc Verify Uint8ClampedArray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const original = [50, 100, 150]
      let result = arr.find((v) => v === 100);
      expect(result).assertEqual(100)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4100
     * @tc.name testTypedUArraysFindPart201_041
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const original = [10, 20, 30]
      let result = arr.find((v) => v === 99)
      expect(result).assertEqual(undefined)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4200
     * @tc.name testTypedUArraysFindPart201_042
     * @tc.desc Verify Uint8Array find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const originalLength = arr.length
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4300
     * @tc.name testTypedUArraysFindPart201_043
     * @tc.desc Verify Uint8Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4400
     * @tc.name testTypedUArraysFindPart201_044
     * @tc.desc Verify Uint16Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 200);
      expect(result).assertEqual(200)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4500
     * @tc.name testTypedUArraysFindPart201_045
     * @tc.desc Verify Uint32Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 2000);
      expect(result).assertEqual(2000)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4600
     * @tc.name testTypedUArraysFindPart201_046
     * @tc.desc Verify BigUint64Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4700
     * @tc.name testTypedUArraysFindPart201_047
     * @tc.desc Verify Uint8ClampedArray find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 100);
      expect(result).assertEqual(100)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4800
     * @tc.name testTypedUArraysFindPart201_048
     * @tc.desc Verify Uint8Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const arr = new Uint8Array(buffer, 0, 4)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4900
     * @tc.name testTypedUArraysFindPart201_049
     * @tc.desc Verify Uint8Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint8Array(buffer, 4, 4)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_5000
     * @tc.name testTypedUArraysFindPart201_050
     * @tc.desc Verify Uint16Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

  });
}
