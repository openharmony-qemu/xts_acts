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

export default function uint32ArrayFindLastIndexTest(): void {
  describe('Uint32ArrayFindLastIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0100
     * @tc.name testUint32ArrayFindLastIndexPartOne001
     * @tc.desc Verify findLastIndex 1 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value > 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0200
     * @tc.name testUint32ArrayFindLastIndexPartOne002
     * @tc.desc Verify predicate 0 arity 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex((): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0300
     * @tc.name testUint32ArrayFindLastIndexPartOne003
     * @tc.desc Verify predicate 1 value arity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex((value: number): boolean => value > 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0400
     * @tc.name testUint32ArrayFindLastIndexPartOne004
     * @tc.desc Verify predicate 2 value index arity 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex((value: number, index: int): boolean => value > 4 && index > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0500
     * @tc.name testUint32ArrayFindLastIndexPartOne005
     * @tc.desc Verify predicate 3 value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === array[index]);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0600
     * @tc.name testUint32ArrayFindLastIndexPartOne006
     * @tc.desc Verify predicate const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const pred = (value: number, index: int, array: Uint32Array): boolean => value > 4;
      const result = values.findLastIndex(pred);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0700
     * @tc.name testUint32ArrayFindLastIndexPartOne007
     * @tc.desc Verify predicate const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const pred: (value: number, index: int, array: Uint32Array) => boolean =
        (value: number, index: int, array: Uint32Array): boolean => value > 4;
      const result = values.findLastIndex(pred);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0800
     * @tc.name testUint32ArrayFindLastIndexPartOne008
     * @tc.desc Verify predicate value === 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_0900
     * @tc.name testUint32ArrayFindLastIndexPartOne009
     * @tc.desc Verify predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => {
        return true;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1000
     * @tc.name testUint32ArrayFindLastIndexPartOne010
     * @tc.desc Verify predicate false -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4, 5, 6);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1100
     * @tc.name testUint32ArrayFindLastIndexPartOne011
     * @tc.desc Verify predicate value > 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 5, 9, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value > 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1200
     * @tc.name testUint32ArrayFindLastIndexPartOne012
     * @tc.desc Verify predicate value < 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 1, 9, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value < 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1300
     * @tc.name testUint32ArrayFindLastIndexPartOne013
     * @tc.desc Verify predicate value <= 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 5, 9, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value <= 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1400
     * @tc.name testUint32ArrayFindLastIndexPartOne014
     * @tc.desc Verify predicate value !== 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 5, 0, 9);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value !== 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1500
     * @tc.name testUint32ArrayFindLastIndexPartOne015
     * @tc.desc Verify predicate (value & 1) === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 4, 7, 8);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => (value & 1) === 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1600
     * @tc.name testUint32ArrayFindLastIndexPartOne016
     * @tc.desc Verify predicate value % 2 === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 4, 7, 8);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value % 2 === 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1700
     * @tc.name testUint32ArrayFindLastIndexPartOne017
     * @tc.desc Verify predicate value === 0 || value === 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 5, 9, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0 || value === 9);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1800
     * @tc.name testUint32ArrayFindLastIndexPartOne018
     * @tc.desc Verify predicate value > 0 && value < 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 5, 150, 9);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value > 0 && value < 100);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_1900
     * @tc.name testUint32ArrayFindLastIndexPartOne019
     * @tc.desc Verify predicate uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 4294967295, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 4294967295);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2000
     * @tc.name testUint32ArrayFindLastIndexPartOne020
     * @tc.desc Verify value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2100
     * @tc.name testUint32ArrayFindLastIndexPartOne021
     * @tc.desc Verify value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2200
     * @tc.name testUint32ArrayFindLastIndexPartOne022
     * @tc.desc Verify value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2, 3, 4);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2300
     * @tc.name testUint32ArrayFindLastIndexPartOne023
     * @tc.desc Verify value uint32.MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 4294967295);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2400
     * @tc.name testUint32ArrayFindLastIndexPartOne024
     * @tc.desc Verify value 0xFFFFFFFF uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFFFFFF, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 4294967295);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2500
     * @tc.name testUint32ArrayFindLastIndexPartOne025
     * @tc.desc Verify value 0x100000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0x100000000, 1, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2600
     * @tc.name testUint32ArrayFindLastIndexPartOne026
     * @tc.desc Verify value -1 2^32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(-1, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 4294967295);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2700
     * @tc.name testUint32ArrayFindLastIndexPartOne027
     * @tc.desc Verify value 0x80000000 2147483648 int32 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0x80000000, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 2147483648);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2800
     * @tc.name testUint32ArrayFindLastIndexPartOne028
     * @tc.desc Verify value int32.MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_2900
     * @tc.name testUint32ArrayFindLastIndexPartOne029
     * @tc.desc Verify value -2147483648 2^32 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(-2147483648, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 2147483648);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3000
     * @tc.name testUint32ArrayFindLastIndexPartOne030
     * @tc.desc Verify value 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3.14, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3100
     * @tc.name testUint32ArrayFindLastIndexPartOne031
     * @tc.desc Verify value Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(Number.NaN, 1, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3200
     * @tc.name testUint32ArrayFindLastIndexPartOne032
     * @tc.desc Verify value Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(Number.POSITIVE_INFINITY, 1, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3300
     * @tc.name testUint32ArrayFindLastIndexPartOne033
     * @tc.desc Verify value Number.NEGATIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(Number.NEGATIVE_INFINITY, 1, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3400
     * @tc.name testUint32ArrayFindLastIndexPartOne034
     * @tc.desc Verify value 9007199254740991 2^53-1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9007199254740991, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 4294967295);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3500
     * @tc.name testUint32ArrayFindLastIndexPartOne035
     * @tc.desc Verify value 0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0o17, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3600
     * @tc.name testUint32ArrayFindLastIndexPartOne036
     * @tc.desc Verify value 0b1111 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0b1111, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3700
     * @tc.name testUint32ArrayFindLastIndexPartOne037
     * @tc.desc Verify value 0xF 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xF, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3800
     * @tc.name testUint32ArrayFindLastIndexPartOne038
     * @tc.desc Verify value 15 0o17/0b1111/0xF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(15, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_3900
     * @tc.name testUint32ArrayFindLastIndexPartOne039
     * @tc.desc Verify value 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFF, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 255);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4000
     * @tc.name testUint32ArrayFindLastIndexPartOne040
     * @tc.desc Verify value 255 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(255, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 255);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4100
     * @tc.name testUint32ArrayFindLastIndexPartOne041
     * @tc.desc Verify value 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFF, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 65535);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4200
     * @tc.name testUint32ArrayFindLastIndexPartOne042
     * @tc.desc Verify value 0xFFFFFF 16777215 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFFFF, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 16777215);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4300
     * @tc.name testUint32ArrayFindLastIndexPartOne043
     * @tc.desc Verify value 0x10 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0x10, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4400
     * @tc.name testUint32ArrayFindLastIndexPartOne044
     * @tc.desc Verify value 1e1 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1e1, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4500
     * @tc.name testUint32ArrayFindLastIndexPartOne045
     * @tc.desc Verify value uint32.MAX-1 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967294, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 4294967294);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4600
     * @tc.name testUint32ArrayFindLastIndexPartOne046
     * @tc.desc Verify value 4294967296 0 0x100000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967296, 1, 2);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4700
     * @tc.name testUint32ArrayFindLastIndexPartOne047
     * @tc.desc Verify value 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000000, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 1000000);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4800
     * @tc.name testUint32ArrayFindLastIndexPartOne048
     * @tc.desc Verify value 256 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(256, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 256);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_4900
     * @tc.name testUint32ArrayFindLastIndexPartOne049
     * @tc.desc Verify value 65535 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(65535, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 65535);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5000
     * @tc.name testUint32ArrayFindLastIndexPartOne050
     * @tc.desc Verify value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5100
     * @tc.name testUint32ArrayFindLastIndexPartOne051
     * @tc.desc Verify value 0x7FFFFFFF int32.MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0x7FFFFFFF, 0, 1);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5200
     * @tc.name testUint32ArrayFindLastIndexPartOne052
     * @tc.desc Verify value 1e0 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1e0, 2, 3);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5300
     * @tc.name testUint32ArrayFindLastIndexPartOne053
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5400
     * @tc.name testUint32ArrayFindLastIndexPartOne054
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5500
     * @tc.name testUint32ArrayFindLastIndexPartOne055
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5600
     * @tc.name testUint32ArrayFindLastIndexPartOne056
     * @tc.desc Verify index index > 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index > 1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5700
     * @tc.name testUint32ArrayFindLastIndexPartOne057
     * @tc.desc Verify index index < 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index < 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5800
     * @tc.name testUint32ArrayFindLastIndexPartOne058
     * @tc.desc Verify index index % 2 === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index % 2 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_5900
     * @tc.name testUint32ArrayFindLastIndexPartOne059
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6000
     * @tc.name testUint32ArrayFindLastIndexPartOne060
     * @tc.desc Verify predicate -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      let called = 0;
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => {
        called = called + 1;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6100
     * @tc.name testUint32ArrayFindLastIndexPartOne061
     * @tc.desc Verify index [2, 1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let visited: number[] = [0, 0, 0];
      let vi = 0;
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => {
        visited[vi] = index;
        vi = vi + 1;
        return false;
      });
      expect(visited[0]).assertEqual(2);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6200
     * @tc.name testUint32ArrayFindLastIndexPartOne062
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 5, 5);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6300
     * @tc.name testUint32ArrayFindLastIndexPartOne063
     * @tc.desc Verify index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 5, 5);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6400
     * @tc.name testUint32ArrayFindLastIndexPartOne064
     * @tc.desc Verify 100 index 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(100);
      big.fill(7);
      const result = big.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6500
     * @tc.name testUint32ArrayFindLastIndexPartOne065
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6600
     * @tc.name testUint32ArrayFindLastIndexPartOne066
     * @tc.desc Verify index 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => index < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6700
     * @tc.name testUint32ArrayFindLastIndexPartOne067
     * @tc.desc Verify array [0] 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array[0] === 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6800
     * @tc.name testUint32ArrayFindLastIndexPartOne068
     * @tc.desc Verify array $_get(index) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array[index] === value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_6900
     * @tc.name testUint32ArrayFindLastIndexPartOne069
     * @tc.desc Verify array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array === values);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7000
     * @tc.name testUint32ArrayFindLastIndexPartOne070
     * @tc.desc Verify array subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = Uint32Array.of(10, 20, 30).subarray(1);
      const result = sub.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array === sub);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7100
     * @tc.name testUint32ArrayFindLastIndexPartOne071
     * @tc.desc Verify array $_get(length-1) 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array[array.length - 1] === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7200
     * @tc.name testUint32ArrayFindLastIndexPartOne072
     * @tc.desc Verify array length 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array.length === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7300
     * @tc.name testUint32ArrayFindLastIndexPartOne073
     * @tc.desc Verify subarray(1,4) array length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Uint32Array.of(1, 2, 3, 4, 5).subarray(1, 4);
      const result = s.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array.length === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7400
     * @tc.name testUint32ArrayFindLastIndexPartOne074
     * @tc.desc Verify subarray array [0] 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sub = Uint32Array.of(10, 20, 30).subarray(1);
      const result = sub.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => array[0] === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7500
     * @tc.name testUint32ArrayFindLastIndexPartOne075
     * @tc.desc Verify value === 5 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 10, 5, 20);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7600
     * @tc.name testUint32ArrayFindLastIndexPartOne076
     * @tc.desc Verify value === 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 7, 7);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 7);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7700
     * @tc.name testUint32ArrayFindLastIndexPartOne077
     * @tc.desc Verify value === 30 RTL 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(30, 20, 10);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTONE_7800
     * @tc.name testUint32ArrayFindLastIndexPartOne078
     * @tc.desc Verify value === 5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 5, 0, 0);
      const result = values.findLastIndex(
        (value: number, index: int, array: Uint32Array): boolean => value === 5);
      expect(result).assertEqual(1);
    });

  });
}
