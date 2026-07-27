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

export default function typedUArraysMapTest04(): void {
  describe('TypedUArraysMapTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0100
     * @tc.name testTypedUArraysMapPart202_001
     * @tc.desc Verify Uint16Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v, i) => v + i * 10)
      expect(result[0]).assertEqual(100)
      expect(result[1]).assertEqual(210)
      expect(result[2]).assertEqual(320)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0200
     * @tc.name testTypedUArraysMapPart202_002
     * @tc.desc Verify Uint32Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v, i) => v + i * 100)
      expect(result[0]).assertEqual(1000)
      expect(result[1]).assertEqual(2100)
      expect(result[2]).assertEqual(3200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0300
     * @tc.name testTypedUArraysMapPart202_003
     * @tc.desc Verify BigUint64Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v, i) => v + numberToBigint(i))
      expect(result[0]).assertEqual(1n)
      expect(result[1]).assertEqual(3n)
      expect(result[2]).assertEqual(5n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0400
     * @tc.name testTypedUArraysMapPart202_004
     * @tc.desc Verify Uint8Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v, i, a) => a[i] * 2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0500
     * @tc.name testTypedUArraysMapPart202_005
     * @tc.desc Verify Uint8Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v, i, a) => v + a.length)
      expect(result[0]).assertEqual(4)
      expect(result[1]).assertEqual(5)
      expect(result[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0600
     * @tc.name testTypedUArraysMapPart202_006
     * @tc.desc Verify Uint16Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.map((v, i, a) => a[i] + 100)
      expect(result[0]).assertEqual(110)
      expect(result[1]).assertEqual(120)
      expect(result[2]).assertEqual(130)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0700
     * @tc.name testTypedUArraysMapPart202_007
     * @tc.desc Verify BigUint64Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v, i, a) => a[i] * 2n)
      expect(result[0]).assertEqual(2n)
      expect(result[1]).assertEqual(4n)
      expect(result[2]).assertEqual(6n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0800
     * @tc.name testTypedUArraysMapPart202_008
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r1 = arr.map((v) => v * 2)
      const r2 = arr.map((v) => v * 3)
      expect(r1 === r2).assertEqual(false)
      expect(r1[0]).assertEqual(2)
      expect(r2[0]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0900
     * @tc.name testTypedUArraysMapPart202_009
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      const r1 = arr.map((v) => v + 1)
      const r2 = arr.map((v) => v + 2)
      expect(r1 === r2).assertEqual(false)
      expect(r1[0]).assertEqual(11)
      expect(r2[0]).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1000
     * @tc.name testTypedUArraysMapPart202_010
     * @tc.desc Verify Uint8Array map buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r1 = arr.map((v) => v * 2)
      const r2 = arr.map((v) => v * 3)
      expect(r1 === r2).assertEqual(false)
      expect(r1[0]).assertEqual(2)
      expect(r2[0]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1100
     * @tc.name testTypedUArraysMapPart202_011
     * @tc.desc Verify Uint8Array map r1 r2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r2 = arr.map((v) => v * 3)
      expect(r2[0]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1200
     * @tc.name testTypedUArraysMapPart202_012
     * @tc.desc Verify Uint8Array map r2 r1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r1 = arr.map((v) => v * 2)
      expect(r1[0]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1300
     * @tc.name testTypedUArraysMapPart202_013
     * @tc.desc Verify Uint8Array map 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 256 : 256)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1400
     * @tc.name testTypedUArraysMapPart202_014
     * @tc.desc Verify Uint8Array map -1 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? -1 : -1)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1500
     * @tc.name testTypedUArraysMapPart202_015
     * @tc.desc Verify Uint16Array map 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 65536 : 65536)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1600
     * @tc.name testTypedUArraysMapPart202_016
     * @tc.desc Verify Uint32Array map 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 4294967296 : 4294967296)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1700
     * @tc.name testTypedUArraysMapPart202_017
     * @tc.desc Verify Uint8ClampedArray map 300 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 300 : 300)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1800
     * @tc.name testTypedUArraysMapPart202_018
     * @tc.desc Verify Uint8ClampedArray map -10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? -10 : -10)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1900
     * @tc.name testTypedUArraysMapPart202_019
     * @tc.desc Verify Uint8ClampedArray map NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? Number.NaN : Number.NaN)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2000
     * @tc.name testTypedUArraysMapPart202_020
     * @tc.desc Verify Uint8ClampedArray map Infinity 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? Number.POSITIVE_INFINITY : Number.POSITIVE_INFINITY)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2100
     * @tc.name testTypedUArraysMapPart202_021
     * @tc.desc Verify Uint8ClampedArray map -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? -Number.POSITIVE_INFINITY : -Number.POSITIVE_INFINITY)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2200
     * @tc.name testTypedUArraysMapPart202_022
     * @tc.desc Verify Uint8Array map 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 3.7 : 3.7)
      expect(result[0]).assertEqual(3)
      expect(result[1]).assertEqual(3)
      expect(result[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2300
     * @tc.name testTypedUArraysMapPart202_023
     * @tc.desc Verify Uint16Array map 100.9 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 100.9 : 100.9)
      expect(result[0]).assertEqual(100)
      expect(result[1]).assertEqual(100)
      expect(result[2]).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2400
     * @tc.name testTypedUArraysMapPart202_024
     * @tc.desc Verify Uint32Array map 1000.5 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 1000.5 : 1000.5)
      expect(result[0]).assertEqual(1000)
      expect(result[1]).assertEqual(1000)
      expect(result[2]).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2500
     * @tc.name testTypedUArraysMapPart202_025
     * @tc.desc Verify Uint8ClampedArray map 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? 3.7 : 3.7);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2600
     * @tc.name testTypedUArraysMapPart202_026
     * @tc.desc Verify Uint8Array map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2700
     * @tc.name testTypedUArraysMapPart202_027
     * @tc.desc Verify Uint16Array map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2800
     * @tc.name testTypedUArraysMapPart202_028
     * @tc.desc Verify Uint32Array map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2900
     * @tc.name testTypedUArraysMapPart202_029
     * @tc.desc Verify BigUint64Array map undefined 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((): bigint => { return 0n; });
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(0n);
      expect(result[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_3000
     * @tc.name testTypedUArraysMapPart202_030
     * @tc.desc Verify Uint8ClampedArray map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapPart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

  });
}
