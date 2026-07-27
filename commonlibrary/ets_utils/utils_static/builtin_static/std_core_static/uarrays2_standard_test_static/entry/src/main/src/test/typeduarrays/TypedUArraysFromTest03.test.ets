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

function numberToBigint(value: number): bigint {
  let result: bigint = 0n;
  for (let i: number = 0; i < value; i++) {
    result += 1n;
  }
  return result;
}

export default function typedUArraysFromTest03(): void {
  describe('TypedUArraysFromTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0100
     * @tc.name testTypedUArraysFrom02_001
     * @tc.desc Verify BigUint64Array.from constructor BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0200
     * @tc.name testTypedUArraysFrom02_002
     * @tc.desc Verify BigUint64Array.from BYTES_PER_ELEMENT 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0300
     * @tc.name testTypedUArraysFrom02_003
     * @tc.desc Verify BigUint64Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(10n, 20n, 30n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v : v + numberToBigint(k));
      expect(result === source).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0400
     * @tc.name testTypedUArraysFrom02_004
     * @tc.desc Verify BigUint64Array.from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(100n, 200n, 300n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v * 2n : v * 2n);
      expect(result[0]).assertEqual(200n);
      expect(result[1]).assertEqual(400n);
      expect(result[2]).assertEqual(600n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0500
     * @tc.name testTypedUArraysFrom02_005
     * @tc.desc Verify BigUint64Array.from mapfn byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v : v);
      expect(result.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0600
     * @tc.name testTypedUArraysFrom02_006
     * @tc.desc Verify BigUint64Array.from mapfn byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(5n, 10n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v : v + numberToBigint(k));
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0700
     * @tc.name testTypedUArraysFrom02_007
     * @tc.desc Verify BigUint64Array.from mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v : v * numberToBigint(k));
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0800
     * @tc.name testTypedUArraysFrom02_008
     * @tc.desc Verify BigUint64Array.from mapfn constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v : v);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_0900
     * @tc.name testTypedUArraysFrom02_009
     * @tc.desc Verify BigUint64Array.from mapfn BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source, (v: bigint, k: number): bigint => k >= 0 ? v : v);
      expect(BigUint64Array.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1000
     * @tc.name testTypedUArraysFrom02_010
     * @tc.desc Verify BigUint64Array.from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n, 13n, 14n, 15n, 16n, 17n, 18n, 19n, 20n);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1100
     * @tc.name testTypedUArraysFrom02_011
     * @tc.desc Verify BigUint64Array.from byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n, 13n, 14n, 15n, 16n, 17n, 18n, 19n, 20n);
      let result = BigUint64Array.from(source);
      expect(result.byteLength).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1200
     * @tc.name testTypedUArraysFrom02_012
     * @tc.desc Verify Uint8Array.from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1300
     * @tc.name testTypedUArraysFrom02_013
     * @tc.desc Verify Uint16Array.from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1400
     * @tc.name testTypedUArraysFrom02_014
     * @tc.desc Verify Uint32Array.from Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2);
      let result = Uint32Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1500
     * @tc.name testTypedUArraysFrom02_015
     * @tc.desc Verify Uint8ClampedArray.from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2);
      let result = Uint8ClampedArray.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1600
     * @tc.name testTypedUArraysFrom02_016
     * @tc.desc Verify BigUint64Array.from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1700
     * @tc.name testTypedUArraysFrom02_017
     * @tc.desc Verify Uint8Array.from Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1800
     * @tc.name testTypedUArraysFrom02_018
     * @tc.desc Verify BigUint64Array.from Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_1900
     * @tc.name testTypedUArraysFrom02_019
     * @tc.desc Verify Uint8Array.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2, 3);
      let result = Uint8Array.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2000
     * @tc.name testTypedUArraysFrom02_020
     * @tc.desc Verify Uint16Array.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2100
     * @tc.name testTypedUArraysFrom02_021
     * @tc.desc Verify Uint32Array.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3);
      let result = Uint32Array.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2200
     * @tc.name testTypedUArraysFrom02_022
     * @tc.desc Verify Uint8ClampedArray.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8ClampedArray.of(1, 2, 3);
      let result = Uint8ClampedArray.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2300
     * @tc.name testTypedUArraysFrom02_023
     * @tc.desc Verify BigUint64Array.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n);
      let result = BigUint64Array.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2400
     * @tc.name testTypedUArraysFrom02_024
     * @tc.desc Verify Uint8Array.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint8Array.of(1, 2);
      let result = Uint8Array.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2500
     * @tc.name testTypedUArraysFrom02_025
     * @tc.desc Verify BigUint64Array.from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n);
      let result = BigUint64Array.from(source);
      expect(typeof result.buffer).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2600
     * @tc.name testTypedUArraysFrom02_026
     * @tc.desc Verify Uint16Array.from buffer byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint16Array.of(1, 2, 3, 4);
      let result = Uint16Array.from(source);
      expect(result.buffer.byteLength).assertEqual(result.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2700
     * @tc.name testTypedUArraysFrom02_027
     * @tc.desc Verify Uint32Array.from buffer byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Uint32Array.of(1, 2, 3, 4);
      let result = Uint32Array.from(source);
      expect(result.buffer.byteLength).assertEqual(result.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FROM02_2800
     * @tc.name testTypedUArraysFrom02_028
     * @tc.desc Verify BigUint64Array.from buffer byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFrom02_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = BigUint64Array.of(1n, 2n, 3n, 4n);
      let result = BigUint64Array.from(source);
      expect(result.buffer.byteLength).assertEqual(result.byteLength);
    });

  });
}
