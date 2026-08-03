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

export default function typedUArraysReduceRightTest01(): void {
  describe('TypedUArraysReduceRightTest01', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0100
     * @tc.name testTypedUArraysReduceRightTestFileA001
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint8Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect().assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0200
     * @tc.name testTypedUArraysReduceRightTestFileA002
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint16Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect().assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0300
     * @tc.name testTypedUArraysReduceRightTestFileA003
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint32Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect().assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0400
     * @tc.name testTypedUArraysReduceRightTestFileA004
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint8ClampedArray without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect().assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0500
     * @tc.name testTypedUArraysReduceRightTestFileA005
     * @tc.desc Verify reduceRight throws TypeError for an empty BigUint64Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect().assertFail(); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0600
     * @tc.name testTypedUArraysReduceRightTestFileA006
     * @tc.desc Verify reduceRight sums Uint8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0700
     * @tc.name testTypedUArraysReduceRightTestFileA007
     * @tc.desc Verify reduceRight sums Uint16Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0800
     * @tc.name testTypedUArraysReduceRightTestFileA008
     * @tc.desc Verify reduceRight sums BigUint64Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_0900
     * @tc.name testTypedUArraysReduceRightTestFileA009
     * @tc.desc Verify arithmetic using a Uint8Array reduceRight result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1000
     * @tc.name testTypedUArraysReduceRightTestFileA010
     * @tc.desc Verify bigint arithmetic using a BigUint64Array reduceRight result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 10n;
      expect(result).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1100
     * @tc.name testTypedUArraysReduceRightTestFileA011
     * @tc.desc Verify the reduceRight callback receives four arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let argsCount = 0;
      arr.reduceRight((prev, curr, idx, array) => { argsCount = 4; return prev + curr; });
      expect(argsCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1200
     * @tc.name testTypedUArraysReduceRightTestFileA012
     * @tc.desc Verify reduceRight callback indices for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const indices: number[] = [];
      arr.reduceRight((_, curr, idx) => { indices.push(idx); return 0; });
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1300
     * @tc.name testTypedUArraysReduceRightTestFileA013
     * @tc.desc Verify reduceRight callback indices for BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      const indices: number[] = [];
      arr.reduceRight((_, curr, idx) => { indices.push(idx); return 0n; });
      expect(indices[0]).assertEqual(2);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1400
     * @tc.name testTypedUArraysReduceRightTestFileA014
     * @tc.desc Verify reduceRight callback values for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const values: number[] = [];
      arr.reduceRight((_, curr) => { values.push(curr); return 0; });
      expect(values[0]).assertEqual(3);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1500
     * @tc.name testTypedUArraysReduceRightTestFileA015
     * @tc.desc Verify reduceRight callback values for BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const values: bigint[] = [];
      arr.reduceRight((_, curr) => { values.push(curr); return 0n; });
      expect(values[0]).assertEqual(3n);
      expect(values[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1600
     * @tc.name testTypedUArraysReduceRightTestFileA016
     * @tc.desc Verify the first accumulator value for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const firstPrev: number[] = [];
      arr.reduceRight((prev, curr) => { if (firstPrev.length === 0) firstPrev.push(prev); return prev + curr; });
      expect(firstPrev[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1700
     * @tc.name testTypedUArraysReduceRightTestFileA017
     * @tc.desc Verify the first accumulator value for Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const firstPrev: number[] = [];
      arr.reduceRight((prev, curr) => { if (firstPrev.length === 0) firstPrev.push(prev); return prev + curr; });
      expect(firstPrev[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1800
     * @tc.name testTypedUArraysReduceRightTestFileA018
     * @tc.desc Verify the reduceRight callback receives the source Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let passedArray: Uint8Array | null = null;
      arr.reduceRight((prev, curr, idx, array) => { passedArray = array; return prev + curr; });
      expect(passedArray).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_1900
     * @tc.name testTypedUArraysReduceRightTestFileA019
     * @tc.desc Verify arithmetic using a Uint8Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 100;
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2000
     * @tc.name testTypedUArraysReduceRightTestFileA020
     * @tc.desc Verify arithmetic using a BigUint64Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 0n;
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2100
     * @tc.name testTypedUArraysReduceRightTestFileA021
     * @tc.desc Verify reduceRight throws TypeError for an empty Uint8Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        arr.reduceRight((prev: number, curr: number): number => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2200
     * @tc.name testTypedUArraysReduceRightTestFileA022
     * @tc.desc Verify reduceRight throws TypeError for an empty BigUint64Array without an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      try {
        arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2300
     * @tc.name testTypedUArraysReduceRightTestFileA023
     * @tc.desc Verify reduceRight supports a string initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev: string, curr) => prev + curr, "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2400
     * @tc.name testTypedUArraysReduceRightTestFileA024
     * @tc.desc Verify reduceRight supports an array initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const result = arr.reduceRight((prev: Array<number>, curr: number): Array<number> => { prev.push(curr); return prev; }, []);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2500
     * @tc.name testTypedUArraysReduceRightTestFileA025
     * @tc.desc Verify reduceRight sums Uint8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2600
     * @tc.name testTypedUArraysReduceRightTestFileA026
     * @tc.desc Verify reduceRight sums Uint16Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2700
     * @tc.name testTypedUArraysReduceRightTestFileA027
     * @tc.desc Verify reduceRight sums Uint32Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2800
     * @tc.name testTypedUArraysReduceRightTestFileA028
     * @tc.desc Verify reduceRight sums Uint8ClampedArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_2900
     * @tc.name testTypedUArraysReduceRightTestFileA029
     * @tc.desc Verify reduceRight sums BigUint64Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3000
     * @tc.name testTypedUArraysReduceRightTestFileA030
     * @tc.desc Verify arithmetic using a Uint16Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 100;
      expect(result).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3100
     * @tc.name testTypedUArraysReduceRightTestFileA031
     * @tc.desc Verify arithmetic using a Uint32Array reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 1000;
      expect(result).assertEqual(1600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3200
     * @tc.name testTypedUArraysReduceRightTestFileA032
     * @tc.desc Verify arithmetic using a Uint8ClampedArray reduceRight sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3300
     * @tc.name testTypedUArraysReduceRightTestFileA033
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(42);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3400
     * @tc.name testTypedUArraysReduceRightTestFileA034
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(99);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3500
     * @tc.name testTypedUArraysReduceRightTestFileA035
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([999]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(999);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3600
     * @tc.name testTypedUArraysReduceRightTestFileA036
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([55]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(55);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3700
     * @tc.name testTypedUArraysReduceRightTestFileA037
     * @tc.desc Verify reduceRight does not invoke the callback for a single-element BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(42n);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3800
     * @tc.name testTypedUArraysReduceRightTestFileA038
     * @tc.desc Verify reduceRight propagates an Error thrown by the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.reduceRight((prev, curr) => { throw new Error(); });
        expect().assertFail();
      } catch (e) { expect(e.name).assertEqual('Error'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_3900
     * @tc.name testTypedUArraysReduceRightTestFileA039
     * @tc.desc Verify reduceRight subtraction for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHT_PART101_4000
     * @tc.name testTypedUArraysReduceRightTestFileA040
     * @tc.desc Verify reduceRight subtraction for BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0n);
    });
  });
}
