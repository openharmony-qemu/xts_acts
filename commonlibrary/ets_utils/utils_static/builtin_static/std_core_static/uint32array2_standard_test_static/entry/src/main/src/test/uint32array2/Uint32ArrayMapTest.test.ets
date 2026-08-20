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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayMapOneTest(): void {
  describe('Uint32ArrayMapOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0100
     * @tc.name testUint32ArrayMapOne001
     * @tc.desc Verify map() callback with arity 0 returns constant 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((): number => 5);
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(1)).assertEqual(5);
      expect(result.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0200
     * @tc.name testUint32ArrayMapOne002
     * @tc.desc Verify map(v => v) with arity 1 returns element copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 8, 9);
      const result: Uint32Array = src.map((v: number): number => v);
      expect(result.$_get(0)).assertEqual(7);
      expect(result.$_get(1)).assertEqual(8);
      expect(result.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0300
     * @tc.name testUint32ArrayMapOne003
     * @tc.desc Verify map(v => v*2) with arity 1 doubles each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number): number => v * 2);
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0400
     * @tc.name testUint32ArrayMapOne004
     * @tc.desc Verify map((v,i) => v+i) with arity 2 uses value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 10, 10);
      const result: Uint32Array = src.map((v: number, i: int): number => v + i);
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(11);
      expect(result.$_get(2)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0500
     * @tc.name testUint32ArrayMapOne005
     * @tc.desc Verify map((v,i) => i) with arity 2 returns index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30);
      const result: Uint32Array = src.map((v: number, i: int): number => i);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(1);
      expect(result.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0600
     * @tc.name testUint32ArrayMapOne006
     * @tc.desc Verify map((v,i,a) => v+a[i]) with arity 3 reads array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + a.$_get(i));
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0700
     * @tc.name testUint32ArrayMapOne007
     * @tc.desc Verify map((v,i,a) => a.length) returns array length for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => a.length);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(4);
      expect(result.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0800
     * @tc.name testUint32ArrayMapOne008
     * @tc.desc Verify map((v,i,a) => v+i+a.length) sums value, index, and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + i + a.length);
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(6);
      expect(result.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_0900
     * @tc.name testUint32ArrayMapOne009
     * @tc.desc Verify map(v => v) with element 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1000
     * @tc.name testUint32ArrayMapOne010
     * @tc.desc Verify map(v => v+1) with element 1 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + 1);
      expect(result.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1100
     * @tc.name testUint32ArrayMapOne011
     * @tc.desc Verify map(v => v) preserves uint32 MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(4294967295);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1200
     * @tc.name testUint32ArrayMapOne012
     * @tc.desc Verify map(v => v) with source -1 stored as 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(-1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1300
     * @tc.name testUint32ArrayMapOne013
     * @tc.desc Verify map(v => v) preserves int32 MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(2147483647);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1400
     * @tc.name testUint32ArrayMapOne014
     * @tc.desc Verify map(v => v) with source int32 MIN stored as 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(-2147483648);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1500
     * @tc.name testUint32ArrayMapOne015
     * @tc.desc Verify map(v => v) with NaN source returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(Number.NaN);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1600
     * @tc.name testUint32ArrayMapOne016
     * @tc.desc Verify map(v => v) truncates 3.14 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(3.14);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1700
     * @tc.name testUint32ArrayMapOne017
     * @tc.desc Verify map(v => v) with -3.14 stored as 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(-3.14);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1800
     * @tc.name testUint32ArrayMapOne018
     * @tc.desc Verify map(v => v) with MAX_SAFE_INTEGER wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(Number.MAX_SAFE_INTEGER);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_1900
     * @tc.name testUint32ArrayMapOne019
     * @tc.desc Verify map(v => v) with MIN_SAFE_INTEGER wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(Number.MIN_SAFE_INTEGER);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2000
     * @tc.name testUint32ArrayMapOne020
     * @tc.desc Verify map(v => v) with 1e10 wraps to 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1e10);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2100
     * @tc.name testUint32ArrayMapOne021
     * @tc.desc Verify map(v => v) with 0.5 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0.5);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2200
     * @tc.name testUint32ArrayMapOne022
     * @tc.desc Verify map(v => v) with 1.999 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1.999);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2300
     * @tc.name testUint32ArrayMapOne023
     * @tc.desc Verify map(v => v) preserves 0, uint32 MAX, and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 4294967295, 1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(4294967295);
      expect(result.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2400
     * @tc.name testUint32ArrayMapOne024
     * @tc.desc Verify map() callback receives index 0 for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      let captured: int = -1;
      src.map((v: number, i: int, a: Uint32Array): number => {
        captured = i;
        return v;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2500
     * @tc.name testUint32ArrayMapOne025
     * @tc.desc Verify map() callback receives sequential indices 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30);
      const indices: int[] = [];
      src.map((v: number, i: int, a: Uint32Array): number => {
        indices.push(i);
        return v;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2600
     * @tc.name testUint32ArrayMapOne026
     * @tc.desc Verify map() callback receives index 99 for 100th element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: number[] = [];
      let k: int = 0;
      while (k < 100) { big.push(k); k = k + 1; }
      const src: Uint32Array = new Uint32Array(big);
      let lastIdx: int = -1;
      src.map((v: number, i: int, a: Uint32Array): number => {
        if (i === 99) { lastIdx = i; }
        return v;
      });
      expect(lastIdx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2700
     * @tc.name testUint32ArrayMapOne027
     * @tc.desc Verify map((v,i) => i*2) returns doubled index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => i * 2);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(4);
      expect(result.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2800
     * @tc.name testUint32ArrayMapOne028
     * @tc.desc Verify map((v,i) => v-i) subtracts index from value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(5, 5, 5);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v - i);
      expect(result.$_get(0)).assertEqual(5);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_2900
     * @tc.name testUint32ArrayMapOne029
     * @tc.desc Verify map() callback receives source array as third parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let sameRef: boolean = false;
      src.map((v: number, i: int, a: Uint32Array): number => {
        if (i === 0) { sameRef = (a === src); }
        return v;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3000
     * @tc.name testUint32ArrayMapOne030
     * @tc.desc Verify map() callback array parameter length matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let capturedLen: int = -1;
      src.map((v: number, i: int, a: Uint32Array): number => {
        if (i === 0) { capturedLen = a.length; }
        return v;
      });
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3100
     * @tc.name testUint32ArrayMapOne031
     * @tc.desc Verify map() callback array parameter $_get(0) returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 8, 9);
      let firstVal: number = -1;
      src.map((v: number, i: int, a: Uint32Array): number => {
        if (i === 0) { firstVal = a.$_get(0); }
        return v;
      });
      expect(firstVal).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3200
     * @tc.name testUint32ArrayMapOne032
     * @tc.desc Verify map((v,i,a) => a.$_get(i)-v) reads array via index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(3, 6, 9);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => a.$_get(i) - v);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(0);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3300
     * @tc.name testUint32ArrayMapOne033
     * @tc.desc Verify map() callback array parameter byteLength returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let capturedByteLen: int = -1;
      src.map((v: number, i: int, a: Uint32Array): number => {
        if (i === 0) { capturedByteLen = a.byteLength; }
        return v;
      });
      expect(capturedByteLen).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3400
     * @tc.name testUint32ArrayMapOne034
     * @tc.desc Verify map((v,i,a) => a.$_get(a.length-1)) reads last element via array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => a.$_get(a.length - 1));
      expect(result.$_get(0)).assertEqual(3);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3500
     * @tc.name testUint32ArrayMapOne035
     * @tc.desc Verify map(v => -1) returns 4294967295 (uint32 wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => -1);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3600
     * @tc.name testUint32ArrayMapOne036
     * @tc.desc Verify map(v => 4294967296) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 4294967296);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3700
     * @tc.name testUint32ArrayMapOne037
     * @tc.desc Verify map(v => 4294967297) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 4294967297);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3800
     * @tc.name testUint32ArrayMapOne038
     * @tc.desc Verify map(v => 4294967295) returns uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 4294967295);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_3900
     * @tc.name testUint32ArrayMapOne039
     * @tc.desc Verify map(v => 0x80000000) returns 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 0x80000000);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4000
     * @tc.name testUint32ArrayMapOne040
     * @tc.desc Verify map(v => 2147483647) returns int32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 2147483647);
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4100
     * @tc.name testUint32ArrayMapOne041
     * @tc.desc Verify map(v => -2147483648) wraps to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => -2147483648);
      expect(result.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4200
     * @tc.name testUint32ArrayMapOne042
     * @tc.desc Verify map(v => -2147483649) wraps to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => -2147483649);
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4300
     * @tc.name testUint32ArrayMapOne043
     * @tc.desc Verify map(v => 3.14) truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 3.14);
      expect(result.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4400
     * @tc.name testUint32ArrayMapOne044
     * @tc.desc Verify map(v => -3.14) wraps to 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => -3.14);
      expect(result.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4500
     * @tc.name testUint32ArrayMapOne045
     * @tc.desc Verify map(v => 0.5) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 0.5);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4600
     * @tc.name testUint32ArrayMapOne046
     * @tc.desc Verify map(v => 1.999) truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 1.999);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4700
     * @tc.name testUint32ArrayMapOne047
     * @tc.desc Verify map(v => MAX_SAFE_INTEGER) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => Number.MAX_SAFE_INTEGER);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4800
     * @tc.name testUint32ArrayMapOne048
     * @tc.desc Verify map(v => MIN_SAFE_INTEGER) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => Number.MIN_SAFE_INTEGER);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_4900
     * @tc.name testUint32ArrayMapOne049
     * @tc.desc Verify map(v => 1e10) wraps to 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 1e10);
      expect(result.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5000
     * @tc.name testUint32ArrayMapOne050
     * @tc.desc Verify map(v => -1e10) wraps to 2884901888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => -1e10);
      expect(result.$_get(0)).assertEqual(2884901888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5100
     * @tc.name testUint32ArrayMapOne051
     * @tc.desc Verify map(v => -4294967291) wraps to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => -4294967291);
      expect(result.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5200
     * @tc.name testUint32ArrayMapOne052
     * @tc.desc Verify map(v => 0) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 0);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5300
     * @tc.name testUint32ArrayMapOne053
     * @tc.desc Verify map(v => 4294967295.99) truncates to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 4294967295.99);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5400
     * @tc.name testUint32ArrayMapOne054
     * @tc.desc Verify map(v => v + 4294967296) wraps back to original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(100);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + 4294967296);
      expect(result.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5500
     * @tc.name testUint32ArrayMapOne055
     * @tc.desc Verify map() propagates Error thrown by callback at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          throw new Error('boom at 0');
        });
      } catch (e) {
        expect(e.name).assertEqual("Error");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5600
     * @tc.name testUint32ArrayMapOne056
     * @tc.desc Verify map() propagates Error thrown at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          if (i === 1) { throw new Error('boom at mid'); }
          return v;
        });
      } catch (e) {
        expect(e.name).assertEqual("Error");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5700
     * @tc.name testUint32ArrayMapOne057
     * @tc.desc Verify map() propagates Error thrown at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          if (i === 2) { throw new Error('boom at end'); }
          return v;
        });
      } catch (e) {
        expect(e.name).assertEqual("Error");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5800
     * @tc.name testUint32ArrayMapOne058
     * @tc.desc Verify map() propagates Error thrown on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1);
      let caught: boolean = false;
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          throw new Error('single');
        });
      } catch (e) {
        expect(e.name).assertEqual("Error");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_5900
     * @tc.name testUint32ArrayMapOne059
     * @tc.desc Verify map() propagates RangeError thrown by callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2);
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6000
     * @tc.name testUint32ArrayMapOne060
     * @tc.desc Verify map() propagates Error message unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2);
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          throw new Error('specific-message');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('specific-message');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6100
     * @tc.name testUint32ArrayMapOne061
     * @tc.desc Verify map() propagates Error after callback mutates source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          a.$_set(0, 999);
          throw new Error('after-mutate');
        });
      } catch (e) {
        expect(e.name).assertEqual("Error");
        caught = true;
      }
      expect(caught).assertTrue();
      expect(src.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6200
     * @tc.name testUint32ArrayMapOne062
     * @tc.desc Verify map() does not mutate source array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      src.map((v: number, i: int, a: Uint32Array): number => v + 100);
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
      expect(src.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6300
     * @tc.name testUint32ArrayMapOne063
     * @tc.desc Verify map() does not change source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      src.map((v: number, i: int, a: Uint32Array): number => v + 100);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6400
     * @tc.name testUint32ArrayMapOne064
     * @tc.desc Verify map() returns new Uint32Array not same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v);
      const sameRef: boolean = src === result;
      expect(sameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6500
     * @tc.name testUint32ArrayMapOne065
     * @tc.desc Verify map() result length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + 1);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6600
     * @tc.name testUint32ArrayMapOne066
     * @tc.desc Verify map() result byteLength equals source byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + 1);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6700
     * @tc.name testUint32ArrayMapOne067
     * @tc.desc Verify map() does not mutate source when callback reads array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(5, 10, 15);
      src.map((v: number, i: int, a: Uint32Array): number => a.$_get(i) + 1);
      expect(src.$_get(0)).assertEqual(5);
      expect(src.$_get(1)).assertEqual(10);
      expect(src.$_get(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6800
     * @tc.name testUint32ArrayMapOne068
     * @tc.desc Verify map() on empty array returns length 0 and does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = new Uint32Array(0);
      let called: boolean = false;
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => {
        called = true;
        return v;
      });
      expect(result.length).assertEqual(0);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_6900
     * @tc.name testUint32ArrayMapOne069
     * @tc.desc Verify map() on single element returns length 1 with transformed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + 1);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7000
     * @tc.name testUint32ArrayMapOne070
     * @tc.desc Verify map() on 100 elements returns length 100 with transformed last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: number[] = [];
      let k: int = 0;
      while (k < 100) { big.push(k); k = k + 1; }
      const src: Uint32Array = new Uint32Array(big);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + 1000);
      expect(result.length).assertEqual(100);
      expect(result.$_get(99)).assertEqual(1099);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7100
     * @tc.name testUint32ArrayMapOne071
     * @tc.desc Verify map(v => 7) returns constant for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 7);
      expect(result.$_get(0)).assertEqual(7);
      expect(result.$_get(4)).assertEqual(7);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7200
     * @tc.name testUint32ArrayMapOne072
     * @tc.desc Verify map(v => 0) returns 0 for each of 0, uint32 MAX, 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 4294967295, 1);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => 0);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(0);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7300
     * @tc.name testUint32ArrayMapOne073
     * @tc.desc Verify map() nested inside map() callback returns transformed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => {
        const inner: Uint32Array = a.map((x: number, j: int, b: Uint32Array): number => x);
        return inner.$_get(i) + 1;
      });
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7400
     * @tc.name testUint32ArrayMapOne074
     * @tc.desc Verify map(v => v + offset) uses outer scope variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const offset: number = 100;
      const result: Uint32Array = src.map((v: number, i: int, a: Uint32Array): number => v + offset);
      expect(result.$_get(0)).assertEqual(101);
      expect(result.$_get(1)).assertEqual(102);
      expect(result.$_get(2)).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7500
     * @tc.name testUint32ArrayMapOne075
     * @tc.desc Verify map() invokes callback exactly length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let count: int = 0;
      src.map((v: number, i: int, a: Uint32Array): number => {
        count = count + 1;
        return v;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_7600
     * @tc.name testUint32ArrayMapOne076
     * @tc.desc Verify map propagates callback exception and stops iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let calls: int = 0;
      let caught: boolean = false;
      try {
        src.map((v: number, i: int, a: Uint32Array): number => {
          calls = calls + 1;
          if (i === 1) {
            throw new Error('map stop');
          }
          return v;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertTrue();
      expect(calls).assertEqual(2);
    });


  });
}
