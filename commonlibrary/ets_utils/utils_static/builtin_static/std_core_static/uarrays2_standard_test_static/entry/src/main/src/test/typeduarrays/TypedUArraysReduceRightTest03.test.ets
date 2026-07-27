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

interface SumObj {
  sum: number;
}

export default function typedUArraysReduceRightTest03(): void {
  describe('TypedUArraysReduceRightTest03', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    it('testTypedUArraysReduceRightPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: number | null, val: number): number | null => {
        return acc !== null ? acc + val : val;
      }, null);
      expect(result).assertEqual(null);
    });
    it('testTypedUArraysReduceRightPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => 42);
      expect(result).assertEqual(42);
    });
    it('testTypedUArraysReduceRightPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let externalSum: number = 0;
      arr.reduceRight((prev, curr, idx, array) => { externalSum += curr; return prev + curr; });
      expect(externalSum).assertEqual(3);
    });
    it('testTypedUArraysReduceRightPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let multiplier: number = 2;
      let result = arr.reduceRight((sum, val) => sum + val * multiplier);
      expect(result).assertEqual(9);
    });
    it('testTypedUArraysReduceRightPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + arr.reduceRight((s, v) => s + v));
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: number | null, val: number): number | null => {
        return acc !== null ? acc + val : null;
      }, null);
      expect(result).assertEqual(null);
    });
    it('testTypedUArraysReduceRightPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((acc: number | undefined, val: number): number | undefined => {
        return val === 3 ? undefined : acc;
      }, 0);
      expect(result).assertUndefined();
    });
    it('testTypedUArraysReduceRightPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: SumObj, val: number): SumObj => { acc.sum += val; return acc; }, { sum: 0 });
      expect(result.sum).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((acc: Array<number>, val: number): Array<number> => { acc.push(val); return acc; }, []);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
    });
    it('testTypedUArraysReduceRightPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, true);
      expect(result).assertTrue();
    });
    it('testTypedUArraysReduceRightPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((acc: number, val: bigint): number => acc + Number(val), 0);
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });
    it('testTypedUArraysReduceRightPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 0, 255, 0]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(510);
    });
    it('testTypedUArraysReduceRightPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0x10, 0x20, 0x30]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(96);
    });
    it('testTypedUArraysReduceRightPart202_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2, -3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(762);
    });
    it('testTypedUArraysReduceRightPart202_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.5, 2.7, 3.9]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart202_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1.5, -2.7, -3.9]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(762);
    });
    it('testTypedUArraysReduceRightPart202_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + NaN;
      expect(Number.isNaN(result)).assertTrue();
    });
    it('testTypedUArraysReduceRightPart202_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.POSITIVE_INFINITY;
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });
    it('testTypedUArraysReduceRightPart202_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 4294967295, 4294967295]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(12884901885);
    });
    it('testTypedUArraysReduceRightPart202_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 65535, 1, 0xFFFF]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(163838);
    });
    it('testTypedUArraysReduceRightPart202_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MAX_SAFE_INTEGER;
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 3);
    });
    it('testTypedUArraysReduceRightPart202_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MIN_SAFE_INTEGER;
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER + 3);
    });
    it('testTypedUArraysReduceRightPart202_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MAX_VALUE;
      expect(result).assertEqual(Number.MAX_VALUE);
    });
    it('testTypedUArraysReduceRightPart202_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.MIN_VALUE;
      expect(result).assertEqual(3 + Number.MIN_VALUE);
    });
    it('testTypedUArraysReduceRightPart202_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.EPSILON;
      expect(result).assertEqual(3 + Number.EPSILON);
    });
    it('testTypedUArraysReduceRightPart202_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0x100;
      expect(result).assertEqual(259);
    });
    it('testTypedUArraysReduceRightPart202_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0xFFFF;
      expect(result).assertEqual(65538);
    });
    it('testTypedUArraysReduceRightPart202_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0xFFFFFFFF;
      expect(result).assertEqual(4294967298);
    });
    it('testTypedUArraysReduceRightPart202_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1e10;
      expect(result).assertEqual(10000000003);
    });
    it('testTypedUArraysReduceRightPart202_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1.5e1;
      expect(result).assertEqual(18);
    });
    it('testTypedUArraysReduceRightPart202_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(30);
      expect(order[2]).assertEqual(10);
    });
    it('testTypedUArraysReduceRightPart202_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(4);
      expect(order[3]).assertEqual(1);
    });
    it('testTypedUArraysReduceRightPart202_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(9);
      expect(order[8]).assertEqual(1);
    });
    it('testTypedUArraysReduceRightPart202_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(2);
    });
    it('testTypedUArraysReduceRightPart202_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(1);
    });
    it('testTypedUArraysReduceRightPart202_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart202_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.length).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart202_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const originalToString = arr.toString;
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.toString).assertEqual(originalToString);
    });
    it('testTypedUArraysReduceRightPart202_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([4, 5, 6]);
      let result = arr2.reduceRight((sum, val) => sum + val, arr1.reduceRight((s, v) => s + v));
      expect(result).assertEqual(21);
    });
    it('testTypedUArraysReduceRightPart202_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      const output = result > 5 ? "large" : "small";
      expect(output).assertEqual("large");
    });
    it('testTypedUArraysReduceRightPart202_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      const output = result * 2;
      expect(output).assertEqual(12);
    });
    it('testTypedUArraysReduceRightPart202_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const u16 = new Uint16Array(buf);
      let result = u16.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(1540);
    });
    it('testTypedUArraysReduceRightPart202_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const u8 = new Uint8Array(buf);
      u8[8] = 1; u8[9] = 0; u8[10] = 2; u8[11] = 0; u8[12] = 3; u8[13] = 0; u8[14] = 4; u8[15] = 0;
      const view = new Uint16Array(buf, 8, 4);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
      expect(view.byteOffset).assertEqual(8);
    });
    it('testTypedUArraysReduceRightPart202_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u8 = new Uint8Array(buf);
      u8[4] = 10; u8[5] = 0; u8[6] = 0; u8[7] = 0;
      u8[8] = 20; u8[9] = 0; u8[10] = 0; u8[11] = 0;
      u8[12] = 30; u8[13] = 0; u8[14] = 0; u8[15] = 0;
      const view = new Uint32Array(buf, 4, 3);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(60);
    });
    it('testTypedUArraysReduceRightPart202_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, true);
      expect(result).assertTrue();
    });
    it('testTypedUArraysReduceRightPart202_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, false);
      expect(result).assertFalse();
    });
    it('testTypedUArraysReduceRightPart202_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.reduceRight((acc: string, val: number): string => acc + val, "");
      expect(result).assertEqual("");
    });
    it('testTypedUArraysReduceRightPart202_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum * 2);
      expect(result).assertEqual(12);
    });
    it('testTypedUArraysReduceRightPart202_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart202_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.reduceRight((sum, val, idx, array) => sum + val + idx);
      expect(result).assertEqual(61);
    });
    it('testTypedUArraysReduceRightPart202_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(255);
    });
    it('testTypedUArraysReduceRightPart202_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });
    it('testTypedUArraysReduceRightPart202_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255, 255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(1020);
    });
    it('testTypedUArraysReduceRightPart202_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 2, 1]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(9);
    });
    it('testTypedUArraysReduceRightPart202_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0x0001, 0x0002, 0x0003, 0x0004]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
    });
    it('testTypedUArraysReduceRightPart202_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(10n);
    });
  });
}
