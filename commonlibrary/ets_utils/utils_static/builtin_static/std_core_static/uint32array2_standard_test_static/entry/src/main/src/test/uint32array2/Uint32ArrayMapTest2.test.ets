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

export default function uint32ArrayMapTwoTest(): void {
  describe('Uint32ArrayMapTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0100
     * @tc.name testUint32ArrayMapTwo001
     * @tc.desc Verify map() returns length 3 and transformed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0200
     * @tc.name testUint32ArrayMapTwo002
     * @tc.desc Verify map() on empty array returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0300
     * @tc.name testUint32ArrayMapTwo003
     * @tc.desc Verify map() returns length 1 and transformed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(43);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0400
     * @tc.name testUint32ArrayMapTwo004
     * @tc.desc Verify map() preserves length and boundary element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 2147483647, 4294967295);
      const result = src.map((v: number, i: int, a: Uint32Array) => v);
      expect(result.length).assertEqual(3);
      expect(result.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0500
     * @tc.name testUint32ArrayMapTwo005
     * @tc.desc Verify map() on 100 elements returns length 100 and transformed last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(100);
      expect(result.$_get(99)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0600
     * @tc.name testUint32ArrayMapTwo006
     * @tc.desc Verify map() result has independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v);
      const sameBuffer = src.buffer === result.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0700
     * @tc.name testUint32ArrayMapTwo007
     * @tc.desc Verify map() result mutation does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      result.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0800
     * @tc.name testUint32ArrayMapTwo008
     * @tc.desc Verify map() source mutation after map does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      src.$_set(1, 888);
      expect(result.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_0900
     * @tc.name testUint32ArrayMapTwo009
     * @tc.desc Verify chained map().map() result has independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map(
        (v: number, i: int, a: Uint32Array) => v + 1
      ).map((v: number, i: int, a: Uint32Array) => v + 1);
      const sameBuffer = src.buffer === result.buffer;
      expect(sameBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1000
     * @tc.name testUint32ArrayMapTwo010
     * @tc.desc Verify map() result buffer byteLength equals 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1100
     * @tc.name testUint32ArrayMapTwo011
     * @tc.desc Verify map(v => v) with identity callback returns copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.map((v: number, i: int, a: Uint32Array) => v);
      expect(result.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1200
     * @tc.name testUint32ArrayMapTwo012
     * @tc.desc Verify map(v => 0) returns 0 for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => 0);
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(0);
      expect(result.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1300
     * @tc.name testUint32ArrayMapTwo013
     * @tc.desc Verify map(v => 100) returns 100 for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => 100);
      expect(result.$_get(0)).assertEqual(100);
      expect(result.$_get(1)).assertEqual(100);
      expect(result.$_get(2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1400
     * @tc.name testUint32ArrayMapTwo014
     * @tc.desc Verify map(v => v*2) doubles each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v * 2);
      expect(result.$_get(0)).assertEqual(2);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1500
     * @tc.name testUint32ArrayMapTwo015
     * @tc.desc Verify map(v => v*v) squares each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v * v);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(4);
      expect(result.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1600
     * @tc.name testUint32ArrayMapTwo016
     * @tc.desc Verify map() on empty array join returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.join()).assertEqual('');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1700
     * @tc.name testUint32ArrayMapTwo017
     * @tc.desc Verify map(v => -1) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => -1);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1800
     * @tc.name testUint32ArrayMapTwo018
     * @tc.desc Verify map(v => -2) wraps to 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => -2);
      expect(result.$_get(0)).assertEqual(4294967294);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_1900
     * @tc.name testUint32ArrayMapTwo019
     * @tc.desc Verify map(v => NaN) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => Number.NaN);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2000
     * @tc.name testUint32ArrayMapTwo020
     * @tc.desc Verify map(v => Infinity) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => Number.POSITIVE_INFINITY);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2100
     * @tc.name testUint32ArrayMapTwo021
     * @tc.desc Verify map(v => -Infinity) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => -Number.POSITIVE_INFINITY);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2200
     * @tc.name testUint32ArrayMapTwo022
     * @tc.desc Verify map(v => 0b11111111111111111111111111111111) returns 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => 0b11111111111111111111111111111111);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2300
     * @tc.name testUint32ArrayMapTwo023
     * @tc.desc Verify map(v => 2^53-1) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => 9007199254740991);
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2400
     * @tc.name testUint32ArrayMapTwo024
     * @tc.desc Verify map(v => 2^33-1) wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => 8589934591);
      expect(result.$_get(0)).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2500
     * @tc.name testUint32ArrayMapTwo025
     * @tc.desc Verify map(v => 0o20) returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => 0o20);
      expect(result.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2600
     * @tc.name testUint32ArrayMapTwo026
     * @tc.desc Verify map(v => 1e0) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => 1e0);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2700
     * @tc.name testUint32ArrayMapTwo027
     * @tc.desc Verify map(v => 2^33-2) wraps to 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = src.map((v: number, i: int, a: Uint32Array) => 8589934590);
      expect(result.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2800
     * @tc.name testUint32ArrayMapTwo028
     * @tc.desc Verify map((v,i) => i) returns index for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.map((v: number, i: int, a: Uint32Array) => i);
      expect(result.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_2900
     * @tc.name testUint32ArrayMapTwo029
     * @tc.desc Verify map((v,i) => v+i) sums value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + i);
      expect(result.$_get(2)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3000
     * @tc.name testUint32ArrayMapTwo030
     * @tc.desc Verify map((v,i,a) => a.length) returns source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 6, 7, 8);
      const result = src.map((v: number, i: int, a: Uint32Array) => a.length);
      expect(result.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3100
     * @tc.name testUint32ArrayMapTwo031
     * @tc.desc Verify map((v,i,a) => a.$_get(0)) returns first element via array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8, 9);
      const result = src.map((v: number, i: int, a: Uint32Array) => a.$_get(0));
      expect(result.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3200
     * @tc.name testUint32ArrayMapTwo032
     * @tc.desc Verify map() callback array parameter equals source reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const result = src.map((v: number, i: int, a: Uint32Array) => a === src ? 1 : 0);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3300
     * @tc.name testUint32ArrayMapTwo033
     * @tc.desc Verify map() result length equals 5 for 5-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3400
     * @tc.name testUint32ArrayMapTwo034
     * @tc.desc Verify map() result length equals 2 for 2-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3500
     * @tc.name testUint32ArrayMapTwo035
     * @tc.desc Verify map() result byteLength equals 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3600
     * @tc.name testUint32ArrayMapTwo036
     * @tc.desc Verify map() result byteLength equals 0 for empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3700
     * @tc.name testUint32ArrayMapTwo037
     * @tc.desc Verify map() result byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3800
     * @tc.name testUint32ArrayMapTwo038
     * @tc.desc Verify map() result byteLength equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_3900
     * @tc.name testUint32ArrayMapTwo039
     * @tc.desc Verify map() result byteLength equals 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4000
     * @tc.name testUint32ArrayMapTwo040
     * @tc.desc Verify map() on 100 elements returns byteLength 400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteLength).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4100
     * @tc.name testUint32ArrayMapTwo041
     * @tc.desc Verify map() result byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4200
     * @tc.name testUint32ArrayMapTwo042
     * @tc.desc Verify map() does not modify source first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(src.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4300
     * @tc.name testUint32ArrayMapTwo043
     * @tc.desc Verify map() does not change source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4400
     * @tc.name testUint32ArrayMapTwo044
     * @tc.desc Verify map() on empty source keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(src.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4500
     * @tc.name testUint32ArrayMapTwo045
     * @tc.desc Verify map() does not modify source join result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(src.join()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4600
     * @tc.name testUint32ArrayMapTwo046
     * @tc.desc Verify chained map(v => v+1).map(v => v+1) applies transform twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const result = src.map(
        (v: number, i: int, a: Uint32Array) => v + 1
      ).map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4700
     * @tc.name testUint32ArrayMapTwo047
     * @tc.desc Verify map(v => v+1).$_get(0) returns transformed first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      expect(src.map((v: number, i: int, a: Uint32Array) => v + 1).$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4800
     * @tc.name testUint32ArrayMapTwo048
     * @tc.desc Verify map(v => v+1).length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      expect(src.map((v: number, i: int, a: Uint32Array) => v + 1).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_4900
     * @tc.name testUint32ArrayMapTwo049
     * @tc.desc Verify map(v => v+1).join() returns comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      expect(src.map((v: number, i: int, a: Uint32Array) => v + 1).join()).assertEqual('4,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_5000
     * @tc.name testUint32ArrayMapTwo050
     * @tc.desc Verify map(v => v+1).slice(0, 2) returns first two transformed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const r = src.map((v: number, i: int, a: Uint32Array) => v + 1).slice(0, 2);
      expect(r.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_5100
     * @tc.name testUint32ArrayMapTwo051
     * @tc.desc Verify map(v => v+1).subarray(0) returns full transformed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const r = src.map((v: number, i: int, a: Uint32Array) => v + 1).subarray(0);
      expect(r.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_5200
     * @tc.name testUint32ArrayMapTwo052
     * @tc.desc Verify map(v => v+1).reduce sums to 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const sum = src.map((v: number, i: int, a: Uint32Array) => v + 1).reduce(
        (prev: number, curr: number, idx: int, arr: Uint32Array) => prev + curr,
        0);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_5300
     * @tc.name testUint32ArrayMapTwo053
     * @tc.desc Verify map() does not modify source last element on 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, i);
      }
      src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(src.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_MAP_TWO_5400
     * @tc.name testUint32ArrayMapTwo054
     * @tc.desc Verify map returns a Uint32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayMapTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = src.map((v: number, i: int, a: Uint32Array) => v + 1);
      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(2);
    });

  });
}
