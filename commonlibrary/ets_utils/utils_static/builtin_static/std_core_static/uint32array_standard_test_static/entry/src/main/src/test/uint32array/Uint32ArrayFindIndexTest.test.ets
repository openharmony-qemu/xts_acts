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

export default function uint32ArrayFindIndexTest(): void {
  describe('Uint32ArrayFindIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0100
     * @tc.name testUint32ArrayFindIndexPartOne001
     * @tc.desc Verify 1 predicate arity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 10, 15);
      let idx: int = arr.findIndex((v: number): boolean => v === 5);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0200
     * @tc.name testUint32ArrayFindIndexPartOne002
     * @tc.desc Verify 1 predicate 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 10, 15);
      let idx: int = arr.findIndex((v: number): boolean => v === 10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0300
     * @tc.name testUint32ArrayFindIndexPartOne003
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: number = 12;
      let arr: Uint32Array = Uint32Array.of(1, 5, 20, 30);
      let idx: int = arr.findIndex((v: number): boolean => v > threshold);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0400
     * @tc.name testUint32ArrayFindIndexPartOne004
     * @tc.desc Verify predicate function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: number = 15;
      let arr: Uint32Array = Uint32Array.of(1, 15, 99);
      let idx: int = arr.findIndex((v: number): boolean => v === target);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0500
     * @tc.name testUint32ArrayFindIndexPartOne005
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 50, 200, 5000);
      let idx: int = arr.findIndex((v: number): boolean => v > 10 && v < 100);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0600
     * @tc.name testUint32ArrayFindIndexPartOne006
     * @tc.desc Verify value uint32.MIN(0) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 1, 2]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0700
     * @tc.name testUint32ArrayFindIndexPartOne007
     * @tc.desc Verify value uint32.MAX(4294967295) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967295, 1, 2]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0800
     * @tc.name testUint32ArrayFindIndexPartOne008
     * @tc.desc Verify value 0x80000000 2147483648 int32 +1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, 0x80000000, 2]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0x80000000);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_0900
     * @tc.name testUint32ArrayFindIndexPartOne009
     * @tc.desc Verify value -2147483648 int32.MIN uint32 2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-2147483648, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 2147483648);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1000
     * @tc.name testUint32ArrayFindIndexPartOne010
     * @tc.desc Verify value -1 2^32 4294967295 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-1, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1100
     * @tc.name testUint32ArrayFindIndexPartOne011
     * @tc.desc Verify value 3.14 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([3.14, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1200
     * @tc.name testUint32ArrayFindIndexPartOne012
     * @tc.desc Verify value NaN 0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([Number.NaN, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1300
     * @tc.name testUint32ArrayFindIndexPartOne013
     * @tc.desc Verify value Infinity 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([Number.POSITIVE_INFINITY, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1400
     * @tc.name testUint32ArrayFindIndexPartOne014
     * @tc.desc Verify value -Infinity 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([5, -Number.POSITIVE_INFINITY]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1500
     * @tc.name testUint32ArrayFindIndexPartOne015
     * @tc.desc Verify value 0o17 15 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0o17, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0o17);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1600
     * @tc.name testUint32ArrayFindIndexPartOne016
     * @tc.desc Verify value 0b1111 15 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, 0b1111, 2]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0b1111);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1700
     * @tc.name testUint32ArrayFindIndexPartOne017
     * @tc.desc Verify value 1e3 1000 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, 2, 1e3]);
      let idx: int = arr.findIndex((v: number): boolean => v === 1e3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1800
     * @tc.name testUint32ArrayFindIndexPartOne018
     * @tc.desc Verify value -2 2^32 4294967294 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-2, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967294);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_1900
     * @tc.name testUint32ArrayFindIndexPartOne019
     * @tc.desc Verify value 2.99 2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([9, 2.99, 3]);
      let idx: int = arr.findIndex((v: number): boolean => v === 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2000
     * @tc.name testUint32ArrayFindIndexPartOne020
     * @tc.desc Verify value 0.5 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0.5, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2100
     * @tc.name testUint32ArrayFindIndexPartOne021
     * @tc.desc Verify value -0.5 0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([7, 8, -0.5]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2200
     * @tc.name testUint32ArrayFindIndexPartOne022
     * @tc.desc Verify value 4294967295.9 4294967295 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967295.9, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2300
     * @tc.name testUint32ArrayFindIndexPartOne023
     * @tc.desc Verify value 4294967296.5 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967296.5, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2400
     * @tc.name testUint32ArrayFindIndexPartOne024
     * @tc.desc Verify value 0xF 15 15 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, 0xF, 2]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0xF);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2500
     * @tc.name testUint32ArrayFindIndexPartOne025
     * @tc.desc Verify value -3.14 4294967293 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-3.14, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967293);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2600
     * @tc.name testUint32ArrayFindIndexPartOne026
     * @tc.desc Verify value 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, 2, 3]);
      let idx: int = arr.findIndex((v: number): boolean => v === 1);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2700
     * @tc.name testUint32ArrayFindIndexPartOne027
     * @tc.desc Verify value 100 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([3, 7, 100, 9]);
      let idx: int = arr.findIndex((v: number): boolean => v === 100);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2800
     * @tc.name testUint32ArrayFindIndexPartOne028
     * @tc.desc Verify value 4294967295 MAX 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 4294967295, 4294967295]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_2900
     * @tc.name testUint32ArrayFindIndexPartOne029
     * @tc.desc Verify value 0x100000000 predicate v 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 5, 9]);
      let idx: int = arr.findIndex((v: number): boolean => v > 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3000
     * @tc.name testUint32ArrayFindIndexPartOne030
     * @tc.desc Verify findIndex -1 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([]);
      let called: boolean = false;
      let idx: int = arr.findIndex((v: number): boolean => { called = true; return v === 1; });
      expect(idx).assertEqual(-1);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3100
     * @tc.name testUint32ArrayFindIndexPartOne031
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(42);
      let idx: int = arr.findIndex((v: number): boolean => v === 42);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3200
     * @tc.name testUint32ArrayFindIndexPartOne032
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(42);
      let idx: int = arr.findIndex((v: number): boolean => v === 99);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3300
     * @tc.name testUint32ArrayFindIndexPartOne033
     * @tc.desc Verify 65535 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(65535);
      arr.$_set(65534, 777);
      let idx: int = arr.findIndex((v: number): boolean => v === 777);
      expect(idx).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3400
     * @tc.name testUint32ArrayFindIndexPartOne034
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(8, 8, 8, 8);
      let idx: int = arr.findIndex((v: number): boolean => v === 8);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3500
     * @tc.name testUint32ArrayFindIndexPartOne035
     * @tc.desc Verify 0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(5);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3600
     * @tc.name testUint32ArrayFindIndexPartOne036
     * @tc.desc Verify predicate index === 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(100, 200, 300);
      let idx: int = arr.findIndex((v: number, i: int): boolean => i === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3700
     * @tc.name testUint32ArrayFindIndexPartOne037
     * @tc.desc Verify predicate index === length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(100, 200, 300);
      let idx: int = arr.findIndex((v: number, i: int): boolean => i === arr.length - 1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3800
     * @tc.name testUint32ArrayFindIndexPartOne038
     * @tc.desc Verify predicate index === 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      let idx: int = arr.findIndex((v: number, i: int): boolean => i === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_3900
     * @tc.name testUint32ArrayFindIndexPartOne039
     * @tc.desc Verify predicate index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let idx: int = arr.findIndex((v: number, i: int): boolean => i % 2 === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4000
     * @tc.name testUint32ArrayFindIndexPartOne040
     * @tc.desc Verify predicate index === 5 6 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 1, 2, 3, 4, 5);
      let idx: int = arr.findIndex((v: number, i: int): boolean => i === 5);
      expect(idx).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4100
     * @tc.name testUint32ArrayFindIndexPartOne041
     * @tc.desc Verify predicate index length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let idx: int = arr.findIndex((v: number, i: int): boolean => i === 100);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4200
     * @tc.name testUint32ArrayFindIndexPartOne042
     * @tc.desc Verify predicate array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let idx: int = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => a === arr);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4300
     * @tc.name testUint32ArrayFindIndexPartOne043
     * @tc.desc Verify predicate array.length 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let idx: int = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => a.length === 4);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4400
     * @tc.name testUint32ArrayFindIndexPartOne044
     * @tc.desc Verify predicate array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let idx: int = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => a.$_get(0) === 10 && v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4500
     * @tc.name testUint32ArrayFindIndexPartOne045
     * @tc.desc Verify predicate array.BYTES_PER_ELEMENT 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      let idx: int = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => a.BYTES_PER_ELEMENT === 4);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4600
     * @tc.name testUint32ArrayFindIndexPartOne046
     * @tc.desc Verify predicate array Uint32Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      let capturedArr: Uint32Array | null = null;
      let capturedVal: number = -1;
      let capturedIdx: int = -1;
      let idx: int = arr.findIndex((v: number, i: int, a: Uint32Array): boolean => {
        capturedArr = a;
        capturedVal = v;
        capturedIdx = i;
        return true;
      });
      expect(idx).assertEqual(0);
      expect(capturedVal).assertEqual(1);
      expect(capturedIdx).assertEqual(0);
      expect(capturedArr!.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4700
     * @tc.name testUint32ArrayFindIndexPartOne047
     * @tc.desc Verify predicate int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(7, 8, 9);
      let idx: int = arr.findIndex((v: number): boolean => v === 7);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4800
     * @tc.name testUint32ArrayFindIndexPartOne048
     * @tc.desc Verify predicate length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_4900
     * @tc.name testUint32ArrayFindIndexPartOne049
     * @tc.desc Verify predicate 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 6, 7, 8);
      let idx: int = arr.findIndex((v: number): boolean => v === 7);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5000
     * @tc.name testUint32ArrayFindIndexPartOne050
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 9, 9, 9);
      let idx: int = arr.findIndex((v: number): boolean => v === 9);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5100
     * @tc.name testUint32ArrayFindIndexPartOne051
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 999);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5200
     * @tc.name testUint32ArrayFindIndexPartOne052
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 5, 5);
      let idx: int = arr.findIndex((v: number): boolean => v === 5);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5300
     * @tc.name testUint32ArrayFindIndexPartOne053
     * @tc.desc Verify predicate true 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(11, 22, 33);
      let idx: int = arr.findIndex((v: number): boolean => true);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5400
     * @tc.name testUint32ArrayFindIndexPartOne054
     * @tc.desc Verify predicate false -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(11, 22, 33);
      let idx: int = arr.findIndex((v: number): boolean => false);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5500
     * @tc.name testUint32ArrayFindIndexPartOne055
     * @tc.desc Verify predicate Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let threw: boolean = false;
      try {
        arr.findIndex((v: number): boolean => { throw new Error('boom'); });
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom');
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5600
     * @tc.name testUint32ArrayFindIndexPartOne056
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let threw: boolean = false;
      try {
        arr.findIndex((v: number, i: int): boolean => { if (i === 2) { throw new Error('third'); } return false; });
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('third');
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5700
     * @tc.name testUint32ArrayFindIndexPartOne057
     * @tc.desc Verify predicate 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let want: number = 30;
      let idx: int = arr.findIndex((v: number): boolean => v === want);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5800
     * @tc.name testUint32ArrayFindIndexPartOne058
     * @tc.desc Verify predicate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(5, 6, 7, 8);
      let sum: int = 0;
      let idx: int = arr.findIndex((v: number, i: int): boolean => { sum = sum + i; return v === 7; });
      expect(idx).assertEqual(2);
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_5900
     * @tc.name testUint32ArrayFindIndexPartOne059
     * @tc.desc Verify predicate 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(9, 9, 9, 9);
      let calls: int = 0;
      let idx: int = arr.findIndex((v: number): boolean => { calls = calls + 1; return v === 9; });
      expect(idx).assertEqual(0);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6000
     * @tc.name testUint32ArrayFindIndexPartOne060
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let idx: int = arr.findIndex(
        (v: number, i: int, a: Uint32Array): boolean => {
          if (i === 0) { a.$_set(2, 999); }
          return v === 999;
        }
      );
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6100
     * @tc.name testUint32ArrayFindIndexPartOne061
     * @tc.desc Verify predicate 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let limits: number[] = [5, 10, 15];
      let arr: Uint32Array = Uint32Array.of(1, 6, 11, 16, 20);
      let idx: int = arr.findIndex((v: number): boolean => v > limits[2]);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6200
     * @tc.name testUint32ArrayFindIndexPartOne062
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(555, 1, 2);
      let idx: int = arr.findIndex((v: number): boolean => v === 555);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6300
     * @tc.name testUint32ArrayFindIndexPartOne063
     * @tc.desc Verify length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 444);
      let idx: int = arr.findIndex((v: number): boolean => v === 444);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6400
     * @tc.name testUint32ArrayFindIndexPartOne064
     * @tc.desc Verify 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 666, 666, 666);
      let idx: int = arr.findIndex((v: number): boolean => v === 666);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6500
     * @tc.name testUint32ArrayFindIndexPartOne065
     * @tc.desc Verify MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967295, 1, 4294967295]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6600
     * @tc.name testUint32ArrayFindIndexPartOne066
     * @tc.desc Verify -1 MAX, 5, -2 MAX-1 predicate MAX 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-1, 5, -2]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6700
     * @tc.name testUint32ArrayFindIndexPartOne067
     * @tc.desc Verify 3, 3.14 3, 7 predicate 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([3, 3.14, 7]);
      let idx: int = arr.findIndex((v: number): boolean => v === 3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6800
     * @tc.name testUint32ArrayFindIndexPartOne068
     * @tc.desc Verify 15 , 0xF, 0o17, 0b1111 predicate 15 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([15, 0xF, 0o17, 0b1111]);
      let idx: int = arr.findIndex((v: number): boolean => v === 15);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_6900
     * @tc.name testUint32ArrayFindIndexPartOne069
     * @tc.desc Verify 0 MAX predicate MAX 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 4294967295]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967295);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7000
     * @tc.name testUint32ArrayFindIndexPartOne070
     * @tc.desc Verify 0, MAX, MAX-1, 1 predicate MAX-1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 4294967295, 4294967294, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967294);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7100
     * @tc.name testUint32ArrayFindIndexPartOne071
     * @tc.desc Verify predicate v !== 0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 0, 5, 0]);
      let idx: int = arr.findIndex((v: number): boolean => v !== 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7200
     * @tc.name testUint32ArrayFindIndexPartOne072
     * @tc.desc Verify predicate v >= 4294967290 MAX 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, 4294967293, 5]);
      let idx: int = arr.findIndex((v: number): boolean => v >= 4294967290);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7300
     * @tc.name testUint32ArrayFindIndexPartOne073
     * @tc.desc Verify predicate v % 2 === 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 4, 5, 7);
      let idx: int = arr.findIndex((v: number): boolean => v % 2 === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7400
     * @tc.name testUint32ArrayFindIndexPartOne074
     * @tc.desc Verify predicate v === 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(3, 7, 9);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7500
     * @tc.name testUint32ArrayFindIndexPartOne075
     * @tc.desc Verify predicate v < 0 uint32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 1, 2);
      let idx: int = arr.findIndex((v: number): boolean => v < 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7600
     * @tc.name testUint32ArrayFindIndexPartOne076
     * @tc.desc Verify predicate v === arr.length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(3, 1, 2);
      let idx: int = arr.findIndex((v: number): boolean => v === arr.length);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7700
     * @tc.name testUint32ArrayFindIndexPartOne077
     * @tc.desc Verify predicate v > 2 && v < 8 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 5, 9);
      let idx: int = arr.findIndex((v: number): boolean => v > 2 && v < 8);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7800
     * @tc.name testUint32ArrayFindIndexPartOne078
     * @tc.desc Verify predicate v === 2147483648 int32.MIN 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, -2147483648, 3]);
      let idx: int = arr.findIndex((v: number): boolean => v === 2147483648);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_7900
     * @tc.name testUint32ArrayFindIndexPartOne079
     * @tc.desc Verify predicate v === i 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 1, 2);
      let idx: int = arr.findIndex((v: number, i: int): boolean => v === i);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8000
     * @tc.name testUint32ArrayFindIndexPartOne080
     * @tc.desc Verify predicate v === i + 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 11, 12);
      let idx: int = arr.findIndex((v: number, i: int): boolean => v === i + 10);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8100
     * @tc.name testUint32ArrayFindIndexPartOne081
     * @tc.desc Verify predicate v !== 4294967295 MAX 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967295, 1, 2]);
      let idx: int = arr.findIndex((v: number): boolean => v !== 4294967295);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8200
     * @tc.name testUint32ArrayFindIndexPartOne082
     * @tc.desc Verify predicate v * 2 === 10 5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 5, 3);
      let idx: int = arr.findIndex((v: number): boolean => v * 2 === 10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8300
     * @tc.name testUint32ArrayFindIndexPartOne083
     * @tc.desc Verify predicate v >= 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 3);
      let idx: int = arr.findIndex((v: number): boolean => v >= 1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8400
     * @tc.name testUint32ArrayFindIndexPartOne084
     * @tc.desc Verify predicate v === 2 MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967295, 4294967294, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 2);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8500
     * @tc.name testUint32ArrayFindIndexPartOne085
     * @tc.desc Verify predicate v <= 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 1, 2);
      let idx: int = arr.findIndex((v: number): boolean => v <= 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8600
     * @tc.name testUint32ArrayFindIndexPartOne086
     * @tc.desc Verify predicate v === 0xFF 255 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 0xFF, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 0xFF);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8700
     * @tc.name testUint32ArrayFindIndexPartOne087
     * @tc.desc Verify predicate v === 0o100 64 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 0o100, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 0o100);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8800
     * @tc.name testUint32ArrayFindIndexPartOne088
     * @tc.desc Verify predicate v === 0b1000000 64 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 0b1000000, 3);
      let idx: int = arr.findIndex((v: number): boolean => v === 0b1000000);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_8900
     * @tc.name testUint32ArrayFindIndexPartOne089
     * @tc.desc Verify predicate v === 0 NaN 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([5, 6, Number.NaN]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_9000
     * @tc.name testUint32ArrayFindIndexPartOne090
     * @tc.desc Verify predicate v === 0 Infinity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([7, Number.POSITIVE_INFINITY]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_9100
     * @tc.name testUint32ArrayFindIndexPartOne091
     * @tc.desc Verify predicate v === 0 -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-Number.POSITIVE_INFINITY, 8]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_9200
     * @tc.name testUint32ArrayFindIndexPartOne092
     * @tc.desc Verify predicate v === 4294967293 -3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([-3, 1]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967293);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_9300
     * @tc.name testUint32ArrayFindIndexPartOne093
     * @tc.desc Verify predicate v === 4294967292 -4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([1, -4]);
      let idx: int = arr.findIndex((v: number): boolean => v === 4294967292);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_9400
     * @tc.name testUint32ArrayFindIndexPartOne094
     * @tc.desc Verify predicate v === 0x7FFFFFFF int32.MAX 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([0, 0x7FFFFFFF]);
      let idx: int = arr.findIndex((v: number): boolean => v === 0x7FFFFFFF);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTONE_9500
     * @tc.name testUint32ArrayFindIndexPartOne095
     * @tc.desc Verify predicate v === 1000 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 1000);
      let idx: int = arr.findIndex((v: number): boolean => v === 1000);
      expect(idx).assertEqual(1);
    });

  });
}
