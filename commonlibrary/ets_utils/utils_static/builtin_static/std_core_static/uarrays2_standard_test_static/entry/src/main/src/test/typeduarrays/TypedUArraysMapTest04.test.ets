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
     * @tc.name testTypedUArraysMapTestFileD001
     * @tc.desc Verify Uint16Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300])
      let result = arr.map((v, i) => v + i * 10)
      expect(result[0]).assertEqual(100)
      expect(result[1]).assertEqual(210)
      expect(result[2]).assertEqual(320)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0200
     * @tc.name testTypedUArraysMapTestFileD002
     * @tc.desc Verify Uint32Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000])
      let result = arr.map((v, i) => v + i * 100)
      expect(result[0]).assertEqual(1000)
      expect(result[1]).assertEqual(2100)
      expect(result[2]).assertEqual(3200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0300
     * @tc.name testTypedUArraysMapTestFileD003
     * @tc.desc Verify BigUint64Array map index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v, i) => v + numberToBigint(i))
      expect(result[0]).assertEqual(1n)
      expect(result[1]).assertEqual(3n)
      expect(result[2]).assertEqual(5n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0400
     * @tc.name testTypedUArraysMapTestFileD004
     * @tc.desc Verify Uint8Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v, i, a) => a[i] * 2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0500
     * @tc.name testTypedUArraysMapTestFileD005
     * @tc.desc Verify Uint8Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v, i, a) => v + a.length)
      expect(result[0]).assertEqual(4)
      expect(result[1]).assertEqual(5)
      expect(result[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0600
     * @tc.name testTypedUArraysMapTestFileD006
     * @tc.desc Verify Uint16Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      let result = arr.map((v, i, a) => a[i] + 100)
      expect(result[0]).assertEqual(110)
      expect(result[1]).assertEqual(120)
      expect(result[2]).assertEqual(130)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0700
     * @tc.name testTypedUArraysMapTestFileD007
     * @tc.desc Verify BigUint64Array map array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n])
      let result = arr.map((v, i, a) => a[i] * 2n)
      expect(result[0]).assertEqual(2n)
      expect(result[1]).assertEqual(4n)
      expect(result[2]).assertEqual(6n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0800
     * @tc.name testTypedUArraysMapTestFileD008
     * @tc.desc Verify Uint8Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r1 = arr.map((v) => v * 2)
      const r2 = arr.map((v) => v * 3)
      expect(r1 === r2).assertEqual(false)
      expect(r1[0]).assertEqual(2)
      expect(r2[0]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_0900
     * @tc.name testTypedUArraysMapTestFileD009
     * @tc.desc Verify Uint16Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30])
      const r1 = arr.map((v) => v + 1)
      const r2 = arr.map((v) => v + 2)
      expect(r1 === r2).assertEqual(false)
      expect(r1[0]).assertEqual(11)
      expect(r2[0]).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1000
     * @tc.name testTypedUArraysMapTestFileD010
     * @tc.desc Verify Uint8Array map r1 r2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r2 = arr.map((v) => v * 3)
      expect(r2[0]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1100
     * @tc.name testTypedUArraysMapTestFileD011
     * @tc.desc Verify Uint8Array map r2 r1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      const r1 = arr.map((v) => v * 2)
      expect(r1[0]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1200
     * @tc.name testTypedUArraysMapTestFileD012
     * @tc.desc Verify Uint8Array map 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 256 : 256)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1300
     * @tc.name testTypedUArraysMapTestFileD013
     * @tc.desc Verify Uint8Array map -1 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? -1 : -1)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1400
     * @tc.name testTypedUArraysMapTestFileD014
     * @tc.desc Verify Uint16Array map 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 65536 : 65536)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1500
     * @tc.name testTypedUArraysMapTestFileD015
     * @tc.desc Verify Uint32Array map 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 4294967296 : 4294967296)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1600
     * @tc.name testTypedUArraysMapTestFileD016
     * @tc.desc Verify Uint8ClampedArray map 300 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 300 : 300)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1700
     * @tc.name testTypedUArraysMapTestFileD017
     * @tc.desc Verify Uint8ClampedArray map -10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? -10 : -10)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1800
     * @tc.name testTypedUArraysMapTestFileD018
     * @tc.desc Verify Uint8ClampedArray map NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? Number.NaN : Number.NaN)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_1900
     * @tc.name testTypedUArraysMapTestFileD019
     * @tc.desc Verify Uint8ClampedArray map Infinity 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? Number.POSITIVE_INFINITY : Number.POSITIVE_INFINITY)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(255)
      expect(result[2]).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2000
     * @tc.name testTypedUArraysMapTestFileD020
     * @tc.desc Verify Uint8ClampedArray map -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? -Number.POSITIVE_INFINITY : -Number.POSITIVE_INFINITY)
      expect(result[0]).assertEqual(0)
      expect(result[1]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2100
     * @tc.name testTypedUArraysMapTestFileD021
     * @tc.desc Verify Uint8Array map 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 3.7 : 3.7)
      expect(result[0]).assertEqual(3)
      expect(result[1]).assertEqual(3)
      expect(result[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2200
     * @tc.name testTypedUArraysMapTestFileD022
     * @tc.desc Verify Uint16Array map 100.9 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 100.9 : 100.9)
      expect(result[0]).assertEqual(100)
      expect(result[1]).assertEqual(100)
      expect(result[2]).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2300
     * @tc.name testTypedUArraysMapTestFileD023
     * @tc.desc Verify Uint32Array map 1000.5 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3])
      let result = arr.map((v) => v >= 0 ? 1000.5 : 1000.5)
      expect(result[0]).assertEqual(1000)
      expect(result[1]).assertEqual(1000)
      expect(result[2]).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2400
     * @tc.name testTypedUArraysMapTestFileD024
     * @tc.desc Verify Uint8ClampedArray map 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((v) => v >= 0 ? 3.7 : 3.7);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2500
     * @tc.name testTypedUArraysMapTestFileD025
     * @tc.desc Verify Uint8Array map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2600
     * @tc.name testTypedUArraysMapTestFileD026
     * @tc.desc Verify Uint16Array map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2700
     * @tc.name testTypedUArraysMapTestFileD027
     * @tc.desc Verify Uint32Array map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2800
     * @tc.name testTypedUArraysMapTestFileD028
     * @tc.desc Verify BigUint64Array map undefined 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.map((): bigint => { return 0n; });
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(0n);
      expect(result[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_MAP_PART202_2900
     * @tc.name testTypedUArraysMapTestFileD029
     * @tc.desc Verify Uint8ClampedArray map undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysMapTestFileD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let result = arr.map((): number => { return Number.NaN; });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });
  });
}
