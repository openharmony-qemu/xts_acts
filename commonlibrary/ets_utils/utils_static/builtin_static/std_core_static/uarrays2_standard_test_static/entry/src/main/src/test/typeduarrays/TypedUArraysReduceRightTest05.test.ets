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

export default function typedUArraysReduceRightTest05(): void {
  describe('TypedUArraysReduceRightTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0100
     * @tc.name testTypedUArraysReduceRightTestFileE001
     * @tc.desc Verify reduceRight TypeError on empty Uint8Array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try {
        arr.reduceRight((prev, curr, idx, array) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0200
     * @tc.name testTypedUArraysReduceRightTestFileE002
     * @tc.desc Verify reduceRight - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0300
     * @tc.name testTypedUArraysReduceRightTestFileE003
     * @tc.desc Verify reduceRight TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0400
     * @tc.name testTypedUArraysReduceRightTestFileE004
     * @tc.desc Verify reduceRight TypeError Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0500
     * @tc.name testTypedUArraysReduceRightTestFileE005
     * @tc.desc Verify reduceRight TypeError Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0600
     * @tc.name testTypedUArraysReduceRightTestFileE006
     * @tc.desc Verify reduceRight TypeError Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0700
     * @tc.name testTypedUArraysReduceRightTestFileE007
     * @tc.desc Verify reduceRight TypeError BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      try {
        arr.reduceRight((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0800
     * @tc.name testTypedUArraysReduceRightTestFileE008
     * @tc.desc Verify reduceRight on single-element Uint8Array returns the element without calling callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let called = false;
      const result = arr.reduceRight((prev, curr) => {
        called = true;
        return prev + curr;
      });
      expect(result).assertEqual(42);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_0900
     * @tc.name testTypedUArraysReduceRightTestFileE009
     * @tc.desc Verify reduceRight on empty BigUint64Array with initialValue returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      let result = arr.reduceRight((prev, curr) => prev + curr, 42n);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1000
     * @tc.name testTypedUArraysReduceRightTestFileE010
     * @tc.desc Verify reduceRight Uint8Array 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 1]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1100
     * @tc.name testTypedUArraysReduceRightTestFileE011
     * @tc.desc Verify reduceRight Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1200
     * @tc.name testTypedUArraysReduceRightTestFileE012
     * @tc.desc Verify reduceRight Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1300
     * @tc.name testTypedUArraysReduceRightTestFileE013
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 1n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1400
     * @tc.name testTypedUArraysReduceRightTestFileE014
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000000000000n, 2000000000000n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(3000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1500
     * @tc.name testTypedUArraysReduceRightTestFileE015
     * @tc.desc Verify reduceRight BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev, curr) => prev * curr);
      expect(result).assertEqual(120n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1600
     * @tc.name testTypedUArraysReduceRightTestFileE016
     * @tc.desc Verify reduceRight Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 1]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1700
     * @tc.name testTypedUArraysReduceRightTestFileE017
     * @tc.desc Verify reduceRight Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 1]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1800
     * @tc.name testTypedUArraysReduceRightTestFileE018
     * @tc.desc Verify reduceRight Uint8Array -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev: string, curr: number): string => prev + curr + "", "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_1900
     * @tc.name testTypedUArraysReduceRightTestFileE019
     * @tc.desc Verify reduceRight BigUint64Array -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: string, curr: bigint): string => prev + String(curr), "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2000
     * @tc.name testTypedUArraysReduceRightTestFileE020
     * @tc.desc Verify reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.reduceRight((prev, curr, idx, array) => prev * curr) * 1;
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2100
     * @tc.name testTypedUArraysReduceRightTestFileE021
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((prev, curr) => prev * curr);
      expect(result).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2200
     * @tc.name testTypedUArraysReduceRightTestFileE022
     * @tc.desc Verify reduceRight Uint8Array max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 5, 30, 15]);
      let result = arr.reduceRight((prev, curr) => prev > curr ? prev : curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2300
     * @tc.name testTypedUArraysReduceRightTestFileE023
     * @tc.desc Verify reduceRight BigUint64Array max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 5n, 30n, 15n]);
      let result = arr.reduceRight((prev, curr) => prev > curr ? prev : curr);
      expect(result).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2400
     * @tc.name testTypedUArraysReduceRightTestFileE024
     * @tc.desc Verify reduceRight Uint8Array min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 5, 30, 15]);
      let result = arr.reduceRight((prev, curr) => prev < curr ? prev : curr);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2500
     * @tc.name testTypedUArraysReduceRightTestFileE025
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([100, 200, 300, 400]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2600
     * @tc.name testTypedUArraysReduceRightTestFileE026
     * @tc.desc Verify reduceRight Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000, 2000, 3000, 4000]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2700
     * @tc.name testTypedUArraysReduceRightTestFileE027
     * @tc.desc Verify reduceRight reduce Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const reduceResult = arr.reduce((prev, curr) => prev - curr);
      const reduceRightResult = arr.reduceRight((prev, curr) => prev - curr);
      expect(reduceResult).assertEqual(-4);
      expect(reduceRightResult).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2800
     * @tc.name testTypedUArraysReduceRightTestFileE028
     * @tc.desc Verify reduceRight BigUint64Array reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const reduceResult = arr.reduce((prev, curr) => prev - curr);
      const reduceRightResult = arr.reduceRight((prev, curr) => prev - curr);
      expect(reduceRightResult).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_2900
     * @tc.name testTypedUArraysReduceRightTestFileE029
     * @tc.desc Verify reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 10]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3000
     * @tc.name testTypedUArraysReduceRightTestFileE030
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 10n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3100
     * @tc.name testTypedUArraysReduceRightTestFileE031
     * @tc.desc Verify reduceRight Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3200
     * @tc.name testTypedUArraysReduceRightTestFileE032
     * @tc.desc Verify reduceRight Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let steps: string[] = [];
      arr.reduceRight((prev, curr, idx, array) => {
        steps.push(`${prev}+${curr}@${idx}`);
        return prev + curr;
      });
      expect(steps[0]).assertEqual("3+2@1");
      expect(steps[1]).assertEqual("5+1@0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3300
     * @tc.name testTypedUArraysReduceRightTestFileE033
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3400
     * @tc.name testTypedUArraysReduceRightTestFileE034
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev - curr) + 100;
      expect(result).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3500
     * @tc.name testTypedUArraysReduceRightTestFileE035
     * @tc.desc Verify reduceRight Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.reduceRight((prev, curr) => prev + curr) + 0.0;
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3600
     * @tc.name testTypedUArraysReduceRightTestFileE036
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3700
     * @tc.name testTypedUArraysReduceRightTestFileE037
     * @tc.desc Verify reduceRight Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const result = arr.reduceRight((prev, curr, idx, array) => prev + curr) + 100;
      expect(result).assertEqual(115);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3800
     * @tc.name testTypedUArraysReduceRightTestFileE038
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1000000000000n, 2000000000000n]);
      let result = arr.reduceRight((prev, curr) => prev + curr, 5000000000000n);
      expect(result).assertEqual(8000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_3900
     * @tc.name testTypedUArraysReduceRightTestFileE039
     * @tc.desc Verify reduceRight Uint8Array prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let firstPrev: number = -1;
      arr.reduceRight((prev, curr) => {
        if (firstPrev === -1) firstPrev = prev;
        return prev + curr;
      });
      expect(firstPrev).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_4000
     * @tc.name testTypedUArraysReduceRightTestFileE040
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let callCount = 0;
      let firstCurr: number = -1;
      arr.reduceRight((prev, curr) => {
        if (callCount === 0) firstCurr = curr;
        callCount++;
        return prev + curr;
      });
      expect(firstCurr).assertEqual(30);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_4100
     * @tc.name testTypedUArraysReduceRightTestFileE041
     * @tc.desc Verify reduceRight BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let callCount = 0;
      let firstCurr: bigint = 0n;
      arr.reduceRight((prev, curr) => {
        if (callCount === 0) firstCurr = curr;
        callCount++;
        return prev + curr;
      });
      expect(firstCurr).assertEqual(30n);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_4200
     * @tc.name testTypedUArraysReduceRightTestFileE042
     * @tc.desc Verify reduceRight Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const result = arr.reduceRight((prev: Array<number>, curr: number): Array<number> => {
        prev.push(curr);
        return prev;
      }, []);
      const val19 = result[0];
      expect(val19).assertEqual(4);
      const val20 = result[1];
      expect(val20).assertEqual(3);
      const val21 = result[2];
      expect(val21).assertEqual(2);
      const val22 = result[3];
      expect(val22).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST05_4300
     * @tc.name testTypedUArraysReduceRightTestFileE043
     * @tc.desc Verify reduceRight Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.reduceRight((prev: string, curr: number): string => prev + "-" + curr, "");
      expect(result).assertEqual("-30-20-10");
    });
  });
}
