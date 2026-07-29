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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0001
     * @tc.name testTypedUArraysFindPart201_001
     * @tc.desc Verify Uint16Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      let result = arr.find((v) => v === 0);
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0002
     * @tc.name testTypedUArraysFindPart201_002
     * @tc.desc Verify Uint32Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      let result = arr.find((v) => v === 0);
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0003
     * @tc.name testTypedUArraysFindPart201_003
     * @tc.desc Verify BigUint64Array ArrayBuffer find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      let result = arr.find((v) => v === 0n);
      expect(result).assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0004
     * @tc.name testTypedUArraysFindPart201_004
     * @tc.desc Verify Uint8Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0005
     * @tc.name testTypedUArraysFindPart201_005
     * @tc.desc Verify Uint8Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint8Array(buffer, 4, 4)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0006
     * @tc.name testTypedUArraysFindPart201_006
     * @tc.desc Verify Uint16Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 200);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0007
     * @tc.name testTypedUArraysFindPart201_007
     * @tc.desc Verify Uint32Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 2000);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0008
     * @tc.name testTypedUArraysFindPart201_008
     * @tc.desc Verify BigUint64Array find byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      const originalOffset = arr.byteOffset
      let result = arr.find((v) => v === 20n);
      expect(result).assertUndefined()
      expect(arr.byteOffset).assertEqual(originalOffset)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0009
     * @tc.name testTypedUArraysFindPart201_009
     * @tc.desc Verify Uint8Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const arr = new Uint8Array(buffer, 0, 4)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0010
     * @tc.name testTypedUArraysFindPart201_010
     * @tc.desc Verify Uint16Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 200);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0011
     * @tc.name testTypedUArraysFindPart201_011
     * @tc.desc Verify Uint32Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 2000);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0012
     * @tc.name testTypedUArraysFindPart201_012
     * @tc.desc Verify BigUint64Array find buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      const originalBuffer = arr.buffer
      let result = arr.find((v) => v === 20n);
      expect(result).assertUndefined()
      expect(arr.buffer).assertEqual(originalBuffer)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0013
     * @tc.name testTypedUArraysFindPart201_013
     * @tc.desc Verify Uint8Array find length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint8Array(buffer, 4, 4)
      const originalLength = arr.length
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0014
     * @tc.name testTypedUArraysFindPart201_014
     * @tc.desc Verify Uint8Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8)
      const arr = new Uint8Array(buffer, 0, 4)
      const originalBPE = Uint8Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 20);
      expect(result).assertUndefined()
      expect(Uint8Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0015
     * @tc.name testTypedUArraysFindPart201_015
     * @tc.desc Verify Uint16Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16)
      const arr = new Uint16Array(buffer, 4, 2)
      const originalBPE = Uint16Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 200);
      expect(result).assertUndefined()
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0016
     * @tc.name testTypedUArraysFindPart201_016
     * @tc.desc Verify Uint32Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new Uint32Array(buffer, 8, 2)
      const originalBPE = Uint32Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 2000);
      expect(result).assertUndefined()
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0017
     * @tc.name testTypedUArraysFindPart201_017
     * @tc.desc Verify BigUint64Array find BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32)
      const arr = new BigUint64Array(buffer, 8, 2)
      const originalBPE = BigUint64Array.BYTES_PER_ELEMENT
      let result = arr.find((v) => v === 20n);
      expect(result).assertUndefined()
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(originalBPE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0018
     * @tc.name testTypedUArraysFindPart201_018
     * @tc.desc Verify Uint8Array find Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0019
     * @tc.name testTypedUArraysFindPart201_019
     * @tc.desc Verify Uint16Array find Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0020
     * @tc.name testTypedUArraysFindPart201_020
     * @tc.desc Verify Uint32Array find Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0021
     * @tc.name testTypedUArraysFindPart201_021
     * @tc.desc Verify BigUint64Array find BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect(typeof result).assertEqual('bigint')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0022
     * @tc.name testTypedUArraysFindPart201_022
     * @tc.desc Verify Uint8ClampedArray find Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      expect(typeof result).assertEqual('number')
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0023
     * @tc.name testTypedUArraysFindPart201_023
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      const index = arr.findIndex((v) => v === 20);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0024
     * @tc.name testTypedUArraysFindPart201_024
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      const index = arr.findIndex((v) => v === 200);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0025
     * @tc.name testTypedUArraysFindPart201_025
     * @tc.desc Verify Uint32Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      const index = arr.findIndex((v) => v === 2000);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0026
     * @tc.name testTypedUArraysFindPart201_026
     * @tc.desc Verify BigUint64Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      const index = arr.findIndex((v) => v === 20n);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0027
     * @tc.name testTypedUArraysFindPart201_027
     * @tc.desc Verify Uint8ClampedArray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      const index = arr.findIndex((v) => v === 100);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0028
     * @tc.name testTypedUArraysFindPart201_028
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!) + 5).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0029
     * @tc.name testTypedUArraysFindPart201_029
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      let result = arr.find((v) => v === 200);
      expect((result!) + 10).assertEqual(210)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0030
     * @tc.name testTypedUArraysFindPart201_030
     * @tc.desc Verify Uint32Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      let result = arr.find((v) => v === 2000);
      expect((result!) + 100).assertEqual(2100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0031
     * @tc.name testTypedUArraysFindPart201_031
     * @tc.desc Verify BigUint64Array find BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect((result!) + 5n).assertEqual(25n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0032
     * @tc.name testTypedUArraysFindPart201_032
     * @tc.desc Verify Uint8ClampedArray find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      let result = arr.find((v) => v === 100);
      expect((result!) + 5).assertEqual(105)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0033
     * @tc.name testTypedUArraysFindPart201_033
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!) * 2).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0034
     * @tc.name testTypedUArraysFindPart201_034
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!) & 0x0F).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0035
     * @tc.name testTypedUArraysFindPart201_035
     * @tc.desc Verify BigUint64Array find BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect((result!) * 2n).assertEqual(40n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0036
     * @tc.name testTypedUArraysFindPart201_036
     * @tc.desc Verify Uint8Array find toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect((result!).toString()).assertEqual('20')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0037
     * @tc.name testTypedUArraysFindPart201_037
     * @tc.desc Verify BigUint64Array find toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect((result as bigint).toString()).assertEqual('20')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0038
     * @tc.name testTypedUArraysFindPart201_038
     * @tc.desc Verify Uint8Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const index = arr.findIndex((v) => v === 20);
      let result = arr.find((v) => v === 20);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0039
     * @tc.name testTypedUArraysFindPart201_039
     * @tc.desc Verify Uint16Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const index = arr.findIndex((v) => v === 200);
      let result = arr.find((v) => v === 200);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0040
     * @tc.name testTypedUArraysFindPart201_040
     * @tc.desc Verify Uint32Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000]);
      const index = arr.findIndex((v) => v === 2000);
      let result = arr.find((v) => v === 2000);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0041
     * @tc.name testTypedUArraysFindPart201_041
     * @tc.desc Verify BigUint64Array find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const index = arr.findIndex((v) => v === 20n);
      let result = arr.find((v) => v === 20n);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0042
     * @tc.name testTypedUArraysFindPart201_042
     * @tc.desc Verify Uint8ClampedArray find findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100, 150]);
      const index = arr.findIndex((v) => v === 100);
      let result = arr.find((v) => v === 100);
      expect(arr[index.toInt()]).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0043
     * @tc.name testTypedUArraysFindPart201_043
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 20);
      expect(result).assertEqual(20)
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0044
     * @tc.name testTypedUArraysFindPart201_044
     * @tc.desc Verify Uint8Array find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.find((v) => v === 99)
      expect(result).assertEqual(undefined)
      expect(typeof result).assertEqual('undefined')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0045
     * @tc.name testTypedUArraysFindPart201_045
     * @tc.desc Verify BigUint64Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.find((v) => v === 20n);
      expect(result).assertEqual(20n)
      expect(typeof result).assertEqual('bigint')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0046
     * @tc.name testTypedUArraysFindPart201_046
     * @tc.desc Verify Uint8Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      const result1 = arr.find((v) => v === 20)
      const result2 = arr.find((v) => v === 20)
      expect(result1).assertEqual(result2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FIND_PART201_0047
     * @tc.name testTypedUArraysFindPart201_047
     * @tc.desc Verify Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFindPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300]);
      const result1 = arr.find((v) => v === 200)
      const result2 = arr.find((v) => v === 200)
      expect(result1).assertEqual(result2)
    });

  });
}

