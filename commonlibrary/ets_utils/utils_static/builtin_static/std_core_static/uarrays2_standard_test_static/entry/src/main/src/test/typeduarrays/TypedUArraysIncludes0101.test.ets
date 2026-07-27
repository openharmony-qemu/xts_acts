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

export default function typedUArraysIncludes0101(): void {
  describe('TypedUArraysIncludes0101', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0100
     * @tc.name testTypedUArraysIncludes001
     * @tc.desc Verify includes(searchElement)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(20)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0200
     * @tc.name testTypedUArraysIncludes002
     * @tc.desc Verify includes(searchElement)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30])
      let result = arr.includes(99)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0300
     * @tc.name testTypedUArraysIncludes003
     * @tc.desc Verify includes(searchElement, fromIndex)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 20])
      let result = arr.includes(20, 1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0500
     * @tc.name testTypedUArraysIncludes005
     * @tc.desc Verify Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0600
     * @tc.name testTypedUArraysIncludes006
     * @tc.desc Verify Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(1)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0700
     * @tc.name testTypedUArraysIncludes007
     * @tc.desc Verify Uint8Array 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127, 0, 1])
      let result = arr.includes(127)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0800
     * @tc.name testTypedUArraysIncludes008
     * @tc.desc Verify Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 1])
      let result = arr.includes(255)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_0900
     * @tc.name testTypedUArraysIncludes009
     * @tc.desc Verify Uint8Array 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 1])
      let result = arr.includes(0xFF)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1000
     * @tc.name testTypedUArraysIncludes010
     * @tc.desc Verify Uint8Array 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(256)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1100
     * @tc.name testTypedUArraysIncludes011
     * @tc.desc Verify Uint8Array -1 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 1])
      let result = arr.includes(-1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1200
     * @tc.name testTypedUArraysIncludes012
     * @tc.desc Verify Uint8Array 300 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2])
      let result = arr.includes(300)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1300
     * @tc.name testTypedUArraysIncludes013
     * @tc.desc Verify Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0)
      let result = arr.includes(0)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1400
     * @tc.name testTypedUArraysIncludes014
     * @tc.desc Verify Uint8Array 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255])
      let result = arr.includes(255)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1500
     * @tc.name testTypedUArraysIncludes015
     * @tc.desc Verify Uint8Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1600
     * @tc.name testTypedUArraysIncludes016
     * @tc.desc Verify Uint8Array 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([128, 0, 128])
      let result = arr.includes(128)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1700
     * @tc.name testTypedUArraysIncludes017
     * @tc.desc Verify Uint8Array 0x80 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([128, 0, 128])
      let result = arr.includes(0x80)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1800
     * @tc.name testTypedUArraysIncludes018
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_1900
     * @tc.name testTypedUArraysIncludes019
     * @tc.desc Verify Uint16Array 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 1])
      let result = arr.includes(32767)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2000
     * @tc.name testTypedUArraysIncludes020
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 1])
      let result = arr.includes(65535)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2100
     * @tc.name testTypedUArraysIncludes021
     * @tc.desc Verify Uint16Array 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 1])
      let result = arr.includes(0xFFFF)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2200
     * @tc.name testTypedUArraysIncludes022
     * @tc.desc Verify Uint16Array 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2])
      let result = arr.includes(65536)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2300
     * @tc.name testTypedUArraysIncludes023
     * @tc.desc Verify Uint16Array -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 1])
      let result = arr.includes(-1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2400
     * @tc.name testTypedUArraysIncludes024
     * @tc.desc Verify Uint16Array 70000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 1, 2])
      let result = arr.includes(70000)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2500
     * @tc.name testTypedUArraysIncludes025
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0)
      let result = arr.includes(0)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2600
     * @tc.name testTypedUArraysIncludes026
     * @tc.desc Verify Uint16Array 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 65535])
      let result = arr.includes(65535)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2700
     * @tc.name testTypedUArraysIncludes027
     * @tc.desc Verify Uint16Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2800
     * @tc.name testTypedUArraysIncludes028
     * @tc.desc Verify Uint16Array 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 32768])
      let result = arr.includes(32768)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_2900
     * @tc.name testTypedUArraysIncludes029
     * @tc.desc Verify Uint16Array 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 32768])
      let result = arr.includes(0x8000)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3000
     * @tc.name testTypedUArraysIncludes030
     * @tc.desc Verify Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1, 2])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3100
     * @tc.name testTypedUArraysIncludes031
     * @tc.desc Verify Uint32Array 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 1])
      let result = arr.includes(2147483647)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3200
     * @tc.name testTypedUArraysIncludes032
     * @tc.desc Verify Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 1])
      let result = arr.includes(4294967295)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3300
     * @tc.name testTypedUArraysIncludes033
     * @tc.desc Verify Uint32Array 0xFFFFFFFF 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 1])
      let result = arr.includes(0xFFFFFFFF)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3400
     * @tc.name testTypedUArraysIncludes034
     * @tc.desc Verify Uint32Array 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 1, 2])
      let result = arr.includes(4294967296)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3500
     * @tc.name testTypedUArraysIncludes035
     * @tc.desc Verify Uint32Array -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 1])
      let result = arr.includes(-1)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3600
     * @tc.name testTypedUArraysIncludes036
     * @tc.desc Verify Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0)
      let result = arr.includes(0)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3700
     * @tc.name testTypedUArraysIncludes037
     * @tc.desc Verify Uint32Array 4294967295 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295])
      let result = arr.includes(4294967295)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3800
     * @tc.name testTypedUArraysIncludes038
     * @tc.desc Verify Uint32Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0])
      let result = arr.includes(0)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_3900
     * @tc.name testTypedUArraysIncludes039
     * @tc.desc Verify Uint32Array 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 2147483648])
      let result = arr.includes(2147483648)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4000
     * @tc.name testTypedUArraysIncludes040
     * @tc.desc Verify Uint32Array 0x80000000 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 2147483648])
      let result = arr.includes(0x80000000)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4100
     * @tc.name testTypedUArraysIncludes041
     * @tc.desc Verify Uint32Array 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967294, 4294967295])
      let result = arr.includes(4294967294)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4200
     * @tc.name testTypedUArraysIncludes042
     * @tc.desc Verify BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n])
      let result = arr.includes(0n)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4300
     * @tc.name testTypedUArraysIncludes043
     * @tc.desc Verify BigUint64Array 1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n])
      let result = arr.includes(1n)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4400
     * @tc.name testTypedUArraysIncludes044
     * @tc.desc Verify BigUint64Array BigInt('18446744073709551615')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 1n])
      let result = arr.includes(BigInt('18446744073709551615'));
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4500
     * @tc.name testTypedUArraysIncludes045
     * @tc.desc Verify BigUint64Array -1n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 0n, 1n])
      let result = arr.includes(-1n)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4600
     * @tc.name testTypedUArraysIncludes046
     * @tc.desc Verify BigUint64Array 18446744073709551616n 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n])
      let result = arr.includes(18446744073709551616n);
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4700
     * @tc.name testTypedUArraysIncludes047
     * @tc.desc Verify BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0)
      let result = arr.includes(0n)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4800
     * @tc.name testTypedUArraysIncludes048
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), BigInt('18446744073709551615')]);
      let result = arr.includes(BigInt('18446744073709551615'));
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_4900
     * @tc.name testTypedUArraysIncludes049
     * @tc.desc Verify BigUint64Array 0n 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n])
      let result = arr.includes(0n)
      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_5000
     * @tc.name testTypedUArraysIncludes050
     * @tc.desc Verify BigUint64Array 3n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n])
      let result = arr.includes(3n)
      expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_INCLUDES_5100
     * @tc.name testTypedUArraysIncludes051
     * @tc.desc Verify Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1, 2]);
      let result = arr.includes(0);
      expect(result).assertEqual(true);
    });

  });
}
