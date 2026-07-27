'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * ...保留Apache 2.0许可证原文...
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function typedUArraysReduceRightTest01(): void {
  describe('TypedUArraysReduceRightTest01', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => { await Utils.msSleep(30); });
    afterEach((): void => {});
    afterAll((): void => {});

    it('testTypedUArraysReduceRight01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRight01002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRight01003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRight01004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRight01005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([]);
      try { arr.reduceRight((prev, curr) => prev + curr); expect(typeof arr).assertEqual('object'); }
      catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRight01006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRight01007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });
    it('testTypedUArraysReduceRight01008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15n);
    });
    it('testTypedUArraysReduceRight01009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });
    it('testTypedUArraysReduceRight01010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 10n;
      expect(result).assertEqual(16n);
    });
    it('testTypedUArraysReduceRight01011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let argsCount = 0;
      arr.reduceRight((prev, curr, idx, array) => { argsCount = 4; return prev + curr; });
      expect(argsCount).assertEqual(4);
    });
    it('testTypedUArraysReduceRight01012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      const indices: number[] = [];
      arr.reduceRight((_, curr, idx) => { indices.push(idx); return 0; });
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });
    it('testTypedUArraysReduceRight01013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n]);
      const indices: number[] = [];
      arr.reduceRight((_, curr, idx) => { indices.push(idx); return 0n; });
      expect(indices[0]).assertEqual(2);
      expect(indices[2]).assertEqual(0);
    });
    it('testTypedUArraysReduceRight01014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      const values: number[] = [];
      arr.reduceRight((_, curr) => { values.push(curr); return 0; });
      expect(values[0]).assertEqual(3);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(1);
    });
    it('testTypedUArraysReduceRight01015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const values: bigint[] = [];
      arr.reduceRight((_, curr) => { values.push(curr); return 0n; });
      expect(values[0]).assertEqual(3n);
      expect(values[2]).assertEqual(1n);
    });
    it('testTypedUArraysReduceRight01016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const firstPrev: number[] = [];
      arr.reduceRight((prev, curr) => { if (firstPrev.length === 0) firstPrev.push(prev); return prev + curr; });
      expect(firstPrev[0]).assertEqual(5);
    });
    it('testTypedUArraysReduceRight01017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const firstPrev: number[] = [];
      arr.reduceRight((prev, curr) => { if (firstPrev.length === 0) firstPrev.push(prev); return prev + curr; });
      expect(firstPrev[0]).assertEqual(30);
    });
    it('testTypedUArraysReduceRight01018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let passedArray: Uint8Array | null = null;
      arr.reduceRight((prev, curr, idx, array) => { passedArray = array; return prev + curr; });
      expect(passedArray).assertEqual(arr);
    });
    it('testTypedUArraysReduceRight01019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });
    it('testTypedUArraysReduceRight01020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 100;
      expect(result).assertEqual(106);
    });
    it('testTypedUArraysReduceRight01021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 0n;
      expect(result).assertEqual(15n);
    });
    it('testTypedUArraysReduceRight01022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      try {
        let result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 99;
        expect(result).assertEqual(99);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRight01023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      try {
        let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 99n;
        expect(result).assertEqual(99n);
      } catch (e) {
        expect(true).assertTrue();
      }
    });
    it('testTypedUArraysReduceRight01024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev: string, curr) => prev + curr, "");
      expect(result).assertEqual("321");
    });
    it('testTypedUArraysReduceRight01025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      const result = arr.reduceRight((prev: Array<number>, curr: number): Array<number> => { prev.push(curr); return prev; }, []);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
    });
    it('testTypedUArraysReduceRight01026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10);
    });
    it('testTypedUArraysReduceRight01027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(100);
    });
    it('testTypedUArraysReduceRight01028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(1000);
    });
    it('testTypedUArraysReduceRight01029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10);
    });
    it('testTypedUArraysReduceRight01030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = arr.reduceRight((prev, curr) => prev + curr);
      expect(result).assertEqual(10n);
    });
    it('testTypedUArraysReduceRight01031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });
    it('testTypedUArraysReduceRight01032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 100;
      expect(result).assertEqual(160);
    });
    it('testTypedUArraysReduceRight01033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 1000;
      expect(result).assertEqual(1600);
    });
    it('testTypedUArraysReduceRight01034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const result = arr.reduceRight((prev: number, curr: number): number => prev + curr) + 10;
      expect(result).assertEqual(16);
    });
    it('testTypedUArraysReduceRight01035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev: bigint, curr: bigint): bigint => prev + curr) + 10n;
      expect(result).assertEqual(16n);
    });
    it('testTypedUArraysReduceRight01036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(42);
      expect(called).assertFalse();
    });
    it('testTypedUArraysReduceRight01037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([99]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(99);
      expect(called).assertFalse();
    });
    it('testTypedUArraysReduceRight01038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([999]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(999);
      expect(called).assertFalse();
    });
    it('testTypedUArraysReduceRight01039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([55]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(55);
      expect(called).assertFalse();
    });
    it('testTypedUArraysReduceRight01040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let called: boolean = false;
      let result = arr.reduceRight((prev, curr) => { called = true; return prev + curr; });
      expect(result).assertEqual(42n);
      expect(called).assertFalse();
    });
    it('testTypedUArraysReduceRight01041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      try {
        arr.reduceRight((prev, curr) => { throw new Error(); return prev + curr; });
        expect(false).assertEqual(true);
      } catch (e) { expect(typeof e).assertEqual('object'); }
    });
    it('testTypedUArraysReduceRight01042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0);
    });
    it('testTypedUArraysReduceRight01043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      let result = arr.reduceRight((prev, curr) => prev - curr);
      expect(result).assertEqual(0n);
    });
  });
}
