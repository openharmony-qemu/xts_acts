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

export default function uint32ArrayFromTest3(): void {
  describe('Uint32ArrayFromTest3', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0010
     * @tc.name testUint32ArrayFrom001
     * @tc.desc Verify from(FixedArray) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(fa);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0020
     * @tc.name testUint32ArrayFrom002
     * @tc.desc Verify from(Set) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(10);
      s.add(20);
      const r: Uint32Array = Uint32Array.from(s);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0030
     * @tc.name testUint32ArrayFrom003
     * @tc.desc Verify from(Uint32Array) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(7, 8, 9);
      const r: Uint32Array = Uint32Array.from(u);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0040
     * @tc.name testUint32ArrayFrom004
     * @tc.desc Verify from(Array) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [4, 5, 6];
      const r: Uint32Array = Uint32Array.from(a);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0050
     * @tc.name testUint32ArrayFrom005
     * @tc.desc Verify from(ArrayLike) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: ArrayLike<number> = [11, 22, 33];
      const r: Uint32Array = Uint32Array.from(al);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0060
     * @tc.name testUint32ArrayFrom006
     * @tc.desc Verify from(Iterable) arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [11, 22];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from(it);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0070
     * @tc.name testUint32ArrayFrom007
     * @tc.desc Verify from(Iterable, mapfn) arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v * 2);
      expect(r.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0080
     * @tc.name testUint32ArrayFrom008
     * @tc.desc Verify from(ArrayLike, mapfn) arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: ArrayLike<number> = [1, 2];
      const r: Uint32Array = Uint32Array.from<number>(al, (v: number, k: number): number => v + 10);
      expect(r.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0090
     * @tc.name testUint32ArrayFrom009
     * @tc.desc Verify from(Uint32Array, mapfn) Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(1, 2);
      const r: Uint32Array = Uint32Array.from<number>(u, (v: number, k: number): number => v + 100);
      expect(r.$_get(0)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0100
     * @tc.name testUint32ArrayFrom010
     * @tc.desc Verify from(Set, mapfn) Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      const r: Uint32Array = Uint32Array.from(s, (v, k) => v * 10);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0110
     * @tc.name testUint32ArrayFrom011
     * @tc.desc Verify [1,2,3] FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const a: Array<number> = [1, 2, 3];
      const r1: Uint32Array = Uint32Array.from(fa);
      const r2: Uint32Array = Uint32Array.from(a);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0120
     * @tc.name testUint32ArrayFrom012
     * @tc.desc Verify [1,2,3] FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const a: Array<number> = [1, 2, 3];
      expect(Uint32Array.from(fa).$_get(2)).assertEqual(Uint32Array.from(a).$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0130
     * @tc.name testUint32ArrayFrom013
     * @tc.desc Verify [1,2,3] FixedArray Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const a: Array<number> = [1, 2, 3];
      expect(Uint32Array.from(fa).length).assertEqual(Uint32Array.from(a).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0140
     * @tc.name testUint32ArrayFrom014
     * @tc.desc Verify [1,2,3] FixedArray Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const a: Array<number> = [1, 2, 3];
      expect(Uint32Array.from(fa).byteLength).assertEqual(Uint32Array.from(a).byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0150
     * @tc.name testUint32ArrayFrom015
     * @tc.desc Verify [1,2,3] FixedArray Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const a: Array<number> = [1, 2, 3];
      expect(Uint32Array.from(fa).toString()).assertEqual(Uint32Array.from(a).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0160
     * @tc.name testUint32ArrayFrom016
     * @tc.desc Verify Set Set Array(Iterable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(5);
      s.add(6);
      const a: Array<number> = [5, 6];
      const it: Iterable<number> = a;
      const r1: Uint32Array = Uint32Array.from(s);
      const r2: Uint32Array = Uint32Array.from(it);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0170
     * @tc.name testUint32ArrayFrom017
     * @tc.desc Verify Set Set Iterable length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(5);
      s.add(6);
      const a: Array<number> = [5, 6];
      const it: Iterable<number> = a;
      expect(Uint32Array.from(s).length).assertEqual(Uint32Array.from(it).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0180
     * @tc.name testUint32ArrayFrom018
     * @tc.desc Verify Uint32Array Uint32Array Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(7, 8);
      const a: Array<number> = [7, 8];
      const it: Iterable<number> = a;
      const r1: Uint32Array = Uint32Array.from(u);
      const r2: Uint32Array = Uint32Array.from(it);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0190
     * @tc.name testUint32ArrayFrom019
     * @tc.desc Verify Uint32Array Uint32Array Iterable byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(7, 8);
      const a: Array<number> = [7, 8];
      const it: Iterable<number> = a;
      expect(Uint32Array.from(u).byteLength).assertEqual(Uint32Array.from(it).byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0200
     * @tc.name testUint32ArrayFrom020
     * @tc.desc Verify FixedArray Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [9, 8, 7];
      const u: Uint32Array = Uint32Array.of(9, 8, 7);
      const r1: Uint32Array = Uint32Array.from(fa);
      const r2: Uint32Array = Uint32Array.from(u);
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0210
     * @tc.name testUint32ArrayFrom021
     * @tc.desc Verify Array ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [3, 4];
      const al: ArrayLike<number> = [3, 4];
      const r1: Uint32Array = Uint32Array.from(a);
      const r2: Uint32Array = Uint32Array.from(al);
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0220
     * @tc.name testUint32ArrayFrom022
     * @tc.desc Verify FixedArray Array length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [];
      const a: Array<number> = [];
      expect(Uint32Array.from(fa).length).assertEqual(Uint32Array.from(a).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0230
     * @tc.name testUint32ArrayFrom023
     * @tc.desc Verify Set Iterable length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      const a: Array<number> = [];
      const it: Iterable<number> = a;
      expect(Uint32Array.from(s).length).assertEqual(Uint32Array.from(it).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0240
     * @tc.name testUint32ArrayFrom024
     * @tc.desc Verify Uint32Array length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = new Uint32Array(0);
      expect(Uint32Array.from(u).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0250
     * @tc.name testUint32ArrayFrom025
     * @tc.desc Verify 42 FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [42];
      const a: Array<number> = [42];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0260
     * @tc.name testUint32ArrayFrom026
     * @tc.desc Verify 42 Set Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(42);
      const a: Array<number> = [42];
      const it: Iterable<number> = a;
      expect(Uint32Array.from(s).$_get(0)).assertEqual(Uint32Array.from(it).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0270
     * @tc.name testUint32ArrayFrom027
     * @tc.desc Verify 4294967295 Array Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<number> =[4294967295];
      const a: Array<number> = [4294967295];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0280
     * @tc.name testUint32ArrayFrom028
     * @tc.desc Verify -1 FixedArray Array uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [-1];
      const a: Array<number> = [-1];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0290
     * @tc.name testUint32ArrayFrom029
     * @tc.desc Verify 4294967296 Array Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<number> =[4294967296];
      const a: Array<number> = [4294967296];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0300
     * @tc.name testUint32ArrayFrom030
     * @tc.desc Verify NaN Array Iterable+mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [Number.NaN];
      const r1: Uint32Array = Uint32Array.from(a);
      const it: Iterable<number> = a;
      const r2: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0310
     * @tc.name testUint32ArrayFrom031
     * @tc.desc Verify Infinity Array Iterable+mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [Number.POSITIVE_INFINITY];
      const r1: Uint32Array = Uint32Array.from(a);
      const it: Iterable<number> = a;
      const r2: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0320
     * @tc.name testUint32ArrayFrom032
     * @tc.desc Verify 3.14 FixedArray Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [3];
      const a: Array<number> = [3.14];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0330
     * @tc.name testUint32ArrayFrom033
     * @tc.desc Verify 10 FixedArray Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const a: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      expect(Uint32Array.from(fa).length).assertEqual(Uint32Array.from(a).length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0340
     * @tc.name testUint32ArrayFrom034
     * @tc.desc Verify Set Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(1);
      s.add(2);
      const a: Array<number> = [1, 1, 2];
      expect(Uint32Array.from(a).length - Uint32Array.from(s).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0350
     * @tc.name testUint32ArrayFrom035
     * @tc.desc Verify Set from(Set) [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(3);
      s.add(1);
      s.add(2);
      const r: Uint32Array = Uint32Array.from(s);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0360
     * @tc.name testUint32ArrayFrom036
     * @tc.desc Verify Set from(Set) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(3);
      s.add(1);
      s.add(2);
      const r: Uint32Array = Uint32Array.from(s);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0370
     * @tc.name testUint32ArrayFrom037
     * @tc.desc Verify int32 2147483647 FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [2147483647];
      const a: Array<number> = [2147483647];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0380
     * @tc.name testUint32ArrayFrom038
     * @tc.desc Verify int32 -2147483648 FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [-2147483648];
      const a: Array<number> = [-2147483648];
      expect(Uint32Array.from(fa).$_get(0)).assertEqual(Uint32Array.from(a).$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0390
     * @tc.name testUint32ArrayFrom039
     * @tc.desc Verify 0 FixedArray Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [0, 0, 0];
      const a: Array<number> = [0, 0, 0];
      expect(Uint32Array.from(fa).$_get(1)).assertEqual(Uint32Array.from(a).$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0400
     * @tc.name testUint32ArrayFrom040
     * @tc.desc Verify [5,5,5] FixedArray Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [5, 5, 5];
      const a: Array<number> = [5, 5, 5];
      expect(Uint32Array.from(fa).toString()).assertEqual(Uint32Array.from(a).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0410
     * @tc.name testUint32ArrayFrom041
     * @tc.desc Verify Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [100, 200, 300];
      const r1: Uint32Array = Uint32Array.from(a);
      const r2: Uint32Array = Uint32Array.from(a);
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0420
     * @tc.name testUint32ArrayFrom042
     * @tc.desc Verify mapfn v*2 Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v * 2);
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0430
     * @tc.name testUint32ArrayFrom043
     * @tc.desc Verify mapfn v+100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v + 100);
      expect(r.$_get(1)).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0440
     * @tc.name testUint32ArrayFrom044
     * @tc.desc Verify mapfn 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => 7);
      expect(r.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0450
     * @tc.name testUint32ArrayFrom045
     * @tc.desc Verify mapfn NaN Iterable 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => Number.NaN);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0460
     * @tc.name testUint32ArrayFrom046
     * @tc.desc Verify mapfn Infinity Iterable 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => Number.POSITIVE_INFINITY);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0470
     * @tc.name testUint32ArrayFrom047
     * @tc.desc Verify mapfn -1 Iterable uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => -1);
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0480
     * @tc.name testUint32ArrayFrom048
     * @tc.desc Verify mapfn 4294967296 Iterable 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => 4294967296);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0490
     * @tc.name testUint32ArrayFrom049
     * @tc.desc Verify mapfn 4294967295 Iterable MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => 4294967295);
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0500
     * @tc.name testUint32ArrayFrom050
     * @tc.desc Verify mapfn 3.14 Iterable 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => 3.14);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0510
     * @tc.name testUint32ArrayFrom051
     * @tc.desc Verify mapfn 0 Iterable 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [9, 9];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => 0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0520
     * @tc.name testUint32ArrayFrom052
     * @tc.desc Verify mapfn -2147483648 Iterable 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => -2147483648);
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0530
     * @tc.name testUint32ArrayFrom053
     * @tc.desc Verify mapfn accumulate acc+v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      let acc: number = 0;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => {
        acc = acc + v;
        return acc;
      });
      expect(r.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0540
     * @tc.name testUint32ArrayFrom054
     * @tc.desc Verify mapfn k 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [10, 20, 30];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => k);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0550
     * @tc.name testUint32ArrayFrom055
     * @tc.desc Verify mapfn from(from(x, fn1), fn2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r1: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v * 2);
      const it2: Iterable<number> = r1;
      const r2: Uint32Array = Uint32Array.from<number>(it2, (v: number, k: number): number => v + 1);
      expect(r2.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0560
     * @tc.name testUint32ArrayFrom056
     * @tc.desc Verify mapfn ArrayLike int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: ArrayLike<number> = [5, 10, 15];
      const r: Uint32Array = Uint32Array.from<number>(al, (v: number, k: number): number => v / 5);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0570
     * @tc.name testUint32ArrayFrom057
     * @tc.desc Verify Set mapfn Set mapfn Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1: Set<int> = new Set<int>();
      s1.add(1);
      s1.add(2);
      const r1: Uint32Array = Uint32Array.from(s1);
      const s2: Set<number> = new Set<number>();
      s2.add(1);
      s2.add(2);
      const r2: Uint32Array = Uint32Array.from(s2, (v, k) => v + 100);
      expect(r1.$_get(0)).assertEqual(1);
      expect(r2.$_get(0)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0580
     * @tc.name testUint32ArrayFrom058
     * @tc.desc Verify Uint32Array mapfn Uint32Array mapfn Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u1: Uint32Array = Uint32Array.of(5, 6);
      const u2: Uint32Array = Uint32Array.of(5, 6);
      const r1: Uint32Array = Uint32Array.from(u1);
      const r2: Uint32Array = Uint32Array.from<number>(u2, (v: number, k: number): number => v * 10);
      expect(r1.$_get(0)).assertEqual(5);
      expect(r2.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0590
     * @tc.name testUint32ArrayFrom059
     * @tc.desc Verify Array mapfn Array mapfn Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Array<number> = [7, 8];
      const a2: Array<number> = [7, 8];
      const r1: Uint32Array = Uint32Array.from(a1);
      const r2: Uint32Array = Uint32Array.from<number>(a2, (v: number, k: number): number => v + 1);
      expect(r1.$_get(1)).assertEqual(8);
      expect(r2.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0600
     * @tc.name testUint32ArrayFrom060
     * @tc.desc Verify from(FixedArray) arity=1 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [11, 22];
      const r: Uint32Array = Uint32Array.from(fa);
      expect(r.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0610
     * @tc.name testUint32ArrayFrom061
     * @tc.desc Verify ArrayLike<number> ArrayLike Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: ArrayLike<number> = [3, 6, 9];
      const r: Uint32Array = Uint32Array.from(al);
      expect(r.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0620
     * @tc.name testUint32ArrayFrom062
     * @tc.desc Verify ArrayLike<number> Uint32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(ba);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0630
     * @tc.name testUint32ArrayFrom063
     * @tc.desc Verify Iterable<number> Iterable Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [4, 8, 12];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from(it);
      expect(r.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0640
     * @tc.name testUint32ArrayFrom064
     * @tc.desc Verify Set / mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      const r1: Uint32Array = Uint32Array.from(s);
      const r2: Uint32Array = Uint32Array.from(s, (v, k) => v);
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0650
     * @tc.name testUint32ArrayFrom065
     * @tc.desc Verify from(Array) vs from(Iterable, identity) equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Array<number> = [1, 2, 3];
      const a2: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a2;
      const r1: Uint32Array = Uint32Array.from(a1);
      const r2: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0660
     * @tc.name testUint32ArrayFrom066
     * @tc.desc Verify byteLength length*4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3, 4];
      const r: Uint32Array = Uint32Array.from(fa);
      expect(r.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0670
     * @tc.name testUint32ArrayFrom067
     * @tc.desc Verify from(FixedArray) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3, 4, 5];
      expect(Uint32Array.from(fa).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0680
     * @tc.name testUint32ArrayFrom068
     * @tc.desc Verify from(Set) byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      const r: Uint32Array = Uint32Array.from(s);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0690
     * @tc.name testUint32ArrayFrom069
     * @tc.desc Verify from(Uint32Array) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(Uint32Array.from(u).byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0700
     * @tc.name testUint32ArrayFrom070
     * @tc.desc Verify from(Array) buffer.byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(a);
      expect(r.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0710
     * @tc.name testUint32ArrayFrom071
     * @tc.desc Verify from(ArrayLike) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: ArrayLike<number> = [1, 2, 3, 4];
      expect(Uint32Array.from(al).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0720
     * @tc.name testUint32ArrayFrom072
     * @tc.desc Verify from(Iterable) byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from(it);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0730
     * @tc.name testUint32ArrayFrom073
     * @tc.desc Verify from(Iterable, mapfn) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0740
     * @tc.name testUint32ArrayFrom074
     * @tc.desc Verify FixedArray byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [];
      expect(Uint32Array.from(fa).byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0750
     * @tc.name testUint32ArrayFrom075
     * @tc.desc Verify Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [];
      expect(Uint32Array.from(a).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0760
     * @tc.name testUint32ArrayFrom076
     * @tc.desc Verify [1,2,3] FixedArray toString '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      expect(Uint32Array.from(fa).toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0770
     * @tc.name testUint32ArrayFrom077
     * @tc.desc Verify [1,2,3] Set toString '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      s.add(3);
      expect(Uint32Array.from(s).toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0780
     * @tc.name testUint32ArrayFrom078
     * @tc.desc Verify [1,2,3] Array toString '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      expect(Uint32Array.from(a).toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0790
     * @tc.name testUint32ArrayFrom079
     * @tc.desc Verify [1,2,3] Iterable+mapfn toString '2,4,6'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v * 2);
      expect(r.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0800
     * @tc.name testUint32ArrayFrom080
     * @tc.desc Verify from(FixedArray) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(fa);
      const v: Uint32Array = r.valueOf();
      v.$_set(0, 99);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0810
     * @tc.name testUint32ArrayFrom081
     * @tc.desc Verify from(Array) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(a);
      const v: Uint32Array = r.valueOf();
      v.$_set(2, 77);
      expect(r.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0820
     * @tc.name testUint32ArrayFrom082
     * @tc.desc Verify from(Array) join(',') toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [4, 5, 6];
      const r: Uint32Array = Uint32Array.from(a);
      expect(r.join(',')).assertEqual(r.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0830
     * @tc.name testUint32ArrayFrom083
     * @tc.desc Verify from(Set) join(',') toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(7);
      s.add(8);
      const r: Uint32Array = Uint32Array.from(s);
      expect(r.join(',')).assertEqual(r.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0840
     * @tc.name testUint32ArrayFrom084
     * @tc.desc Verify from(ArrayLike) length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: ArrayLike<number> = [10, 20, 30, 40, 50];
      expect(Uint32Array.from(al).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0850
     * @tc.name testUint32ArrayFrom085
     * @tc.desc Verify from(Uint32Array) buffer ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(1, 2);
      const r: Uint32Array = Uint32Array.from(u);
      expect(r.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0860
     * @tc.name testUint32ArrayFrom086
     * @tc.desc Verify Iterable buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [];
      const it: Iterable<number> = a;
      expect(Uint32Array.from(it).buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0870
     * @tc.name testUint32ArrayFrom087
     * @tc.desc Verify FixedArray byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [42];
      expect(Uint32Array.from(fa).byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0880
     * @tc.name testUint32ArrayFrom088
     * @tc.desc Verify Array byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      expect(Uint32Array.from(a).byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0890
     * @tc.name testUint32ArrayFrom089
     * @tc.desc Verify from(Iterable, mapfn) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3, 4];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from<number>(it, (v: number, k: number): number => v);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0900
     * @tc.name testUint32ArrayFrom090
     * @tc.desc Verify from(Array) $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(a);
      r.$_set(1, 999);
      expect(r.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0910
     * @tc.name testUint32ArrayFrom091
     * @tc.desc Verify from(FixedArray) from(Array) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2];
      const a: Array<number> = [1, 2];
      expect(Uint32Array.from(fa).byteOffset).assertEqual(Uint32Array.from(a).byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0920
     * @tc.name testUint32ArrayFrom092
     * @tc.desc Verify mapfn throws Error first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0930
     * @tc.name testUint32ArrayFrom093
     * @tc.desc Verify mapfn throws Error middle at k=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          if (k === 1) {
            throw new Error('middle');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0940
     * @tc.name testUint32ArrayFrom094
     * @tc.desc Verify mapfn throws Error last at k=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          if (k === 2) {
            throw new Error('last');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0950
     * @tc.name testUint32ArrayFrom095
     * @tc.desc Verify mapfn RangeError name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          throw new RangeError('rng');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0960
     * @tc.name testUint32ArrayFrom096
     * @tc.desc Verify mapfn TypeError name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0970
     * @tc.name testUint32ArrayFrom097
     * @tc.desc Verify mapfn throws Error custom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          throw new Error('custom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0980
     * @tc.name testUint32ArrayFrom098
     * @tc.desc Verify mapfn throws Error Iterable source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [10, 20, 30];
      const it: Iterable<number> = a;
      try {
        Uint32Array.from<number>(it, (v: number, k: number): number => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(a[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_0990
     * @tc.name testUint32ArrayFrom099
     * @tc.desc Verify mapfn Set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      const before: number = s.size;
      try {
        Uint32Array.from(s, (v, k) => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(s.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1000
     * @tc.name testUint32ArrayFrom100
     * @tc.desc Verify mapfn Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(5, 6, 7);
      try {
        Uint32Array.from<number>(u, (v: number, k: number): number => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(u.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1010
     * @tc.name testUint32ArrayFrom101
     * @tc.desc Verify mapfn throws Error Array source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<number> = [8, 9];
      try {
        Uint32Array.from<number>(fa, (v: number, k: number): number => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(fa[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1020
     * @tc.name testUint32ArrayFrom102
     * @tc.desc Verify from(Array) source intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      Uint32Array.from(a);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1030
     * @tc.name testUint32ArrayFrom103
     * @tc.desc Verify from Set length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      const before: number = s.size;
      Uint32Array.from(s);
      expect(s.size).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1040
     * @tc.name testUint32ArrayFrom104
     * @tc.desc Verify from Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(7, 8);
      Uint32Array.from(u);
      expect(u.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1050
     * @tc.name testUint32ArrayFrom105
     * @tc.desc Verify from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [3, 4, 5];
      Uint32Array.from(fa);
      expect(fa[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1060
     * @tc.name testUint32ArrayFrom106
     * @tc.desc Verify from + mapfn Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      Uint32Array.from<number>(it, (v: number, k: number): number => v * 100);
      expect(a[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1070
     * @tc.name testUint32ArrayFrom107
     * @tc.desc Verify from(Uint32Array) result source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: Uint32Array = Uint32Array.from(u);
      r.$_set(0, 999);
      expect(u.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1080
     * @tc.name testUint32ArrayFrom108
     * @tc.desc Verify from(Array) result source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(a);
      r.$_set(1, 888);
      expect(a[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1090
     * @tc.name testUint32ArrayFrom109
     * @tc.desc Verify from(FixedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const r1: Uint32Array = Uint32Array.from(fa);
      const r2: Uint32Array = Uint32Array.from(fa);
      r1.$_set(0, 555);
      expect(r2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1100
     * @tc.name testUint32ArrayFrom110
     * @tc.desc Verify from(Set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      const r1: Uint32Array = Uint32Array.from(s);
      const r2: Uint32Array = Uint32Array.from(s);
      r1.$_set(0, 444);
      expect(r2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1110
     * @tc.name testUint32ArrayFrom111
     * @tc.desc Verify from(Array) independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [10, 20, 30];
      const r1: Uint32Array = Uint32Array.from(a);
      const r2: Uint32Array = Uint32Array.from(a);
      r1.$_set(2, 333);
      expect(r2.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1120
     * @tc.name testUint32ArrayFrom112
     * @tc.desc Verify from(Uint32Array) buffer result buffer source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(1, 2);
      const r: Uint32Array = Uint32Array.from(u);
      r.$_set(0, 777);
      expect(u.buffer.byteLength).assertEqual(8);
      expect(u.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1130
     * @tc.name testUint32ArrayFrom113
     * @tc.desc Verify from(Uint32Array) result independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: Uint32Array = Uint32Array.from(u);
      u.$_set(0, 666);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1140
     * @tc.name testUint32ArrayFrom114
     * @tc.desc Verify from(Array) result independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(a);
      a[0] = 555;
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1150
     * @tc.name testUint32ArrayFrom115
     * @tc.desc Verify Set from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1);
      s.add(2);
      const r: Uint32Array = Uint32Array.from(s);
      s.add(3);
      s.add(4);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1160
     * @tc.name testUint32ArrayFrom116
     * @tc.desc Verify from(FixedArray) result independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(fa);
      fa[0] = 444;
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1170
     * @tc.name testUint32ArrayFrom117
     * @tc.desc Verify from(Array) Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const r: Uint32Array = Uint32Array.from(a);
      r.$_set(1, 222);
      expect(a[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1180
     * @tc.name testUint32ArrayFrom118
     * @tc.desc Verify from(Iterable) Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
      const it: Iterable<number> = a;
      const r: Uint32Array = Uint32Array.from(it);
      a.push(4);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_THREE_1190
     * @tc.name testUint32ArrayFrom119
     * @tc.desc Verify from(from(source))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFrom119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 3];
