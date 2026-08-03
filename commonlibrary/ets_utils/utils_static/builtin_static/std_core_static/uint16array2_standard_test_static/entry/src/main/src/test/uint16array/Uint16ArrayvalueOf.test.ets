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

export default function uint16ArrayValueOfTest(): void {
  describe('Uint16ArrayValueOfTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0100
     * @tc.name testUint16ArrayValueOf001
      * @tc.desc Verify valueOf returns the original populated Uint16Array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0200
     * @tc.name testUint16ArrayValueOf002
      * @tc.desc Verify valueOf returns the original empty array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of();
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0300
     * @tc.name testUint16ArrayValueOf003
      * @tc.desc Verify valueOf returns the original single-element array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(42);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0400
     * @tc.name testUint16ArrayValueOf004
      * @tc.desc Verify valueOf preserves identity for a five-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0500
     * @tc.name testUint16ArrayValueOf005
      * @tc.desc Verify valueOf preserves identity for a populated hundred-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0600
     * @tc.name testUint16ArrayValueOf006
      * @tc.desc Verify valueOf preserves identity for a zero-initialized length construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(8);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0700
     * @tc.name testUint16ArrayValueOf007
      * @tc.desc Verify valueOf preserves identity for a copied typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(10, 20, 30);
      const arr: Uint16Array = new Uint16Array(source);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0800
     * @tc.name testUint16ArrayValueOf008
      * @tc.desc Verify valueOf preserves identity for an of-created array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(100, 200, 300);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_0900
     * @tc.name testUint16ArrayValueOf009
      * @tc.desc Verify valueOf preserves identity for a from-created array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.from([5, 10, 15]);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1000
     * @tc.name testUint16ArrayValueOf010
      * @tc.desc Verify valueOf preserves identity for a buffer-backed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      const arr: Uint16Array = new Uint16Array(buffer);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1100
     * @tc.name testUint16ArrayValueOf011
      * @tc.desc Verify valueOf preserves identity for an offset buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buffer, 2);
      arr[0] = 42;
      arr[1] = 99;
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1200
     * @tc.name testUint16ArrayValueOf012
      * @tc.desc Verify valueOf preserves identity for a bounded buffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(12);
      const arr: Uint16Array = new Uint16Array(buffer, 4, 3);
      arr[0] = 7;
      arr[1] = 8;
      arr[2] = 9;
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1300
     * @tc.name testUint16ArrayValueOf013
      * @tc.desc Verify repeated valueOf calls preserve the receiver identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.valueOf().valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1400
     * @tc.name testUint16ArrayValueOf014
      * @tc.desc Verify three chained valueOf calls preserve the receiver identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20);
      const result: Uint16Array = arr.valueOf().valueOf().valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1500
     * @tc.name testUint16ArrayValueOf015
      * @tc.desc Verify fill through valueOf mutates every receiver element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.valueOf().fill(99);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1600
     * @tc.name testUint16ArrayValueOf016
      * @tc.desc Verify reverse through valueOf mutates receiver order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.valueOf().reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1700
     * @tc.name testUint16ArrayValueOf017
      * @tc.desc Verify copyWithin through valueOf mutates receiver content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      arr.valueOf().copyWithin(0, 3);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1800
     * @tc.name testUint16ArrayValueOf018
      * @tc.desc Verify valueOf preserves zero length for an empty receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of();
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_1900
     * @tc.name testUint16ArrayValueOf019
      * @tc.desc Verify valueOf preserves length and exposes live indexed writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(100, 200, 300, 400, 500);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result.length).assertEqual(5);
      result[4] = 999;
      expect(arr[4]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2000
     * @tc.name testUint16ArrayValueOf020
      * @tc.desc Verify valueOf retains byte length and shares indexed writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(8);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result.byteLength).assertEqual(16);
      result[0] = 65535;
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2100
     * @tc.name testUint16ArrayValueOf021
      * @tc.desc Verify valueOf retains the receiver byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(12);
      const arr: Uint16Array = new Uint16Array(buffer, 4);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2200
     * @tc.name testUint16ArrayValueOf022
      * @tc.desc Verify valueOf preserves the receiver backing buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buffer);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2300
     * @tc.name testUint16ArrayValueOf023
      * @tc.desc Verify valueOf exposes each indexed value of the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(7, 14, 21);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(arr[0]);
      expect(result[1]).assertEqual(arr[1]);
      expect(result[2]).assertEqual(arr[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2400
     * @tc.name testUint16ArrayValueOf024
      * @tc.desc Verify valueOf exposes the receiver final indexed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(5, 10, 15, 20);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[arr.length - 1]).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2500
     * @tc.name testUint16ArrayValueOf025
      * @tc.desc Verify valueOf preserves a leading zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(0, 1, 2);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2600
     * @tc.name testUint16ArrayValueOf026
      * @tc.desc Verify valueOf preserves a leading maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(65535, 0);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2700
     * @tc.name testUint16ArrayValueOf027
      * @tc.desc Verify valueOf preserves repeated midpoint values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(32768, 32768);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(32768);
      expect(result[1]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2800
     * @tc.name testUint16ArrayValueOf028
      * @tc.desc Verify valueOf preserves minimum and maximum boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(0, 65535);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_2900
     * @tc.name testUint16ArrayValueOf029
      * @tc.desc Verify valueOf preserves default zero initialization
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(4);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3000
     * @tc.name testUint16ArrayValueOf030
      * @tc.desc Verify valueOf preserves repeated maximum Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(65535);
      expect(result[1]).assertEqual(65535);
      expect(result[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3100
     * @tc.name testUint16ArrayValueOf031
      * @tc.desc Verify valueOf preserves a mixed set of Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(0, 1, 32768, 65534, 65535);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(32768);
      expect(result[3]).assertEqual(65534);
      expect(result[4]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3200
     * @tc.name testUint16ArrayValueOf032
      * @tc.desc Verify valueOf reflects an indexed receiver mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr[0] = 42;
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3300
     * @tc.name testUint16ArrayValueOf033
      * @tc.desc Verify valueOf exposes content produced by fill
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      arr.fill(7);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(7);
      expect(result[2]).assertEqual(7);
      expect(result[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3400
     * @tc.name testUint16ArrayValueOf034
      * @tc.desc Verify valueOf exposes content written by set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      arr.set([100, 200], 0);
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3500
     * @tc.name testUint16ArrayValueOf035
      * @tc.desc Verify valueOf reflects a final-index receiver mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr[arr.length - 1] = 99;
      const result: Uint16Array = arr.valueOf();
      expect(result).assertEqual(arr);
      expect(result[arr.length - 1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3600
     * @tc.name testUint16ArrayValueOf036
      * @tc.desc Verify writes through the valueOf result mutate the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.valueOf();
      result[0] = 42;
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3700
     * @tc.name testUint16ArrayValueOf037
      * @tc.desc Verify filling the valueOf result mutates every source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      const result: Uint16Array = arr.valueOf();
      result.fill(7);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(7);
      expect(arr[2]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3800
     * @tc.name testUint16ArrayValueOf038
      * @tc.desc Verify set through valueOf writes through to the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.valueOf();
      result.set([100, 200], 0);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_3900
     * @tc.name testUint16ArrayValueOf039
      * @tc.desc Verify repeated valueOf results expose the same live receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.valueOf();
      result[arr.length - 1] = 99;
      expect(arr[arr.length - 1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4000
     * @tc.name testUint16ArrayValueOf040
      * @tc.desc Verify mapping a valueOf result leaves the receiver unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.valueOf();
      const mapped: Uint16Array = result.map((v: number) => v * 2);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4100
     * @tc.name testUint16ArrayValueOf041
      * @tc.desc Verify filtering a valueOf result retains matching receiver values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.valueOf();
      const filtered: Uint16Array = result.filter((v: number) => v > 2);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(3);
      expect(filtered[1]).assertEqual(4);
      expect(filtered[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4200
     * @tc.name testUint16ArrayValueOf042
      * @tc.desc Verify reducing a valueOf result sums all receiver values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.valueOf();
      const sum: number = result.reduce((acc: number, v: number) => acc + v, 0);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4300
     * @tc.name testUint16ArrayValueOf043
      * @tc.desc Verify forEach on a valueOf result visits every receiver value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.valueOf();
      let sum: number = 0;
      result.forEach((v: number) => {
        sum = sum + v;
      });
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4400
     * @tc.name testUint16ArrayValueOf044
      * @tc.desc Verify every on a valueOf result evaluates all-even content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(2, 4, 6, 8);
      const result: Uint16Array = arr.valueOf();
      const allEven: boolean = result.every((v: number) => v % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4500
     * @tc.name testUint16ArrayValueOf045
      * @tc.desc Verify some on a valueOf result detects an even element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const result: Uint16Array = arr.valueOf();
      const hasEven: boolean = result.some((v: number) => v % 2 === 0);
      expect(hasEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4600
     * @tc.name testUint16ArrayValueOf046
      * @tc.desc Verify find on a valueOf result returns the first matching value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      const result: Uint16Array = arr.valueOf();
      const found: number | undefined = result.find((v: number) => v > 25);
      expect(found as number).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4700
     * @tc.name testUint16ArrayValueOf047
      * @tc.desc Verify findIndex on a valueOf result returns the matching index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      const result: Uint16Array = arr.valueOf();
      const idx: number = result.findIndex((v: number) => v > 25);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4800
     * @tc.name testUint16ArrayValueOf048
      * @tc.desc Verify sorting a valueOf result reorders the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(3, 1, 2);
      const result: Uint16Array = arr.valueOf();
      result.sort((a: number, b: number): int => (a - b).toInt());
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_4900
     * @tc.name testUint16ArrayValueOf049
      * @tc.desc Verify valueOf returns the exact subarray view reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const sub: Uint16Array = arr.subarray(1, 4);
      const result: Uint16Array = sub.valueOf();
      expect(result).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5000
     * @tc.name testUint16ArrayValueOf050
      * @tc.desc Verify valueOf returns the exact sliced array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      const sliced: Uint16Array = arr.slice(1, 3);
      const result: Uint16Array = sliced.valueOf();
      expect(result).assertEqual(sliced);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5100
     * @tc.name testUint16ArrayValueOf051
      * @tc.desc Verify valueOf exposes the selected subarray values and length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      const sub: Uint16Array = arr.subarray(1, 3);
      const result: Uint16Array = sub.valueOf();
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5200
     * @tc.name testUint16ArrayValueOf052
      * @tc.desc Verify a later source mutation is visible through earlier valueOf results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const a: Uint16Array = arr.valueOf();
      expect(a).assertEqual(arr);
      a[0] = 99;
      expect(arr[0]).assertEqual(99);
      const b: Uint16Array = arr.valueOf();
      expect(b).assertEqual(arr);
      expect(b[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5300
     * @tc.name testUint16ArrayValueOf053
      * @tc.desc Verify valueOf preserves the length of a large zero-filled array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const first: Uint16Array = arr.valueOf();
      arr[0] = 99;
      const second: Uint16Array = arr.valueOf();
      expect(first).assertEqual(second);
      expect(second).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5400
     * @tc.name testUint16ArrayValueOf054
      * @tc.desc Verify chained valueOf calls retain fill access to the source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      arr.valueOf().valueOf().fill(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5500
     * @tc.name testUint16ArrayValueOf055
      * @tc.desc Verify valueOf keeps distinct views distinct despite a shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const arr1: Uint16Array = new Uint16Array(buffer);
      const arr2: Uint16Array = new Uint16Array(buffer);
      expect(arr1.valueOf()).assertEqual(arr1);
      expect(arr2.valueOf()).assertEqual(arr2);
      expect(arr1.valueOf()).not().assertEqual(arr2.valueOf());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5600
     * @tc.name testUint16ArrayValueOf056
      * @tc.desc Verify valueOf observes writes through a shared buffer alias
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const arr1: Uint16Array = new Uint16Array(buffer);
      arr1[0] = 10;
      const arr2: Uint16Array = new Uint16Array(buffer);
      arr2[0] = 99;
      expect(arr1.valueOf()[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5700
     * @tc.name testUint16ArrayValueOf057
      * @tc.desc Verify valueOf preserves independent values of separate offset views
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const arr1: Uint16Array = new Uint16Array(buffer, 0, 2);
      const arr2: Uint16Array = new Uint16Array(buffer, 4, 2);
      arr1[0] = 100;
      arr2[0] = 200;
      expect(arr1.valueOf()[0]).assertEqual(100);
      expect(arr2.valueOf()[0]).assertEqual(200);
      expect(arr1.valueOf()).not().assertEqual(arr2.valueOf());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5800
     * @tc.name testUint16ArrayValueOf058
      * @tc.desc Verify valueOf observes byte-level mutation through an Int8Array alias
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint16Array = new Uint16Array(buffer);
      arr[0] = 0xFFFF;
      const int8: Int8Array = new Int8Array(buffer);
      int8[0] = 0;
      expect(arr.valueOf()[0]).assertEqual(0xFF00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_5900
     * @tc.name testUint16ArrayValueOf059
      * @tc.desc Verify a valueOf result can be copied into an independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.valueOf();
      const copied: Uint16Array = Uint16Array.from(result);
      expect(copied[0]).assertEqual(1);
      expect(copied[1]).assertEqual(2);
      expect(copied[2]).assertEqual(3);
      expect(copied).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6000
     * @tc.name testUint16ArrayValueOf060
      * @tc.desc Verify valueOf preserves ordered Uint16 boundary content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = new Uint16Array(1000);
      const result: Uint16Array = arr.valueOf();
      expect(result.length).assertEqual(1000);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6100
     * @tc.name testUint16ArrayValueOf061
      * @tc.desc Verify valueOf exposes each Uint16 boundary value in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      const result: Uint16Array = arr.valueOf();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(65535);
      expect(result[2]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6200
     * @tc.name testUint16ArrayValueOf062
     * @tc.desc Verify valueOf result supports indexed writes on the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       a.valueOf()[1] = 22;
      expect(a.join(',')).assertEqual('1,22,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6300
     * @tc.name testUint16ArrayValueOf063
     * @tc.desc Verify valueOf result supports set on the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       a.valueOf().set(Uint16Array.of(8, 9), 1);
      expect(a.join(',')).assertEqual('1,8,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6400
     * @tc.name testUint16ArrayValueOf064
     * @tc.desc Verify valueOf result supports fill on the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       a.valueOf().fill(7, 1, 3);
      expect(a.join(',')).assertEqual('1,7,7,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6500
     * @tc.name testUint16ArrayValueOf065
     * @tc.desc Verify valueOf result supports sort on the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(3, 1, 2);
      a.valueOf().sort();
      expect(a.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6600
     * @tc.name testUint16ArrayValueOf066
     * @tc.desc Verify valueOf result exposes live values after later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(7, 8, 9);
       const r: Uint16Array = a.valueOf();
       a[2] = 99;
      expect(r.join(',')).assertEqual('7,8,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6700
     * @tc.name testUint16ArrayValueOf067
     * @tc.desc Verify valueOf result from a subarray writes through to its owner
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const v: Uint16Array = a.subarray(1, 3);
       v.valueOf()[0] = 20;
      expect(a.join(',')).assertEqual('1,20,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6800
     * @tc.name testUint16ArrayValueOf068
     * @tc.desc Verify valueOf result participates in overlapping set semantics
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const r: Uint16Array = a.valueOf();
       r.set(r.subarray(0, 3), 1);
      expect(a.join(',')).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_6900
     * @tc.name testUint16ArrayValueOf069
     * @tc.desc Verify valueOf result updates shared ArrayBuffer aliases
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(6);
       const a: Uint16Array = new Uint16Array(b);
       const alias: Uint16Array = new Uint16Array(b);
       a.valueOf().set(Uint16Array.of(6, 7, 8));
      expect(alias.join(',')).assertEqual('6,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7000
     * @tc.name testUint16ArrayValueOf070
     * @tc.desc Verify valueOf on an empty array remains operational
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array();
       const r: Uint16Array = a.valueOf();
      expect(r).assertEqual(a);
      expect(r.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7100
     * @tc.name testUint16ArrayValueOf071
     * @tc.desc Verify valueOf preserves converted stored content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = new Uint16Array([-1, 65536, 65537]);
       const r: Uint16Array = a.valueOf();
      expect(r.join(',')).assertEqual('65535,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7200
     * @tc.name testUint16ArrayValueOf072
     * @tc.desc Verify valueOf from a copied array respects copy isolation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const src: Uint16Array = Uint16Array.of(1, 2, 3);
       const copy: Uint16Array = new Uint16Array(src);
       copy.valueOf()[0] = 9;
      expect(copy.join(',')).assertEqual('9,2,3');
      expect(src.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7300
     * @tc.name testUint16ArrayValueOf073
     * @tc.desc Verify valueOf result can create an isolated slice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const copy: Uint16Array = a.valueOf().slice(1, 3);
       copy[0] = 20;
      expect(copy.join(',')).assertEqual('20,3');
      expect(a.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7400
     * @tc.name testUint16ArrayValueOf074
     * @tc.desc Verify valueOf result can create a shared subarray
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const v: Uint16Array = a.valueOf().subarray(1, 3);
       v[1] = 30;
      expect(a.join(',')).assertEqual('1,2,30,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7500
     * @tc.name testUint16ArrayValueOf075
     * @tc.desc Verify valueOf result can produce a values iterator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(4, 5);
       const it: IterableIterator<Number> = a.valueOf().values();
      expect(it.next().value).assertEqual(4);
      expect(it.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7600
     * @tc.name testUint16ArrayValueOf076
     * @tc.desc Verify valueOf result can be reduced without changing receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(2, 3, 4);
       const sum: number = a.valueOf().reduce((p: number, v: number): number => p + v, 0);
      expect(sum).assertEqual(9);
      expect(a.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7700
     * @tc.name testUint16ArrayValueOf077
     * @tc.desc Verify valueOf result can be converted to an exact string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(10, 20, 30);
      expect(a.valueOf().toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_VALUEOF_7800
     * @tc.name testUint16ArrayValueOf078
     * @tc.desc Verify valueOf result on a nonzero view uses that view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayValueOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(10);
       const all: Uint16Array = new Uint16Array(b);
       all.set(Uint16Array.of(9, 1, 2, 3, 8));
       const v: Uint16Array = new Uint16Array(b, 2, 3);
      expect(v.valueOf().join(',')).assertEqual('1,2,3');
    });

  });
}
