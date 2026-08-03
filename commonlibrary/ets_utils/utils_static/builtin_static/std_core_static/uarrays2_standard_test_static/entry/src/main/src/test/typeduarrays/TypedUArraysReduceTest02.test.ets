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

export default function typedUArraysReduceTest02(): void {
  describe('TypedUArraysReduceTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0100
     * @tc.name testTypedUArraysReduceTestFileB001
     * @tc.desc Verify MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      let result = arr.reduce((sum, val) => sum + val, 0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0200
     * @tc.name testTypedUArraysReduceTestFileB002
     * @tc.desc Verify Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(300, -10, 128);
      const result = arr.reduce((sum: number, val: number): number => sum + val) + 128;
      expect(result).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0300
     * @tc.name testTypedUArraysReduceTestFileB003
     * @tc.desc Verify BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduce((sum, val) => sum + val, 0n);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0400
     * @tc.name testTypedUArraysReduceTestFileB004
     * @tc.desc Verify initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      try {
        (arr).reduce((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0500
     * @tc.name testTypedUArraysReduceTestFileB005
     * @tc.desc Verify Uint16Array initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint16Array.of();
      try {
        (arr).reduce((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0600
     * @tc.name testTypedUArraysReduceTestFileB006
     * @tc.desc Verify Uint32Array initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of();
      try {
        (arr).reduce((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0700
     * @tc.name testTypedUArraysReduceTestFileB007
     * @tc.desc Verify Uint8ClampedArray initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      try {
        (arr).reduce((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0800
     * @tc.name testTypedUArraysReduceTestFileB008
     * @tc.desc Verify BigUint64Array initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      try {
        (arr).reduce((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_0900
     * @tc.name testTypedUArraysReduceTestFileB009
     * @tc.desc Verify new Uint8Array(0) initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        (arr).reduce((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1000
     * @tc.name testTypedUArraysReduceTestFileB010
     * @tc.desc Verify BigUint64Array reduce with 1n initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduce((sum, val) => sum + val, 1n);
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1100
     * @tc.name testTypedUArraysReduceTestFileB011
     * @tc.desc Verify BigUint64Array reduce with MAX BigInt initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      const result = arr.reduce((sum: bigint, val: bigint): bigint => sum + val) + 18446744073709551615n;
      expect(result).assertEqual(18446744073709551618n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1200
     * @tc.name testTypedUArraysReduceTestFileB012
     * @tc.desc Verify BigUint64Array reduce with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(100n);
      let result = arr.reduce((sum, val) => sum + val, 50n);
      expect(result).assertEqual(150n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1300
     * @tc.name testTypedUArraysReduceTestFileB013
     * @tc.desc Verify BigUint64Array reduce with empty array + BigInt initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      let result = arr.reduce((sum, val) => sum + val, 42n);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1400
     * @tc.name testTypedUArraysReduceTestFileB014
     * @tc.desc Verify BigUint64Array reduce with hex BigInt initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      const result = arr.reduce((sum: bigint, val: bigint): bigint => sum + val) + 255n;
      expect(result).assertEqual(258n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1500
     * @tc.name testTypedUArraysReduceTestFileB015
     * @tc.desc Verify BigUint64Array reduce with overflow BigInt initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      const result = arr.reduce((sum: bigint, val: bigint): bigint => sum + val) + 18446744073709551616n;
      expect(result).assertEqual(18446744073709551619n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1600
     * @tc.name testTypedUArraysReduceTestFileB016
     * @tc.desc Verify BigUint64Array reduce with multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = arr.reduce((sum, val) => sum + val, 0n);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1700
     * @tc.name testTypedUArraysReduceTestFileB017
     * @tc.desc Verify BigUint64Array reduce with callbackfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(10n, 20n, 30n);
      let result = arr.reduce((sum, val, idx, ary) => sum + val + numberToBigint(idx));
      expect(result).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1800
     * @tc.name testTypedUArraysReduceTestFileB018
     * @tc.desc Verify BigUint64Array reduce with callbackfn using array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let arrayRef: BigUint64Array | null = null;
      let result = arr.reduce((sum, val, idx, ary) => {
        arrayRef = ary;
        return sum + val;
      }, 0n);
      expect(result).assertEqual(6n);
      expect(arrayRef).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_1900
     * @tc.name testTypedUArraysReduceTestFileB019
     * @tc.desc Verify BigUint64Array reduce with BigInt('18446744073709551615') MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(18446744073709551615n, 1n);
      let result = arr.reduce((sum, val) => sum + val, 0n);
      expect(result).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2000
     * @tc.name testTypedUArraysReduceTestFileB020
     * @tc.desc Verify BigUint64Array reduce with 0n + empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      let result = arr.reduce((sum, val) => sum + val, 0n);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2100
     * @tc.name testTypedUArraysReduceTestFileB021
     * @tc.desc Verify BigUint64Array reduce with string BigInt initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      let result = arr.reduce((sum, val) => sum + val, 100n);
      expect(result).assertEqual(103n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2200
     * @tc.name testTypedUArraysReduceTestFileB022
     * @tc.desc Verify BigUint64Array reduce with callbackfn returning non-BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduce((acc, val) => acc + val);
      expect(Number(result)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2300
     * @tc.name testTypedUArraysReduceTestFileB023
     * @tc.desc Verify BigUint64Array reduce with callbackfn returning string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduce((acc, val) => acc + val);
      expect(result.toString()).assertEqual("6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2400
     * @tc.name testTypedUArraysReduceTestFileB024
     * @tc.desc Verify BigUint64Array reduceRight with empty array and no initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      try {
        (arr).reduceRight((a, b) => a + b);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2500
     * @tc.name testTypedUArraysReduceTestFileB025
     * @tc.desc Verify BigUint64Array reduceRight with basic callbackfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2600
     * @tc.name testTypedUArraysReduceTestFileB026
     * @tc.desc Verify BigUint64Array reduceRight with initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduceRight((sum, val) => sum + val, 10n);
      expect(result).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2700
     * @tc.name testTypedUArraysReduceTestFileB027
     * @tc.desc Verify BigUint64Array reduceRight right-to-left order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result: string = arr.reduceRight<string>((acc: string, val: bigint) => acc + val.toString(), "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2800
     * @tc.name testTypedUArraysReduceTestFileB028
     * @tc.desc Verify BigUint64Array reduceRight with single element and no initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(42n);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_2900
     * @tc.name testTypedUArraysReduceTestFileB029
     * @tc.desc Verify BigUint64Array reduceRight with callbackfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(10n, 20n, 30n);
      let indices: number[] = [];
      arr.reduceRight((sum, val, idx) => {
        indices.push(idx);
        return sum + val;
      }, 0n);
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3000
     * @tc.name testTypedUArraysReduceTestFileB030
     * @tc.desc Verify BigUint64Array reduceRight with multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3100
     * @tc.name testTypedUArraysReduceTestFileB031
     * @tc.desc Verify BigUint64Array reduceRight with MAX BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      const result = arr.reduceRight((sum: bigint, val: bigint): bigint => sum + val) + 18446744073709551615n;
      expect(result).assertEqual(18446744073709551618n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3200
     * @tc.name testTypedUArraysReduceTestFileB032
     * @tc.desc Verify BigUint64Array join with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3300
     * @tc.name testTypedUArraysReduceTestFileB033
     * @tc.desc Verify BigUint64Array join with custom separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(10n, 20n, 30n);
      let result = arr.join("-");
      expect(result).assertEqual("10-20-30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3400
     * @tc.name testTypedUArraysReduceTestFileB034
     * @tc.desc Verify BigUint64Array join with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      let result = arr.join();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3500
     * @tc.name testTypedUArraysReduceTestFileB035
     * @tc.desc Verify BigUint64Array join with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(42n);
      let result = arr.join();
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3600
     * @tc.name testTypedUArraysReduceTestFileB036
     * @tc.desc Verify BigUint64Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.toString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3700
     * @tc.name testTypedUArraysReduceTestFileB037
     * @tc.desc Verify BigUint64Array toString with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      let result = arr.toString();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3800
     * @tc.name testTypedUArraysReduceTestFileB038
     * @tc.desc Verify BigUint64Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(100n, 200n);
      let result = arr.toLocaleString();
      expect(result).assertEqual(arr[0].toLocaleString() + ',' + arr[1].toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_3900
     * @tc.name testTypedUArraysReduceTestFileB039
     * @tc.desc Verify BigUint64Array reduceRight with callbackfn null throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let result = arr.reduceRight((sum: bigint, val: bigint): bigint => sum + val);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_4000
     * @tc.name testTypedUArraysReduceTestFileB040
     * @tc.desc Verify BigUint64Array reduceRight with two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      let result = arr.reduceRight((sum: bigint, val: bigint): bigint => sum + val);
      expect(result).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_4100
     * @tc.name testTypedUArraysReduceTestFileB041
     * @tc.desc Verify BigUint64Array reduceRight with empty array + BigInt initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of();
      let result = arr.reduceRight((sum, val) => sum + val, 42n);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_4200
     * @tc.name testTypedUArraysReduceTestFileB042
     * @tc.desc Verify BigUint64Array reduceRight with callbackfn using array ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n, 3n);
      let arrayRef: BigUint64Array | null = null;
      let result = arr.reduceRight((sum, val, idx, ary) => {
        arrayRef = ary;
        return sum + val;
      }, 0n);
      expect(result).assertEqual(6n);
      expect(arrayRef).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCE_PART102_4300
     * @tc.name testTypedUArraysReduceTestFileB043
     * @tc.desc Verify BigUint64Array reduceRight with BigInt initialValue string hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceTestFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = BigUint64Array.of(1n, 2n);
      const result = arr.reduceRight((sum: bigint, val: bigint): bigint => sum + val) + 255n;
      expect(result).assertEqual(258n);
    });

  });
}
