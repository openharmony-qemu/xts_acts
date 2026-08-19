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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0100
     * @tc.name testTypedUArraysFindTestFileC001
     * @tc.desc Verify Uint8Array find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0200
     * @tc.name testTypedUArraysFindTestFileC002
     * @tc.desc Verify Uint16Array find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      expect(result).assertEqual(200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0300
     * @tc.name testTypedUArraysFindTestFileC003
     * @tc.desc Verify Uint32Array find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      expect(result).assertEqual(2000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0400
     * @tc.name testTypedUArraysFindTestFileC004
     * @tc.desc Verify Uint8ClampedArray find typeof Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      expect(result).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0500
     * @tc.name testTypedUArraysFindTestFileC005
     * @tc.desc Verify BigUint64Array find typeof BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0600
     * @tc.name testTypedUArraysFindTestFileC006
     * @tc.desc Verify Uint8Array find typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 99)
      expect(result).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0700
     * @tc.name testTypedUArraysFindTestFileC007
     * @tc.desc Verify BigUint64Array find typeof undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 99n)
      expect(result).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0800
     * @tc.name testTypedUArraysFindTestFileC008
     * @tc.desc Verify Uint8Array find 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 10, 30])
      let result = arr.find((v) => v === 10)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_0900
     * @tc.name testTypedUArraysFindTestFileC009
     * @tc.desc Verify Uint8Array find 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 128, 255])
      let result = arr.find((v) => v === 255)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1000
     * @tc.name testTypedUArraysFindTestFileC010
     * @tc.desc Verify Uint8Array find 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 0, 2])
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1100
     * @tc.name testTypedUArraysFindTestFileC011
     * @tc.desc Verify Uint16Array find 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 32768, 65535])
      let result = arr.find((v) => v === 65535)
      expect(result).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1200
     * @tc.name testTypedUArraysFindTestFileC012
     * @tc.desc Verify Uint16Array find 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0xFFFF])
      let result = arr.find((v) => v === 0xFFFF)
      expect(result).assertEqual(0xFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1300
     * @tc.name testTypedUArraysFindTestFileC013
     * @tc.desc Verify Uint32Array find 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 2147483648, 4294967295])
      let result = arr.find((v) => v === 4294967295)
      expect(result).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1400
     * @tc.name testTypedUArraysFindTestFileC014
     * @tc.desc Verify Uint32Array find 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0xFFFFFFFF])
      let result = arr.find((v) => v === 0xFFFFFFFF)
      expect(result).assertEqual(0xFFFFFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1500
     * @tc.name testTypedUArraysFindTestFileC015
     * @tc.desc Verify BigUint64Array find BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('9223372036854775808'), BigInt('18446744073709551615')]);
      let result = arr.find((v) => v === BigInt('18446744073709551615'));
      expect(result).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1600
     * @tc.name testTypedUArraysFindTestFileC016
     * @tc.desc Verify BigUint64Array find 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 0n, 2n])
      let result = arr.find((v) => v === 0n)
      expect(result).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1700
     * @tc.name testTypedUArraysFindTestFileC017
     * @tc.desc Verify Uint8ClampedArray find 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 128, 255])
      let result = arr.find((v) => v === 255)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1800
     * @tc.name testTypedUArraysFindTestFileC018
     * @tc.desc Verify Uint8ClampedArray find 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 0, 2])
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_1900
     * @tc.name testTypedUArraysFindTestFileC019
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42])
      let result = arr.find((v) => v === 42)
      expect(result).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2000
     * @tc.name testTypedUArraysFindTestFileC020
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7])
      let result = arr.find((v) => v === 7)
      expect(result).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2100
     * @tc.name testTypedUArraysFindTestFileC021
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2200
     * @tc.name testTypedUArraysFindTestFileC022
     * @tc.desc Verify Uint16Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2300
     * @tc.name testTypedUArraysFindTestFileC023
     * @tc.desc Verify Uint32Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2400
     * @tc.name testTypedUArraysFindTestFileC024
     * @tc.desc Verify BigUint64Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0)
      let result = arr.find((v) => v === 0n)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2500
     * @tc.name testTypedUArraysFindTestFileC025
     * @tc.desc Verify Uint8Array find 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3])
      let result = arr.find((v) => v < 1)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2600
     * @tc.name testTypedUArraysFindTestFileC026
     * @tc.desc Verify Uint8Array find 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 255])
      let result = arr.find((v) => v > 250)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2700
     * @tc.name testTypedUArraysFindTestFileC027
     * @tc.desc Verify Uint8Array find 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 128, 255])
      let result = arr.find((v) => v === 0x80)
      expect(result).assertEqual(128)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2800
     * @tc.name testTypedUArraysFindTestFileC028
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.find((v) => v > 100)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_2900
     * @tc.name testTypedUArraysFindTestFileC029
     * @tc.desc Verify Uint16Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v > 100000)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3000
     * @tc.name testTypedUArraysFindTestFileC030
     * @tc.desc Verify Uint32Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000])
      let result = arr.find((v) => v > 4294967295)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3100
     * @tc.name testTypedUArraysFindTestFileC031
     * @tc.desc Verify BigUint64Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.find((v) => v > 100n)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3200
     * @tc.name testTypedUArraysFindTestFileC032
     * @tc.desc Verify Uint8ClampedArray find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30])
      let result = arr.find((v) => v > 300)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3300
     * @tc.name testTypedUArraysFindTestFileC033
     * @tc.desc Verify Uint8Array find false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.find((v) => v !== v)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3400
     * @tc.name testTypedUArraysFindTestFileC034
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 25)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3500
     * @tc.name testTypedUArraysFindTestFileC035
     * @tc.desc Verify BigUint64Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.find((v) => v === 5n)
      expect(result).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3600
     * @tc.name testTypedUArraysFindTestFileC036
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const original = [10, 20, 30]
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3700
     * @tc.name testTypedUArraysFindTestFileC037
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const original = [100, 200, 300]
      let result = arr.find((v) => v === 200);
      expect(result).assertEqual(200)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3800
     * @tc.name testTypedUArraysFindTestFileC038
     * @tc.desc Verify Uint32Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const original = [1000, 2000, 3000]
      let result = arr.find((v) => v === 2000);
      expect(result).assertEqual(2000)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_3900
     * @tc.name testTypedUArraysFindTestFileC039
     * @tc.desc Verify BigUint64Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const original = [10n, 20n, 30n]
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4000
     * @tc.name testTypedUArraysFindTestFileC040
     * @tc.desc Verify Uint8ClampedArray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const original = [50, 100, 150]
      let result = arr.find((v) => v === 100);
      expect(result).assertEqual(100)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4100
     * @tc.name testTypedUArraysFindTestFileC041
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const original = [10, 20, 30]
      let result = arr.find((v) => v === 99)
      expect(result).assertEqual(undefined)
      expect(arr[0]).assertEqual(original[0])
      expect(arr[1]).assertEqual(original[1])
      expect(arr[2]).assertEqual(original[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4200
     * @tc.name testTypedUArraysFindTestFileC042
     * @tc.desc Verify Uint8Array find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const originalLength = arr.length
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4300
     * @tc.name testTypedUArraysFindTestFileC043
     * @tc.desc Verify Uint8Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4400
     * @tc.name testTypedUArraysFindTestFileC044
     * @tc.desc Verify Uint16Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 200);
      expect(result).assertEqual(200)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4500
     * @tc.name testTypedUArraysFindTestFileC045
     * @tc.desc Verify Uint32Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 2000);
      expect(result).assertEqual(2000)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4600
     * @tc.name testTypedUArraysFindTestFileC046
     * @tc.desc Verify BigUint64Array find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4700
     * @tc.name testTypedUArraysFindTestFileC047
     * @tc.desc Verify Uint8ClampedArray find byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const originalByteLength = arr.byteLength
      let result = arr.find((v) => v === 100);
      expect(result).assertEqual(100)
      expect(arr.byteLength).assertEqual(originalByteLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4800
     * @tc.name testTypedUArraysFindTestFileC048
     * @tc.desc Verify Uint8Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const arr = new Uint8Array(buffer, 0, 4)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_4900
     * @tc.name testTypedUArraysFindTestFileC049
     * @tc.desc Verify Uint8Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint8Array(buffer, 4, 4)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FINDTEST03_5000
     * @tc.name testTypedUArraysFindTestFileC050
     * @tc.desc Verify Uint16Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileC050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      let result = arr.find((v) => v === 0)
      expect(result).assertEqual(0)
    });

  });
}
