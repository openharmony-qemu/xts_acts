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

export default function typedUArraysReduceRightTest02(): void {
  describe('TypedUArraysReduceRightTest02', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0100
     * @tc.name testTypedUArraysReduceRightTestFileB001
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0200
     * @tc.name testTypedUArraysReduceRightTestFileB002
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0300
     * @tc.name testTypedUArraysReduceRightTestFileB003
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0400
     * @tc.name testTypedUArraysReduceRightTestFileB004
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0500
     * @tc.name testTypedUArraysReduceRightTestFileB005
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0600
     * @tc.name testTypedUArraysReduceRightTestFileB006
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: string, val: number): string => acc + val, "");
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0700
     * @tc.name testTypedUArraysReduceRightTestFileB007
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0800
     * @tc.name testTypedUArraysReduceRightTestFileB008
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((acc: Array<number>, val: number): Array<number> => { acc[0] += val; return acc; }, [0]);
      expect(result[0]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_0900
     * @tc.name testTypedUArraysReduceRightTestFileB009
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        arr.reduceRight((sum, val) => sum + val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1000
     * @tc.name testTypedUArraysReduceRightTestFileB010
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1100
     * @tc.name testTypedUArraysReduceRightTestFileB011
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1200
     * @tc.name testTypedUArraysReduceRightTestFileB012
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1300
     * @tc.name testTypedUArraysReduceRightTestFileB013
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1400
     * @tc.name testTypedUArraysReduceRightTestFileB014
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1500
     * @tc.name testTypedUArraysReduceRightTestFileB015
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8Array(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5;
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1600
     * @tc.name testTypedUArraysReduceRightTestFileB016
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val * 2);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1700
     * @tc.name testTypedUArraysReduceRightTestFileB017
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000000, 2000000, 3000000]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1800
     * @tc.name testTypedUArraysReduceRightTestFileB018
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prod, val) => prod * val);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_1900
     * @tc.name testTypedUArraysReduceRightTestFileB019
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: string, val: number): string => acc + val, "");
      expect(result).assertEqual("321");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2000
     * @tc.name testTypedUArraysReduceRightTestFileB020
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0x10;
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2100
     * @tc.name testTypedUArraysReduceRightTestFileB021
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0o20;
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2200
     * @tc.name testTypedUArraysReduceRightTestFileB022
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0b10000;
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2300
     * @tc.name testTypedUArraysReduceRightTestFileB023
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1e2;
      expect(result).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2400
     * @tc.name testTypedUArraysReduceRightTestFileB024
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2500
     * @tc.name testTypedUArraysReduceRightTestFileB025
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2600
     * @tc.name testTypedUArraysReduceRightTestFileB026
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2700
     * @tc.name testTypedUArraysReduceRightTestFileB027
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((diff, val) => diff - val);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2800
     * @tc.name testTypedUArraysReduceRightTestFileB028
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4, 1, 5]);
      let result = arr.reduceRight((max, val) => Math.max(max, val));
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_2900
     * @tc.name testTypedUArraysReduceRightTestFileB029
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4, 1, 5]);
      let result = arr.reduceRight((min, val) => Math.min(min, val));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3000
     * @tc.name testTypedUArraysReduceRightTestFileB030
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.NaN;
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3100
     * @tc.name testTypedUArraysReduceRightTestFileB031
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.POSITIVE_INFINITY;
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3200
     * @tc.name testTypedUArraysReduceRightTestFileB032
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.NEGATIVE_INFINITY;
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3300
     * @tc.name testTypedUArraysReduceRightTestFileB033
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3400
     * @tc.name testTypedUArraysReduceRightTestFileB034
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + (-0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3500
     * @tc.name testTypedUArraysReduceRightTestFileB035
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1.5;
      expect(result).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3600
     * @tc.name testTypedUArraysReduceRightTestFileB036
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + (-1.5);
      expect(result).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3700
     * @tc.name testTypedUArraysReduceRightTestFileB037
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 127, 255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(382);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3800
     * @tc.name testTypedUArraysReduceRightTestFileB038
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 65535]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(98302);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_3900
     * @tc.name testTypedUArraysReduceRightTestFileB039
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 4294967295]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6442450942);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4000
     * @tc.name testTypedUArraysReduceRightTestFileB040
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(382);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4100
     * @tc.name testTypedUArraysReduceRightTestFileB041
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 9223372036854775807n, BigInt('18446744073709551615')]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(27670116110564327422n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4200
     * @tc.name testTypedUArraysReduceRightTestFileB042
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      let result = arr.reduceRight((sum, val) => sum + val, 18446744073709551615n);
      expect(result).assertEqual(18446744073709551618n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4300
     * @tc.name testTypedUArraysReduceRightTestFileB043
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4400
     * @tc.name testTypedUArraysReduceRightTestFileB044
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4500
     * @tc.name testTypedUArraysReduceRightTestFileB045
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, -10, 128]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST02_4600
     * @tc.name testTypedUArraysReduceRightTestFileB046
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x01]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(384);
    });
  });
}
