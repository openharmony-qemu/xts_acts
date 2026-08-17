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

interface SumObj {
  sum: number;
}

export default function typedUArraysReduceRightTest03(): void {
  describe('TypedUArraysReduceRightTest03', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0100
     * @tc.name testTypedUArraysReduceRightTestFileC001
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: number | null, val: number): number | null => {
        return acc !== null ? acc + val : val;
      }, null);
      expect(result).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0200
     * @tc.name testTypedUArraysReduceRightTestFileC002
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => 42);
      expect(result).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0300
     * @tc.name testTypedUArraysReduceRightTestFileC003
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let externalSum: number = 0;
      arr.reduceRight((prev, curr, idx, array) => { externalSum += curr; return prev + curr; });
      expect(externalSum).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0400
     * @tc.name testTypedUArraysReduceRightTestFileC004
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let multiplier: number = 2;
      let result = arr.reduceRight((sum, val) => sum + val * multiplier);
      expect(result).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0500
     * @tc.name testTypedUArraysReduceRightTestFileC005
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + arr.reduceRight((s, v) => s + v));
      expect(result).assertEqual(15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0600
     * @tc.name testTypedUArraysReduceRightTestFileC006
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: number | null, val: number): number | null => {
        return acc !== null ? acc + val : null;
      }, null);
      expect(result).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0700
     * @tc.name testTypedUArraysReduceRightTestFileC007
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((acc: number | undefined, val: number): number | undefined => {
        return val === 3 ? undefined : acc;
      }, 0);
      expect(result).assertUndefined();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0800
     * @tc.name testTypedUArraysReduceRightTestFileC008
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: SumObj, val: number): SumObj => { acc.sum += val; return acc; }, { sum: 0 });
      expect(result.sum).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_0900
     * @tc.name testTypedUArraysReduceRightTestFileC009
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((acc: Array<number>, val: number): Array<number> => { acc.push(val); return acc; }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1000
     * @tc.name testTypedUArraysReduceRightTestFileC010
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, true);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1100
     * @tc.name testTypedUArraysReduceRightTestFileC011
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((acc: number, val: bigint): number => acc + Number(val), 0);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1200
     * @tc.name testTypedUArraysReduceRightTestFileC012
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1300
     * @tc.name testTypedUArraysReduceRightTestFileC013
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 255, 0]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(510);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1400
     * @tc.name testTypedUArraysReduceRightTestFileC014
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x20, 0x30]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(96);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1500
     * @tc.name testTypedUArraysReduceRightTestFileC015
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(762);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1600
     * @tc.name testTypedUArraysReduceRightTestFileC016
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.5, 2.7, 3.9]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1700
     * @tc.name testTypedUArraysReduceRightTestFileC017
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1.5, -2.7, -3.9]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(762);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1800
     * @tc.name testTypedUArraysReduceRightTestFileC018
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.NaN;
      expect(result).assertNaN();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_1900
     * @tc.name testTypedUArraysReduceRightTestFileC019
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.POSITIVE_INFINITY;
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2000
     * @tc.name testTypedUArraysReduceRightTestFileC020
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(12884901885);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2100
     * @tc.name testTypedUArraysReduceRightTestFileC021
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 65535, 1, 0xFFFF]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(163838);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2200
     * @tc.name testTypedUArraysReduceRightTestFileC022
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MAX_SAFE_INTEGER;
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2300
     * @tc.name testTypedUArraysReduceRightTestFileC023
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MIN_SAFE_INTEGER;
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER + 3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2400
     * @tc.name testTypedUArraysReduceRightTestFileC024
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MAX_VALUE;
      expect(result).assertEqual(Number.MAX_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2500
     * @tc.name testTypedUArraysReduceRightTestFileC025
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MIN_VALUE;
      expect(result).assertEqual(3 + Number.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2600
     * @tc.name testTypedUArraysReduceRightTestFileC026
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.EPSILON;
      expect(result).assertEqual(3 + Number.EPSILON);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2700
     * @tc.name testTypedUArraysReduceRightTestFileC027
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0x100;
      expect(result).assertEqual(259);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2800
     * @tc.name testTypedUArraysReduceRightTestFileC028
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0xFFFF;
      expect(result).assertEqual(65538);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_2900
     * @tc.name testTypedUArraysReduceRightTestFileC029
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0xFFFFFFFF;
      expect(result).assertEqual(4294967298);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3000
     * @tc.name testTypedUArraysReduceRightTestFileC030
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1e10;
      expect(result).assertEqual(10000000003);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3100
     * @tc.name testTypedUArraysReduceRightTestFileC031
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1.5e1;
      expect(result).assertEqual(18);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3200
     * @tc.name testTypedUArraysReduceRightTestFileC032
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(30);
      expect(order[2]).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3300
     * @tc.name testTypedUArraysReduceRightTestFileC033
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(4);
      expect(order[3]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3400
     * @tc.name testTypedUArraysReduceRightTestFileC034
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(9);
      expect(order[8]).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3500
     * @tc.name testTypedUArraysReduceRightTestFileC035
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3600
     * @tc.name testTypedUArraysReduceRightTestFileC036
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3700
     * @tc.name testTypedUArraysReduceRightTestFileC037
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3800
     * @tc.name testTypedUArraysReduceRightTestFileC038
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.length).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_3900
     * @tc.name testTypedUArraysReduceRightTestFileC039
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const originalToString = arr.toString;
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.toString).assertEqual(originalToString);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4000
     * @tc.name testTypedUArraysReduceRightTestFileC040
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([4, 5, 6]);
      let result = arr2.reduceRight((sum, val) => sum + val, arr1.reduceRight((s, v) => s + v));
      expect(result).assertEqual(21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4100
     * @tc.name testTypedUArraysReduceRightTestFileC041
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      const output = result > 5 ? "large" : "small";
      expect(output).assertEqual("large");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4200
     * @tc.name testTypedUArraysReduceRightTestFileC042
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      const output = result * 2;
      expect(output).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4300
     * @tc.name testTypedUArraysReduceRightTestFileC043
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const u16 = new Uint16Array(buf);
      let result = u16.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(1540);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4400
     * @tc.name testTypedUArraysReduceRightTestFileC044
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const u8 = new Uint8Array(buf);
      u8[8] = 1; u8[9] = 0; u8[10] = 2; u8[11] = 0; u8[12] = 3; u8[13] = 0; u8[14] = 4; u8[15] = 0;
      const view = new Uint16Array(buf, 8, 4);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
      expect(view.byteOffset).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4500
     * @tc.name testTypedUArraysReduceRightTestFileC045
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u8 = new Uint8Array(buf);
      u8[4] = 10; u8[5] = 0; u8[6] = 0; u8[7] = 0;
      u8[8] = 20; u8[9] = 0; u8[10] = 0; u8[11] = 0;
      u8[12] = 30; u8[13] = 0; u8[14] = 0; u8[15] = 0;
      const view = new Uint32Array(buf, 4, 3);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(60);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4600
     * @tc.name testTypedUArraysReduceRightTestFileC046
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, true);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4700
     * @tc.name testTypedUArraysReduceRightTestFileC047
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, false);
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4800
     * @tc.name testTypedUArraysReduceRightTestFileC048
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: string, val: number): string => acc + val, "");
      expect(result).assertEqual("");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_4900
     * @tc.name testTypedUArraysReduceRightTestFileC049
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum * 2);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5000
     * @tc.name testTypedUArraysReduceRightTestFileC050
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5100
     * @tc.name testTypedUArraysReduceRightTestFileC051
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.reduceRight((sum, val, idx, array) => sum + val + idx);
      expect(result).assertEqual(61);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5200
     * @tc.name testTypedUArraysReduceRightTestFileC052
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(255);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5300
     * @tc.name testTypedUArraysReduceRightTestFileC053
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5400
     * @tc.name testTypedUArraysReduceRightTestFileC054
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255, 255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(1020);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5500
     * @tc.name testTypedUArraysReduceRightTestFileC055
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 2, 1]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5600
     * @tc.name testTypedUArraysReduceRightTestFileC056
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x0001, 0x0002, 0x0003, 0x0004]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_REDUCERIGHTTEST03_5700
     * @tc.name testTypedUArraysReduceRightTestFileC057
     * @tc.desc Verify TypedArray API behavior for this test scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysReduceRightTestFileC057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(10n);
    });
  });
}
