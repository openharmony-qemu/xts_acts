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

export default function typedUArraysFindTest05(): void {
  describe('TypedUArraysFindTest05', (): void => {
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
     * @tc.name testTypedUArraysFindTestFileE001
     * @tc.desc Verify Uint16Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      let result = arr.find((v) => v === 0);
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0200
     * @tc.name testTypedUArraysFindTestFileE002
     * @tc.desc Verify Uint32Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      let result = arr.find((v) => v === 0);
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0300
     * @tc.name testTypedUArraysFindTestFileE003
     * @tc.desc Verify BigUint64Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      let result = arr.find((v) => v === 0n);
      expect(result).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0400
     * @tc.name testTypedUArraysFindTestFileE004
     * @tc.desc Verify Uint8Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const view = new Uint8Array(buffer)
      view[0] = 10; view[1] = 20; view[2] = 30; view[3] = 40
      const arr = new Uint8Array(buffer, 0, 4)
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(view[0]).assertEqual(10)
      expect(view[1]).assertEqual(20)
      expect(view[2]).assertEqual(30)
      expect(view[3]).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0500
     * @tc.name testTypedUArraysFindTestFileE005
     * @tc.desc Verify Uint8Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint8Array(buffer, 4, 4)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0600
     * @tc.name testTypedUArraysFindTestFileE006
     * @tc.desc Verify Uint16Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 200);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0700
     * @tc.name testTypedUArraysFindTestFileE007
     * @tc.desc Verify Uint32Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 2000);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0800
     * @tc.name testTypedUArraysFindTestFileE008
     * @tc.desc Verify BigUint64Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 20n);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0900
     * @tc.name testTypedUArraysFindTestFileE009
     * @tc.desc Verify Uint8Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const arr = new Uint8Array(buffer, 0, 4)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1000
     * @tc.name testTypedUArraysFindTestFileE010
     * @tc.desc Verify Uint16Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 200);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1100
     * @tc.name testTypedUArraysFindTestFileE011
     * @tc.desc Verify Uint32Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 2000);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1200
     * @tc.name testTypedUArraysFindTestFileE012
     * @tc.desc Verify BigUint64Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 20n);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1300
     * @tc.name testTypedUArraysFindTestFileE013
     * @tc.desc Verify Uint8Array find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint8Array(buffer, 4, 4)
      const originalLength = arr.length
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1400
     * @tc.name testTypedUArraysFindTestFileE014
     * @tc.desc Verify Uint8Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const arr = new Uint8Array(buffer, 0, 4)
      const originalBPE = Uint8Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1500
     * @tc.name testTypedUArraysFindTestFileE015
     * @tc.desc Verify Uint16Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      const originalBPE = Uint16Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 200);
      expect(result).assertUndefined()
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1600
     * @tc.name testTypedUArraysFindTestFileE016
     * @tc.desc Verify Uint32Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      const originalBPE = Uint32Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 2000);
      expect(result).assertUndefined()
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1700
     * @tc.name testTypedUArraysFindTestFileE017
     * @tc.desc Verify BigUint64Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      const originalBPE = BigUint64Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 20n);
      expect(result).assertUndefined()
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1800
     * @tc.name testTypedUArraysFindTestFileE018
     * @tc.desc Verify Uint8Array find Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_1900
     * @tc.name testTypedUArraysFindTestFileE019
     * @tc.desc Verify Uint16Array find Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2000
     * @tc.name testTypedUArraysFindTestFileE020
     * @tc.desc Verify Uint32Array find Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2100
     * @tc.name testTypedUArraysFindTestFileE021
     * @tc.desc Verify BigUint64Array find BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect(typeof result).assertEqual('bigint')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2200
     * @tc.name testTypedUArraysFindTestFileE022
     * @tc.desc Verify Uint8ClampedArray find Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      expect(typeof result).assertEqual('number')
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2300
     * @tc.name testTypedUArraysFindTestFileE023
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      const index = arr.findIndex((v) => v === 20);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2400
     * @tc.name testTypedUArraysFindTestFileE024
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      const index = arr.findIndex((v) => v === 200);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2500
     * @tc.name testTypedUArraysFindTestFileE025
     * @tc.desc Verify Uint32Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      const index = arr.findIndex((v) => v === 2000);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2600
     * @tc.name testTypedUArraysFindTestFileE026
     * @tc.desc Verify BigUint64Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      const index = arr.findIndex((v) => v === 20n);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2700
     * @tc.name testTypedUArraysFindTestFileE027
     * @tc.desc Verify Uint8ClampedArray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      const index = arr.findIndex((v) => v === 100);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2800
     * @tc.name testTypedUArraysFindTestFileE028
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!) + 5).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_2900
     * @tc.name testTypedUArraysFindTestFileE029
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      expect((result!) + 10).assertEqual(210)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3000
     * @tc.name testTypedUArraysFindTestFileE030
     * @tc.desc Verify Uint32Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      expect((result!) + 100).assertEqual(2100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3100
     * @tc.name testTypedUArraysFindTestFileE031
     * @tc.desc Verify BigUint64Array find BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect((result!) + 5n).assertEqual(25n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3200
     * @tc.name testTypedUArraysFindTestFileE032
     * @tc.desc Verify Uint8ClampedArray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      expect((result!) + 5).assertEqual(105)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3300
     * @tc.name testTypedUArraysFindTestFileE033
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!) * 2).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3400
     * @tc.name testTypedUArraysFindTestFileE034
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!) & 0x0F).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3500
     * @tc.name testTypedUArraysFindTestFileE035
     * @tc.desc Verify BigUint64Array find BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect((result!) * 2n).assertEqual(40n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3600
     * @tc.name testTypedUArraysFindTestFileE036
     * @tc.desc Verify Uint8Array find toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!).toString()).assertEqual('20')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3700
     * @tc.name testTypedUArraysFindTestFileE037
     * @tc.desc Verify BigUint64Array find toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect((result as bigint).toString()).assertEqual('20')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3800
     * @tc.name testTypedUArraysFindTestFileE038
     * @tc.desc Verify Uint8Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const index = arr.findIndex((v) => v === 20);
      let result = arr.find((v) => v === 20);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_3900
     * @tc.name testTypedUArraysFindTestFileE039
     * @tc.desc Verify Uint16Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const index = arr.findIndex((v) => v === 200);
      let result = arr.find((v) => v === 200);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4000
     * @tc.name testTypedUArraysFindTestFileE040
     * @tc.desc Verify Uint32Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const index = arr.findIndex((v) => v === 2000);
      let result = arr.find((v) => v === 2000);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4100
     * @tc.name testTypedUArraysFindTestFileE041
     * @tc.desc Verify BigUint64Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const index = arr.findIndex((v) => v === 20n);
      let result = arr.find((v) => v === 20n);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4200
     * @tc.name testTypedUArraysFindTestFileE042
     * @tc.desc Verify Uint8ClampedArray find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const index = arr.findIndex((v) => v === 100);
      let result = arr.find((v) => v === 100);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4300
     * @tc.name testTypedUArraysFindTestFileE043
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4400
     * @tc.name testTypedUArraysFindTestFileE044
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 99)
      expect(result).assertEqual(undefined)
      expect(typeof result).assertEqual('undefined')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4500
     * @tc.name testTypedUArraysFindTestFileE045
     * @tc.desc Verify BigUint64Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
      expect(typeof result).assertEqual('bigint')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4600
     * @tc.name testTypedUArraysFindTestFileE046
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result1 = arr.find((v) => v === 20)
      const result2 = arr.find((v) => v === 20)
      expect(result1).assertEqual(result2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_4700
     * @tc.name testTypedUArraysFindTestFileE047
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindTestFileE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result1 = arr.find((v) => v === 200)
      const result2 = arr.find((v) => v === 200)
      expect(result1).assertEqual(result2)
    });

  });
}

