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

export default function typedUArraysReduceRightTest01(): void {
  describe('TypedUArraysReduceRightTest01', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0010
     * @tc.name testTypedUArraysReduceRightPart101_001
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint8Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(true).assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0020
     * @tc.name testTypedUArraysReduceRightPart101_002
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint16Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(true).assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0030
     * @tc.name testTypedUArraysReduceRightPart101_003
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint32Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(true).assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0040
     * @tc.name testTypedUArraysReduceRightPart101_004
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint8ClampedArray without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(true).assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0050
     * @tc.name testTypedUArraysReduceRightPart101_005
     * @tc.desc Verify reduceRight throws TypeError for an empty BigUint64Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(true).assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0060
     * @tc.name testTypedUArraysReduceRightPart101_006
     * @tc.desc Verify reduceRight sums Uint8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0070
     * @tc.name testTypedUArraysReduceRightPart101_007
     * @tc.desc Verify reduceRight sums Uint16Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0080
     * @tc.name testTypedUArraysReduceRightPart101_008
     * @tc.desc Verify reduceRight sums BigUint64Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15n);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0090
     * @tc.name testTypedUArraysReduceRightPart101_009
     * @tc.desc Verify arithmetic using a Uint8Array reduceRight result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0100
     * @tc.name testTypedUArraysReduceRightPart101_010
     * @tc.desc Verify bigint arithmetic using a BigUint64Array reduceRight result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 10n;
      expect(result).assertEqual(16n);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0110
     * @tc.name testTypedUArraysReduceRightPart101_011
     * @tc.desc Verify the reduceRight callback receives four arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let argsCount = 0;
      arr.reduceRight((prev, curr, idx, array) => { argsCount = 4; return prev + curr; });
      expect(argsCount).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0120
     * @tc.name testTypedUArraysReduceRightPart101_012
     * @tc.desc Verify reduceRight callback indices for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const indices: number[] = [];
      arr.reduceRight((_, curr, idx) => { indices.push(idx); return 0; });
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0130
     * @tc.name testTypedUArraysReduceRightPart101_013
     * @tc.desc Verify reduceRight callback indices for BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      const indices: number[] = [];
      arr.reduceRight((_, curr, idx) => { indices.push(idx); return 0n; });
      expect(indices[0]).assertEqual(2);
      expect(indices[2]).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0140
     * @tc.name testTypedUArraysReduceRightPart101_014
     * @tc.desc Verify reduceRight callback values for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const values: number[] = [];
      arr.reduceRight((_, curr) => { values.push(curr); return 0; });
      expect(values[0]).assertEqual(3);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0150
     * @tc.name testTypedUArraysReduceRightPart101_015
     * @tc.desc Verify reduceRight callback values for BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const values: bigint[] = [];
      arr.reduceRight((_, curr) => { values.push(curr); return 0n; });
      expect(values[0]).assertEqual(3n);
      expect(values[2]).assertEqual(1n);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0160
     * @tc.name testTypedUArraysReduceRightPart101_016
     * @tc.desc Verify the first accumulator value for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const firstPrev: number[] = [];
      arr.reduceRight((prev, curr) => { if (firstPrev.length === 0) firstPrev.push(prev); return prev + curr; });
      expect(firstPrev[0]).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0170
     * @tc.name testTypedUArraysReduceRightPart101_017
     * @tc.desc Verify the first accumulator value for Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const firstPrev: number[] = [];
      arr.reduceRight((prev, curr) => { if (firstPrev.length === 0) firstPrev.push(prev); return prev + curr; });
      expect(firstPrev[0]).assertEqual(30);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0180
     * @tc.name testTypedUArraysReduceRightPart101_018
     * @tc.desc Verify the reduceRight callback receives the source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let passedArray: Uint8Array | null = null;
      arr.reduceRight((prev, curr, idx, array) => { passedArray = array; return prev + curr; });
      expect(passedArray).assertEqual(arr);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0190
     * @tc.name testTypedUArraysReduceRightPart101_019
     * @tc.desc Verify reduceRight returns the Uint8Array sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0200
     * @tc.name testTypedUArraysReduceRightPart101_020
     * @tc.desc Verify arithmetic using a Uint8Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 100;
      expect(result).assertEqual(106);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0210
     * @tc.name testTypedUArraysReduceRightPart101_021
     * @tc.desc Verify arithmetic using a BigUint64Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 0n;
      expect(result).assertEqual(15n);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0220
     * @tc.name testTypedUArraysReduceRightPart101_022
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint8Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        arr.reduceRight((prev: number, curr: number): number => prev + curr);
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0230
     * @tc.name testTypedUArraysReduceRightPart101_023
     * @tc.desc Verify reduceRight throws TypeError for an empty BigUint64Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      try {
        arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr);
        expect(true).assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0240
     * @tc.name testTypedUArraysReduceRightPart101_024
     * @tc.desc Verify reduceRight supports a string initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev: string, curr) => prev + curr, "");
      expect(result).assertEqual("321");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0250
     * @tc.name testTypedUArraysReduceRightPart101_025
     * @tc.desc Verify reduceRight supports an array initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const result = arr.reduceRight((prev: Array<number>, curr: number): Array<number> => { prev.push(curr); return prev; }, []);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0260
     * @tc.name testTypedUArraysReduceRightPart101_026
     * @tc.desc Verify reduceRight sums Uint8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0270
     * @tc.name testTypedUArraysReduceRightPart101_027
     * @tc.desc Verify reduceRight sums Uint16Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(100);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0280
     * @tc.name testTypedUArraysReduceRightPart101_028
     * @tc.desc Verify reduceRight sums Uint32Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(1000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0290
     * @tc.name testTypedUArraysReduceRightPart101_029
     * @tc.desc Verify reduceRight sums Uint8ClampedArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0300
     * @tc.name testTypedUArraysReduceRightPart101_030
     * @tc.desc Verify reduceRight sums BigUint64Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10n);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0310
     * @tc.name testTypedUArraysReduceRightPart101_031
     * @tc.desc Verify arithmetic using a Uint8Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0320
     * @tc.name testTypedUArraysReduceRightPart101_032
     * @tc.desc Verify arithmetic using a Uint16Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 100;
      expect(result).assertEqual(160);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0330
     * @tc.name testTypedUArraysReduceRightPart101_033
     * @tc.desc Verify arithmetic using a Uint32Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 1000;
      expect(result).assertEqual(1600);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0340
     * @tc.name testTypedUArraysReduceRightPart101_034
     * @tc.desc Verify arithmetic using a Uint8ClampedArray reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0350
     * @tc.name testTypedUArraysReduceRightPart101_035
     * @tc.desc Verify bigint arithmetic using a BigUint64Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 10n;
      expect(result).assertEqual(16n);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0360
     * @tc.name testTypedUArraysReduceRightPart101_036
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(42);
      expect(called).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0370
     * @tc.name testTypedUArraysReduceRightPart101_037
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(99);
      expect(called).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0380
     * @tc.name testTypedUArraysReduceRightPart101_038
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([999]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(999);
      expect(called).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0390
     * @tc.name testTypedUArraysReduceRightPart101_039
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([55]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(55);
      expect(called).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0400
     * @tc.name testTypedUArraysReduceRightPart101_040
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(42n);
      expect(called).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0410
     * @tc.name testTypedUArraysReduceRightPart101_041
     * @tc.desc Verify reduceRight propagates an Error thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.reduceRight((prev, curr) => { throw new Error(); });
        expect(true).assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0420
     * @tc.name testTypedUArraysReduceRightPart101_042
     * @tc.desc Verify reduceRight subtraction for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0430
     * @tc.name testTypedUArraysReduceRightPart101_043
     * @tc.desc Verify reduceRight subtraction for BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightPart101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0n);
    });
  });
}
