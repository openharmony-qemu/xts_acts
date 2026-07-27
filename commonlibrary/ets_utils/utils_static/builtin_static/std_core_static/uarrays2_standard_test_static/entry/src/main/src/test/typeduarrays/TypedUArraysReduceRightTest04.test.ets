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

export default function typedUArraysReduceRightTest04(): void {
  describe('TypedUArraysReduceRightTest04', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    it('testTypedUArraysReduceRightPart201_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let order: number[] = [];
      arr.reduceRight((sum, val) => { order.push(val); return sum + val; });
      expect(order[0]).assertEqual(20);
      expect(order[1]).assertEqual(10);
      expect(order.length).assertEqual(2);
    });
    it('testTypedUArraysReduceRightPart201_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let indices: number[] = [];
      arr.reduceRight((sum, val, idx, arr2) => { indices.push(idx); return sum + val; });
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(0);
      expect(indices.length).assertEqual(2);
    });
    it('testTypedUArraysReduceRightPart201_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let arrayRef: Uint8Array | null = null;
      arr.reduceRight((sum, val, idx, array) => { arrayRef = arr; return sum + val; });
      expect(arrayRef).assertEqual(arr);
    });
    it('testTypedUArraysReduceRightPart201_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([100, 200, 300]);
      let idxSum: number = 0;
      arr.reduceRight((sum, val, idx, arr2) => { idxSum = idxSum + idx; return sum + val; });
      expect(idxSum).assertEqual(1);
    });
    it('testTypedUArraysReduceRightPart201_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(0);
    });
    it('testTypedUArraysReduceRightPart201_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(1);
    });
    it('testTypedUArraysReduceRightPart201_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let callCount: number = 0;
      arr.reduceRight((sum, val) => { callCount++; return sum + val; });
      expect(callCount).assertEqual(2);
    });
    it('testTypedUArraysReduceRightPart201_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try { arr.reduceRight((sum, val) => sum + val); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRightPart201_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(0);
    });
    it('testTypedUArraysReduceRightPart201_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 5, 5, 5, 5]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(25);
    });
    it('testTypedUArraysReduceRightPart201_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      arr.reduceRight((sum, val) => sum * 2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });
    it('testTypedUArraysReduceRightPart201_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.length).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const buf = arr.buffer;
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.buffer).assertEqual(buf);
    });
    it('testTypedUArraysReduceRightPart201_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 8);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.byteOffset).assertEqual(4);
    });
    it('testTypedUArraysReduceRightPart201_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.byteLength).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.length).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });
    it('testTypedUArraysReduceRightPart201_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr.length).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.reduceRight((sum, val) => sum + val);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });
    it('testTypedUArraysReduceRightPart201_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val) * 2;
      expect(result).assertEqual(12);
    });
    it('testTypedUArraysReduceRightPart201_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([4, 5, 6]);
      const intermediate = arr1.reduceRight((sum, val) => sum + val);
      let result = arr2.reduceRight((sum, val) => sum + val, intermediate);
      expect(result).assertEqual(21);
    });
    it('testTypedUArraysReduceRightPart201_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([4, 5, 6]);
      const intermediate = arr1.reduceRight((sum, val) => sum + val);
      let result = arr2.reduce((sum, val) => sum + val, intermediate);
      expect(result).assertEqual(21);
    });
    it('testTypedUArraysReduceRightPart201_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const reduceResult = arr.reduce((sum, val) => sum + val);
      const reduceRightResult = arr.reduceRight((sum, val) => sum + val);
      expect(reduceResult).assertEqual(reduceRightResult);
    });
    it('testTypedUArraysReduceRightPart201_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result > 5).assertTrue();
    });
    it('testTypedUArraysReduceRightPart201_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(Math.sqrt(result)).assertEqual(Math.sqrt(6));
    });
    it('testTypedUArraysReduceRightPart201_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(Number.isInteger(result)).assertTrue();
    });
    it('testTypedUArraysReduceRightPart201_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result.toString()).assertEqual("6");
    });
    it('testTypedUArraysReduceRightPart201_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      const arrResult = [result, result * 2];
      expect(arrResult[0]).assertEqual(6);
      expect(arrResult[1]).assertEqual(12);
    });
    it('testTypedUArraysReduceRightPart201_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart201_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const child = new Uint8Array(buf, 0, 4);
      let result = child.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
    });
    it('testTypedUArraysReduceRightPart201_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[4] = 1; u8[5] = 2; u8[6] = 3; u8[7] = 4;
      const view = new Uint8Array(buf, 4, 4);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
    });
    it('testTypedUArraysReduceRightPart201_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u8 = new Uint8Array(buf);
      for (let i = 0; i < 8; i++) { u8[i] = i + 1; }
      const view = new Uint8Array(buf, 0, 8);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(36);
    });
    it('testTypedUArraysReduceRightPart201_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const u8 = new Uint8Array(buf);
      for (let i = 8; i < 16; i++) { u8[i] = 10 + (i - 8); }
      const view = new Uint8Array(buf, 8, 4);
      let result = view.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(46);
    });
    it('testTypedUArraysReduceRightPart201_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8View = new Uint8Array(buf);
      u8View[0] = 1; u8View[1] = 0; u8View[2] = 2; u8View[3] = 0; u8View[4] = 3; u8View[5] = 0;
      const u16View = new Uint16Array(buf);
      let result = u16View.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(6);
    });
    it('testTypedUArraysReduceRightPart201_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const child = new Uint8Array(buf, 0, 4);
      child.reduceRight((sum, val) => sum + val);
      expect(u8[0]).assertEqual(1);
      expect(u8[3]).assertEqual(4);
    });
    it('testTypedUArraysReduceRightPart201_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const child = new Uint8Array(buf, 0, 4);
      let result = child.reduceRight((sum, val) => sum + val);
      expect(u8.reduceRight((s, v) => s + v)).assertEqual(result);
    });
    it('testTypedUArraysReduceRightPart201_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const u8 = new Uint8Array(buf);
      u8[0] = 1; u8[1] = 2; u8[2] = 3; u8[3] = 4;
      const v1 = new Uint8Array(buf, 0, 4);
      const v2 = new Uint8Array(buf, 4, 4);
      let result = v1.reduceRight((sum, val) => sum + val);
      expect(result).assertEqual(10);
      expect(v2[0]).assertEqual(0);
    });
    it('testTypedUArraysReduceRightPart201_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 4);
      view.reduceRight((sum, val) => sum + val);
      expect(view.byteOffset).assertEqual(4);
    });
    it('testTypedUArraysReduceRightPart201_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint8Array(buf, 4, 4);
      view.reduceRight((sum, val) => sum + val);
      expect(view.byteLength).assertEqual(4);
    });
    it('testTypedUArraysReduceRightPart201_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + 42;
        expect(result).assertEqual(42);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + 0;
        expect(result).assertEqual(0);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + 100;
        expect(result).assertEqual(100);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + 200;
        expect(result).assertEqual(200);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + 300;
        expect(result).assertEqual(300);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.reduceRight((sum, val) => sum + val, 42n);
      expect(result).assertEqual(42n);
    });
    it('testTypedUArraysReduceRightPart201_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + NaN;
        expect(Number.isNaN(result)).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + Number.POSITIVE_INFINITY;
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRightPart201_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        let result = arr.reduceRight((sum, val) => sum + val) + Number.NEGATIVE_INFINITY;
        expect(result).assertEqual(Number.NEGATIVE_INFINITY);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
  });
}
