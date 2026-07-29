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

export default function typedUArraysReduceRightTest02(): void {
  describe('TypedUArraysReduceRightTest02', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    it('testTypedUArraysReduceRightPart201_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(typeof result).assertEqual('number');
    });
    it('testTypedUArraysReduceRightPart201_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(typeof result).assertEqual('number');
    });
    it('testTypedUArraysReduceRightPart201_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(typeof result).assertEqual('number');
    });
    it('testTypedUArraysReduceRightPart201_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(typeof result).assertEqual('number');
    });
    it('testTypedUArraysReduceRightPart201_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(typeof result).assertEqual('bigint');
    });
    it('testTypedUArraysReduceRightPart201_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: string, val: number): string => acc + val, "");
      expect(typeof result).assertEqual('string');
    });
    it('testTypedUArraysReduceRightPart201_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: boolean, val: number): boolean => acc && val > 0, true);
      expect(typeof result).assertEqual('boolean');
    });
    it('testTypedUArraysReduceRightPart201_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((acc: Array<number>, val: number): Array<number> => { acc[0] += val; return acc; }, [0]);
      expect(typeof result).assertEqual('object');
    });
    it('testTypedUArraysReduceRightPart201_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(typeof result).assertEqual('number');
    });
    it('testTypedUArraysReduceRightPart201_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try { arr.reduceRight((sum, val) => sum + val); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(e.name).assertEqual('TypeError'); }
    });
    it('testTypedUArraysReduceRightPart201_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(15n);
    });
    it('testTypedUArraysReduceRightPart201_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8Array(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4; arr[4] = 5;
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val * 2);
      expect(result).assertEqual(9);
    });
    it('testTypedUArraysReduceRightPart201_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1000000, 2000000, 3000000]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6000000);
    });
    it('testTypedUArraysReduceRightPart201_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prod, val) => prod * val);
      expect(result).assertEqual(120);
    });
    it('testTypedUArraysReduceRightPart201_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((acc: string, val: number): string => acc + val, "");
      expect(result).assertEqual("321");
    });
    it('testTypedUArraysReduceRightPart201_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0x10;
      expect(result).assertEqual(22);
    });
    it('testTypedUArraysReduceRightPart201_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0o20;
      expect(result).assertEqual(22);
    });
    it('testTypedUArraysReduceRightPart201_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0b10000;
      expect(result).assertEqual(22);
    });
    it('testTypedUArraysReduceRightPart201_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1e2;
      expect(result).assertEqual(106);
    });
    it('testTypedUArraysReduceRightPart201_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRightPart201_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(42);
    });
    it('testTypedUArraysReduceRightPart201_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(30);
    });
    it('testTypedUArraysReduceRightPart201_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((diff, val) => diff - val);
      expect(result).assertEqual(-5);
    });
    it('testTypedUArraysReduceRightPart201_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4, 1, 5]);
      let result = arr.reduceRight((max, val) => Math.max(max, val));
      expect(result).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4, 1, 5]);
      let result = arr.reduceRight((min, val) => Math.min(min, val));
      expect(result).assertEqual(1);
    });
    it('testTypedUArraysReduceRightPart201_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + NaN;
      expect(Number.isNaN(result)).assertTrue();
    });
    it('testTypedUArraysReduceRightPart201_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.POSITIVE_INFINITY;
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });
    it('testTypedUArraysReduceRightPart201_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + Number.NEGATIVE_INFINITY;
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });
    it('testTypedUArraysReduceRightPart201_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 0;
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart201_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + (-0);
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart201_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + 1.5;
      expect(result).assertEqual(7.5);
    });
    it('testTypedUArraysReduceRightPart201_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) + (-1.5);
      expect(result).assertEqual(4.5);
    });
    it('testTypedUArraysReduceRightPart201_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 127, 255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(382);
    });
    it('testTypedUArraysReduceRightPart201_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 65535]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(98302);
    });
    it('testTypedUArraysReduceRightPart201_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 4294967295]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6442450942);
    });
    it('testTypedUArraysReduceRightPart201_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(382);
    });
    it('testTypedUArraysReduceRightPart201_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 9223372036854775807n, BigInt('18446744073709551615')]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(9223372036854775806n);
    });
    it('testTypedUArraysReduceRightPart201_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n]);
      let result = arr.reduceRight((sum, val) => sum + val, 18446744073709551615n);
      expect(result).assertEqual(18446744073709551618n);
    });
    it('testTypedUArraysReduceRightPart201_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((sum, val) => sum + val, 0n);
      expect(result).assertEqual(6n);
    });
    it('testTypedUArraysReduceRightPart201_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(15n);
    });
    it('testTypedUArraysReduceRightPart201_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([300, -10, 128]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(383);
    });
    it('testTypedUArraysReduceRightPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x01]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(384);
    });
  });
}
